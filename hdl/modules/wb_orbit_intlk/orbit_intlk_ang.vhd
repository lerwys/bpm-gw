------------------------------------------------------------------------------
-- Title      : BPM orbit angular interlock
------------------------------------------------------------------------------
-- Author     : Lucas Maziero Russo
-- Company    : CNPEM LNLS-DIG
-- Created    : 2022-06-12
-- Platform   : FPGA-generic
-------------------------------------------------------------------------------
-- Description: Module for angular orbit interlock
-------------------------------------------------------------------------------
-- Copyright (c) 2020 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2020-06-02  1.0      lucas.russo        Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
-- General cores
use work.gencores_pkg.all;
-- Orbit interlock cores
use work.orbit_intlk_pkg.all;

entity orbit_intlk_ang is
generic
(
  g_ADC_WIDTH                                : natural := 16;
  g_DECIM_WIDTH                              : natural := 32;
  -- interlock limits
  g_INTLK_LMT_WIDTH                          : natural := 32
);
port
(
  -----------------------------
  -- Clocks and resets
  -----------------------------

  fs_rst_n_i                                 : in std_logic;
  fs_clk_i                                   : in std_logic;

  -----------------------------
  -- Interlock enable and limits signals
  -----------------------------

  -- Angular interlock on/off
  intlk_ang_en_i                             : in std_logic;
  -- Angular interlock clear
  intlk_ang_clr_i                            : in std_logic;
  intlk_ang_max_x_i                          : in std_logic_vector(g_INTLK_LMT_WIDTH-1 downto 0);
  intlk_ang_max_y_i                          : in std_logic_vector(g_INTLK_LMT_WIDTH-1 downto 0);
  intlk_ang_min_x_i                          : in std_logic_vector(g_INTLK_LMT_WIDTH-1 downto 0);
  intlk_ang_min_y_i                          : in std_logic_vector(g_INTLK_LMT_WIDTH-1 downto 0);

  -----------------------------
  -- Downstream ADC and position signals
  -----------------------------

  adc_ds_ch0_swap_i                          : in std_logic_vector(g_ADC_WIDTH-1 downto 0) := (others => '0');
  adc_ds_ch1_swap_i                          : in std_logic_vector(g_ADC_WIDTH-1 downto 0) := (others => '0');
  adc_ds_ch2_swap_i                          : in std_logic_vector(g_ADC_WIDTH-1 downto 0) := (others => '0');
  adc_ds_ch3_swap_i                          : in std_logic_vector(g_ADC_WIDTH-1 downto 0) := (others => '0');
  adc_ds_tag_i                               : in std_logic_vector(0 downto 0) := (others => '0');
  adc_ds_swap_valid_i                        : in std_logic := '0';

  decim_ds_pos_x_i                           : in std_logic_vector(g_DECIM_WIDTH-1 downto 0);
  decim_ds_pos_y_i                           : in std_logic_vector(g_DECIM_WIDTH-1 downto 0);
  decim_ds_pos_q_i                           : in std_logic_vector(g_DECIM_WIDTH-1 downto 0);
  decim_ds_pos_sum_i                         : in std_logic_vector(g_DECIM_WIDTH-1 downto 0);
  decim_ds_pos_valid_i                       : in std_logic;

  -----------------------------
  -- Upstream ADC and position signals
  -----------------------------

  adc_us_ch0_swap_i                          : in std_logic_vector(g_ADC_WIDTH-1 downto 0) := (others => '0');
  adc_us_ch1_swap_i                          : in std_logic_vector(g_ADC_WIDTH-1 downto 0) := (others => '0');
  adc_us_ch2_swap_i                          : in std_logic_vector(g_ADC_WIDTH-1 downto 0) := (others => '0');
  adc_us_ch3_swap_i                          : in std_logic_vector(g_ADC_WIDTH-1 downto 0) := (others => '0');
  adc_us_tag_i                               : in std_logic_vector(0 downto 0) := (others => '0');
  adc_us_swap_valid_i                        : in std_logic := '0';

  decim_us_pos_x_i                           : in std_logic_vector(g_DECIM_WIDTH-1 downto 0);
  decim_us_pos_y_i                           : in std_logic_vector(g_DECIM_WIDTH-1 downto 0);
  decim_us_pos_q_i                           : in std_logic_vector(g_DECIM_WIDTH-1 downto 0);
  decim_us_pos_sum_i                         : in std_logic_vector(g_DECIM_WIDTH-1 downto 0);
  decim_us_pos_valid_i                       : in std_logic;

  -----------------------------
  -- Interlock outputs
  -----------------------------
  intlk_ang_bigger_x_o                       : out std_logic;
  intlk_ang_bigger_y_o                       : out std_logic;

  intlk_ang_bigger_ltc_x_o                   : out std_logic;
  intlk_ang_bigger_ltc_y_o                   : out std_logic;

  intlk_ang_bigger_any_o                     : out std_logic;

  intlk_ang_x_diff_o                         : out std_logic_vector(g_DECIM_WIDTH-1 downto 0);
  intlk_ang_y_diff_o                         : out std_logic_vector(g_DECIM_WIDTH-1 downto 0);

  -- only cleared when intlk_ang_clr_i is asserted
  intlk_ang_bigger_ltc_o                     : out std_logic;
  -- conditional to intlk_ang_en_i
  intlk_ang_bigger_o                         : out std_logic;

  intlk_ang_smaller_x_o                      : out std_logic;
  intlk_ang_smaller_y_o                      : out std_logic;

  intlk_ang_smaller_ltc_x_o                  : out std_logic;
  intlk_ang_smaller_ltc_y_o                  : out std_logic;

  intlk_ang_smaller_any_o                    : out std_logic;

  -- only cleared when intlk_ang_clr_i is asserted
  intlk_ang_smaller_ltc_o                    : out std_logic;
  -- conditional to intlk_ang_en_i
  intlk_ang_smaller_o                        : out std_logic
);
end orbit_intlk_ang;

