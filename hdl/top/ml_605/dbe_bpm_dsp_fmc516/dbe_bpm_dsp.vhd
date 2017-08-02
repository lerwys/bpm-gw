------------------------------------------------------------------------------
-- Title      : Top DSP design
------------------------------------------------------------------------------
-- Author     : Lucas Maziero Russo
-- Company    : CNPEM LNLS-DIG
-- Created    : 2013-02-25
-- Platform   : FPGA-generic
-------------------------------------------------------------------------------
-- Description: Top design for testing the integration/control of the DSP
-------------------------------------------------------------------------------
-- Copyright (c) 2012 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2013-02-25  1.0      lucas.russo        Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
-- Main Wishbone Definitions
use work.wishbone_pkg.all;
-- Memory core generator
use work.gencores_pkg.all;
-- Custom Wishbone Modules
use work.ifc_wishbone_pkg.all;
-- Custom common cores
use work.ifc_common_pkg.all;
-- Wishbone stream modules and interface
use work.wb_stream_generic_pkg.all;
-- Ethernet MAC Modules and SDB structure
use work.ethmac_pkg.all;
-- Wishbone Fabric interface
use work.wr_fabric_pkg.all;
-- Etherbone slave core
use work.etherbone_pkg.all;
-- FMC516 definitions
use work.fmc_adc_pkg.all;
-- DSP definitions
use work.dsp_cores_pkg.all;

library UNISIM;
use UNISIM.vcomponents.all;

entity dbe_bpm_dsp is
port(
  -----------------------------------------
  -- Clocking pins
  -----------------------------------------
  sys_clk_p_i                               : in std_logic;
  sys_clk_n_i                               : in std_logic;

  -----------------------------------------
  -- Reset Button
  -----------------------------------------
  sys_rst_button_i                          : in std_logic;

  -----------------------------------------
  -- UART pins
  -----------------------------------------

  uart_txd_o                                : out std_logic;
  uart_rxd_i                                : in std_logic;

  -----------------------------------------
  -- PHY pins
  -----------------------------------------

  -- Clock and resets to PHY (GMII). Not used in MII mode (10/100)
  mgtx_clk_o                                : out std_logic;
  mrstn_o                                   : out std_logic;

  -- PHY TX
  mtx_clk_pad_i                             : in std_logic;
  mtxd_pad_o                                : out std_logic_vector(3 downto 0);
  mtxen_pad_o                               : out std_logic;
  mtxerr_pad_o                              : out std_logic;

  -- PHY RX
  mrx_clk_pad_i                             : in std_logic;
  mrxd_pad_i                                : in std_logic_vector(3 downto 0);
  mrxdv_pad_i                               : in std_logic;
  mrxerr_pad_i                              : in std_logic;
  mcoll_pad_i                               : in std_logic;
  mcrs_pad_i                                : in std_logic;

  -- MII
  mdc_pad_o                                 : out std_logic;
  md_pad_b                                  : inout std_logic;

  -----------------------------
  -- FMC516 ports
  -----------------------------

  -- System I2C Bus. Slaves: Atmel AT24C512B Serial EEPROM,
  -- AD7417 temperature diodes and AD7417 supply rails
  sys_i2c_scl_b                             : inout std_logic;
  sys_i2c_sda_b                             : inout std_logic;

  -- ADC clocks. One clock per ADC channel.
  -- Only ch1 clock is used as all data chains
  -- are sampled at the same frequency
  adc_clk0_p_i                              : in std_logic;
  adc_clk0_n_i                              : in std_logic;
  adc_clk1_p_i                              : in std_logic;
  adc_clk1_n_i                              : in std_logic;
  adc_clk2_p_i                              : in std_logic;
  adc_clk2_n_i                              : in std_logic;
  adc_clk3_p_i                              : in std_logic;
  adc_clk3_n_i                              : in std_logic;

  -- DDR ADC data channels.
  adc_data_ch0_p_i                          : in std_logic_vector(c_num_adc_bits/2-1 downto 0);
  adc_data_ch0_n_i                          : in std_logic_vector(c_num_adc_bits/2-1 downto 0);
  adc_data_ch1_p_i                          : in std_logic_vector(c_num_adc_bits/2-1 downto 0);
  adc_data_ch1_n_i                          : in std_logic_vector(c_num_adc_bits/2-1 downto 0);
  adc_data_ch2_p_i                          : in std_logic_vector(c_num_adc_bits/2-1 downto 0);
  adc_data_ch2_n_i                          : in std_logic_vector(c_num_adc_bits/2-1 downto 0);
  adc_data_ch3_p_i                          : in std_logic_vector(c_num_adc_bits/2-1 downto 0);
  adc_data_ch3_n_i                          : in std_logic_vector(c_num_adc_bits/2-1 downto 0);

  -- ADC clock (half of the sampling frequency) divider reset
  adc_clk_div_rst_p_o                       : out std_logic;
  adc_clk_div_rst_n_o                       : out std_logic;

  -- FMC Front leds. Typical uses: Over Range or Full Scale
  -- condition.
  fmc_leds_o                                : out std_logic_vector(1 downto 0);

  -- ADC SPI control interface. Three-wire mode. Tri-stated data pin
  sys_spi_clk_o                             : out std_logic;
  sys_spi_data_b                            : inout std_logic;
  sys_spi_cs_adc0_n_o                       : out std_logic;  -- SPI ADC CS channel 0
  sys_spi_cs_adc1_n_o                       : out std_logic;  -- SPI ADC CS channel 1
  sys_spi_cs_adc2_n_o                       : out std_logic;  -- SPI ADC CS channel 2
  sys_spi_cs_adc3_n_o                       : out std_logic;  -- SPI ADC CS channel 3

  -- External Trigger To/From FMC
  m2c_trig_p_i                              : in std_logic;
  m2c_trig_n_i                              : in std_logic;
  c2m_trig_p_o                              : out std_logic;
  c2m_trig_n_o                              : out std_logic;

  -- LMK (National Semiconductor) is the clock and distribution IC,
  -- programmable via Microwire Interface
  lmk_lock_i                                : in std_logic;
  lmk_sync_o                                : out std_logic;
  lmk_uwire_latch_en_o                      : out std_logic;
  lmk_uwire_data_o                          : out std_logic;
  lmk_uwire_clock_o                         : out std_logic;

  -- Programable VCXO via I2C
  vcxo_i2c_sda_b                            : inout std_logic;
  vcxo_i2c_scl_o                            : out std_logic;
  vcxo_pd_l_o                               : out std_logic;

  -- One-wire To/From DS2431 (VMETRO Data)
  fmc_id_dq_b                               : inout std_logic;
  -- One-wire To/From DS2432 SHA-1 (SP-Devices key)
  fmc_key_dq_b                              : inout std_logic;

  -- General board pins
  fmc_pwr_good_i                            : in std_logic;
  -- Internal/External clock distribution selection
  fmc_clk_sel_o                             : out std_logic;
  -- Reset ADCs
  fmc_reset_adcs_n_o                        : out std_logic;
  --FMC Present status
  fmc_prsnt_m2c_l_i                         : in  std_logic;

  -- General board status
  fmc_mmcm_lock_o                           : out std_logic;
  fmc_lmk_lock_o                            : out std_logic;

  -----------------------------------------
  -- Button pins
  -----------------------------------------
  buttons_i                                 : in std_logic_vector(7 downto 0);

  -----------------------------------------
  -- User LEDs
  -----------------------------------------
  leds_o                                    : out std_logic_vector(7 downto 0)
);
end dbe_bpm_dsp;

