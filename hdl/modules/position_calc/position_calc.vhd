-------------------------------------------------------------------------------
-- Title      : Position calc, no sysgen generator
-- Project    :
-------------------------------------------------------------------------------
-- File       : position_calc.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    :
-- Created    : 2014-05-06
-- Last update: 2016-05-02
-- Platform   :
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Position calculation with no sysgen parts
-------------------------------------------------------------------------------
-- Copyright (c) 2014
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author              Description
-- 2014-05-06  1.0      aylons              Created
-- 2014-10-06  2.0      vfinotti            CreatedHotfix
-- 2022-11-11  2.1      guilherme.ricioli   Add ADC scaling stage
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library work;
use work.dsp_cores_pkg.all;
use work.genram_pkg.all;
use work.bpm_cores_pkg.all;

entity position_calc is
  generic(
    -- selection of position_calc stages
    g_with_downconv  : boolean := true;

    -- input sizes
    g_input_width : natural := 16;
    g_mixed_width : natural := 16;
    g_adc_ratio   : natural := 1;

    -- mixer
    g_dds_width  : natural := 16;
    g_dds_points : natural := 35;

    -- desync counter width. Tied to register width
    g_tbt_tag_desync_cnt_width   : natural := 14;
    -- width of CIC mask number of samples
    g_tbt_cic_mask_samples_width : natural := 16;

    -- CIC setup
    g_tbt_cic_delay   : natural := 1;
    g_tbt_cic_stages  : natural := 2;
    g_tbt_ratio       : natural := 35;  -- ratio between
    g_tbt_decim_width : natural := 32;

    g_fofb_cic_delay   : natural := 1;
    g_fofb_cic_stages  : natural := 2;
    g_fofb_ratio       : natural := 980;  -- ratio between adc and fofb rates
    g_fofb_decim_width : natural := 32;

    -- desync counter width. Tied to register width
    g_fofb_decim_desync_cnt_width : natural := 14;
    -- width of CIC mask number of samples
    g_fofb_cic_mask_samples_width : natural := 16;

    g_monit1_cic_delay  : natural := 1;
    g_monit1_cic_stages : natural := 1;
    g_monit1_ratio      : natural := 100;  --ratio between fofb and monit 1
    g_monit1_cic_ratio  : positive := 8;

    -- desync counter width. Tied to register width
    g_monit1_tag_desync_cnt_width   : natural := 14;
    -- width of CIC mask number of samples
    g_monit1_cic_mask_samples_width : natural := 16;

    g_monit2_cic_delay  : natural := 1;
    g_monit2_cic_stages : natural := 1;
    g_monit2_ratio      : natural := 100;  -- ratio between monit 1 and 2
    g_monit2_cic_ratio  : positive := 8;

    -- desync counter width. Tied to register width
    g_monit2_tag_desync_cnt_width : natural := 14;
    -- width of CIC mask number of samples
    g_monit2_cic_mask_samples_width : natural := 16;

    g_monit_decim_width : natural := 32;

    -- Cordic setup
    g_tbt_cordic_stages       : positive := 12;
    g_tbt_cordic_iter_per_clk : positive := 3;
    g_tbt_cordic_ratio        : positive := 4;

    g_fofb_cordic_stages       : positive := 15;
    g_fofb_cordic_iter_per_clk : positive := 3;
    g_fofb_cordic_ratio        : positive := 4;

    -- width of K constants
    g_k_width : natural := 25;

    -- width of offset constants
    g_offset_width : natural := 32;

    --width for IQ output
    g_IQ_width : natural := 32;

    -- width of adc gains
    g_adc_gain_width  : natural := 25;

    -- Width of ADC offsets
    g_adc_offset_width : natural := 16
    );

  port(
    adc_ch0_i       : in std_logic_vector(g_input_width-1 downto 0);
    adc_ch1_i       : in std_logic_vector(g_input_width-1 downto 0);
    adc_ch2_i       : in std_logic_vector(g_input_width-1 downto 0);
    adc_ch3_i       : in std_logic_vector(g_input_width-1 downto 0);
    adc_tag_i       : in std_logic_vector(0 downto 0);
    adc_tag_en_i    : in std_logic                                   := '0';
    adc_valid_i     : in std_logic;

    clk_i : in std_logic;  -- clock period = 4.44116091946435 ns (225.16635135135124 Mhz)
    rst_i : in std_logic;               -- clear signal

    ksum_i : in std_logic_vector(g_k_width-1 downto 0);
    kx_i   : in std_logic_vector(g_k_width-1 downto 0);
    ky_i   : in std_logic_vector(g_k_width-1 downto 0);

    adc_ch0_swclk_0_gain_i : in std_logic_vector(g_adc_gain_width-1 downto 0);
    adc_ch1_swclk_0_gain_i : in std_logic_vector(g_adc_gain_width-1 downto 0);
    adc_ch2_swclk_0_gain_i : in std_logic_vector(g_adc_gain_width-1 downto 0);
    adc_ch3_swclk_0_gain_i : in std_logic_vector(g_adc_gain_width-1 downto 0);

    adc_ch0_swclk_1_gain_i : in std_logic_vector(g_adc_gain_width-1 downto 0);
    adc_ch1_swclk_1_gain_i : in std_logic_vector(g_adc_gain_width-1 downto 0);
    adc_ch2_swclk_1_gain_i : in std_logic_vector(g_adc_gain_width-1 downto 0);
    adc_ch3_swclk_1_gain_i : in std_logic_vector(g_adc_gain_width-1 downto 0);

    adc_ch0_swclk_0_offset_i : in std_logic_vector(g_adc_offset_width-1 downto 0);
    adc_ch1_swclk_0_offset_i : in std_logic_vector(g_adc_offset_width-1 downto 0);
    adc_ch2_swclk_0_offset_i : in std_logic_vector(g_adc_offset_width-1 downto 0);
    adc_ch3_swclk_0_offset_i : in std_logic_vector(g_adc_offset_width-1 downto 0);

    adc_ch0_swclk_1_offset_i : in std_logic_vector(g_adc_offset_width-1 downto 0);
    adc_ch1_swclk_1_offset_i : in std_logic_vector(g_adc_offset_width-1 downto 0);
    adc_ch2_swclk_1_offset_i : in std_logic_vector(g_adc_offset_width-1 downto 0);
    adc_ch3_swclk_1_offset_i : in std_logic_vector(g_adc_offset_width-1 downto 0);

    offset_x_i  : in std_logic_vector(g_offset_width-1 downto 0) := (others => '0');
    offset_y_i  : in std_logic_vector(g_offset_width-1 downto 0) := (others => '0');

    mix_ch0_i_o : out std_logic_vector(g_IQ_width-1 downto 0);
    mix_ch0_q_o : out std_logic_vector(g_IQ_width-1 downto 0);
    mix_ch1_i_o : out std_logic_vector(g_IQ_width-1 downto 0);
    mix_ch1_q_o : out std_logic_vector(g_IQ_width-1 downto 0);
    mix_ch2_i_o : out std_logic_vector(g_IQ_width-1 downto 0);
    mix_ch2_q_o : out std_logic_vector(g_IQ_width-1 downto 0);
    mix_ch3_i_o : out std_logic_vector(g_IQ_width-1 downto 0);
    mix_ch3_q_o : out std_logic_vector(g_IQ_width-1 downto 0);
    mix_valid_o : out std_logic;
    mix_ce_o    : out std_logic;

    tbt_tag_i                         : in std_logic_vector(0 downto 0);
    tbt_tag_en_i                      : in std_logic := '0';
    tbt_tag_desync_cnt_rst_i          : in std_logic := '0';
    tbt_tag_desync_cnt_o              : out std_logic_vector(g_tbt_tag_desync_cnt_width-1 downto 0);
    tbt_decim_mask_en_i               : in std_logic := '0';
    tbt_decim_mask_num_samples_beg_i  : in unsigned(g_tbt_cic_mask_samples_width-1 downto 0) := (others => '0');
    tbt_decim_mask_num_samples_end_i  : in unsigned(g_tbt_cic_mask_samples_width-1 downto 0) := (others => '0');

    tbt_decim_ch0_i_o : out std_logic_vector(g_tbt_decim_width-1 downto 0);
    tbt_decim_ch0_q_o : out std_logic_vector(g_tbt_decim_width-1 downto 0);
    tbt_decim_ch1_i_o : out std_logic_vector(g_tbt_decim_width-1 downto 0);
    tbt_decim_ch1_q_o : out std_logic_vector(g_tbt_decim_width-1 downto 0);
    tbt_decim_ch2_i_o : out std_logic_vector(g_tbt_decim_width-1 downto 0);
    tbt_decim_ch2_q_o : out std_logic_vector(g_tbt_decim_width-1 downto 0);
    tbt_decim_ch3_i_o : out std_logic_vector(g_tbt_decim_width-1 downto 0);
    tbt_decim_ch3_q_o : out std_logic_vector(g_tbt_decim_width-1 downto 0);
    tbt_decim_valid_o : out std_logic;
    tbt_decim_ce_o    : out std_logic;

    tbt_amp_ch0_o   : out std_logic_vector(g_tbt_decim_width-1 downto 0);
    tbt_amp_ch1_o   : out std_logic_vector(g_tbt_decim_width-1 downto 0);
    tbt_amp_ch2_o   : out std_logic_vector(g_tbt_decim_width-1 downto 0);
    tbt_amp_ch3_o   : out std_logic_vector(g_tbt_decim_width-1 downto 0);
    tbt_amp_valid_o : out std_logic;
    tbt_amp_ce_o    : out std_logic;

    tbt_pha_ch0_o   : out std_logic_vector(g_tbt_decim_width-1 downto 0);
    tbt_pha_ch1_o   : out std_logic_vector(g_tbt_decim_width-1 downto 0);
    tbt_pha_ch2_o   : out std_logic_vector(g_tbt_decim_width-1 downto 0);
    tbt_pha_ch3_o   : out std_logic_vector(g_tbt_decim_width-1 downto 0);
    tbt_pha_valid_o : out std_logic;
    tbt_pha_ce_o    : out std_logic;

    fofb_decim_desync_cnt_rst_i   : in std_logic := '0';
    fofb_decim_desync_cnt_o       : out std_logic_vector(g_fofb_decim_desync_cnt_width-1 downto 0);
    fofb_decim_mask_en_i          : in std_logic := '0';
    fofb_decim_mask_num_samples_i : in unsigned(g_fofb_cic_mask_samples_width-1 downto 0) := (others => '0');

    fofb_decim_ch0_i_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
    fofb_decim_ch0_q_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
    fofb_decim_ch1_i_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
    fofb_decim_ch1_q_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
    fofb_decim_ch2_i_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
    fofb_decim_ch2_q_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
    fofb_decim_ch3_i_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
    fofb_decim_ch3_q_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
    fofb_decim_valid_o : out std_logic;
    fofb_decim_ce_o    : out std_logic;

    fofb_amp_ch0_o   : out std_logic_vector(g_fofb_decim_width-1 downto 0);
    fofb_amp_ch1_o   : out std_logic_vector(g_fofb_decim_width-1 downto 0);
    fofb_amp_ch2_o   : out std_logic_vector(g_fofb_decim_width-1 downto 0);
    fofb_amp_ch3_o   : out std_logic_vector(g_fofb_decim_width-1 downto 0);
    fofb_amp_valid_o : out std_logic;
    fofb_amp_ce_o    : out std_logic;

    fofb_pha_ch0_o   : out std_logic_vector(g_fofb_decim_width-1 downto 0);
    fofb_pha_ch1_o   : out std_logic_vector(g_fofb_decim_width-1 downto 0);
    fofb_pha_ch2_o   : out std_logic_vector(g_fofb_decim_width-1 downto 0);
    fofb_pha_ch3_o   : out std_logic_vector(g_fofb_decim_width-1 downto 0);
    fofb_pha_valid_o : out std_logic;
    fofb_pha_ce_o    : out std_logic;

    monit1_tag_i                         : in std_logic_vector(0 downto 0);
    monit1_tag_en_i                      : in std_logic := '0';
    monit1_tag_desync_cnt_rst_i          : in std_logic := '0';
    monit1_tag_desync_cnt_o              : out std_logic_vector(g_monit1_tag_desync_cnt_width-1 downto 0);
    monit1_decim_mask_en_i               : in std_logic := '0';
    monit1_decim_mask_num_samples_beg_i  : in unsigned(g_monit1_cic_mask_samples_width-1 downto 0) := (others => '0');
    monit1_decim_mask_num_samples_end_i  : in unsigned(g_monit1_cic_mask_samples_width-1 downto 0) := (others => '0');

    monit1_amp_ch0_o   : out std_logic_vector(g_monit_decim_width-1 downto 0);
    monit1_amp_ch1_o   : out std_logic_vector(g_monit_decim_width-1 downto 0);
    monit1_amp_ch2_o   : out std_logic_vector(g_monit_decim_width-1 downto 0);
    monit1_amp_ch3_o   : out std_logic_vector(g_monit_decim_width-1 downto 0);
    monit1_amp_valid_o : out std_logic;
    monit1_amp_ce_o    : out std_logic;

    monit_tag_i                         : in std_logic_vector(0 downto 0);
    monit_tag_en_i                      : in std_logic := '0';
    monit_tag_desync_cnt_rst_i          : in std_logic := '0';
    monit_tag_desync_cnt_o              : out std_logic_vector(g_monit2_tag_desync_cnt_width-1 downto 0);
    monit_decim_mask_en_i               : in std_logic := '0';
    monit_decim_mask_num_samples_beg_i  : in unsigned(g_monit2_cic_mask_samples_width-1 downto 0) := (others => '0');
    monit_decim_mask_num_samples_end_i  : in unsigned(g_monit2_cic_mask_samples_width-1 downto 0) := (others => '0');

    monit_amp_ch0_o   : out std_logic_vector(g_monit_decim_width-1 downto 0);
    monit_amp_ch1_o   : out std_logic_vector(g_monit_decim_width-1 downto 0);
    monit_amp_ch2_o   : out std_logic_vector(g_monit_decim_width-1 downto 0);
    monit_amp_ch3_o   : out std_logic_vector(g_monit_decim_width-1 downto 0);
    monit_amp_valid_o : out std_logic;
    monit_amp_ce_o    : out std_logic;

    tbt_pos_x_o        : out std_logic_vector(g_tbt_decim_width-1 downto 0);
    tbt_pos_y_o        : out std_logic_vector(g_tbt_decim_width-1 downto 0);
    tbt_pos_q_o        : out std_logic_vector(g_tbt_decim_width-1 downto 0);
    tbt_pos_sum_o      : out std_logic_vector(g_tbt_decim_width-1 downto 0);
    tbt_pos_valid_o    : out std_logic;
    tbt_pos_ce_o       : out std_logic;

    fofb_pos_x_o        : out std_logic_vector(g_fofb_decim_width-1 downto 0);
    fofb_pos_y_o        : out std_logic_vector(g_fofb_decim_width-1 downto 0);
    fofb_pos_q_o        : out std_logic_vector(g_fofb_decim_width-1 downto 0);
    fofb_pos_sum_o      : out std_logic_vector(g_fofb_decim_width-1 downto 0);
    fofb_pos_valid_o    : out std_logic;
    fofb_pos_ce_o       : out std_logic;

    monit1_pos_x_o        : out std_logic_vector(g_monit_decim_width-1 downto 0);
    monit1_pos_y_o        : out std_logic_vector(g_monit_decim_width-1 downto 0);
    monit1_pos_q_o        : out std_logic_vector(g_monit_decim_width-1 downto 0);
    monit1_pos_sum_o      : out std_logic_vector(g_monit_decim_width-1 downto 0);
    monit1_pos_valid_o    : out std_logic;
    monit1_pos_ce_o       : out std_logic;

    monit_pos_x_o        : out std_logic_vector(g_monit_decim_width-1 downto 0);
    monit_pos_y_o        : out std_logic_vector(g_monit_decim_width-1 downto 0);
    monit_pos_q_o        : out std_logic_vector(g_monit_decim_width-1 downto 0);
    monit_pos_sum_o      : out std_logic_vector(g_monit_decim_width-1 downto 0);
    monit_pos_valid_o    : out std_logic;
    monit_pos_ce_o       : out std_logic
    );