architecture rtl of orbit_intlk_ang is

  -- constants
  constant c_ADC_WIDTH       : natural := g_ADC_WIDTH;
  constant c_DECIM_WIDTH     : natural := g_DECIM_WIDTH;
  constant c_INTLK_LMT_WIDTH : natural := g_INTLK_LMT_WIDTH;

  -- types
  type t_bit_array is array (natural range <>) of std_logic;

  subtype t_adc_data is std_logic_vector(c_adc_width-1 downto 0);
  type t_adc_data_array is array (natural range <>) of t_adc_data;

  subtype t_adc_tag is std_logic_vector(0 downto 0);
  type t_adc_tag_array is array (natural range <>) of t_adc_tag;

  subtype t_decim_data is std_logic_vector(c_decim_width-1 downto 0);
  type t_decim_data_array is array (natural range <>) of t_decim_data;

  subtype t_intlk_lmt_data is std_logic_vector(c_intlk_lmt_width-1 downto 0);
  type t_intlk_lmt_data_array is array (natural range <>) of t_intlk_lmt_data;

  type t_adc_data_array2d is array (natural range <>, natural range <>) of t_adc_data;
  type t_decim_data_array2d is array (natural range <>, natural range <>) of t_decim_data;

  --signals

  -- input mangling
  signal adc_array              : t_adc_data_array2d(c_NUM_BPMS-1 downto 0, c_NUM_CHANNELS-1 downto 0);
  signal adc_tag_array          : t_adc_tag_array(c_NUM_BPMS-1 downto 0);
  signal adc_valid_array        : t_bit_array(c_NUM_BPMS-1 downto 0);
  signal decim_pos_array        : t_decim_data_array2d(c_NUM_BPMS-1 downto 0, c_NUM_CHANNELS-1 downto 0);
  signal decim_pos_array_n      : t_decim_data_array2d(c_NUM_BPMS-1 downto 0, c_NUM_CHANNELS-1 downto 0);
  signal decim_pos_valid_array  : t_bit_array(c_NUM_BPMS-1 downto 0);

  -- interlock limits
  signal intlk_ang_max          : t_intlk_lmt_data_array(c_NUM_CHANNELS-1 downto 0);
  signal intlk_ang_max_high_bit : t_bit_array(c_NUM_CHANNELS-1 downto 0);
  signal intlk_ang_max_n        : t_intlk_lmt_data_array(c_NUM_CHANNELS-1 downto 0);
  signal intlk_ang_min          : t_intlk_lmt_data_array(c_NUM_CHANNELS-1 downto 0);
  signal intlk_ang_min_high_bit : t_bit_array(c_NUM_CHANNELS-1 downto 0);

  -- valid AND
  signal adc_valid_and       : t_bit_array(c_NUM_BPMS downto 0);
  signal adc_valid           : std_logic;
  signal decim_pos_valid_and : t_bit_array(c_NUM_BPMS downto 0);
  signal decim_pos_valid     : std_logic;

  -- angular interlock
  signal ang_sum           : t_decim_data_array(c_NUM_CHANNELS-1 downto 0);
  signal ang_sum_reg       : t_decim_data_array(c_NUM_CHANNELS-1 downto 0);
  signal ang_sum_valid     : t_bit_array(c_NUM_CHANNELS-1 downto 0);
  signal ang_sum_valid_reg : t_bit_array(c_NUM_CHANNELS-1 downto 0);
  signal ang               : t_decim_data_array(c_NUM_CHANNELS-1 downto 0);
  signal ang_high_bit      : t_bit_array(c_NUM_CHANNELS-1 downto 0);
  signal ang_n             : t_decim_data_array(c_NUM_CHANNELS-1 downto 0);
  signal ang_valid         : t_bit_array(c_NUM_CHANNELS-1 downto 0);

  signal ang_bigger             : t_bit_array(c_NUM_CHANNELS-1 downto 0);
  signal ang_bigger_comb        : t_bit_array(c_NUM_CHANNELS-1 downto 0);
  signal ang_bigger_valid       : t_bit_array(c_NUM_CHANNELS-1 downto 0);
  signal ang_bigger_reg         : t_bit_array(c_NUM_CHANNELS-1 downto 0);

  signal ang_smaller            : t_bit_array(c_NUM_CHANNELS-1 downto 0);
  signal ang_smaller_comb       : t_bit_array(c_NUM_CHANNELS-1 downto 0);
  signal ang_smaller_n          : t_bit_array(c_NUM_CHANNELS-1 downto 0);
  signal ang_smaller_valid      : t_bit_array(c_NUM_CHANNELS-1 downto 0);
  signal ang_smaller_reg        : t_bit_array(c_NUM_CHANNELS-1 downto 0);

  signal ang_intlk_det_bigger_all : t_bit_array(c_NUM_CHANNELS-1 downto 0);
  signal ang_intlk_bigger_ltc_all : t_bit_array(c_NUM_CHANNELS-1 downto 0);
  signal ang_intlk_bigger_or      : t_bit_array(c_NUM_CHANNELS downto 0);
  signal ang_intlk_bigger_all     : t_bit_array(c_NUM_CHANNELS-1 downto 0);
  signal ang_intlk_bigger_ltc_or  : t_bit_array(c_NUM_CHANNELS downto 0);
  signal ang_intlk_bigger_ltc     : std_logic;
  signal ang_intlk_bigger_any     : std_logic;
  signal ang_intlk_bigger         : std_logic;

  signal ang_intlk_det_smaller_all : t_bit_array(c_NUM_CHANNELS-1 downto 0);
  signal ang_intlk_smaller_ltc_all : t_bit_array(c_NUM_CHANNELS-1 downto 0);
  signal ang_intlk_smaller_or      : t_bit_array(c_NUM_CHANNELS downto 0);
  signal ang_intlk_smaller_all     : t_bit_array(c_NUM_CHANNELS-1 downto 0);
  signal ang_intlk_smaller_ltc_or  : t_bit_array(c_NUM_CHANNELS downto 0);
  signal ang_intlk_smaller_ltc     : std_logic;
  signal ang_intlk_smaller_any     : std_logic;
  signal ang_intlk_smaller         : std_logic;