architecture rtl of dbe_bpm_dsp is

  -- Top crossbar layout
  -- Number of slaves
  constant c_slaves                         : natural := 10;
  -- General Dual-port memory, Buffer Single-port memory, DMA control port, MAC,
  --Etherbone, FMC516, Peripherals
  -- Number of masters
  constant c_masters                        : natural := 8;            -- LM32 master, Data + Instruction,
  --DMA read+write master, Ethernet MAC, Ethernet MAC adapter read+write master, Etherbone

  --constant c_dpram_size                     : natural := 131072/4; -- in 32-bit words (128KB)
  constant c_dpram_size                       : natural := 90112/4; -- in 32-bit words (90KB)
  --constant c_dpram_ethbuf_size              : natural := 32768/4; -- in 32-bit words (32KB)
  --constant c_dpram_ethbuf_size              : natural := 65536/4; -- in 32-bit words (64KB)
  constant c_dpram_ethbuf_size                : natural := 16384/4; -- in 32-bit words (16KB)

  -- GPIO num pinscalc
  constant c_leds_num_pins                  : natural := 8;
  constant c_buttons_num_pins               : natural := 8;

  -- Counter width. It willl count up to 2^32 clock cycles
  constant c_counter_width                  : natural := 32;

  -- TICs counter period. 100MHz clock -> msec granularity
  constant c_tics_cntr_period               : natural := 100000;

  -- Number of reset clock cycles (FF)
  constant c_button_rst_width               : natural := 255;

  -- number of the ADC reference clock used for all downstream
  -- FPGA logic
  constant c_adc_ref_clk                    : natural := 1;

  -- DSP constants
  constant c_dsp_ref_num_bits               : natural := 24;
  constant c_dsp_pos_num_bits               : natural := 26;

  constant c_xwb_etherbone_sdb : t_sdb_device := (
    abi_class     => x"0000", -- undocumented device
    abi_ver_major => x"01",
    abi_ver_minor => x"01",
    wbd_endian    => c_sdb_endian_big,
    wbd_width     => x"4", --32-bit port granularity
    sdb_component => (
    addr_first    => x"0000000000000000",
    addr_last     => x"00000000000000ff",
    product => (
    vendor_id     => x"0000000000000651", -- GSI
    device_id     => x"68202b22",
    version       => x"00000001",
    date          => x"20120912",
    name          => "GSI_ETHERBONE_CFG  ")));

  constant c_xwb_ethmac_adapter_sdb : t_sdb_device := (
    abi_class     => x"0000", -- undocumented device
    abi_ver_major => x"01",
    abi_ver_minor => x"01",
    wbd_endian    => c_sdb_endian_big,
    wbd_width     => x"4", --32-bit port granularity
    sdb_component => (
    addr_first    => x"0000000000000000",
    addr_last     => x"00000000000000ff",
    product => (
    vendor_id     => x"1000000000001215", -- LNLS
    device_id     => x"2ff9a28e",
    version       => x"00000001",
    date          => x"20130701",
    name          => "ETHMAC_ADAPTER     ")));

  -- FMC516 layout. Size (0x00000FFF) is larger than needed. Just to be sure
  -- no address overlaps will occur
  constant c_fmc516_bridge_sdb : t_sdb_bridge := f_xwb_bridge_manual_sdb(x"00000FFF", x"00000800");

  -- General peripherals layout. UART, LEDs (GPIO), Buttons (GPIO) and Tics counter
  constant c_periph_bridge_sdb : t_sdb_bridge := f_xwb_bridge_manual_sdb(x"00000FFF", x"00000400");

  -- WB SDB (Self describing bus) layout
  constant c_layout : t_sdb_record_array(c_slaves-1 downto 0) :=
    ( 0 => f_sdb_embed_device(f_xwb_dpram(c_dpram_size),  x"00000000"),   -- 128KB RAM
      1 => f_sdb_embed_device(f_xwb_dpram(c_dpram_size),  x"10000000"),   -- Second port to the same memory
      2 => f_sdb_embed_device(f_xwb_dpram(c_dpram_ethbuf_size),
                                                          x"20000000"),   -- 64KB RAM
      3 => f_sdb_embed_device(c_xwb_dma_sdb,              x"30004000"),   -- DMA control port
      4 => f_sdb_embed_device(c_xwb_ethmac_sdb,           x"30005000"),   -- Ethernet MAC control port
      5 => f_sdb_embed_device(c_xwb_ethmac_adapter_sdb,   x"30006000"),   -- Ethernet Adapter control port
      6 => f_sdb_embed_device(c_xwb_etherbone_sdb,        x"30007000"),   -- Etherbone control port
      7 => f_sdb_embed_device(c_xwb_position_calc_core_sdb,
                                                          x"30008000"),   -- Position Calc Core control port
      8 => f_sdb_embed_bridge(c_fmc516_bridge_sdb,        x"30010000"),   -- FMC516 control port
      9 => f_sdb_embed_bridge(c_periph_bridge_sdb,        x"30020000")    -- General peripherals control port
    );

  -- Self Describing Bus ROM Address. It will be an addressed slave as well
  constant c_sdb_address                    : t_wishbone_address := x"30000000";

  -- FMC516 ADC data constants
  constant c_adc_data_ch0_lsb               : natural := 0;
  constant c_adc_data_ch0_msb               : natural := c_num_adc_bits-1 + c_adc_data_ch0_lsb;

  constant c_adc_data_ch1_lsb               : natural := c_adc_data_ch0_msb + 1;
  constant c_adc_data_ch1_msb               : natural := c_num_adc_bits-1 + c_adc_data_ch1_lsb;

  constant c_adc_data_ch2_lsb               : natural := c_adc_data_ch1_msb + 1;
  constant c_adc_data_ch2_msb               : natural := c_num_adc_bits-1 + c_adc_data_ch2_lsb;

  constant c_adc_data_ch3_lsb               : natural := c_adc_data_ch2_msb + 1;
  constant c_adc_data_ch3_msb               : natural := c_num_adc_bits-1 + c_adc_data_ch3_lsb;

  -- Crossbar master/slave arrays
  signal cbar_slave_i                       : t_wishbone_slave_in_array (c_masters-1 downto 0);
  signal cbar_slave_o                       : t_wishbone_slave_out_array(c_masters-1 downto 0);
  signal cbar_master_i                      : t_wishbone_master_in_array(c_slaves-1 downto 0);
  signal cbar_master_o                      : t_wishbone_master_out_array(c_slaves-1 downto 0);

  -- LM32 signals
  signal clk_sys                            : std_logic;
  signal lm32_interrupt                     : std_logic_vector(31 downto 0);
  signal lm32_rstn                          : std_logic;

  -- Clocks and resets signals
  signal locked                             : std_logic;
  signal clk_sys_rstn                       : std_logic;
  signal clk_sys_rst                        : std_logic;

  signal rst_button_sys_pp                  : std_logic;
  signal rst_button_sys                     : std_logic;
  signal rst_button_sys_n                   : std_logic;

  -- Only one clock domain
  signal reset_clks                         : std_logic_vector(0 downto 0);
  signal reset_rstn                         : std_logic_vector(0 downto 0);

  -- 200 Mhz clocck for iodelay_ctrl
  signal clk_200mhz                         : std_logic;

  -- Global Clock Single ended
  signal sys_clk_gen                        : std_logic;

  -- Ethernet MAC signals
  signal ethmac_int                         : std_logic;
  signal ethmac_md_in                       : std_logic;
  signal ethmac_md_out                      : std_logic;
  signal ethmac_md_oe                       : std_logic;

  signal mtxd_pad_int                       : std_logic_vector(3 downto 0);
  signal mtxen_pad_int                      : std_logic;
  signal mtxerr_pad_int                     : std_logic;
  signal mdc_pad_int                        : std_logic;

  -- Ethrnet MAC adapter signals
  signal irq_rx_done                        : std_logic;
  signal irq_tx_done                        : std_logic;

  -- Etherbone signals
  signal wb_ebone_out                       : t_wishbone_master_out;
  signal wb_ebone_in                        : t_wishbone_master_in;

  signal eb_src_i                           : t_wrf_source_in;
  signal eb_src_o                           : t_wrf_source_out;
  signal eb_snk_i                           : t_wrf_sink_in;
  signal eb_snk_o                           : t_wrf_sink_out;

  -- DMA signals
  signal dma_int                            : std_logic;

  -- FMC516 Signals
  signal wbs_fmc516_in_array                : t_wbs_source_in16_array(c_num_adc_channels-1 downto 0);
  signal wbs_fmc516_out_array               : t_wbs_source_out16_array(c_num_adc_channels-1 downto 0);

  signal fmc516_mmcm_lock_int               : std_logic;
  signal fmc516_lmk_lock_int                : std_logic;

  signal fmc516_fs_clk                      : std_logic_vector(c_num_adc_channels-1 downto 0);
  signal fmc516_fs_clk2x                    : std_logic_vector(c_num_adc_channels-1 downto 0);
  signal fmc516_adc_data                    : std_logic_vector(c_num_adc_channels*16-1 downto 0);
  signal fmc516_adc_valid                   : std_logic_vector(c_num_adc_channels-1 downto 0);

  --signal fmc_debug                          : std_logic;
  --signal reset_adc_counter                  : unsigned(6 downto 0) := (others => '0');
  signal fs_rst_sync_n                      : std_logic;
  signal fs_rst_n                           : std_logic;

  -- FMC516 Debug
  signal fmc516_debug_valid_int             : std_logic_vector(c_num_adc_channels-1 downto 0);
  signal fmc516_debug_full_int              : std_logic_vector(c_num_adc_channels-1 downto 0);
  signal fmc516_debug_empty_int             : std_logic_vector(c_num_adc_channels-1 downto 0);

  signal adc_dly_debug_int                  : t_adc_fn_dly_array(c_num_adc_channels-1 downto 0);

  signal sys_spi_clk_int                    : std_logic;
  --signal sys_spi_data_int                   : std_logic;
  signal sys_spi_dout_int                   : std_logic;
  signal sys_spi_din_int                    : std_logic;
  signal sys_spi_miosio_oe_n_int            : std_logic;
  signal sys_spi_cs_adc0_n_int              : std_logic;
  signal sys_spi_cs_adc1_n_int              : std_logic;
  signal sys_spi_cs_adc2_n_int              : std_logic;
  signal sys_spi_cs_adc3_n_int              : std_logic;

  signal lmk_lock_int                       : std_logic;
  signal lmk_sync_int                       : std_logic;
  signal lmk_uwire_latch_en_int             : std_logic;
  signal lmk_uwire_data_int                 : std_logic;
  signal lmk_uwire_clock_int                : std_logic;

  signal fmc_reset_adcs_n_int               : std_logic;
  signal fmc_reset_adcs_n_out               : std_logic;

  -- DSP signals
  signal dsp_sysce                          : std_logic;
  signal dsp_sysce_clr                      : std_logic;
  signal dsp_sysclk                         : std_logic;
  signal dsp_sysclk2x                       : std_logic;
  signal dsp_rst_n                          : std_logic;

  signal dsp_kx                             : std_logic_vector(24 downto 0);
  signal dsp_ky                             : std_logic_vector(24 downto 0);
  signal dsp_ksum                           : std_logic_vector(24 downto 0);

  signal dsp_del_sig_div_thres              : std_logic_vector(25 downto 0);

  signal dsp_adc_ch0_dbg_data               : std_logic_vector(c_num_adc_bits-1 downto 0);
  signal dsp_adc_ch1_dbg_data               : std_logic_vector(c_num_adc_bits-1 downto 0);
  signal dsp_adc_ch2_dbg_data               : std_logic_vector(c_num_adc_bits-1 downto 0);
  signal dsp_adc_ch3_dbg_data               : std_logic_vector(c_num_adc_bits-1 downto 0);

  signal dsp_adc_ch0_data                   : std_logic_vector(c_num_adc_bits-1 downto 0);
  signal dsp_adc_ch1_data                   : std_logic_vector(c_num_adc_bits-1 downto 0);
  signal dsp_adc_ch2_data                   : std_logic_vector(c_num_adc_bits-1 downto 0);
  signal dsp_adc_ch3_data                   : std_logic_vector(c_num_adc_bits-1 downto 0);

  signal dsp_bpf_ch0                        : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal dsp_bpf_ch2                        : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);

  signal dsp_mix_ch0                        : std_logic_vector(c_dsp_ref_num_bits-1  downto 0);
  signal dsp_mix_ch2                        : std_logic_vector(c_dsp_ref_num_bits-1  downto 0);

  signal dsp_poly35_ch0                     : std_logic_vector(c_dsp_ref_num_bits-1  downto 0);
  signal dsp_poly35_ch2                     : std_logic_vector(c_dsp_ref_num_bits-1  downto 0);

  signal dsp_cic_fofb_ch0                   : std_logic_vector(c_dsp_ref_num_bits-1  downto 0);
  signal dsp_cic_fofb_ch2                   : std_logic_vector(c_dsp_ref_num_bits-1  downto 0);

  signal dsp_tbt_amp_ch0                    : std_logic_vector(c_dsp_ref_num_bits-1  downto 0);
  signal dsp_tbt_amp_ch1                    : std_logic_vector(c_dsp_ref_num_bits-1  downto 0);
  signal dsp_tbt_amp_ch2                    : std_logic_vector(c_dsp_ref_num_bits-1  downto 0);
  signal dsp_tbt_amp_ch3                    : std_logic_vector(c_dsp_ref_num_bits-1  downto 0);

  signal dsp_fofb_amp_ch0                   : std_logic_vector(c_dsp_ref_num_bits-1  downto 0);
  signal dsp_fofb_amp_ch1                   : std_logic_vector(c_dsp_ref_num_bits-1  downto 0);
  signal dsp_fofb_amp_ch2                   : std_logic_vector(c_dsp_ref_num_bits-1  downto 0);
  signal dsp_fofb_amp_ch3                   : std_logic_vector(c_dsp_ref_num_bits-1  downto 0);

  signal dsp_monit_amp_ch0                  : std_logic_vector(c_dsp_ref_num_bits-1  downto 0);
  signal dsp_monit_amp_ch1                  : std_logic_vector(c_dsp_ref_num_bits-1  downto 0);
  signal dsp_monit_amp_ch2                  : std_logic_vector(c_dsp_ref_num_bits-1  downto 0);
  signal dsp_monit_amp_ch3                  : std_logic_vector(c_dsp_ref_num_bits-1  downto 0);

  signal dsp_x_tbt                          : std_logic_vector(c_dsp_pos_num_bits-1  downto 0);
  signal dsp_y_tbt                          : std_logic_vector(c_dsp_pos_num_bits-1  downto 0);
  signal dsp_q_tbt                          : std_logic_vector(c_dsp_pos_num_bits-1  downto 0);
  signal dsp_sum_tbt                        : std_logic_vector(c_dsp_pos_num_bits-1  downto 0);

  signal dsp_x_fofb                         : std_logic_vector(c_dsp_pos_num_bits-1  downto 0);
  signal dsp_y_fofb                         : std_logic_vector(c_dsp_pos_num_bits-1  downto 0);
  signal dsp_q_fofb                         : std_logic_vector(c_dsp_pos_num_bits-1  downto 0);
  signal dsp_sum_fofb                       : std_logic_vector(c_dsp_pos_num_bits-1  downto 0);

  signal dsp_x_monit                        : std_logic_vector(c_dsp_pos_num_bits-1  downto 0);
  signal dsp_y_monit                        : std_logic_vector(c_dsp_pos_num_bits-1  downto 0);
  signal dsp_q_monit                        : std_logic_vector(c_dsp_pos_num_bits-1  downto 0);
  signal dsp_sum_monit                      : std_logic_vector(c_dsp_pos_num_bits-1  downto 0);

  signal dsp_tbt_decim_q_ch01_incorrect     : std_logic;
  signal dsp_tbt_decim_q_ch23_incorrect     : std_logic;
  signal dsp_fofb_decim_q_01_missing        : std_logic;
  signal dsp_fofb_decim_q_23_missing        : std_logic;
  signal dsp_monit_cic_unexpected           : std_logic;
  signal dsp_monit_cfir_incorrect           : std_logic;
  signal dsp_monit_pfir_incorrect           : std_logic;

  signal dsp_clk_ce_1                       : std_logic;
  signal dsp_clk_ce_2                       : std_logic;
  signal dsp_clk_ce_35                      : std_logic;
  signal dsp_clk_ce_70                      : std_logic;
  signal dsp_clk_ce_1390000                 : std_logic;
  signal dsp_clk_ce_1112                    : std_logic;
  signal dsp_clk_ce_2224                    : std_logic;
  signal dsp_clk_ce_11120000                : std_logic;
  signal dsp_clk_ce_22240000                : std_logic;
  signal dsp_clk_ce_5000                    : std_logic;
  signal dsp_clk_ce_556                     : std_logic;
  signal dsp_clk_ce_2780000                 : std_logic;
  signal dsp_clk_ce_5560000                 : std_logic;

  signal clk_rffe_swap                      : std_logic;

  -- GPIO LED signals
  signal gpio_slave_led_o                   : t_wishbone_slave_out;
  signal gpio_slave_led_i                   : t_wishbone_slave_in;
  signal gpio_leds_int                      : std_logic_vector(c_leds_num_pins-1 downto 0);
  -- signal leds_gpio_dummy_in                : std_logic_vector(c_leds_num_pins-1 downto 0);

  -- GPIO Button signals
  signal gpio_slave_button_o                : t_wishbone_slave_out;
  signal gpio_slave_button_i                : t_wishbone_slave_in;

  -- Counter signal
  --signal s_counter                          : unsigned(c_counter_width-1 downto 0);
  -- 100MHz period or 1 second
  --constant s_counter_full                   : integer := 100000000;

  -- Chipscope control signals
  signal CONTROL0                           : std_logic_vector(35 downto 0);
  signal CONTROL1                           : std_logic_vector(35 downto 0);
  signal CONTROL2                           : std_logic_vector(35 downto 0);
  signal CONTROL3                           : std_logic_vector(35 downto 0);
  signal CONTROL4                           : std_logic_vector(35 downto 0);
  signal CONTROL5                           : std_logic_vector(35 downto 0);
  signal CONTROL6                           : std_logic_vector(35 downto 0);

  -- Chipscope ILA 0 signals
  signal TRIG_ILA0_0                        : std_logic_vector(31 downto 0);
  signal TRIG_ILA0_1                        : std_logic_vector(31 downto 0);
  signal TRIG_ILA0_2                        : std_logic_vector(31 downto 0);
  signal TRIG_ILA0_3                        : std_logic_vector(31 downto 0);

  -- Chipscope ILA 1 signals
  signal TRIG_ILA1_0                        : std_logic_vector(7 downto 0);
  signal TRIG_ILA1_1                        : std_logic_vector(31 downto 0);
  signal TRIG_ILA1_2                        : std_logic_vector(31 downto 0);
  signal TRIG_ILA1_3                        : std_logic_vector(31 downto 0);
  signal TRIG_ILA1_4                        : std_logic_vector(31 downto 0);

  -- Chipscope ILA 2 signals
  signal TRIG_ILA2_0                        : std_logic_vector(7 downto 0);
  signal TRIG_ILA2_1                        : std_logic_vector(31 downto 0);
  signal TRIG_ILA2_2                        : std_logic_vector(31 downto 0);
  signal TRIG_ILA2_3                        : std_logic_vector(31 downto 0);
  signal TRIG_ILA2_4                        : std_logic_vector(31 downto 0);

  -- Chipscope ILA 3 signals
  signal TRIG_ILA3_0                        : std_logic_vector(7 downto 0);
  signal TRIG_ILA3_1                        : std_logic_vector(31 downto 0);
  signal TRIG_ILA3_2                        : std_logic_vector(31 downto 0);
  signal TRIG_ILA3_3                        : std_logic_vector(31 downto 0);
  signal TRIG_ILA3_4                        : std_logic_vector(31 downto 0);

  -- Chipscope ILA 4 signals
  signal TRIG_ILA4_0                        : std_logic_vector(7 downto 0);
  signal TRIG_ILA4_1                        : std_logic_vector(31 downto 0);
  signal TRIG_ILA4_2                        : std_logic_vector(31 downto 0);
  signal TRIG_ILA4_3                        : std_logic_vector(31 downto 0);
  signal TRIG_ILA4_4                        : std_logic_vector(31 downto 0);

  -- Chipscope ILA 5 signals
  signal TRIG_ILA5_0                        : std_logic_vector(7 downto 0);
  signal TRIG_ILA5_1                        : std_logic_vector(31 downto 0);
  signal TRIG_ILA5_2                        : std_logic_vector(31 downto 0);
  signal TRIG_ILA5_3                        : std_logic_vector(31 downto 0);
  signal TRIG_ILA5_4                        : std_logic_vector(31 downto 0);

  -- Chipscope ILA 6 signals
  signal TRIG_ILA6_0                        : std_logic_vector(7 downto 0);
  signal TRIG_ILA6_1                        : std_logic_vector(31 downto 0);
  signal TRIG_ILA6_2                        : std_logic_vector(31 downto 0);
  signal TRIG_ILA6_3                        : std_logic_vector(31 downto 0);
  signal TRIG_ILA6_4                        : std_logic_vector(31 downto 0);

  ---------------------------
  --      Components       --
  ---------------------------

  -- Clock generation
  component clk_gen is
  port(
    sys_clk_p_i                             : in std_logic;
    sys_clk_n_i                             : in std_logic;
    sys_clk_o                               : out std_logic
  );
  end component;

  -- Xilinx Megafunction
  component sys_pll is
  port(
    rst_i                                   : in std_logic := '0';
    clk_i                                   : in std_logic := '0';
    clk0_o                                  : out std_logic;
    clk1_o                                  : out std_logic;
    locked_o                                : out std_logic
  );
  end component;

  -- Xilinx Chipscope Controller
  component chipscope_icon_1_port
  port (
    CONTROL0                                : inout std_logic_vector(35 downto 0)
  );
  end component;

  -- Xilinx Chipscope Controller 2 port
  --component chipscope_icon_2_port
  --port (
  --  CONTROL0                                : inout std_logic_vector(35 downto 0);
  --  CONTROL1                                : inout std_logic_vector(35 downto 0)
  --);
  --end component;

  --component chipscope_icon_4_port
  --port (
  --  CONTROL0                                : inout std_logic_vector(35 downto 0);
  --  CONTROL1                                : inout std_logic_vector(35 downto 0);
  --  CONTROL2                                : inout std_logic_vector(35 downto 0);
  --  CONTROL3                                : inout std_logic_vector(35 downto 0)
  --);
  --end component;

  --component chipscope_icon_8_port
  --port (
  --  CONTROL0                                : inout std_logic_vector(35 downto 0);
  --  CONTROL1                                : inout std_logic_vector(35 downto 0);
  --  CONTROL2                                : inout std_logic_vector(35 downto 0);
  --  CONTROL3                                : inout std_logic_vector(35 downto 0);
  --  CONTROL4                                : inout std_logic_vector(35 downto 0);
  --  CONTROL5                                : inout std_logic_vector(35 downto 0);
  --  CONTROL6                                : inout std_logic_vector(35 downto 0);
  --  CONTROL7                                : inout std_logic_vector(35 downto 0)
  --);
  --end component;

  component chipscope_icon_7_port
  port (
    CONTROL0                                : inout std_logic_vector(35 downto 0);
    CONTROL1                                : inout std_logic_vector(35 downto 0);
    CONTROL2                                : inout std_logic_vector(35 downto 0);
    CONTROL3                                : inout std_logic_vector(35 downto 0);
    CONTROL4                                : inout std_logic_vector(35 downto 0);
    CONTROL5                                : inout std_logic_vector(35 downto 0);
    CONTROL6                                : inout std_logic_vector(35 downto 0)
  );
  end component;

  -- Xilinx Chipscope Logic Analyser
  component chipscope_ila
  port (
    CONTROL                                 : inout std_logic_vector(35 downto 0);
    CLK                                     : in    std_logic;
    TRIG0                                   : in    std_logic_vector(31 downto 0);
    TRIG1                                   : in    std_logic_vector(31 downto 0);
    TRIG2                                   : in    std_logic_vector(31 downto 0);
    TRIG3                                   : in    std_logic_vector(31 downto 0)
  );
  end component;

  component chipscope_ila_8192
  port (
    CONTROL                                 : inout std_logic_vector(35 downto 0);
    CLK                                     : in std_logic;
    TRIG0                                   : in std_logic_vector(7 downto 0);
    TRIG1                                   : in std_logic_vector(31 downto 0);
    TRIG2                                   : in std_logic_vector(31 downto 0);
    TRIG3                                   : in std_logic_vector(31 downto 0);
    TRIG4                                   : in std_logic_vector(31 downto 0)
  );
  end component;

  -- Functions
  -- Generate dummy (0) values
  function f_zeros(size : integer)
      return std_logic_vector is
  begin
      return std_logic_vector(to_unsigned(0, size));
  end f_zeros;