end position_calc;

architecture rtl of position_calc is

  -------------
  --Constants--
  -------------

  constant c_cic_round_convergent : natural := 1;

  constant c_adc_tag_width           : natural := 1;
  constant c_tbt_tag_width           : natural := 1;
  constant c_monit1_tag_width        : natural := 1;
  constant c_monit2_tag_width        : natural := 1;

  -- full ratio is the accumulated ratio between data and clock.
  constant c_adc_ratio_full    : natural := g_adc_ratio;
  constant c_tbt_ratio_full    : natural := g_tbt_ratio*c_adc_ratio_full;
  constant c_fofb_ratio_full   : natural := g_fofb_ratio*c_adc_ratio_full;
  constant c_monit1_ratio_full : natural := g_monit1_ratio*c_fofb_ratio_full;
  constant c_monit2_ratio_full : natural := g_monit2_ratio*c_monit1_ratio_full;


  -- width for decimation counters
  constant c_adc_width        : natural := f_log2_size(g_adc_ratio+1);
  constant c_cic_tbt_width    : natural := f_log2_size(g_tbt_ratio+1);
  constant c_cic_fofb_width   : natural := f_log2_size(g_fofb_ratio+1);
  constant c_cic_monit1_width : natural := f_log2_size(g_monit1_ratio+1);
  constant c_cic_monit2_width : natural := f_log2_size(g_monit2_ratio+1);

  -- width for ce counters
  constant c_adc_ce_width         : natural := f_log2_size(c_adc_ratio_full+1);
  constant c_tbt_ce_width         : natural := f_log2_size(c_tbt_ratio_full+1);
  constant c_fofb_ce_width        : natural := f_log2_size(c_fofb_ratio_full+1);
  constant c_monit1_ce_width      : natural := f_log2_size(c_monit1_ratio_full+1);
  constant c_monit2_ce_width      : natural := f_log2_size(c_monit2_ratio_full+1);
  constant c_tbt_cordic_ce_width  : natural := f_log2_size(g_tbt_cordic_ratio+1);
  constant c_fofb_cordic_ce_width : natural := f_log2_size(g_fofb_cordic_ratio+1);
  constant c_monit1_cic_ce_width  : natural := f_log2_size(g_monit1_cic_ratio+1);
  constant c_monit2_cic_ce_width  : natural := f_log2_size(g_monit2_cic_ratio+1);


  constant c_fofb_ratio_slv : std_logic_vector(c_cic_fofb_width-1 downto 0)
    := std_logic_vector(to_unsigned(g_fofb_ratio, c_cic_fofb_width));

  constant c_tbt_ratio_slv : std_logic_vector(c_cic_tbt_width-1 downto 0)
    := std_logic_vector(to_unsigned(g_tbt_ratio, c_cic_tbt_width));

  constant c_monit1_ratio_slv : std_logic_vector(c_cic_monit1_width-1 downto 0)
    := std_logic_vector(to_unsigned(g_monit1_ratio, c_cic_monit1_width));

  constant c_monit2_ratio_slv : std_logic_vector(c_cic_monit2_width-1 downto 0)
    := std_logic_vector(to_unsigned(g_monit2_ratio, c_cic_monit2_width));

  constant c_adc_ratio_slv : std_logic_vector(c_adc_width-1 downto 0)
    := std_logic_vector(to_unsigned(g_adc_ratio, c_adc_width));

  constant c_adc_ratio_slv_full : std_logic_vector(c_adc_ce_width-1 downto 0)
    := std_logic_vector(to_unsigned(c_adc_ratio_full, c_adc_ce_width));

  constant c_tbt_ratio_slv_full : std_logic_vector(c_tbt_ce_width-1 downto 0)
    := std_logic_vector(to_unsigned(c_tbt_ratio_full, c_tbt_ce_width));

  constant c_fofb_ratio_slv_full : std_logic_vector(c_fofb_ce_width-1 downto 0)
    := std_logic_vector(to_unsigned(c_fofb_ratio_full, c_fofb_ce_width));

  constant c_monit1_ratio_slv_full : std_logic_vector(c_monit1_ce_width-1 downto 0)
    := std_logic_vector(to_unsigned(c_monit1_ratio_full, c_monit1_ce_width));

  constant c_monit2_ratio_slv_full : std_logic_vector(c_monit2_ce_width-1 downto 0)
    := std_logic_vector(to_unsigned(c_monit2_ratio_full, c_monit2_ce_width));

  constant c_tbt_cordic_ratio_slv : std_logic_vector(c_tbt_cordic_ce_width-1 downto 0)
    := std_logic_vector(to_unsigned(g_tbt_cordic_ratio, c_tbt_cordic_ce_width));

  constant c_fofb_cordic_ratio_slv : std_logic_vector(c_fofb_cordic_ce_width-1 downto 0)
    := std_logic_vector(to_unsigned(g_fofb_cordic_ratio, c_fofb_cordic_ce_width));

  constant c_monit1_cic_ratio_slv : std_logic_vector(c_monit1_cic_ce_width-1 downto 0)
    := std_logic_vector(to_unsigned(g_monit1_cic_ratio, c_monit1_cic_ce_width));

  constant c_monit2_cic_ratio_slv : std_logic_vector(c_monit2_cic_ce_width-1 downto 0)
    := std_logic_vector(to_unsigned(g_monit2_cic_ratio, c_monit2_cic_ce_width));

  --Cordic
  constant c_tbt_cordic_xy_width : natural := g_tbt_decim_width+f_log2_size(g_tbt_cordic_stages+1)+2;  -- internal width of cordic: input_width + right padding + left padding
  constant c_tbt_cordic_ph_width : natural := g_tbt_decim_width+f_log2_size(g_tbt_cordic_stages+1);  -- right padding for cordic stages

  constant c_fofb_cordic_xy_width : natural := g_fofb_decim_width+f_log2_size(g_fofb_cordic_stages+1)+2;  -- internal width of cordic: input_width + right padding + left padding
  constant c_fofb_cordic_ph_width : natural := g_fofb_decim_width+f_log2_size(g_fofb_cordic_stages+1);  -- right padding for cordic stages



  -----------
  --Signals--
  -----------
  type t_input is array(3 downto 0) of std_logic_vector(g_input_width-1 downto 0);
  signal adc_input_d0 : t_input := (others => (others => '0'));
  signal adc_input_d1 : t_input := (others => (others => '0'));
  signal adc_input_offs : t_input := (others => (others => '0'));
  signal adc_input_offs_scaled : t_input := (others => (others => '0'));

  type t_adc_gain_arr is array(3 downto 0) of std_logic_vector(g_adc_gain_width-1 downto 0);
  signal adc_gain_arr : t_adc_gain_arr := (others => (others => '0'));
  signal adc_gain_swclk_0_arr : t_adc_gain_arr := (others => (others => '0'));
  signal adc_gain_swclk_1_arr : t_adc_gain_arr := (others => (others => '0'));

  type t_adc_offset_arr is array(3 downto 0) of std_logic_vector(g_adc_offset_width-1 downto 0);
  signal adc_offset_arr : t_adc_offset_arr := (others => (others => '0'));
  signal adc_offset_swclk_0_arr : t_adc_offset_arr := (others => (others => '0'));
  signal adc_offset_swclk_1_arr : t_adc_offset_arr := (others => (others => '0'));

  type t_input_valid is array(3 downto 0) of std_logic;
  signal iq_valid        : t_input_valid := (others => '0');
  signal adc_input_offs_valid : t_input_valid := (others => '0');
  signal adc_input_offs_scaled_valid : t_input_valid := (others => '0');
  signal adc_input_valid_d1 : std_logic := '0';

  type t_input_tag is array(3 downto 0) of std_logic_vector(c_adc_tag_width-1 downto 0);
  signal adc_input_offs_tag : t_input_tag := (others => (others => '0'));
  signal adc_input_offs_scaled_tag : t_input_tag := (others => (others => '0'));
  signal adc_input_tag_d1 : std_logic_vector(c_adc_tag_width-1 downto 0) := (others => '0');

  signal full_i_tag : t_input_tag := (others => (others => '0'));
  signal full_q_tag : t_input_tag := (others => (others => '0'));

  type t_mixed is array(3 downto 0) of std_logic_vector(g_mixed_width-1 downto 0);
  signal full_i, full_q : t_mixed := (others => (others => '0'));

  -- decimated data
  type t_tbt_data is array(3 downto 0) of std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_i, tbt_q, tbt_mag, tbt_phase : t_tbt_data := (others => (others => '0'));

  type t_tbt_signed is array (3 downto 0) of signed(g_tbt_decim_width-1 downto 0);  -- for cordic output
  signal tbt_signed_mag, tbt_signed_phase : t_tbt_signed := (others => (others => '0'));

  type t_fofb_data is array(3 downto 0) of std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_i, fofb_q, fofb_mag, fofb_phase : t_fofb_data := (others => (others => '0'));

  type t_fofb_signed is array (3 downto 0) of signed(g_fofb_decim_width-1 downto 0);  -- for cordic output
  signal fofb_signed_mag, fofb_signed_phase : t_fofb_signed := (others => (others => '0'));

  type t_monit_data is array(3 downto 0) of std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit1_mag, monit2_mag : t_monit_data := (others => (others => '0'));

  --after deltasigma
  signal fofb_x_pre, fofb_y_pre, fofb_q_pre, fofb_sum_pre :
    std_logic_vector(g_fofb_decim_width-1 downto 0) := (others => '0');

  signal fofb_pos_x_int, fofb_pos_y_int, fofb_pos_q_int, fofb_pos_sum_int :
    std_logic_vector(g_fofb_decim_width-1 downto 0) := (others => '0');

  signal tbt_x_pre, tbt_y_pre, tbt_q_pre, tbt_sum_pre :
    std_logic_vector(g_tbt_decim_width-1 downto 0) := (others => '0');

  signal monit1_pos_x_int, monit1_pos_y_int, monit1_pos_q_int, monit1_pos_sum_int :
    std_logic_vector(g_monit_decim_width-1 downto 0) := (others => '0');

  signal monit_x_pre, monit_y_pre, monit_q_pre, monit_sum_pre :
    std_logic_vector(g_monit_decim_width-1 downto 0) := (others => '0');

  -- desync
  type t_tbt_desync_cnt_array is array (3 downto 0) of std_logic_vector(g_tbt_tag_desync_cnt_width-1 downto 0);
  type t_fofb_desync_cnt_array is array (3 downto 0) of std_logic_vector(g_fofb_decim_desync_cnt_width-1 downto 0);
  type t_monit1_desync_cnt_array is array (3 downto 0) of std_logic_vector(g_monit1_tag_desync_cnt_width-1 downto 0);
  type t_monit2_desync_cnt_array is array (3 downto 0) of std_logic_vector(g_monit2_tag_desync_cnt_width-1 downto 0);

  signal tbt_tag_desync_cnt             : t_tbt_desync_cnt_array := (others => (others => '0'));
  signal fofb_tag_desync_cnt            : t_fofb_desync_cnt_array := (others => (others => '0'));
  signal monit1_tag_desync_cnt          : t_monit1_desync_cnt_array := (others => (others => '0'));
  signal monit2_tag_desync_cnt          : t_monit2_desync_cnt_array := (others => (others => '0'));

  ----------------------------
  --Clocks and clock enables--
  ----------------------------
  type ce_sl is array(3 downto 0) of std_logic;

  signal valid_tbt, valid_tbt_cordic, valid_fofb, valid_fofb_cordic, valid_monit1, valid_monit2 : ce_sl := (others => '0');
  signal ce_adc, ce_monit1, ce_monit2, ce_tbt_cordic, ce_fofb_cordic           : ce_sl := (others => '0');

  signal valid_monit1_pds, valid_fofb_pds, valid_tbt_ds : std_logic;

  attribute max_fanout                                                  : string;
  attribute max_fanout of ce_adc, ce_monit1, ce_monit2 : signal is "50";