begin

  ---------------------------------
  -- Signal mangling
  --------------------------------

  -- Downstream
  adc_array(c_BPM_DS_IDX, 0)    <= adc_ds_ch0_swap_i;
  adc_array(c_BPM_DS_IDX, 1)    <= adc_ds_ch1_swap_i;
  adc_array(c_BPM_DS_IDX, 2)    <= adc_ds_ch2_swap_i;
  adc_array(c_BPM_DS_IDX, 3)    <= adc_ds_ch3_swap_i;
  adc_tag_array(c_BPM_DS_IDX)   <= adc_ds_tag_i;
  adc_valid_array(c_BPM_DS_IDX) <= adc_ds_swap_valid_i;

  decim_pos_array(c_BPM_DS_IDX, 0)    <= decim_ds_pos_x_i;
  decim_pos_array(c_BPM_DS_IDX, 1)    <= decim_ds_pos_y_i;
  decim_pos_array(c_BPM_DS_IDX, 2)    <= decim_ds_pos_q_i;
  decim_pos_array(c_BPM_DS_IDX, 3)    <= decim_ds_pos_sum_i;
  decim_pos_valid_array(c_BPM_DS_IDX) <= decim_ds_pos_valid_i;

  decim_pos_array_n(c_BPM_DS_IDX, 0)    <= not decim_ds_pos_x_i;
  decim_pos_array_n(c_BPM_DS_IDX, 1)    <= not decim_ds_pos_y_i;
  decim_pos_array_n(c_BPM_DS_IDX, 2)    <= not decim_ds_pos_q_i;
  decim_pos_array_n(c_BPM_DS_IDX, 3)    <= not decim_ds_pos_sum_i;

  -- Upwnstream
  adc_array(c_BPM_US_IDX, 0)    <= adc_us_ch0_swap_i;
  adc_array(c_BPM_US_IDX, 1)    <= adc_us_ch1_swap_i;
  adc_array(c_BPM_US_IDX, 2)    <= adc_us_ch2_swap_i;
  adc_array(c_BPM_US_IDX, 3)    <= adc_us_ch3_swap_i;
  adc_tag_array(c_BPM_US_IDX)   <= adc_us_tag_i;
  adc_valid_array(c_BPM_US_IDX) <= adc_us_swap_valid_i;

  decim_pos_array(c_BPM_US_IDX, 0)    <= decim_us_pos_x_i;
  decim_pos_array(c_BPM_US_IDX, 1)    <= decim_us_pos_y_i;
  decim_pos_array(c_BPM_US_IDX, 2)    <= decim_us_pos_q_i;
  decim_pos_array(c_BPM_US_IDX, 3)    <= decim_us_pos_sum_i;
  decim_pos_valid_array(c_BPM_US_IDX) <= decim_us_pos_valid_i;

  decim_pos_array_n(c_BPM_US_IDX, 0)    <= not decim_us_pos_x_i;
  decim_pos_array_n(c_BPM_US_IDX, 1)    <= not decim_us_pos_y_i;
  decim_pos_array_n(c_BPM_US_IDX, 2)    <= not decim_us_pos_q_i;
  decim_pos_array_n(c_BPM_US_IDX, 3)    <= not decim_us_pos_sum_i;

  -- Interlock limits
  -- X limits
  intlk_ang_max(0)  <= intlk_ang_max_x_i;
  intlk_ang_min(0)  <= intlk_ang_min_x_i;

  -- Y limits
  intlk_ang_max(1)  <= intlk_ang_max_y_i;
  intlk_ang_min(1)  <= intlk_ang_min_y_i;

  ----------------------------------
  -- Calculate angular
  ----------------------------------

  -- ANDing ADC valids
  adc_valid_and(0) <= '1';
  gen_adc_valid : for i in 0 to c_NUM_BPMS-1 generate
    adc_valid_and(i+1) <= adc_valid_and(i) and adc_valid_array(i);
  end generate;

  adc_valid <= adc_valid_and(c_NUM_BPMS);

  -- ANDing DECIM valids
  decim_pos_valid_and(0) <= '1';
  gen_decim_pos_valid : for i in 0 to c_NUM_BPMS-1 generate
    decim_pos_valid_and(i+1) <= decim_pos_valid_and(i) and decim_pos_valid_array(i);
  end generate;

  decim_pos_valid <= decim_pos_valid_and(c_NUM_BPMS);

  -------------------------------------------------------------------------
  -- Angular interlock detector. Only for X and Y.
  -- Calculation is a simple (us = upstream, ds = downstream):
  -- x_ang = x_ds - x_us / distance_between_bpms OR
  -- x_ang * distance_between_bpms = x_ds - x_us
  --
  -- y_ang = y_ds - y_us / distance_between_bpms OR
  -- y_ang * distance_between_bpms = y_ds - y_us
  -------------------------------------------------------------------------
  gen_ang_intlk : for i in 0 to c_INTLK_GEN_UPTO_CHANNEL generate

    ----------------------------------
    -- Calculate angle
    ----------------------------------
    cmp_ang_adder : gc_big_adder2
    generic map (
      g_data_bits => c_DECIM_WIDTH
    )
    port map (
      clk_i        => fs_clk_i,
      stall_i      => '0',
      valid_i      => decim_pos_valid,
      a_i          => decim_pos_array(c_BPM_DS_IDX, i),
      b_i          => decim_pos_array_n(c_BPM_US_IDX, i),
      c_i          => '1',
      x2_o         => ang_sum(i),
      c2x2_valid_o => ang_sum_valid(i)
    );

    -- gc_big_adder2 outputs are unregistered. So register them.
    p_ang_reg : process(fs_clk_i)
    begin
      if rising_edge(fs_clk_i) then
        if fs_rst_n_i = '0' then
          ang_sum_valid_reg(i) <= '0';
        else
          if ang_sum_valid(i) = '1' then
            ang_sum_reg(i) <= ang_sum(i);
          end if;

          ang_sum_valid_reg(i) <= ang_sum_valid(i);
        end if;
      end if;
    end process;

    ang(i) <= ang_sum_reg(i);
    ang_valid(i) <= ang_sum_valid_reg(i);

    ----------------------------------
    -- Detect position > Threshold
    ----------------------------------
    -- Compare with threshold. Use the simple identity that:
    -- A > B is the same as A + (-B) and we check if MSB Carry
    -- is 1
    cmp_ang_thold_bigger : gc_big_adder2
    generic map (
      g_data_bits => c_DECIM_WIDTH
    )
    port map (
      clk_i        => fs_clk_i,
      stall_i      => '0',
      valid_i      => ang_valid(i),
      a_i          => ang(i),
      b_i          => intlk_ang_max_n(i),
      c_i          => '1',
      c2_o         => ang_bigger_comb(i),
      c2x2_valid_o => ang_bigger_valid(i)
    );

    intlk_ang_max_n(i) <= not intlk_ang_max(i);

    -- comparison of different sign operands fails with the above method.
    -- Just compare the sign bits, for these cases.
    ang_high_bit(i) <= ang(i)(ang(i)'high);
    intlk_ang_max_high_bit(i) <= intlk_ang_max(i)(intlk_ang_max(i)'high);

    ang_bigger(i) <= ang_bigger_comb(i) when
                       (ang_high_bit(i) xnor intlk_ang_max_high_bit(i)) = '1' else
                        intlk_ang_max_high_bit(i);

    -- gc_big_adder2 outputs are unregistered. So register them.
    p_ang_thold_bigger_reg : process(fs_clk_i)
    begin
      if rising_edge(fs_clk_i) then
        if fs_rst_n_i = '0' then
          ang_bigger_reg(i) <= '0';
        else
          if ang_bigger_valid(i) = '1' then
            ang_bigger_reg(i) <= ang_bigger(i);
          end if;
        end if;
      end if;
    end process;

    ----------------------------------
    -- Detect position < Threshold
    ----------------------------------
    -- Compare with threshold. Use the simple identity that:
    -- A < B is the same as -A > -B = -A + B > 0 and we check
    -- if MSB Carry is 1
    cmp_ang_thold_smaller : gc_big_adder2
    generic map (
      g_data_bits => c_DECIM_WIDTH
    )
    port map (
      clk_i        => fs_clk_i,
      stall_i      => '0',
      valid_i      => ang_valid(i),
      a_i          => ang_n(i),
      b_i          => intlk_ang_min(i),
      c_i          => '1',
      c2_o         => ang_smaller_comb(i),
      c2x2_valid_o => ang_smaller_valid(i)
    );

    ang_n(i) <= not ang(i);

    -- comparison of different sign operands fails with the above method.
    -- Just compare the sign bits, for these cases.
    intlk_ang_min_high_bit(i) <= intlk_ang_min(i)(intlk_ang_min(i)'high);

    ang_smaller(i) <= ang_smaller_comb(i) when
                      (ang_high_bit(i) xnor intlk_ang_min_high_bit(i)) = '1' else
                       ang_high_bit(i);

    -- gc_big_adder2 outputs are unregistered. So register them.
    p_ang_thold_smaller_reg : process(fs_clk_i)
    begin
      if rising_edge(fs_clk_i) then
        if fs_rst_n_i = '0' then
          ang_smaller_reg(i) <= '0';
        else
          if ang_smaller_valid(i) = '1' then
            ang_smaller_reg(i) <= ang_smaller(i);
          end if;
        end if;
      end if;
    end process;

    ----------------------------------
    -- Latch interlocks
    ----------------------------------

    ang_intlk_det_bigger_all(i) <= ang_bigger_reg(i);
    ang_intlk_det_smaller_all(i) <= ang_smaller_reg(i);

    -- latch all interlocks
    p_latch : process(fs_clk_i)
    begin
      if rising_edge(fs_clk_i) then
        if fs_rst_n_i = '0' then
          ang_intlk_bigger_ltc_all(i) <= '0';
          ang_intlk_smaller_ltc_all(i) <= '0';
        else
          -- latch up anglation interlock status
          -- only clear on "clear" signal
          if intlk_ang_clr_i = '1' then
            ang_intlk_bigger_ltc_all(i) <= '0';
          elsif ang_intlk_det_bigger_all(i) = '1' and
                intlk_ang_en_i = '1' then
            ang_intlk_bigger_ltc_all(i) <= '1';
          end if;

          if intlk_ang_clr_i = '1' then
            ang_intlk_smaller_ltc_all(i) <= '0';
          elsif ang_intlk_det_smaller_all(i) = '1' and
                intlk_ang_en_i = '1' then
            ang_intlk_smaller_ltc_all(i) <= '1';
          end if;

          -- register anglation interlock when active
          if intlk_ang_clr_i = '1' or intlk_ang_en_i = '0' then
            ang_intlk_bigger_all(i) <= '0';
          else
            ang_intlk_bigger_all(i) <= ang_intlk_det_bigger_all(i);
          end if;

          if intlk_ang_clr_i = '1' or intlk_ang_en_i = '0' then
            ang_intlk_smaller_all(i) <= '0';
          else
            ang_intlk_smaller_all(i) <= ang_intlk_det_smaller_all(i);
          end if;
        end if;
      end if;
    end process;

  end generate;

  intlk_ang_bigger_ltc_x_o  <= ang_intlk_bigger_ltc_all(c_CHAN_X_IDX);
  intlk_ang_bigger_ltc_y_o  <= ang_intlk_bigger_ltc_all(c_CHAN_Y_IDX);

  intlk_ang_bigger_x_o    <= ang_intlk_bigger_all(c_CHAN_X_IDX);
  intlk_ang_bigger_y_o    <= ang_intlk_bigger_all(c_CHAN_Y_IDX);

  intlk_ang_smaller_ltc_x_o  <= ang_intlk_smaller_ltc_all(c_CHAN_X_IDX);
  intlk_ang_smaller_ltc_y_o  <= ang_intlk_smaller_ltc_all(c_CHAN_Y_IDX);

  intlk_ang_smaller_x_o    <= ang_intlk_smaller_all(c_CHAN_X_IDX);
  intlk_ang_smaller_y_o    <= ang_intlk_smaller_all(c_CHAN_Y_IDX);

  intlk_ang_x_diff_o   <= ang(c_CHAN_X_IDX);
  intlk_ang_y_diff_o   <= ang(c_CHAN_Y_IDX);

  ----------------------------------
  -- Angular interlock merging
  ----------------------------------

  ----------------------------------
  -- Bigger
  ----------------------------------
  ang_intlk_bigger_or(0) <= '0';
  -- ORing all ang_bigger
  gen_ang_intlk_bigger : for i in 0 to c_INTLK_GEN_UPTO_CHANNEL generate
    ang_intlk_bigger_or(i+1) <= ang_intlk_bigger_or(i) or ang_intlk_bigger_all(i);
  end generate;

  ang_intlk_bigger <= ang_intlk_bigger_or(c_INTLK_GEN_UPTO_CHANNEL+1);
  intlk_ang_bigger_o  <= ang_intlk_bigger;
  intlk_ang_bigger_any_o  <= ang_intlk_bigger;

  ang_intlk_bigger_ltc_or(0) <= '0';
  -- ORing all ang_bigger_ltc
  gen_ang_intlk_bigger_ltc : for i in 0 to c_INTLK_GEN_UPTO_CHANNEL generate
    ang_intlk_bigger_ltc_or(i+1) <= ang_intlk_bigger_ltc_or(i) or ang_intlk_bigger_ltc_all(i);
  end generate;

  ang_intlk_bigger_ltc <= ang_intlk_bigger_ltc_or(c_INTLK_GEN_UPTO_CHANNEL+1);
  intlk_ang_bigger_ltc_o  <= ang_intlk_bigger_ltc;

  ----------------------------------
  -- Smaller
  ----------------------------------
  ang_intlk_smaller_or(0) <= '0';
  -- ORing all ang_smaller
  gen_ang_intlk_smaller : for i in 0 to c_INTLK_GEN_UPTO_CHANNEL generate
    ang_intlk_smaller_or(i+1) <= ang_intlk_smaller_or(i) or ang_intlk_smaller_all(i);
  end generate;

  ang_intlk_smaller <= ang_intlk_smaller_or(c_INTLK_GEN_UPTO_CHANNEL+1);
  intlk_ang_smaller_o  <= ang_intlk_smaller;
  intlk_ang_smaller_any_o  <= ang_intlk_smaller;

  ang_intlk_smaller_ltc_or(0) <= '0';
  -- ORing all ang_smaller_ltc
  gen_ang_intlk_smaller_ltc : for i in 0 to c_INTLK_GEN_UPTO_CHANNEL generate
    ang_intlk_smaller_ltc_or(i+1) <= ang_intlk_smaller_ltc_or(i) or ang_intlk_smaller_ltc_all(i);
  end generate;

  ang_intlk_smaller_ltc <= ang_intlk_smaller_ltc_or(c_INTLK_GEN_UPTO_CHANNEL+1);
  intlk_ang_smaller_ltc_o  <= ang_intlk_smaller_ltc;

end rtl;