begin

  -- Clock generation
  cmp_clk_gen : clk_gen
  port map (
    sys_clk_p_i                             => sys_clk_p_i,
    sys_clk_n_i                             => sys_clk_n_i,
    sys_clk_o                               => sys_clk_gen
  );

  -- Obtain core locking and generate necessary clocks
  cmp_sys_pll_inst : sys_pll
  port map (
    rst_i                                   => '0',
    clk_i                                   => sys_clk_gen,
    clk0_o                                  => clk_sys,     -- 100MHz locked clock
    clk1_o                                  => clk_200mhz,  -- 200MHz locked clock
    locked_o                                => locked        -- '1' when the PLL has locked
  );

  -- Reset synchronization. Hold reset line until few locked cycles have passed.
  cmp_reset : gc_reset
  generic map(
    g_clocks                                => 1    -- CLK_SYS
  )
  port map(
    free_clk_i                              => sys_clk_gen,
    locked_i                                => locked,
    clks_i                                  => reset_clks,
    rstn_o                                  => reset_rstn
  );

  reset_clks(0)                             <= clk_sys;
  clk_sys_rstn                              <= reset_rstn(0) and rst_button_sys_n;
  clk_sys_rst                               <= not clk_sys_rstn;
  mrstn_o                                   <= clk_sys_rstn;

  -- Generate button reset synchronous to each clock domain
  -- Detect button positive edge of clk_sys
  cmp_button_sys_ffs : gc_sync_ffs
  port map (
    clk_i                                   => clk_sys,
    rst_n_i                                 => '1',
    data_i                                  => sys_rst_button_i,
    ppulse_o                                => rst_button_sys_pp
  );

  -- Generate the reset signal based on positive edge
  -- of synched sys_rst_button_i
  cmp_button_sys_rst : gc_extend_pulse
  generic map (
    g_width                                 => c_button_rst_width
  )
  port map(
    clk_i                                   => clk_sys,
    rst_n_i                                 => '1',
    pulse_i                                 => rst_button_sys_pp,
    extended_o                              => rst_button_sys
  );

  rst_button_sys_n                          <= not rst_button_sys;

  -- The top-most Wishbone B.4 crossbar
  cmp_interconnect : xwb_sdb_crossbar
  generic map(
    g_num_masters                           => c_masters,
    g_num_slaves                            => c_slaves,
    g_registered                            => true,
    g_wraparound                            => true, -- Should be true for nested buses
    g_layout                                => c_layout,
    g_sdb_addr                              => c_sdb_address
  )
  port map(
    clk_sys_i                               => clk_sys,
    rst_n_i                                 => clk_sys_rstn,
    -- Master connections (INTERCON is a slave)
    slave_i                                 => cbar_slave_i,
    slave_o                                 => cbar_slave_o,
    -- Slave connections (INTERCON is a master)
    master_i                                => cbar_master_i,
    master_o                                => cbar_master_o
  );

  -- The LM32 is master 0+1
  lm32_rstn                                 <= clk_sys_rstn;

  cmp_lm32 : xwb_lm32
  generic map(
    g_profile                               => "medium_icache_debug"
  ) -- Including JTAG and I-cache (no divide)
  port map(
    clk_sys_i                               => clk_sys,
    rst_n_i                                 => lm32_rstn,
    irq_i                                   => lm32_interrupt,
    dwb_o                                   => cbar_slave_i(0), -- Data bus
    dwb_i                                   => cbar_slave_o(0),
    iwb_o                                   => cbar_slave_i(1), -- Instruction bus
    iwb_i                                   => cbar_slave_o(1)
  );

  -- Interrupt '0' is Ethmac.
  -- Interrupt '1' is DMA completion.
  -- Interrupt '2' is Button(0).
  -- Interrupt '3' is Ethernet Adapter RX completion.
  -- Interrupt '4' is Ethernet Adapter TX completion.
  -- Interrupts 31 downto 5 are disabled

  lm32_interrupt <= (0 => ethmac_int, 1 => dma_int, 2 => not buttons_i(0), 3 => irq_rx_done,
                      4 => irq_tx_done, others => '0');

  -- A DMA controller is master 2+3, slave 3, and interrupt 1
  cmp_dma : xwb_dma
  port map(
    clk_i                                   => clk_sys,
    rst_n_i                                 => clk_sys_rstn,
    slave_i                                 => cbar_master_o(3),
    slave_o                                 => cbar_master_i(3),
    r_master_i                              => cbar_slave_o(2),
    r_master_o                              => cbar_slave_i(2),
    w_master_i                              => cbar_slave_o(3),
    w_master_o                              => cbar_slave_i(3),
    interrupt_o                             => dma_int
  );

  -- Slave 0+1 is the RAM. Load a input file containing the embedded software
  cmp_ram : xwb_dpram
  generic map(
    g_size                                  => c_dpram_size, -- must agree with sw/target/lm32/ram.ld:LENGTH / 4
    g_init_file                             => "../../../embedded-sw/dbe.ram",
    --"../../top/ml_605/dbe_bpm_simple/sw/main.ram",
    g_must_have_init_file                   => true,
    g_slave1_interface_mode                 => PIPELINED,
    g_slave2_interface_mode                 => PIPELINED,
    g_slave1_granularity                    => BYTE,
    g_slave2_granularity                    => BYTE
  )
  port map(
    clk_sys_i                               => clk_sys,
    rst_n_i                                 => clk_sys_rstn,
    -- First port connected to the crossbar
    slave1_i                                => cbar_master_o(0),
    slave1_o                                => cbar_master_i(0),
    -- Second port connected to the crossbar
    slave2_i                                => cbar_master_o(1),
    slave2_o                                => cbar_master_i(1)
  );

  -- Slave 2 is the RAM Buffer for Ethernet MAC.
  cmp_ethmac_buf_ram : xwb_dpram
  generic map(
    g_size                                  => c_dpram_ethbuf_size,
    g_init_file                             => "",
    g_must_have_init_file                   => false,
    g_slave1_interface_mode                 => CLASSIC,
    --g_slave2_interface_mode                 => PIPELINED,
    g_slave1_granularity                    => BYTE
    --g_slave2_granularity                    => BYTE
  )
  port map(
    clk_sys_i                               => clk_sys,
    rst_n_i                                 => clk_sys_rstn,
    -- First port connected to the crossbar
    slave1_i                                => cbar_master_o(2),
    slave1_o                                => cbar_master_i(2),
    -- Second port connected to the crossbar
    slave2_i                                => cc_dummy_slave_in, -- CYC always low
    slave2_o                                => open
  );

  -- The Ethernet MAC is master 4, slave 4
  cmp_xwb_ethmac : xwb_ethmac
  generic map (
    --g_ma_interface_mode                     => PIPELINED,
    g_ma_interface_mode                     => CLASSIC, -- NOT used for now
    --g_ma_address_granularity                => WORD,
    g_ma_address_granularity                => BYTE,    -- NOT used for now
    g_sl_interface_mode                     => PIPELINED,
    --g_sl_interface_mode                     => CLASSIC,
    --g_sl_address_granularity                => WORD
    g_sl_address_granularity                => BYTE
  )
  port map(
    -- WISHBONE common
    wb_clk_i                                => clk_sys,
    wb_rst_i                                => clk_sys_rst,

    -- WISHBONE slave
    wb_slave_in                             => cbar_master_o(4),
    wb_slave_out                            => cbar_master_i(4),

    -- WISHBONE master
    wb_master_in                            => cbar_slave_o(4),
    wb_master_out                           => cbar_slave_i(4),

    -- PHY TX
    mtx_clk_pad_i                           => mtx_clk_pad_i,
    --mtxd_pad_o                              => mtxd_pad_o,
    mtxd_pad_o                              => mtxd_pad_int,
    --mtxen_pad_o                             => mtxen_pad_o,
    mtxen_pad_o                             => mtxen_pad_int,
    --mtxerr_pad_o                            => mtxerr_pad_o,
    mtxerr_pad_o                            => mtxerr_pad_int,

    -- PHY RX
    mrx_clk_pad_i                           => mrx_clk_pad_i,
    mrxd_pad_i                              => mrxd_pad_i,
    mrxdv_pad_i                             => mrxdv_pad_i,
    mrxerr_pad_i                            => mrxerr_pad_i,
    mcoll_pad_i                             => mcoll_pad_i,
    mcrs_pad_i                              => mcrs_pad_i,

    -- MII
    --mdc_pad_o                               => mdc_pad_o,
    mdc_pad_o                               => mdc_pad_int,
    md_pad_i                                => ethmac_md_in,
    md_pad_o                                => ethmac_md_out,
    md_padoe_o                              => ethmac_md_oe,

    -- Interrupt
    int_o                                   => ethmac_int
  );

  ---- Tri-state buffer for MII config
  md_pad_b <= ethmac_md_out when ethmac_md_oe = '1' else 'Z';
  ethmac_md_in <= md_pad_b;

  mtxd_pad_o                                <=  mtxd_pad_int;
  mtxen_pad_o                               <=  mtxen_pad_int;
  mtxerr_pad_o                              <=  mtxerr_pad_int;
  mdc_pad_o                                 <=  mdc_pad_int;

  --The Ethernet MAC Adapter is master 5+6, slave 5
  cmp_xwb_ethmac_adapter : xwb_ethmac_adapter
  port map(
    clk_i                                   => clk_sys,
    rstn_i                                  => clk_sys_rstn,

    wb_slave_o                              => cbar_master_i(5),
    wb_slave_i                              => cbar_master_o(5),

    tx_ram_o                                => cbar_slave_i(5),
    tx_ram_i                                => cbar_slave_o(5),

    rx_ram_o                                => cbar_slave_i(6),
    rx_ram_i                                => cbar_slave_o(6),

    rx_eb_o                                 => eb_snk_i,
    rx_eb_i                                 => eb_snk_o,

    tx_eb_o                                 => eb_src_i,
    tx_eb_i                                 => eb_src_o,

    irq_tx_done_o                           => irq_tx_done,
    irq_rx_done_o                           => irq_rx_done
  );

  -- The Etherbone is slave 6
  cmp_eb_slave_core : eb_slave_core
  generic map(
    g_sdb_address                           => x"00000000" & c_sdb_address
  )
  port map
  (
    clk_i                                   => clk_sys,
    nRst_i                                  => clk_sys_rstn,

    -- EB streaming sink
    snk_i                                   => eb_snk_i,
    snk_o                                   => eb_snk_o,

    -- EB streaming source
    src_i                                   => eb_src_i,
    src_o                                   => eb_src_o,

    -- WB slave - Cfg IF
    cfg_slave_o                             => cbar_master_i(6),
    cfg_slave_i                             => cbar_master_o(6),

    -- WB master - Bus IF
    master_o                                => wb_ebone_out,
    master_i                                => wb_ebone_in
  );

  cbar_slave_i(7)                           <= wb_ebone_out;
  wb_ebone_in                               <= cbar_slave_o(7);

  -- The FMC516 is slave 8
  cmp_xwb_fmc516 : xwb_fmc516
  generic map(
    g_fpga_device                           => "VIRTEX6",
    g_interface_mode                        => PIPELINED,
    --g_address_granularity                   => WORD,
    g_address_granularity                   => BYTE,
    --g_adc_clk_period_values                 => default_adc_clk_period_values,
    g_adc_clk_period_values                 => (0.0, 0.0, 8.882, 8.882),  --476.066*35/148 aprox 112.583 MHz
    --g_use_clk_chains                        => default_clk_use_chain,
    -- using clock1 from FMC516 (CLK2_ M2C_P, CLK2_ M2C_M pair)
    -- using clock0 from FMC516.
    -- BUFIO can drive half-bank only, not the full IO bank
    g_use_clk_chains                        => "0011",
    g_use_data_chains                       => "1111",
    g_map_clk_data_chains                   => (1,0,0,1),
    -- Clock 1 is the adc reference clock
    g_ref_clk                               => c_adc_ref_clk,
    g_packet_size                           => 32,
    g_sim                                   => 0
  )
  port map(
    sys_clk_i                               => clk_sys,
    sys_rst_n_i                             => clk_sys_rstn,
    sys_clk_200Mhz_i                        => clk_200mhz,

    -----------------------------
    -- Wishbone Control Interface signals
    -----------------------------
    wb_slv_i                                => cbar_master_o(8),
    wb_slv_o                                => cbar_master_i(8),

    -----------------------------
    -- External ports
    -----------------------------
    -- System I2C Bus. Slaves: Atmel AT24C512B Serial EEPROM,
    -- AD7417 temperature diodes and AD7417 supply rails
    sys_i2c_scl_b                           => sys_i2c_scl_b,
    sys_i2c_sda_b                           => sys_i2c_sda_b,

    -- ADC clocks. One clock per ADC channel.
    -- Only ch1 clock is used as all data chains
    -- are sampled at the same frequency
    adc_clk0_p_i                            => adc_clk0_p_i,
    adc_clk0_n_i                            => adc_clk0_n_i,
    adc_clk1_p_i                            => adc_clk1_p_i,
    adc_clk1_n_i                            => adc_clk1_n_i,
    adc_clk2_p_i                            => adc_clk2_p_i,
    adc_clk2_n_i                            => adc_clk2_n_i,
    adc_clk3_p_i                            => adc_clk3_p_i,
    adc_clk3_n_i                            => adc_clk3_n_i,

    -- DDR ADC data channels.
    adc_data_ch0_p_i                        => adc_data_ch0_p_i,
    adc_data_ch0_n_i                        => adc_data_ch0_n_i,
    adc_data_ch1_p_i                        => adc_data_ch1_p_i,
    adc_data_ch1_n_i                        => adc_data_ch1_n_i,
    adc_data_ch2_p_i                        => adc_data_ch2_p_i,
    adc_data_ch2_n_i                        => adc_data_ch2_n_i,
    adc_data_ch3_p_i                        => adc_data_ch3_p_i,
    adc_data_ch3_n_i                        => adc_data_ch3_n_i,

    -- ADC clock (half of the sampling frequency) divider reset
    adc_clk_div_rst_p_o                     => adc_clk_div_rst_p_o,
    adc_clk_div_rst_n_o                     => adc_clk_div_rst_n_o,

    -- FMC Front leds. Typical uses: Over Range or Full Scale
    -- condition.
    fmc_leds_o                              => fmc_leds_o,

    -- ADC SPI control interface. Three-wire mode. Tri-stated data pin
    sys_spi_clk_o                           => sys_spi_clk_int,--sys_spi_clk_o,
    sys_spi_data_b                          => sys_spi_data_b,
    --sys_spi_dout_o                          => sys_spi_dout_int,
    --sys_spi_din_i                           => sys_spi_din_int,
    sys_spi_cs_adc0_n_o                     => sys_spi_cs_adc0_n_int,  -- SPI ADC CS channel 0
    sys_spi_cs_adc1_n_o                     => sys_spi_cs_adc1_n_int,  -- SPI ADC CS channel 1
    sys_spi_cs_adc2_n_o                     => sys_spi_cs_adc2_n_int,  -- SPI ADC CS channel 2
    sys_spi_cs_adc3_n_o                     => sys_spi_cs_adc3_n_int,  -- SPI ADC CS channel 3
    --sys_spi_miosio_oe_n_o                   => sys_spi_miosio_oe_n_int,

    -- External Trigger To/From FMC
    m2c_trig_p_i                            => m2c_trig_p_i,
    m2c_trig_n_i                            => m2c_trig_n_i,
    c2m_trig_p_o                            => c2m_trig_p_o,
    c2m_trig_n_o                            => c2m_trig_n_o,

    -- LMK (National Semiconductor) is the clock and distribution IC.
    -- uWire interface
    lmk_lock_i                              => lmk_lock_int,--lmk_lock_i,
    lmk_sync_o                              => lmk_sync_int,--lmk_sync_o,
    lmk_uwire_latch_en_o                    => lmk_uwire_latch_en_int,--lmk_uwire_latch_en_o,
    lmk_uwire_data_o                        => lmk_uwire_data_int,--lmk_uwire_data_o,
    lmk_uwire_clock_o                       => lmk_uwire_clock_int,--lmk_uwire_clock_o,

    -- Programable VCXO via I2C
    vcxo_i2c_sda_b                          => vcxo_i2c_sda_b,
    vcxo_i2c_scl_o                          => vcxo_i2c_scl_o,
    vcxo_pd_l_o                             => vcxo_pd_l_o,

    -- One-wire To/From DS2431 (VMETRO Data)
    fmc_id_dq_b                             => fmc_id_dq_b,
    -- One-wire To/From DS2432 SHA-1 (SP-Devices key)
    fmc_key_dq_b                            => fmc_key_dq_b,

    -- General board pins
    fmc_pwr_good_i                          => fmc_pwr_good_i,
    -- Internal/External clock distribution selection
    fmc_clk_sel_o                           => fmc_clk_sel_o,
    -- Reset ADCs
    fmc_reset_adcs_n_o                      => fmc_reset_adcs_n_o,--fmc_reset_adcs_n_int,
    --FMC Present status
    fmc_prsnt_m2c_l_i                       => fmc_prsnt_m2c_l_i,

    -----------------------------
    -- ADC output signals. Continuous flow.
    -----------------------------
    adc_clk_o                               => fmc516_fs_clk,
    adc_clk2x_o                             => fmc516_fs_clk2x,
    adc_rst_n_o                             => open,
    adc_data_o                              => fmc516_adc_data,
    adc_data_valid_o                        => fmc516_adc_valid,

    -----------------------------
    -- General ADC output signals
    -----------------------------
    -- Trigger to other FPGA logic
    trig_hw_o                               => open,
    trig_hw_i                               => clk_rffe_swap, -- from Position Calculation Core
    -- General board status
    fmc_mmcm_lock_o                         => fmc516_mmcm_lock_int,
    fmc_lmk_lock_o                          => fmc516_lmk_lock_int,

    -----------------------------
    -- Wishbone Streaming Interface Source
    -----------------------------
    wbs_source_i                            => wbs_fmc516_in_array,
    wbs_source_o                            => wbs_fmc516_out_array,

    adc_dly_debug_o                         => adc_dly_debug_int,

    fifo_debug_valid_o                      => fmc516_debug_valid_int,
    fifo_debug_full_o                       => fmc516_debug_full_int,
    fifo_debug_empty_o                      => fmc516_debug_empty_int
  );

  gen_wbs_dummy_signals : for i in 0 to c_num_adc_channels-1 generate
    wbs_fmc516_in_array(i)                    <= cc_dummy_src_com_in;
  end generate;

  fmc_mmcm_lock_o                           <= fmc516_mmcm_lock_int;
  fmc_lmk_lock_o                            <= fmc516_lmk_lock_int;

  sys_spi_clk_o                             <= sys_spi_clk_int;
  sys_spi_cs_adc0_n_o                       <= sys_spi_cs_adc0_n_int;
  sys_spi_cs_adc1_n_o                       <= sys_spi_cs_adc1_n_int;
  sys_spi_cs_adc2_n_o                       <= sys_spi_cs_adc2_n_int;
  sys_spi_cs_adc3_n_o                       <= sys_spi_cs_adc3_n_int;

  lmk_lock_int                              <= lmk_lock_i;
  lmk_sync_o                                <= lmk_sync_int;
  lmk_uwire_latch_en_o                      <= lmk_uwire_latch_en_int;
  lmk_uwire_data_o                          <= lmk_uwire_data_int;
  lmk_uwire_clock_o                         <= lmk_uwire_clock_int;

  -- Position calc core is slave 7
  cmp_xwb_position_calc_core : xwb_position_calc_core
  generic map (
    g_interface_mode                        => PIPELINED,
    g_address_granularity                   => WORD
  )
  port map (
    rst_n_i                                 => clk_sys_rstn,
    clk_i                                   => clk_sys,      -- wishbone clock
    fs_clk_i                                => dsp_sysclk2x, -- clock period = 4.44116091946435 ns (225.16635135135124 Mhz)

    -----------------------------
    -- Wishbone signals
    -----------------------------
    wb_slv_i                                => cbar_master_o(7),
    wb_slv_o                                => cbar_master_i(7),

    -----------------------------
    -- Raw ADC signals
    -----------------------------
    adc_ch0_i                               => fmc516_adc_data(c_adc_data_ch0_msb downto c_adc_data_ch0_lsb),
    adc_ch1_i                               => fmc516_adc_data(c_adc_data_ch1_msb downto c_adc_data_ch1_lsb),
    adc_ch2_i                               => fmc516_adc_data(c_adc_data_ch2_msb downto c_adc_data_ch2_lsb),
    adc_ch3_i                               => fmc516_adc_data(c_adc_data_ch3_msb downto c_adc_data_ch3_lsb),

    -----------------------------
    -- DSP config parameter signals
    -----------------------------
    kx                                      => dsp_kx,
    ky                                      => dsp_ky,
    ksum                                    => dsp_ksum,

    del_sig_div_fofb_thres_i                => dsp_del_sig_div_thres,
    del_sig_div_tbt_thres_i                 => dsp_del_sig_div_thres,
    del_sig_div_monit_thres_i               => dsp_del_sig_div_thres,

    -----------------------------
    -- Position calculation at various rates
    -----------------------------
    adc_ch0_dbg_data_o                      => dsp_adc_ch0_data,
    adc_ch1_dbg_data_o                      => dsp_adc_ch1_data,
    adc_ch2_dbg_data_o                      => dsp_adc_ch2_data,
    adc_ch3_dbg_data_o                      => dsp_adc_ch3_data,

    bpf_ch0_o                               => dsp_bpf_ch0,
    --bpf_ch1_o                               => out std_logic_vector(23 downto 0);
    bpf_ch2_o                               => dsp_bpf_ch2,
    --bpf_ch3_o                               => out std_logic_vector(23 downto 0);

    mix_ch0_i_o                             => dsp_mix_ch0,
    --mix_ch0_q_o                             => out std_logic_vector(23 downto 0);
    --mix_ch1_i_o                             => out std_logic_vector(23 downto 0);
    --mix_ch1_q_o                             => out std_logic_vector(23 downto 0);
    mix_ch2_i_o                             => dsp_mix_ch2,
    --mix_ch2_q_o                             => out std_logic_vector(23 downto 0);
    --mix_ch3_i_o                             => out std_logic_vector(23 downto 0);
    --mix_ch3_q_o                             => out std_logic_vector(23 downto 0);

    tbt_decim_ch0_i_o                       => dsp_poly35_ch0,
    --tbt_decim_ch0_i_o                       => open,
    --poly35_ch0_q_o                          => out std_logic_vector(23 downto 0);
    --poly35_ch1_i_o                          => out std_logic_vector(23 downto 0);
    --poly35_ch1_q_o                          => out std_logic_vector(23 downto 0);
    tbt_decim_ch2_i_o                       => dsp_poly35_ch2,
    --tbt_decim_ch2_i_o                       => open,
    --poly35_ch2_q_o                          => out std_logic_vector(23 downto 0);
    --poly35_ch3_i_o                          => out std_logic_vector(23 downto 0);
    --poly35_ch3_q_o                          => out std_logic_vector(23 downto 0);

    tbt_decim_q_ch01_incorrect_o            => dsp_tbt_decim_q_ch01_incorrect,
    tbt_decim_q_ch23_incorrect_o            => dsp_tbt_decim_q_ch23_incorrect,

    tbt_amp_ch0_o                           => dsp_tbt_amp_ch0,
    tbt_amp_ch1_o                           => dsp_tbt_amp_ch1,
    tbt_amp_ch2_o                           => dsp_tbt_amp_ch2,
    tbt_amp_ch3_o                           => dsp_tbt_amp_ch3,

    fofb_decim_ch0_i_o                      => dsp_cic_fofb_ch0, --out std_logic_vector(23 downto 0);
    --cic_fofb_ch0_q_o                        => out std_logic_vector(24 downto 0);
    --cic_fofb_ch1_i_o                        => out std_logic_vector(24 downto 0);
    --cic_fofb_ch1_q_o                        => out std_logic_vector(24 downto 0);
    fofb_decim_ch2_i_o                      => dsp_cic_fofb_ch2, --out std_logic_vector(23 downto 0);
    --cic_fofb_ch2_q_o                        => out std_logic_vector(24 downto 0);
    --cic_fofb_ch3_i_o                        => out std_logic_vector(24 downto 0);
    --cic_fofb_ch3_q_o                        => out std_logic_vector(24 downto 0);

    fofb_decim_q_01_missing_o               => dsp_fofb_decim_q_01_missing,
    fofb_decim_q_23_missing_o               => dsp_fofb_decim_q_23_missing,

    fofb_amp_ch0_o                          => dsp_fofb_amp_ch0,
    fofb_amp_ch1_o                          => dsp_fofb_amp_ch1,
    fofb_amp_ch2_o                          => dsp_fofb_amp_ch2,
    fofb_amp_ch3_o                          => dsp_fofb_amp_ch3,

    monit_amp_ch0_o                         => dsp_monit_amp_ch0,
    monit_amp_ch1_o                         => dsp_monit_amp_ch1,
    monit_amp_ch2_o                         => dsp_monit_amp_ch2,
    monit_amp_ch3_o                         => dsp_monit_amp_ch3,

    x_tbt_o                                 => dsp_x_tbt,
    y_tbt_o                                 => dsp_y_tbt,
    q_tbt_o                                 => dsp_q_tbt,
    sum_tbt_o                               => dsp_sum_tbt,

    x_fofb_o                                => dsp_x_fofb,
    y_fofb_o                                => dsp_y_fofb,
    q_fofb_o                                => dsp_q_fofb,
    sum_fofb_o                              => dsp_sum_fofb,

    x_monit_o                               => dsp_x_monit,
    y_monit_o                               => dsp_y_monit,
    q_monit_o                               => dsp_q_monit,
    sum_monit_o                             => dsp_sum_monit,

    monit_cic_unexpected_o                  => dsp_monit_cic_unexpected,
    monit_cfir_incorrect_o                  => dsp_monit_cfir_incorrect,
    monit_pfir_incorrect_o                  => dsp_monit_pfir_incorrect,

    -----------------------------
    -- Output to RFFE board
    -----------------------------
    clk_swap_o                              => clk_rffe_swap,
    ctrl1_o                                 => open,
    ctrl2_o                                 => open,

  -----------------------------
  -- Clock drivers for various rates
  -----------------------------
    clk_ce_1_o                              => dsp_clk_ce_1,
    clk_ce_1112_o                           => dsp_clk_ce_1112,
    clk_ce_11120000_o                       => dsp_clk_ce_11120000,
    clk_ce_1390000_o                        => dsp_clk_ce_1390000,
    clk_ce_2_o                              => dsp_clk_ce_2,
    clk_ce_2224_o                           => dsp_clk_ce_2224,
    clk_ce_22240000_o                       => dsp_clk_ce_22240000,
    clk_ce_2780000_o                        => dsp_clk_ce_2780000,
    clk_ce_35_o                             => dsp_clk_ce_35,
    clk_ce_5000_o                           => dsp_clk_ce_5000,
    clk_ce_556_o                            => dsp_clk_ce_556,
    clk_ce_5560000_o                        => dsp_clk_ce_5560000,
    clk_ce_70_o                             => dsp_clk_ce_70
  );

  --dsp_poly35_ch0 <= (others => '0');
  --dsp_poly35_ch2 <= (others => '0');
  --
  --dsp_monit_amp_ch0 <= (others => '0');
  --dsp_monit_amp_ch1 <= (others => '0');
  --dsp_monit_amp_ch2 <= (others => '0');
  --dsp_monit_amp_ch3 <= (others => '0');

  -- Signals for the DSP chain
  dsp_sysce                                 <= '1';
  dsp_sysce_clr                             <= '0';
  --dsp_sysclk                                <= fmc516_fs_clk(c_adc_ref_clk);
  dsp_sysclk2x                              <= fmc516_fs_clk2x(c_adc_ref_clk);  -- oversampled DSP chain
  dsp_sysclk                                <= fmc516_fs_clk(c_adc_ref_clk);  -- oversampled DSP chain
  --dsp_rst_n                                 <= fmc516_fs_rst_n(c_adc_ref_clk);
  dsp_del_sig_div_thres                     <= "00000000000000001000000000"; -- aprox 1.22e-4 FIX26_22

  --dsp_kx                                    <= "100110001001011010000000"; -- 10000000 UFIX24_0
  dsp_kx                                    <= "0100000000000000000000000"; -- ??? UFIX25_0
  --dsp_kx                                    <= "00100110001001011010000000"; -- 10000000 UFIX26_0
  --dsp_ky                                    <= "100110001001011010000000"; -- 10000000 UFIX24_0
  dsp_ky                                    <= "0100000000000000000000000"; -- ??? UFIX25_0
  --dsp_ky                                    <= "00100110001001011010000000"; -- 10000000 UFIX26_0
  dsp_ksum                                  <= "0111111111111111111111111"; -- 1.0 FIX25_24
  --dsp_ksum                                  <= "10000000000000000000000000"; -- 1.0 FIX26_25
  --dsp_ksum                                  <= "100000000000000000000000"; -- 1.0 FIX24_23
  --dsp_ksum                                  <= "10000000000000000000000000"; -- 1.0 FIX26_25

  -- The board peripherals components is slave 9
  cmp_xwb_dbe_periph : xwb_dbe_periph
  generic map(
    -- NOT used!
    --g_interface_mode                          : t_wishbone_interface_mode      := CLASSIC;
    -- NOT used!
    --g_address_granularity                     : t_wishbone_address_granularity := WORD;
    g_cntr_period                             => c_tics_cntr_period,
    g_num_leds                                => c_leds_num_pins,
    g_num_buttons                             => c_buttons_num_pins
  )
  port map(
    clk_sys_i                                 => clk_sys,
    rst_n_i                                   => clk_sys_rstn,

    -- UART
    uart_rxd_i                                => uart_rxd_i,
    uart_txd_o                                => uart_txd_o,

    -- LEDs
    led_out_o                                 => gpio_leds_int,
    led_in_i                                  => gpio_leds_int,
    led_oen_o                                 => open,

    -- Buttons
    button_out_o                              => open,
    button_in_i                               => buttons_i,
    button_oen_o                              => open,

    -- Wishbone
    slave_i                                   => cbar_master_o(9),
    slave_o                                   => cbar_master_i(9)
  );

  leds_o <= gpio_leds_int;

  ---- Xilinx Chipscope
  --cmp_chipscope_icon_0 : chipscope_icon_4_port
  --port map (
  --  CONTROL0                                => CONTROL0,
  --  CONTROL1                                => CONTROL1,
  --  CONTROL2                                => CONTROL2,
  --  CONTROL3                                => CONTROL3
  --);

  cmp_chipscope_icon_7_port : chipscope_icon_7_port
  port map (
    CONTROL0                                => CONTROL0,
    CONTROL1                                => CONTROL1,
    CONTROL2                                => CONTROL2,
    CONTROL3                                => CONTROL3,
    CONTROL4                                => CONTROL4,
    CONTROL5                                => CONTROL5,
    CONTROL6                                => CONTROL6
  );

  cmp_chipscope_ila_0_fmc516_adc : chipscope_ila
  port map (
    CONTROL                                 => CONTROL0,
    CLK                                     => fmc516_fs_clk(c_adc_ref_clk),
    TRIG0                                   => TRIG_ILA0_0,
    TRIG1                                   => TRIG_ILA0_1,
    TRIG2                                   => TRIG_ILA0_2,
    TRIG3                                   => TRIG_ILA0_3
  );

  -- FMC516 WBS master output data
  --TRIG_ILA0_0                               <= fmc516_adc_data(31 downto 16) &
  --                                               fmc516_adc_data(47 downto 32);
  TRIG_ILA0_0                               <= dsp_adc_ch1_data &
                                                 dsp_adc_ch0_data;

  TRIG_ILA0_1                               <= dsp_adc_ch3_data &
                                                 dsp_adc_ch2_data;

  TRIG_ILA0_2                               <= (others => '0');
  TRIG_ILA0_3                               <= (others => '0');
  -- FMC516 WBS master output data
  --TRIG_ILA0_1(11 downto 0)                   <= adc_dly_reg_debug_int(1).clk_load &
  --                                              adc_dly_reg_debug_int(1).data_load &
  --                                              adc_dly_reg_debug_int(1).clk_dly_reg &
  --                                              adc_dly_reg_debug_int(1).data_dly_reg;
  --TRIG_ILA0_1(31 downto 12)                  <= (others => '0');

  ---- FMC516 WBS master output control signals
  --TRIG_ILA0_2(17 downto 0)                   <= wbs_fmc516_out_array(1).cyc &
  --                                               wbs_fmc516_out_array(1).stb &
  --                                               wbs_fmc516_out_array(1).adr &
  --                                               wbs_fmc516_out_array(1).sel &
  --                                               wbs_fmc516_out_array(1).we &
  --                                               wbs_fmc516_out_array(2).cyc &
  --                                               wbs_fmc516_out_array(2).stb &
  --                                               wbs_fmc516_out_array(2).adr &
  --                                               wbs_fmc516_out_array(2).sel &
  --                                               wbs_fmc516_out_array(2).we;
  --TRIG_ILA0_2(18)                            <= fmc_reset_adcs_n_out;
  --TRIG_ILA0_2(22 downto 19)                  <= fmc516_adc_valid;
  --TRIG_ILA0_2(23)                            <= fmc516_mmcm_lock_int;
  --TRIG_ILA0_2(24)                            <= fmc516_lmk_lock_int;
  --TRIG_ILA0_2(25)                            <= fmc516_debug_valid_int(1);
  --TRIG_ILA0_2(26)                            <= fmc516_debug_full_int(1);
  --TRIG_ILA0_2(27)                            <= fmc516_debug_empty_int(1);
  --TRIG_ILA0_2(31 downto 28)                  <= (others => '0');
  --
  --TRIG_ILA0_3                                 <= dsp_adc_ch3_data &
  --                                                dsp_adc_ch2_data;

  -- Mix and BPF data
  cmp_chipscope_ila_8192_bpf_mix : chipscope_ila_8192
  port map (
    CONTROL                                 => CONTROL1,
    CLK                                     => dsp_sysclk,
    TRIG0                                   => TRIG_ILA1_0,
    TRIG1                                   => TRIG_ILA1_1,
    TRIG2                                   => TRIG_ILA1_2,
    TRIG3                                   => TRIG_ILA1_3,
    TRIG4                                   => TRIG_ILA1_4
  );

  TRIG_ILA1_0(0)                            <= dsp_clk_ce_1;
  TRIG_ILA1_0(1)                            <= dsp_clk_ce_35;
  TRIG_ILA1_0(2)                            <= dsp_clk_ce_1112;
  TRIG_ILA1_0(3)                            <= dsp_clk_ce_1390000; -- not used
  TRIG_ILA1_0(4)                            <= dsp_clk_ce_2780000;
  TRIG_ILA1_0(5)                            <= dsp_clk_ce_11120000;
  TRIG_ILA1_0(7 downto 6)                   <= (others => '0');

  --TRIG_ILA1_1(dsp_bpf_ch0'range)            <= dsp_bpf_ch0;
  --TRIG_ILA1_2(dsp_bpf_ch2'range)            <= dsp_bpf_ch2;
  --TRIG_ILA1_1(dsp_poly35_ch0'range)         <= dsp_poly35_ch0;
  --TRIG_ILA1_2(dsp_poly35_ch2'range)         <= dsp_poly35_ch2;
  --TRIG_ILA1_3(dsp_cic_fofb_ch0'range)       <= dsp_cic_fofb_ch0;
  --TRIG_ILA1_4(dsp_cic_fofb_ch2'range)       <= dsp_cic_fofb_ch2;
  TRIG_ILA1_1(dsp_monit_amp_ch0'range)      <= dsp_monit_amp_ch0;
  TRIG_ILA1_2(dsp_monit_amp_ch1'range)      <= dsp_monit_amp_ch1;
  TRIG_ILA1_3(dsp_monit_amp_ch2'range)      <= dsp_monit_amp_ch2;
  TRIG_ILA1_4(dsp_monit_amp_ch3'range)      <= dsp_monit_amp_ch3;

  TRIG_ILA1_4(dsp_monit_amp_ch3'left+3 downto
      dsp_monit_amp_ch3'left+1)             <= dsp_monit_cic_unexpected &
                                                dsp_monit_cfir_incorrect &
                                                dsp_monit_pfir_incorrect;

  -- TBT amplitudes data
  cmp_chipscope_ila_8192_tbt_amp : chipscope_ila_8192
  port map (
    CONTROL                                 => CONTROL2,
    CLK                                     => dsp_sysclk,
    TRIG0                                   => TRIG_ILA2_0,
    TRIG1                                   => TRIG_ILA2_1,
    TRIG2                                   => TRIG_ILA2_2,
    TRIG3                                   => TRIG_ILA2_3,
    TRIG4                                   => TRIG_ILA2_4
  );

  TRIG_ILA2_0(0)                            <= dsp_clk_ce_1;
  TRIG_ILA2_0(1)                            <= dsp_clk_ce_35;
  TRIG_ILA2_0(2)                            <= dsp_clk_ce_1112;
  TRIG_ILA2_0(3)                            <= dsp_clk_ce_1390000;
  TRIG_ILA2_0(4)                            <= dsp_clk_ce_2780000; -- not used
  TRIG_ILA2_0(5)                            <= dsp_clk_ce_11120000;
  TRIG_ILA2_0(7 downto 6)                   <= (others => '0');

  TRIG_ILA2_1(dsp_tbt_amp_ch0'range)        <= dsp_tbt_amp_ch0;
  TRIG_ILA2_2(dsp_tbt_amp_ch1'range)        <= dsp_tbt_amp_ch1;
  TRIG_ILA2_3(dsp_tbt_amp_ch2'range)        <= dsp_tbt_amp_ch2;
  TRIG_ILA2_4(dsp_tbt_amp_ch3'range)        <= dsp_tbt_amp_ch3;
  TRIG_ILA2_4(dsp_tbt_amp_ch3'left+2 downto
      dsp_tbt_amp_ch3'left+1)               <= dsp_tbt_decim_q_ch01_incorrect &
                                                  dsp_tbt_decim_q_ch23_incorrect;

  -- TBT position data
  cmp_chipscope_ila_8192_tbt_pos : chipscope_ila_8192
  port map (
    CONTROL                                 => CONTROL3,
    CLK                                     => dsp_sysclk,
    TRIG0                                   => TRIG_ILA3_0,
    TRIG1                                   => TRIG_ILA3_1,
    TRIG2                                   => TRIG_ILA3_2,
    TRIG3                                   => TRIG_ILA3_3,
    TRIG4                                   => TRIG_ILA3_4
  );

  TRIG_ILA3_0(0)                            <= dsp_clk_ce_1;
  TRIG_ILA3_0(1)                            <= dsp_clk_ce_35;
  TRIG_ILA3_0(2)                            <= dsp_clk_ce_1112;
  TRIG_ILA3_0(3)                            <= dsp_clk_ce_1390000;
  TRIG_ILA3_0(4)                            <= dsp_clk_ce_2780000; -- not used
  TRIG_ILA3_0(5)                            <= dsp_clk_ce_11120000;
  TRIG_ILA3_0(7 downto 6)                   <= (others => '0');

  TRIG_ILA3_1(dsp_x_tbt'range)              <= dsp_x_tbt;
  TRIG_ILA3_2(dsp_y_tbt'range)              <= dsp_y_tbt;
  TRIG_ILA3_3(dsp_q_tbt'range)              <= dsp_q_tbt;
  TRIG_ILA3_4(dsp_sum_tbt'range)            <= dsp_sum_tbt;

  -- FOFB amplitudes data
  cmp_chipscope_ila_8192_fofb_amp : chipscope_ila_8192
  port map (
    CONTROL                                 => CONTROL4,
    CLK                                     => dsp_sysclk,
    TRIG0                                   => TRIG_ILA4_0,
    TRIG1                                   => TRIG_ILA4_1,
    TRIG2                                   => TRIG_ILA4_2,
    TRIG3                                   => TRIG_ILA4_3,
    TRIG4                                   => TRIG_ILA4_4
  );

  TRIG_ILA4_0(0)                            <= dsp_clk_ce_1;
  TRIG_ILA4_0(1)                            <= dsp_clk_ce_35;
  TRIG_ILA4_0(2)                            <= dsp_clk_ce_1112;
  TRIG_ILA4_0(3)                            <= dsp_clk_ce_1390000;
  TRIG_ILA4_0(4)                            <= dsp_clk_ce_2780000; -- not used
  TRIG_ILA4_0(5)                            <= dsp_clk_ce_11120000;
  TRIG_ILA4_0(7 downto 6)                   <= (others => '0');

  TRIG_ILA4_1(dsp_fofb_amp_ch0'range)       <= dsp_fofb_amp_ch0;
  TRIG_ILA4_2(dsp_fofb_amp_ch1'range)       <= dsp_fofb_amp_ch1;
  TRIG_ILA4_3(dsp_fofb_amp_ch2'range)       <= dsp_fofb_amp_ch2;
  TRIG_ILA4_4(dsp_fofb_amp_ch3'range)       <= dsp_fofb_amp_ch3;
  TRIG_ILA4_4(dsp_fofb_amp_ch3'left+2 downto
      dsp_fofb_amp_ch3'left+1)              <= dsp_fofb_decim_q_01_missing &
                                                dsp_fofb_decim_q_23_missing;
  -- FOFB position data
  cmp_chipscope_ila_8192_fofb_pos : chipscope_ila_8192
  port map (
    CONTROL                                 => CONTROL5,
    CLK                                     => dsp_sysclk,
    TRIG0                                   => TRIG_ILA5_0,
    TRIG1                                   => TRIG_ILA5_1,
    TRIG2                                   => TRIG_ILA5_2,
    TRIG3                                   => TRIG_ILA5_3,
    TRIG4                                   => TRIG_ILA5_4
  );

  TRIG_ILA5_0(0)                            <= dsp_clk_ce_1;
  TRIG_ILA5_0(1)                            <= dsp_clk_ce_35;
  TRIG_ILA5_0(2)                            <= dsp_clk_ce_1112;
  TRIG_ILA5_0(3)                            <= dsp_clk_ce_1390000;
  TRIG_ILA5_0(4)                            <= dsp_clk_ce_2780000; -- not used
  TRIG_ILA5_0(5)                            <= dsp_clk_ce_11120000;
  TRIG_ILA5_0(7 downto 6)                   <= (others => '0');

  TRIG_ILA5_1(dsp_x_fofb'range)             <= dsp_x_fofb;
  TRIG_ILA5_2(dsp_y_fofb'range)             <= dsp_y_fofb;
  TRIG_ILA5_3(dsp_q_fofb'range)             <= dsp_q_fofb;
  TRIG_ILA5_4(dsp_sum_fofb'range)           <= dsp_sum_fofb;

  -- Monitoring position data
  cmp_chipscope_ila_8192_monit_pos : chipscope_ila_8192
  port map (
    CONTROL                                 => CONTROL6,
    CLK                                     => dsp_sysclk,
    TRIG0                                   => TRIG_ILA6_0,
    TRIG1                                   => TRIG_ILA6_1,
    TRIG2                                   => TRIG_ILA6_2,
    TRIG3                                   => TRIG_ILA6_3,
    TRIG4                                   => TRIG_ILA6_4
  );

  TRIG_ILA6_0(0)                            <= dsp_clk_ce_1;
  TRIG_ILA6_0(1)                            <= dsp_clk_ce_35;
  TRIG_ILA6_0(2)                            <= dsp_clk_ce_1112;
  TRIG_ILA6_0(3)                            <= dsp_clk_ce_1390000;
  TRIG_ILA6_0(4)                            <= dsp_clk_ce_2780000; -- not used
  TRIG_ILA6_0(5)                            <= dsp_clk_ce_11120000;
  TRIG_ILA6_0(7 downto 6)                   <= (others => '0');

  TRIG_ILA6_1(dsp_x_monit'range)            <= dsp_x_monit;
  TRIG_ILA6_2(dsp_y_monit'range)            <= dsp_y_monit;
  TRIG_ILA6_3(dsp_q_monit'range)            <= dsp_q_monit;
  TRIG_ILA6_4(dsp_sum_monit'range)          <= dsp_sum_monit;
end rtl;