begin

  adc_input_d0(0) <= adc_ch0_i;
  adc_input_d0(1) <= adc_ch1_i;
  adc_input_d0(2) <= adc_ch2_i;
  adc_input_d0(3) <= adc_ch3_i;

  adc_gain_swclk_0_arr(0) <= adc_ch0_swclk_0_gain_i;
  adc_gain_swclk_0_arr(1) <= adc_ch1_swclk_0_gain_i;
  adc_gain_swclk_0_arr(2) <= adc_ch2_swclk_0_gain_i;
  adc_gain_swclk_0_arr(3) <= adc_ch3_swclk_0_gain_i;

  adc_gain_swclk_1_arr(0) <= adc_ch0_swclk_1_gain_i;
  adc_gain_swclk_1_arr(1) <= adc_ch1_swclk_1_gain_i;
  adc_gain_swclk_1_arr(2) <= adc_ch2_swclk_1_gain_i;
  adc_gain_swclk_1_arr(3) <= adc_ch3_swclk_1_gain_i;

  adc_offset_swclk_0_arr(0) <= adc_ch0_swclk_0_offset_i;
  adc_offset_swclk_0_arr(1) <= adc_ch1_swclk_0_offset_i;
  adc_offset_swclk_0_arr(2) <= adc_ch2_swclk_0_offset_i;
  adc_offset_swclk_0_arr(3) <= adc_ch3_swclk_0_offset_i;

  adc_offset_swclk_1_arr(0) <= adc_ch0_swclk_1_offset_i;
  adc_offset_swclk_1_arr(1) <= adc_ch1_swclk_1_offset_i;
  adc_offset_swclk_1_arr(2) <= adc_ch2_swclk_1_offset_i;
  adc_offset_swclk_1_arr(3) <= adc_ch3_swclk_1_offset_i;

  -- ADCs' offset (and gain mux) stage
  p_adc_offs_stage : process(clk_i)
  begin
    if rising_edge(clk_i) then
      -- 1st pipeline stage: mux offset
      if adc_tag_i(0) = '0' then
        adc_offset_arr <= adc_offset_swclk_0_arr;
      else
        adc_offset_arr <= adc_offset_swclk_1_arr;
      end if;
      adc_input_d1 <= adc_input_d0;
      adc_input_tag_d1 <= adc_tag_i;
      adc_input_valid_d1 <= adc_valid_i;

      -- 2nd pipeline stage: apply the offset, mux gain
      for chan in 3 downto 0 loop
        adc_input_offs(chan) <= std_logic_vector(
          signed(adc_input_d1(chan)) - signed(adc_offset_arr(chan)));
      end loop;
      adc_input_offs_tag <= (others => adc_input_tag_d1);
      adc_input_offs_valid <= (others => adc_input_valid_d1);

      if adc_input_tag_d1(0) = '0' then
        adc_gain_arr <= adc_gain_swclk_0_arr;
      else
        adc_gain_arr <= adc_gain_swclk_1_arr;
      end if;
    end if;
  end process p_adc_offs_stage;

  -- Reset fof TBT rates sync'ed with external signal
  gen_ddc : for chan in 3 downto 0 generate

    -- Generate clock enable
    cmp_ce_adc : strobe_gen
      generic map (
        g_maxrate   => g_adc_ratio,
        g_bus_width => c_adc_ce_width)
      port map (
        clk_i       => clk_i,
        rst_i       => rst_i,
        ce_i        => '1',
        ratio_i     => c_adc_ratio_slv_full,
        strobe_o    => ce_adc(chan));

    cmp_ce_tbt_cordic : strobe_gen
      generic map (
        g_maxrate   => g_tbt_cordic_ratio,
        g_bus_width => c_tbt_cordic_ce_width)
      port map (
        clk_i       => clk_i,
        rst_i       => rst_i,
        ce_i        => '1',
        ratio_i     => c_tbt_cordic_ratio_slv,
        strobe_o    => ce_tbt_cordic(chan));

    cmp_ce_fofb_cordic : strobe_gen
      generic map (
        g_maxrate   => g_fofb_cordic_ratio,
        g_bus_width => c_fofb_cordic_ce_width)
      port map (
        clk_i       => clk_i,
        rst_i       => rst_i,
        ce_i        => '1',
        ratio_i     => c_fofb_cordic_ratio_slv,
        strobe_o    => ce_fofb_cordic(chan));

    cmp_ce_monit1 : strobe_gen
      generic map (
        g_maxrate   => g_monit1_cic_ratio,
        g_bus_width => c_monit1_cic_ce_width)
      port map (
        clk_i       => clk_i,
        rst_i       => rst_i,
        ce_i        => '1',
        ratio_i     => c_monit1_cic_ratio_slv,
        strobe_o    => ce_monit1(chan));

    cmp_ce_monit2 : strobe_gen
      generic map (
        g_maxrate   => g_monit2_cic_ratio,
        g_bus_width => c_monit2_cic_ce_width)
      port map (
        clk_i       => clk_i,
        rst_i       => rst_i,
        ce_i        => '1',
        ratio_i     => c_monit2_cic_ratio_slv,
        strobe_o    => ce_monit2(chan));

    cmp_generic_multiplier : generic_multiplier
      generic map (
        g_a_width           => g_input_width,
        g_b_width           => g_adc_gain_width,
        g_signed            => true,
        g_tag_width         => c_adc_tag_width,
        g_p_width           => g_input_width,
        g_round_convergent  => 1,
        g_levels            => 1)
      port map (
        a_i                 => adc_input_offs(chan),
        b_i                 => adc_gain_arr(chan),
        valid_i             => adc_input_offs_valid(chan),
        tag_i               => adc_input_offs_tag(chan),
        p_o                 => adc_input_offs_scaled(chan),
        valid_o             => adc_input_offs_scaled_valid(chan),
        tag_o               => adc_input_offs_scaled_tag(chan),
        ce_i                => '1',
        clk_i               => clk_i,
        rst_i               => rst_i);

    -- Position calculation

    gen_with_downconv : if (g_with_downconv) generate

      cmp_mixer : mixer
        generic map (
          g_number_of_points => g_dds_points,
          g_dds_width        => g_dds_width,
          g_input_width      => g_input_width,
          g_output_width     => g_mixed_width,
          g_tag_width        => c_adc_tag_width
        )
        port map (
          rst_i              => rst_i,
          clk_i              => clk_i,
          ce_i               => ce_adc(chan),
          signal_i           => adc_input_offs_scaled(chan),
          valid_i            => adc_input_offs_scaled_valid(chan),
          tag_i              => adc_input_offs_scaled_tag(chan),
          i_o                => full_i(chan),
          q_o                => full_q(chan),
          valid_o            => iq_valid(chan),
          i_tag_o            => full_i_tag(chan),
          q_tag_o            => full_q_tag(chan)
        );

      cmp_tbt_cic : cic_dual
        generic map (
          g_input_width            => g_mixed_width,
          g_output_width           => g_tbt_decim_width,
          g_stages                 => g_tbt_cic_stages,
          g_delay                  => g_tbt_cic_delay,
          g_max_rate               => g_tbt_ratio,
          g_bus_width              => c_cic_tbt_width,
          g_tag_desync_cnt_width   => g_tbt_tag_desync_cnt_width,
          g_tag_width              => c_tbt_tag_width,
          g_data_mask_width        => g_tbt_cic_mask_samples_width,
          g_round_convergent       => c_cic_round_convergent)
        port map (
          clk_i                    => clk_i,
          rst_i                    => rst_i,
          ce_i                     => ce_adc(chan),
          valid_i                  => iq_valid(chan),
          I_i                      => full_i(chan),
          I_tag_i                  => tbt_tag_i,
          I_tag_en_i               => tbt_tag_en_i,
          I_tag_desync_cnt_rst_i   => tbt_tag_desync_cnt_rst_i,
          I_tag_desync_cnt_o       => tbt_tag_desync_cnt(chan),
          I_mask_num_samples_beg_i => tbt_decim_mask_num_samples_beg_i,
          I_mask_num_samples_end_i => tbt_decim_mask_num_samples_end_i,
          I_mask_en_i              => tbt_decim_mask_en_i,
          Q_i                      => full_q(chan),
          Q_tag_i                  => tbt_tag_i,
          Q_tag_en_i               => tbt_tag_en_i,
          Q_mask_num_samples_beg_i => tbt_decim_mask_num_samples_beg_i,
          Q_mask_num_samples_end_i => tbt_decim_mask_num_samples_end_i,
          Q_mask_en_i              => tbt_decim_mask_en_i,
          ratio_i                  => c_tbt_ratio_slv,
          I_o                      => tbt_i(chan),
          Q_o                      => tbt_q(chan),
          valid_o                  => valid_tbt(chan));

      cmp_tbt_cordic : cordic_iter_slv
        generic map (
          g_input_width        => g_tbt_decim_width,
          g_xy_calc_width      => c_tbt_cordic_xy_width,
          g_x_output_width     => g_tbt_decim_width,
          g_phase_calc_width   => c_tbt_cordic_ph_width,
          g_phase_output_width => g_tbt_decim_width,
          g_stages             => g_tbt_cordic_stages,
          g_iter_per_clk       => g_tbt_cordic_iter_per_clk,
          g_rounding           => true)
        port map (
          clk_i                => clk_i,
          ce_data_i            => ce_adc(chan),
          valid_i              => valid_tbt(chan),
          ce_i                 => ce_tbt_cordic(chan),
          x_i                  => tbt_i(chan),
          y_i                  => tbt_q(chan),
          mag_o                => tbt_mag(chan),
          phase_o              => tbt_phase(chan),
          valid_o              => valid_tbt_cordic(chan));

      cmp_fofb_cic : cic_dual
        generic map (
          g_input_width            => g_mixed_width,
          g_output_width           => g_fofb_decim_width,
          g_stages                 => g_fofb_cic_stages,
          g_delay                  => g_fofb_cic_delay,
          g_max_rate               => g_fofb_ratio,
          g_bus_width              => c_cic_fofb_width,
          g_tag_desync_cnt_width   => g_fofb_decim_desync_cnt_width,
          g_tag_width              => c_adc_tag_width,
          g_data_mask_width        => g_fofb_cic_mask_samples_width,
          g_round_convergent       => c_cic_round_convergent)
        port map (
          clk_i                    => clk_i,
          rst_i                    => rst_i,
          ce_i                     => ce_adc(chan),
          valid_i                  => iq_valid(chan),
          I_i                      => full_i(chan),
          I_tag_i                  => full_i_tag(chan),
          I_tag_en_i               => adc_tag_en_i,
          I_tag_desync_cnt_rst_i   => fofb_decim_desync_cnt_rst_i,
          I_tag_desync_cnt_o       => fofb_tag_desync_cnt(chan),
          I_mask_num_samples_beg_i => fofb_decim_mask_num_samples_i,
          I_mask_en_i              => fofb_decim_mask_en_i,
          Q_i                      => full_q(chan),
          Q_tag_i                  => full_q_tag(chan),
          Q_tag_en_i               => adc_tag_en_i,
          Q_mask_num_samples_beg_i => fofb_decim_mask_num_samples_i,
          Q_mask_en_i              => fofb_decim_mask_en_i,
          ratio_i                  => c_fofb_ratio_slv,
          I_o                      => fofb_i(chan),
          Q_o                      => fofb_q(chan),
          valid_o                  => valid_fofb(chan));

      cmp_fofb_cordic : cordic_iter_slv
        generic map (
          g_input_width        => g_fofb_decim_width,
          g_xy_calc_width      => c_fofb_cordic_xy_width,
          g_x_output_width     => g_fofb_decim_width,
          g_phase_calc_width   => c_fofb_cordic_ph_width,
          g_phase_output_width => g_fofb_decim_width,
          g_stages             => g_fofb_cordic_stages,
          g_iter_per_clk       => g_fofb_cordic_iter_per_clk,
          g_rounding           => true)
        port map (
          clk_i                => clk_i,
          ce_data_i            => ce_adc(chan),
          valid_i              => valid_fofb(chan),
          ce_i                 => ce_fofb_cordic(chan),
          x_i                  => fofb_i(chan),
          y_i                  => fofb_q(chan),
          mag_o                => fofb_mag(chan),
          phase_o              => fofb_phase(chan),
          valid_o              => valid_fofb_cordic(chan));

    end generate;

    gen_without_downconv : if (not g_with_downconv) generate

      cmp_tbt_cic : cic_dyn
        generic map (
          g_input_width                => g_input_width,
          g_output_width               => g_tbt_decim_width,
          g_stages                     => g_tbt_cic_stages,
          g_delay                      => g_tbt_cic_delay,
          g_max_rate                   => g_tbt_ratio,
          g_bus_width                  => c_cic_tbt_width,
          g_with_ce_synch              => true,
          g_tag_desync_cnt_width       => g_tbt_tag_desync_cnt_width,
          g_tag_width                  => c_tbt_tag_width,
          g_data_mask_width            => g_tbt_cic_mask_samples_width,
          g_round_convergent           => c_cic_round_convergent)
        port map (
          clk_i                        => clk_i,
          rst_i                        => rst_i,
          ce_i                         => ce_adc(chan),
          -- Synchronize the CE with the already in place
          -- rate, so we don't have to
          -- change them downstream
          ce_out_i                     => ce_tbt_cordic(chan),
          valid_i                      => adc_input_offs_scaled_valid(chan),
          data_i                       => adc_input_offs_scaled(chan),
          ratio_i                      => c_tbt_ratio_slv,
          data_tag_i                   => tbt_tag_i,
          data_tag_en_i                => tbt_tag_en_i,
          data_tag_desync_cnt_rst_i    => tbt_tag_desync_cnt_rst_i,
          data_tag_desync_cnt_o        => tbt_tag_desync_cnt(chan),
          data_mask_en_i               => tbt_decim_mask_en_i,
          data_mask_num_samples_beg_i  => tbt_decim_mask_num_samples_beg_i,
          data_mask_num_samples_end_i  => tbt_decim_mask_num_samples_end_i,
          -- Reuse signal names so we don't have to
          -- change them downstream
          data_o                       => tbt_mag(chan),
          valid_o                      => valid_tbt_cordic(chan));

      -- We don't have phase information for chains
      -- without downconversion
      tbt_phase(chan) <= (others => '0');

      cmp_fofb_cic : cic_dyn
        generic map (
          g_input_width                 => g_input_width,
          g_output_width                => g_fofb_decim_width,
          g_stages                      => g_fofb_cic_stages,
          g_delay                       => g_fofb_cic_delay,
          g_max_rate                    => g_fofb_ratio,
          g_bus_width                   => c_cic_fofb_width,
          g_with_ce_synch               => true,
          g_tag_width                   => c_adc_tag_width,
          g_data_mask_width             => g_fofb_cic_mask_samples_width,
          g_round_convergent            => c_cic_round_convergent)
        port map (
          clk_i                         => clk_i,
          rst_i                         => rst_i,
          ce_i                          => ce_adc(chan),
          ce_out_i                      => ce_fofb_cordic(chan),
          valid_i                       => adc_input_offs_scaled_valid(chan),
          data_i                        => adc_input_offs_scaled(chan),
          data_tag_i                    => adc_input_offs_scaled_tag(chan),
          -- Don't use CIC synchronization feature
          data_tag_en_i                 => '0',
          data_mask_num_samples_beg_i   => (others => '0'),
          data_mask_en_i                => '0',
          ratio_i                       => c_fofb_ratio_slv,
          -- Reuse signal names so we don't have to
          -- change them downstream
          data_o                        => fofb_mag(chan),
          valid_o                       => valid_fofb_cordic(chan));

          -- We don't have phase information for chains
          -- without downconversion
          fofb_phase(chan) <= (others => '0');

    end generate;

    cmp_monit1_cic : cic_dyn
      generic map (
        g_input_width               => g_fofb_decim_width,
        g_output_width              => g_monit_decim_width,
        g_stages                    => g_monit1_cic_stages,
        g_delay                     => g_monit1_cic_delay,
        g_max_rate                  => g_monit1_ratio,
        g_bus_width                 => c_cic_monit1_width,
        g_with_ce_synch             => true,
        g_tag_desync_cnt_width      => g_monit1_tag_desync_cnt_width,
        g_tag_width                 => c_monit1_tag_width,
        g_data_mask_width           => g_monit1_cic_mask_samples_width,
        g_round_convergent          => c_cic_round_convergent)
      port map (
        clk_i                       => clk_i,
        rst_i                       => rst_i,
        ce_i                        => ce_fofb_cordic(chan),
        ce_out_i                    => ce_monit1(chan),
        valid_i                     => valid_fofb_cordic(chan),
        data_i                      => fofb_mag(chan),
        data_tag_i                  => monit1_tag_i,
        data_tag_en_i               => monit1_tag_en_i,
        data_tag_desync_cnt_rst_i   => monit1_tag_desync_cnt_rst_i,
        data_tag_desync_cnt_o       => monit1_tag_desync_cnt(chan),
        data_mask_num_samples_beg_i => monit1_decim_mask_num_samples_beg_i,
        data_mask_num_samples_end_i => monit1_decim_mask_num_samples_end_i,
        data_mask_en_i              => monit1_decim_mask_en_i,
        ratio_i                     => c_monit1_ratio_slv,
        data_o                      => monit1_mag(chan),
        valid_o                     => valid_monit1(chan));

    cmp_monit2_cic : cic_dyn
      generic map (
        g_input_width               => g_monit_decim_width,
        g_output_width              => g_monit_decim_width,
        g_stages                    => g_monit2_cic_stages,
        g_delay                     => g_monit2_cic_delay,
        g_max_rate                  => g_monit2_ratio,
        g_bus_width                 => c_cic_monit2_width,
        g_with_ce_synch             => true,
        g_tag_desync_cnt_width      => g_monit2_tag_desync_cnt_width,
        g_tag_width                 => c_monit2_tag_width,
        g_data_mask_width           => g_monit2_cic_mask_samples_width,
        g_round_convergent          => c_cic_round_convergent)
      port map (
        clk_i                       => clk_i,
        rst_i                       => rst_i,
        ce_i                        => ce_monit1(chan),
        ce_out_i                    => ce_monit2(chan),
        valid_i                     => valid_monit1(chan),
        data_i                      => monit1_mag(chan),
        data_tag_i                  => monit_tag_i,
        data_tag_en_i               => monit_tag_en_i,
        data_tag_desync_cnt_rst_i   => monit_tag_desync_cnt_rst_i,
        data_tag_desync_cnt_o       => monit2_tag_desync_cnt(chan),
        data_mask_num_samples_beg_i => monit_decim_mask_num_samples_beg_i,
        data_mask_num_samples_end_i => monit_decim_mask_num_samples_end_i,
        data_mask_en_i              => monit_decim_mask_en_i,
        ratio_i                     => c_monit2_ratio_slv,
        data_o                      => monit2_mag(chan),
        valid_o                     => valid_monit2(chan));


  end generate gen_ddc;

  -- x and y are fixed point with:
  -- sign bit = MSB
  -- word length = g_WIDTH
  -- integer length = g_K_WIDTH
  -- fractional length = g_WIDTH - g_K_WIDTH
  cmp_fofb_pds : part_delta_sigma
    generic map (
      g_WIDTH         => g_FOFB_DECIM_WIDTH,
      g_K_WIDTH       => g_K_WIDTH,
      g_OFFSET_WIDTH  => g_OFFSET_WIDTH
    )
    port map (
      clk_i           => clk_i,
      rst_i           => rst_i,
      a_i             => fofb_mag(0),
      b_i             => fofb_mag(1),
      c_i             => fofb_mag(2),
      d_i             => fofb_mag(3),
      kx_i            => kx_i,
      ky_i            => ky_i,
      ksum_i          => ksum_i,
      offset_x_i      => offset_x_i,
      offset_y_i      => offset_y_i,
      ce_i            => ce_fofb_cordic(0),
      valid_i         => valid_fofb_cordic(0),
      x_o             => fofb_pos_x_int,
      y_o             => fofb_pos_y_int,
      q_o             => fofb_pos_q_int,
      sum_o           => fofb_pos_sum_int,
      valid_o         => valid_fofb_pds
    );

  -- x and y are fixed point with:
  -- sign bit = MSB
  -- word length = g_WIDTH
  -- integer length = g_K_WIDTH
  -- fractional length = g_WIDTH - g_K_WIDTH
  cmp_monit1_pds : part_delta_sigma
    generic map (
      g_WIDTH         => g_MONIT_DECIM_WIDTH,
      g_K_WIDTH       => g_K_WIDTH,
      g_OFFSET_WIDTH  => g_OFFSET_WIDTH
    )
    port map (
      clk_i           => clk_i,
      rst_i           => rst_i,
      a_i             => monit1_mag(0),
      b_i             => monit1_mag(1),
      c_i             => monit1_mag(2),
      d_i             => monit1_mag(3),
      kx_i            => kx_i,
      ky_i            => ky_i,
      ksum_i          => ksum_i,
      offset_x_i      => offset_x_i,
      offset_y_i      => offset_y_i,
      ce_i            => ce_monit1(0),
      valid_i         => valid_monit1(0),
      x_o             => monit1_pos_x_int,
      y_o             => monit1_pos_y_int,
      q_o             => monit1_pos_q_int,
      sum_o           => monit1_pos_sum_int,
      valid_o         => valid_monit1_pds
    );

  -- desync counters. Use only one of the channels as a sample
  tbt_tag_desync_cnt_o    <= tbt_tag_desync_cnt(0);
  fofb_decim_desync_cnt_o <= fofb_tag_desync_cnt(0);
  monit1_tag_desync_cnt_o <= monit1_tag_desync_cnt(0);
  monit_tag_desync_cnt_o  <= monit2_tag_desync_cnt(0);

  -- Wiring intermediate signals to outputs
  mix_ch0_i_o <= std_logic_vector(resize(signed(full_i(0)), g_IQ_width));
  mix_ch0_q_o <= std_logic_vector(resize(signed(full_q(0)), g_IQ_width));
  mix_ch1_i_o <= std_logic_vector(resize(signed(full_i(1)), g_IQ_width));
  mix_ch1_q_o <= std_logic_vector(resize(signed(full_q(1)), g_IQ_width));
  mix_ch2_i_o <= std_logic_vector(resize(signed(full_i(2)), g_IQ_width));
  mix_ch2_q_o <= std_logic_vector(resize(signed(full_q(2)), g_IQ_width));
  mix_ch3_i_o <= std_logic_vector(resize(signed(full_i(3)), g_IQ_width));
  mix_ch3_q_o <= std_logic_vector(resize(signed(full_q(3)), g_IQ_width));
  mix_valid_o <= iq_valid(0);
  mix_ce_o    <= ce_adc(0);

  tbt_decim_ch0_i_o <= tbt_i(0);
  tbt_decim_ch0_q_o <= tbt_q(0);
  tbt_decim_ch1_i_o <= tbt_i(1);
  tbt_decim_ch1_q_o <= tbt_q(1);
  tbt_decim_ch2_i_o <= tbt_i(2);
  tbt_decim_ch2_q_o <= tbt_q(2);
  tbt_decim_ch3_i_o <= tbt_i(3);
  tbt_decim_ch3_q_o <= tbt_q(3);
  tbt_decim_valid_o <= valid_tbt(0);
  tbt_decim_ce_o    <= ce_adc(0);

  tbt_amp_ch0_o   <= tbt_mag(0);
  tbt_amp_ch1_o   <= tbt_mag(1);
  tbt_amp_ch2_o   <= tbt_mag(2);
  tbt_amp_ch3_o   <= tbt_mag(3);
  tbt_amp_valid_o <= valid_tbt_cordic(0);
  tbt_amp_ce_o    <= ce_tbt_cordic(0);

  tbt_pha_ch0_o   <= tbt_phase(0);
  tbt_pha_ch1_o   <= tbt_phase(1);
  tbt_pha_ch2_o   <= tbt_phase(2);
  tbt_pha_ch3_o   <= tbt_phase(3);
  tbt_pha_valid_o <= valid_tbt_cordic(0);
  tbt_pha_ce_o    <= ce_tbt_cordic(0);

  fofb_decim_ch0_i_o <= fofb_i(0);
  fofb_decim_ch0_q_o <= fofb_q(0);
  fofb_decim_ch1_i_o <= fofb_i(1);
  fofb_decim_ch1_q_o <= fofb_q(1);
  fofb_decim_ch2_i_o <= fofb_i(2);
  fofb_decim_ch2_q_o <= fofb_q(2);
  fofb_decim_ch3_i_o <= fofb_i(3);
  fofb_decim_ch3_q_o <= fofb_q(3);
  fofb_decim_valid_o <= valid_fofb(0);
  fofb_decim_ce_o    <= ce_adc(0);

  fofb_amp_ch0_o   <= fofb_mag(0);
  fofb_amp_ch1_o   <= fofb_mag(1);
  fofb_amp_ch2_o   <= fofb_mag(2);
  fofb_amp_ch3_o   <= fofb_mag(3);
  fofb_amp_valid_o <= valid_fofb_cordic(0);
  fofb_amp_ce_o    <= ce_fofb_cordic(0);

  fofb_pha_ch0_o   <= fofb_phase(0);
  fofb_pha_ch1_o   <= fofb_phase(1);
  fofb_pha_ch2_o   <= fofb_phase(2);
  fofb_pha_ch3_o   <= fofb_phase(3);
  fofb_pha_valid_o <= valid_fofb_cordic(0);
  fofb_pha_ce_o    <= ce_fofb_cordic(0);

  monit1_amp_ch0_o   <= monit1_mag(0);
  monit1_amp_ch1_o   <= monit1_mag(1);
  monit1_amp_ch2_o   <= monit1_mag(2);
  monit1_amp_ch3_o   <= monit1_mag(3);
  monit1_amp_valid_o <= valid_monit1(0);
  monit1_amp_ce_o    <= ce_monit1(0);

  monit_amp_ch0_o   <= monit2_mag(0);
  monit_amp_ch1_o   <= monit2_mag(1);
  monit_amp_ch2_o   <= monit2_mag(2);
  monit_amp_ch3_o   <= monit2_mag(3);
  monit_amp_valid_o <= valid_monit2(0);
  monit_amp_ce_o    <= ce_monit2(0);

  fofb_pos_valid_o <= valid_fofb_pds;
  fofb_pos_ce_o    <= ce_fofb_cordic(0);

  fofb_pos_x_o   <= std_logic_vector(shift_right(signed(fofb_pos_x_int), g_fofb_decim_width-g_k_width));
  fofb_pos_y_o   <= std_logic_vector(shift_right(signed(fofb_pos_y_int), g_fofb_decim_width-g_k_width));
  fofb_pos_q_o   <= std_logic_vector(shift_right(signed(fofb_pos_q_int), g_fofb_decim_width-g_k_width));
  fofb_pos_sum_o <= fofb_pos_sum_int;

  -- Removed to speed synthesis during test
  tbt_pos_valid_o <= '0';
  tbt_pos_ce_o    <= '0';

  tbt_pos_x_o   <= (others => '0');
  tbt_pos_y_o   <= (others => '0');
  tbt_pos_q_o   <= (others => '0');
  tbt_pos_sum_o <= (others => '0');

  monit1_pos_valid_o <= valid_monit1_pds;
  monit1_pos_ce_o    <= ce_monit1(0);

  monit1_pos_x_o   <= std_logic_vector(shift_right(signed(monit1_pos_x_int), g_monit_decim_width-g_k_width));
  monit1_pos_y_o   <= std_logic_vector(shift_right(signed(monit1_pos_y_int), g_monit_decim_width-g_k_width));
  monit1_pos_q_o   <= std_logic_vector(shift_right(signed(monit1_pos_q_int), g_monit_decim_width-g_k_width));
  monit1_pos_sum_o <= monit1_pos_sum_int;

  monit_pos_valid_o <= '0';
  monit_pos_ce_o    <= '0';

  monit_pos_x_o   <= (others => '0');
  monit_pos_y_o   <= (others => '0');
  monit_pos_q_o   <= (others => '0');
  monit_pos_sum_o <= (others => '0');

end rtl;
