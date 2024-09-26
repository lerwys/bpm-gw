---------------------------------------------------------------------------------------
-- Title          : Wishbone slave core for BPM Orbit Interlock Interface Registers
---------------------------------------------------------------------------------------
-- File           : wb_orbit_intlk_regs.vhd
-- Author         : auto-generated by wbgen2 from wb_orbit_intlk_regs.wb
-- Created        : Tue Sep 24 11:12:27 2024
-- Standard       : VHDL'87
---------------------------------------------------------------------------------------
-- THIS FILE WAS GENERATED BY wbgen2 FROM SOURCE FILE wb_orbit_intlk_regs.wb
-- DO NOT HAND-EDIT UNLESS IT'S ABSOLUTELY NECESSARY!
---------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.orbit_intlk_wbgen2_pkg.all;


entity wb_orbit_intlk_regs is
  port (
    rst_n_i                                  : in     std_logic;
    clk_sys_i                                : in     std_logic;
    wb_adr_i                                 : in     std_logic_vector(3 downto 0);
    wb_dat_i                                 : in     std_logic_vector(31 downto 0);
    wb_dat_o                                 : out    std_logic_vector(31 downto 0);
    wb_cyc_i                                 : in     std_logic;
    wb_sel_i                                 : in     std_logic_vector(3 downto 0);
    wb_stb_i                                 : in     std_logic;
    wb_we_i                                  : in     std_logic;
    wb_ack_o                                 : out    std_logic;
    wb_err_o                                 : out    std_logic;
    wb_rty_o                                 : out    std_logic;
    wb_stall_o                               : out    std_logic;
    fs_clk_i                                 : in     std_logic;
    regs_i                                   : in     t_orbit_intlk_in_registers;
    regs_o                                   : out    t_orbit_intlk_out_registers
  );
end wb_orbit_intlk_regs;

architecture syn of wb_orbit_intlk_regs is

signal orbit_intlk_ctrl_en_int                  : std_logic      ;
signal orbit_intlk_ctrl_clr_dly0                : std_logic      ;
signal orbit_intlk_ctrl_clr_int                 : std_logic      ;
signal orbit_intlk_ctrl_min_sum_en_int          : std_logic      ;
signal orbit_intlk_ctrl_trans_en_int            : std_logic      ;
signal orbit_intlk_ctrl_trans_clr_dly0          : std_logic      ;
signal orbit_intlk_ctrl_trans_clr_int           : std_logic      ;
signal orbit_intlk_ctrl_ang_en_int              : std_logic      ;
signal orbit_intlk_ctrl_ang_clr_dly0            : std_logic      ;
signal orbit_intlk_ctrl_ang_clr_int             : std_logic      ;
signal orbit_intlk_min_sum_int                  : std_logic_vector(31 downto 0);
signal orbit_intlk_min_sum_swb                  : std_logic      ;
signal orbit_intlk_min_sum_swb_delay            : std_logic      ;
signal orbit_intlk_min_sum_swb_s0               : std_logic      ;
signal orbit_intlk_min_sum_swb_s1               : std_logic      ;
signal orbit_intlk_min_sum_swb_s2               : std_logic      ;
signal orbit_intlk_trans_max_x_int              : std_logic_vector(31 downto 0);
signal orbit_intlk_trans_max_x_swb              : std_logic      ;
signal orbit_intlk_trans_max_x_swb_delay        : std_logic      ;
signal orbit_intlk_trans_max_x_swb_s0           : std_logic      ;
signal orbit_intlk_trans_max_x_swb_s1           : std_logic      ;
signal orbit_intlk_trans_max_x_swb_s2           : std_logic      ;
signal orbit_intlk_trans_max_y_int              : std_logic_vector(31 downto 0);
signal orbit_intlk_trans_max_y_swb              : std_logic      ;
signal orbit_intlk_trans_max_y_swb_delay        : std_logic      ;
signal orbit_intlk_trans_max_y_swb_s0           : std_logic      ;
signal orbit_intlk_trans_max_y_swb_s1           : std_logic      ;
signal orbit_intlk_trans_max_y_swb_s2           : std_logic      ;
signal orbit_intlk_ang_max_x_int                : std_logic_vector(31 downto 0);
signal orbit_intlk_ang_max_x_swb                : std_logic      ;
signal orbit_intlk_ang_max_x_swb_delay          : std_logic      ;
signal orbit_intlk_ang_max_x_swb_s0             : std_logic      ;
signal orbit_intlk_ang_max_x_swb_s1             : std_logic      ;
signal orbit_intlk_ang_max_x_swb_s2             : std_logic      ;
signal orbit_intlk_ang_max_y_int                : std_logic_vector(31 downto 0);
signal orbit_intlk_ang_max_y_swb                : std_logic      ;
signal orbit_intlk_ang_max_y_swb_delay          : std_logic      ;
signal orbit_intlk_ang_max_y_swb_s0             : std_logic      ;
signal orbit_intlk_ang_max_y_swb_s1             : std_logic      ;
signal orbit_intlk_ang_max_y_swb_s2             : std_logic      ;
signal orbit_intlk_trans_min_x_int              : std_logic_vector(31 downto 0);
signal orbit_intlk_trans_min_x_swb              : std_logic      ;
signal orbit_intlk_trans_min_x_swb_delay        : std_logic      ;
signal orbit_intlk_trans_min_x_swb_s0           : std_logic      ;
signal orbit_intlk_trans_min_x_swb_s1           : std_logic      ;
signal orbit_intlk_trans_min_x_swb_s2           : std_logic      ;
signal orbit_intlk_trans_min_y_int              : std_logic_vector(31 downto 0);
signal orbit_intlk_trans_min_y_swb              : std_logic      ;
signal orbit_intlk_trans_min_y_swb_delay        : std_logic      ;
signal orbit_intlk_trans_min_y_swb_s0           : std_logic      ;
signal orbit_intlk_trans_min_y_swb_s1           : std_logic      ;
signal orbit_intlk_trans_min_y_swb_s2           : std_logic      ;
signal orbit_intlk_ang_min_x_int                : std_logic_vector(31 downto 0);
signal orbit_intlk_ang_min_x_swb                : std_logic      ;
signal orbit_intlk_ang_min_x_swb_delay          : std_logic      ;
signal orbit_intlk_ang_min_x_swb_s0             : std_logic      ;
signal orbit_intlk_ang_min_x_swb_s1             : std_logic      ;
signal orbit_intlk_ang_min_x_swb_s2             : std_logic      ;
signal orbit_intlk_ang_min_y_int                : std_logic_vector(31 downto 0);
signal orbit_intlk_ang_min_y_swb                : std_logic      ;
signal orbit_intlk_ang_min_y_swb_delay          : std_logic      ;
signal orbit_intlk_ang_min_y_swb_s0             : std_logic      ;
signal orbit_intlk_ang_min_y_swb_s1             : std_logic      ;
signal orbit_intlk_ang_min_y_swb_s2             : std_logic      ;
signal orbit_intlk_trans_x_diff_int             : std_logic_vector(31 downto 0);
signal orbit_intlk_trans_x_diff_lwb             : std_logic      ;
signal orbit_intlk_trans_x_diff_lwb_delay       : std_logic      ;
signal orbit_intlk_trans_x_diff_lwb_in_progress : std_logic      ;
signal orbit_intlk_trans_x_diff_lwb_s0          : std_logic      ;
signal orbit_intlk_trans_x_diff_lwb_s1          : std_logic      ;
signal orbit_intlk_trans_x_diff_lwb_s2          : std_logic      ;
signal orbit_intlk_trans_y_diff_int             : std_logic_vector(31 downto 0);
signal orbit_intlk_trans_y_diff_lwb             : std_logic      ;
signal orbit_intlk_trans_y_diff_lwb_delay       : std_logic      ;
signal orbit_intlk_trans_y_diff_lwb_in_progress : std_logic      ;
signal orbit_intlk_trans_y_diff_lwb_s0          : std_logic      ;
signal orbit_intlk_trans_y_diff_lwb_s1          : std_logic      ;
signal orbit_intlk_trans_y_diff_lwb_s2          : std_logic      ;
signal orbit_intlk_ang_x_diff_int               : std_logic_vector(31 downto 0);
signal orbit_intlk_ang_x_diff_lwb               : std_logic      ;
signal orbit_intlk_ang_x_diff_lwb_delay         : std_logic      ;
signal orbit_intlk_ang_x_diff_lwb_in_progress   : std_logic      ;
signal orbit_intlk_ang_x_diff_lwb_s0            : std_logic      ;
signal orbit_intlk_ang_x_diff_lwb_s1            : std_logic      ;
signal orbit_intlk_ang_x_diff_lwb_s2            : std_logic      ;
signal orbit_intlk_ang_y_diff_int               : std_logic_vector(31 downto 0);
signal orbit_intlk_ang_y_diff_lwb               : std_logic      ;
signal orbit_intlk_ang_y_diff_lwb_delay         : std_logic      ;
signal orbit_intlk_ang_y_diff_lwb_in_progress   : std_logic      ;
signal orbit_intlk_ang_y_diff_lwb_s0            : std_logic      ;
signal orbit_intlk_ang_y_diff_lwb_s1            : std_logic      ;
signal orbit_intlk_ang_y_diff_lwb_s2            : std_logic      ;
signal ack_sreg                                 : std_logic_vector(9 downto 0);
signal rddata_reg                               : std_logic_vector(31 downto 0);
signal wrdata_reg                               : std_logic_vector(31 downto 0);
signal bwsel_reg                                : std_logic_vector(3 downto 0);
signal rwaddr_reg                               : std_logic_vector(3 downto 0);
signal ack_in_progress                          : std_logic      ;
signal wr_int                                   : std_logic      ;
signal rd_int                                   : std_logic      ;
signal allones                                  : std_logic_vector(31 downto 0);
signal allzeros                                 : std_logic_vector(31 downto 0);

begin
-- Some internal signals assignments
  wrdata_reg <= wb_dat_i;
-- 
-- Main register bank access process.
  process (clk_sys_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      ack_sreg <= "0000000000";
      ack_in_progress <= '0';
      rddata_reg <= "00000000000000000000000000000000";
      orbit_intlk_ctrl_en_int <= '0';
      orbit_intlk_ctrl_clr_int <= '0';
      orbit_intlk_ctrl_min_sum_en_int <= '0';
      orbit_intlk_ctrl_trans_en_int <= '0';
      orbit_intlk_ctrl_trans_clr_int <= '0';
      orbit_intlk_ctrl_ang_en_int <= '0';
      orbit_intlk_ctrl_ang_clr_int <= '0';
      orbit_intlk_min_sum_int <= "00000000000000000000000000000000";
      orbit_intlk_min_sum_swb <= '0';
      orbit_intlk_min_sum_swb_delay <= '0';
      orbit_intlk_trans_max_x_int <= "00000000000000000000000000000000";
      orbit_intlk_trans_max_x_swb <= '0';
      orbit_intlk_trans_max_x_swb_delay <= '0';
      orbit_intlk_trans_max_y_int <= "00000000000000000000000000000000";
      orbit_intlk_trans_max_y_swb <= '0';
      orbit_intlk_trans_max_y_swb_delay <= '0';
      orbit_intlk_ang_max_x_int <= "00000000000000000000000000000000";
      orbit_intlk_ang_max_x_swb <= '0';
      orbit_intlk_ang_max_x_swb_delay <= '0';
      orbit_intlk_ang_max_y_int <= "00000000000000000000000000000000";
      orbit_intlk_ang_max_y_swb <= '0';
      orbit_intlk_ang_max_y_swb_delay <= '0';
      orbit_intlk_trans_min_x_int <= "00000000000000000000000000000000";
      orbit_intlk_trans_min_x_swb <= '0';
      orbit_intlk_trans_min_x_swb_delay <= '0';
      orbit_intlk_trans_min_y_int <= "00000000000000000000000000000000";
      orbit_intlk_trans_min_y_swb <= '0';
      orbit_intlk_trans_min_y_swb_delay <= '0';
      orbit_intlk_ang_min_x_int <= "00000000000000000000000000000000";
      orbit_intlk_ang_min_x_swb <= '0';
      orbit_intlk_ang_min_x_swb_delay <= '0';
      orbit_intlk_ang_min_y_int <= "00000000000000000000000000000000";
      orbit_intlk_ang_min_y_swb <= '0';
      orbit_intlk_ang_min_y_swb_delay <= '0';
      orbit_intlk_trans_x_diff_lwb <= '0';
      orbit_intlk_trans_x_diff_lwb_delay <= '0';
      orbit_intlk_trans_x_diff_lwb_in_progress <= '0';
      orbit_intlk_trans_y_diff_lwb <= '0';
      orbit_intlk_trans_y_diff_lwb_delay <= '0';
      orbit_intlk_trans_y_diff_lwb_in_progress <= '0';
      orbit_intlk_ang_x_diff_lwb <= '0';
      orbit_intlk_ang_x_diff_lwb_delay <= '0';
      orbit_intlk_ang_x_diff_lwb_in_progress <= '0';
      orbit_intlk_ang_y_diff_lwb <= '0';
      orbit_intlk_ang_y_diff_lwb_delay <= '0';
      orbit_intlk_ang_y_diff_lwb_in_progress <= '0';
    elsif rising_edge(clk_sys_i) then
-- advance the ACK generator shift register
      ack_sreg(8 downto 0) <= ack_sreg(9 downto 1);
      ack_sreg(9) <= '0';
      if (ack_in_progress = '1') then
        if (ack_sreg(0) = '1') then
          orbit_intlk_ctrl_clr_int <= '0';
          orbit_intlk_ctrl_trans_clr_int <= '0';
          orbit_intlk_ctrl_ang_clr_int <= '0';
          ack_in_progress <= '0';
        else
          orbit_intlk_min_sum_swb <= orbit_intlk_min_sum_swb_delay;
          orbit_intlk_min_sum_swb_delay <= '0';
          orbit_intlk_trans_max_x_swb <= orbit_intlk_trans_max_x_swb_delay;
          orbit_intlk_trans_max_x_swb_delay <= '0';
          orbit_intlk_trans_max_y_swb <= orbit_intlk_trans_max_y_swb_delay;
          orbit_intlk_trans_max_y_swb_delay <= '0';
          orbit_intlk_ang_max_x_swb <= orbit_intlk_ang_max_x_swb_delay;
          orbit_intlk_ang_max_x_swb_delay <= '0';
          orbit_intlk_ang_max_y_swb <= orbit_intlk_ang_max_y_swb_delay;
          orbit_intlk_ang_max_y_swb_delay <= '0';
          orbit_intlk_trans_min_x_swb <= orbit_intlk_trans_min_x_swb_delay;
          orbit_intlk_trans_min_x_swb_delay <= '0';
          orbit_intlk_trans_min_y_swb <= orbit_intlk_trans_min_y_swb_delay;
          orbit_intlk_trans_min_y_swb_delay <= '0';
          orbit_intlk_ang_min_x_swb <= orbit_intlk_ang_min_x_swb_delay;
          orbit_intlk_ang_min_x_swb_delay <= '0';
          orbit_intlk_ang_min_y_swb <= orbit_intlk_ang_min_y_swb_delay;
          orbit_intlk_ang_min_y_swb_delay <= '0';
          orbit_intlk_trans_x_diff_lwb <= orbit_intlk_trans_x_diff_lwb_delay;
          orbit_intlk_trans_x_diff_lwb_delay <= '0';
          if ((ack_sreg(1) = '1') and (orbit_intlk_trans_x_diff_lwb_in_progress = '1')) then
            rddata_reg(31 downto 0) <= orbit_intlk_trans_x_diff_int;
            orbit_intlk_trans_x_diff_lwb_in_progress <= '0';
          end if;
          orbit_intlk_trans_y_diff_lwb <= orbit_intlk_trans_y_diff_lwb_delay;
          orbit_intlk_trans_y_diff_lwb_delay <= '0';
          if ((ack_sreg(1) = '1') and (orbit_intlk_trans_y_diff_lwb_in_progress = '1')) then
            rddata_reg(31 downto 0) <= orbit_intlk_trans_y_diff_int;
            orbit_intlk_trans_y_diff_lwb_in_progress <= '0';
          end if;
          orbit_intlk_ang_x_diff_lwb <= orbit_intlk_ang_x_diff_lwb_delay;
          orbit_intlk_ang_x_diff_lwb_delay <= '0';
          if ((ack_sreg(1) = '1') and (orbit_intlk_ang_x_diff_lwb_in_progress = '1')) then
            rddata_reg(31 downto 0) <= orbit_intlk_ang_x_diff_int;
            orbit_intlk_ang_x_diff_lwb_in_progress <= '0';
          end if;
          orbit_intlk_ang_y_diff_lwb <= orbit_intlk_ang_y_diff_lwb_delay;
          orbit_intlk_ang_y_diff_lwb_delay <= '0';
          if ((ack_sreg(1) = '1') and (orbit_intlk_ang_y_diff_lwb_in_progress = '1')) then
            rddata_reg(31 downto 0) <= orbit_intlk_ang_y_diff_int;
            orbit_intlk_ang_y_diff_lwb_in_progress <= '0';
          end if;
        end if;
      else
        if ((wb_cyc_i = '1') and (wb_stb_i = '1')) then
          case rwaddr_reg(3 downto 0) is
          when "0000" => 
            if (wb_we_i = '1') then
              orbit_intlk_ctrl_en_int <= wrdata_reg(0);
              orbit_intlk_ctrl_clr_int <= wrdata_reg(1);
              orbit_intlk_ctrl_min_sum_en_int <= wrdata_reg(2);
              orbit_intlk_ctrl_trans_en_int <= wrdata_reg(3);
              orbit_intlk_ctrl_trans_clr_int <= wrdata_reg(4);
              orbit_intlk_ctrl_ang_en_int <= wrdata_reg(5);
              orbit_intlk_ctrl_ang_clr_int <= wrdata_reg(6);
            end if;
            rddata_reg(0) <= orbit_intlk_ctrl_en_int;
            rddata_reg(1) <= '0';
            rddata_reg(2) <= orbit_intlk_ctrl_min_sum_en_int;
            rddata_reg(3) <= orbit_intlk_ctrl_trans_en_int;
            rddata_reg(4) <= '0';
            rddata_reg(5) <= orbit_intlk_ctrl_ang_en_int;
            rddata_reg(6) <= '0';
            rddata_reg(30 downto 7) <= regs_i.ctrl_reserved_i;
            rddata_reg(31) <= 'X';
            ack_sreg(2) <= '1';
            ack_in_progress <= '1';
          when "0001" => 
            if (wb_we_i = '1') then
            end if;
            rddata_reg(0) <= regs_i.sts_trans_bigger_x_i;
            rddata_reg(1) <= regs_i.sts_trans_bigger_y_i;
            rddata_reg(2) <= regs_i.sts_trans_bigger_ltc_x_i;
            rddata_reg(3) <= regs_i.sts_trans_bigger_ltc_y_i;
            rddata_reg(4) <= regs_i.sts_trans_bigger_any_i;
            rddata_reg(5) <= regs_i.sts_trans_bigger_i;
            rddata_reg(6) <= regs_i.sts_trans_bigger_ltc_i;
            rddata_reg(7) <= regs_i.sts_ang_bigger_x_i;
            rddata_reg(8) <= regs_i.sts_ang_bigger_y_i;
            rddata_reg(9) <= regs_i.sts_ang_bigger_ltc_x_i;
            rddata_reg(10) <= regs_i.sts_ang_bigger_ltc_y_i;
            rddata_reg(11) <= regs_i.sts_ang_bigger_any_i;
            rddata_reg(12) <= regs_i.sts_ang_bigger_i;
            rddata_reg(13) <= regs_i.sts_ang_bigger_ltc_i;
            rddata_reg(14) <= regs_i.sts_intlk_i;
            rddata_reg(15) <= regs_i.sts_intlk_ltc_i;
            rddata_reg(16) <= regs_i.sts_trans_smaller_x_i;
            rddata_reg(17) <= regs_i.sts_trans_smaller_y_i;
            rddata_reg(18) <= regs_i.sts_trans_smaller_ltc_x_i;
            rddata_reg(19) <= regs_i.sts_trans_smaller_ltc_y_i;
            rddata_reg(20) <= regs_i.sts_trans_smaller_any_i;
            rddata_reg(21) <= regs_i.sts_trans_smaller_i;
            rddata_reg(22) <= regs_i.sts_trans_smaller_ltc_i;
            rddata_reg(23) <= regs_i.sts_ang_smaller_x_i;
            rddata_reg(24) <= regs_i.sts_ang_smaller_y_i;
            rddata_reg(25) <= regs_i.sts_ang_smaller_ltc_x_i;
            rddata_reg(26) <= regs_i.sts_ang_smaller_ltc_y_i;
            rddata_reg(27) <= regs_i.sts_ang_smaller_any_i;
            rddata_reg(28) <= regs_i.sts_ang_smaller_i;
            rddata_reg(29) <= regs_i.sts_ang_smaller_ltc_i;
            rddata_reg(30) <= regs_i.sts_min_sum_bigger_i;
            rddata_reg(31) <= regs_i.sts_reserved_i;
            ack_sreg(0) <= '1';
            ack_in_progress <= '1';
          when "0010" => 
            if (wb_we_i = '1') then
              orbit_intlk_min_sum_int <= wrdata_reg(31 downto 0);
              orbit_intlk_min_sum_swb <= '1';
              orbit_intlk_min_sum_swb_delay <= '1';
            end if;
            rddata_reg(31 downto 0) <= orbit_intlk_min_sum_int;
            ack_sreg(3) <= '1';
            ack_in_progress <= '1';
          when "0011" => 
            if (wb_we_i = '1') then
              orbit_intlk_trans_max_x_int <= wrdata_reg(31 downto 0);
              orbit_intlk_trans_max_x_swb <= '1';
              orbit_intlk_trans_max_x_swb_delay <= '1';
            end if;
            rddata_reg(31 downto 0) <= orbit_intlk_trans_max_x_int;
            ack_sreg(3) <= '1';
            ack_in_progress <= '1';
          when "0100" => 
            if (wb_we_i = '1') then
              orbit_intlk_trans_max_y_int <= wrdata_reg(31 downto 0);
              orbit_intlk_trans_max_y_swb <= '1';
              orbit_intlk_trans_max_y_swb_delay <= '1';
            end if;
            rddata_reg(31 downto 0) <= orbit_intlk_trans_max_y_int;
            ack_sreg(3) <= '1';
            ack_in_progress <= '1';
          when "0101" => 
            if (wb_we_i = '1') then
              orbit_intlk_ang_max_x_int <= wrdata_reg(31 downto 0);
              orbit_intlk_ang_max_x_swb <= '1';
              orbit_intlk_ang_max_x_swb_delay <= '1';
            end if;
            rddata_reg(31 downto 0) <= orbit_intlk_ang_max_x_int;
            ack_sreg(3) <= '1';
            ack_in_progress <= '1';
          when "0110" => 
            if (wb_we_i = '1') then
              orbit_intlk_ang_max_y_int <= wrdata_reg(31 downto 0);
              orbit_intlk_ang_max_y_swb <= '1';
              orbit_intlk_ang_max_y_swb_delay <= '1';
            end if;
            rddata_reg(31 downto 0) <= orbit_intlk_ang_max_y_int;
            ack_sreg(3) <= '1';
            ack_in_progress <= '1';
          when "0111" => 
            if (wb_we_i = '1') then
              orbit_intlk_trans_min_x_int <= wrdata_reg(31 downto 0);
              orbit_intlk_trans_min_x_swb <= '1';
              orbit_intlk_trans_min_x_swb_delay <= '1';
            end if;
            rddata_reg(31 downto 0) <= orbit_intlk_trans_min_x_int;
            ack_sreg(3) <= '1';
            ack_in_progress <= '1';
          when "1000" => 
            if (wb_we_i = '1') then
              orbit_intlk_trans_min_y_int <= wrdata_reg(31 downto 0);
              orbit_intlk_trans_min_y_swb <= '1';
              orbit_intlk_trans_min_y_swb_delay <= '1';
            end if;
            rddata_reg(31 downto 0) <= orbit_intlk_trans_min_y_int;
            ack_sreg(3) <= '1';
            ack_in_progress <= '1';
          when "1001" => 
            if (wb_we_i = '1') then
              orbit_intlk_ang_min_x_int <= wrdata_reg(31 downto 0);
              orbit_intlk_ang_min_x_swb <= '1';
              orbit_intlk_ang_min_x_swb_delay <= '1';
            end if;
            rddata_reg(31 downto 0) <= orbit_intlk_ang_min_x_int;
            ack_sreg(3) <= '1';
            ack_in_progress <= '1';
          when "1010" => 
            if (wb_we_i = '1') then
              orbit_intlk_ang_min_y_int <= wrdata_reg(31 downto 0);
              orbit_intlk_ang_min_y_swb <= '1';
              orbit_intlk_ang_min_y_swb_delay <= '1';
            end if;
            rddata_reg(31 downto 0) <= orbit_intlk_ang_min_y_int;
            ack_sreg(3) <= '1';
            ack_in_progress <= '1';
          when "1011" => 
            if (wb_we_i = '1') then
            end if;
            if (wb_we_i = '0') then
              orbit_intlk_trans_x_diff_lwb <= '1';
              orbit_intlk_trans_x_diff_lwb_delay <= '1';
              orbit_intlk_trans_x_diff_lwb_in_progress <= '1';
            end if;
            ack_sreg(5) <= '1';
            ack_in_progress <= '1';
          when "1100" => 
            if (wb_we_i = '1') then
            end if;
            if (wb_we_i = '0') then
              orbit_intlk_trans_y_diff_lwb <= '1';
              orbit_intlk_trans_y_diff_lwb_delay <= '1';
              orbit_intlk_trans_y_diff_lwb_in_progress <= '1';
            end if;
            ack_sreg(5) <= '1';
            ack_in_progress <= '1';
          when "1101" => 
            if (wb_we_i = '1') then
            end if;
            if (wb_we_i = '0') then
              orbit_intlk_ang_x_diff_lwb <= '1';
              orbit_intlk_ang_x_diff_lwb_delay <= '1';
              orbit_intlk_ang_x_diff_lwb_in_progress <= '1';
            end if;
            ack_sreg(5) <= '1';
            ack_in_progress <= '1';
          when "1110" => 
            if (wb_we_i = '1') then
            end if;
            if (wb_we_i = '0') then
              orbit_intlk_ang_y_diff_lwb <= '1';
              orbit_intlk_ang_y_diff_lwb_delay <= '1';
              orbit_intlk_ang_y_diff_lwb_in_progress <= '1';
            end if;
            ack_sreg(5) <= '1';
            ack_in_progress <= '1';
          when others =>
-- prevent the slave from hanging the bus on invalid address
            ack_in_progress <= '1';
            ack_sreg(0) <= '1';
          end case;
        end if;
      end if;
    end if;
  end process;
  
  
-- Drive the data output bus
  wb_dat_o <= rddata_reg;
-- Enable
  regs_o.ctrl_en_o <= orbit_intlk_ctrl_en_int;
-- Clear
  process (clk_sys_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      orbit_intlk_ctrl_clr_dly0 <= '0';
      regs_o.ctrl_clr_o <= '0';
    elsif rising_edge(clk_sys_i) then
      orbit_intlk_ctrl_clr_dly0 <= orbit_intlk_ctrl_clr_int;
      regs_o.ctrl_clr_o <= orbit_intlk_ctrl_clr_int and (not orbit_intlk_ctrl_clr_dly0);
    end if;
  end process;
  
  
-- Minimum sum enable
  regs_o.ctrl_min_sum_en_o <= orbit_intlk_ctrl_min_sum_en_int;
-- Translation Interlock Enable
  regs_o.ctrl_trans_en_o <= orbit_intlk_ctrl_trans_en_int;
-- Translation Interlock Clear
  process (clk_sys_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      orbit_intlk_ctrl_trans_clr_dly0 <= '0';
      regs_o.ctrl_trans_clr_o <= '0';
    elsif rising_edge(clk_sys_i) then
      orbit_intlk_ctrl_trans_clr_dly0 <= orbit_intlk_ctrl_trans_clr_int;
      regs_o.ctrl_trans_clr_o <= orbit_intlk_ctrl_trans_clr_int and (not orbit_intlk_ctrl_trans_clr_dly0);
    end if;
  end process;
  
  
-- Angular Interlock Enable
  regs_o.ctrl_ang_en_o <= orbit_intlk_ctrl_ang_en_int;
-- Angular Interlock Clear
  process (clk_sys_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      orbit_intlk_ctrl_ang_clr_dly0 <= '0';
      regs_o.ctrl_ang_clr_o <= '0';
    elsif rising_edge(clk_sys_i) then
      orbit_intlk_ctrl_ang_clr_dly0 <= orbit_intlk_ctrl_ang_clr_int;
      regs_o.ctrl_ang_clr_o <= orbit_intlk_ctrl_ang_clr_int and (not orbit_intlk_ctrl_ang_clr_dly0);
    end if;
  end process;
  
  
-- Reserved
-- Translation Bigger X
-- Translation Bigger Y
-- Translation Bigger Latched X
-- Translation Bigger Latched Y
-- Translation Bigger Any (X/Y)
-- Translation Bigger
-- Translation Bigger Latched
-- Angular Bigger X
-- Angular Bigger Y
-- Angular Bigger Latched X
-- Angular Bigger Latched Y
-- Angular Bigger Any (X/Y)
-- Angular Bigger
-- Angular Bigger Latched
-- Interlock Trip
-- Interlock Trip Latched
-- Translation Smaller X
-- Translation Smaller Y
-- Translation Smaller Latched X
-- Translation Smaller Latched Y
-- Translation Smaller Any (X/Y)
-- Translation Smaller
-- Translation Smaller Latched
-- Angular Smaller X
-- Angular Smaller Y
-- Angular Smaller Latched X
-- Angular Smaller Latched Y
-- Angular Smaller Any (X/Y)
-- Angular Smaller
-- Angular Smaller Latched
-- Minimum sum threshold detection
-- Reserved
-- Minimum Sum Threshold
-- asynchronous std_logic_vector register : Minimum Sum Threshold (type RW/RO, fs_clk_i <-> clk_sys_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      orbit_intlk_min_sum_swb_s0 <= '0';
      orbit_intlk_min_sum_swb_s1 <= '0';
      orbit_intlk_min_sum_swb_s2 <= '0';
      regs_o.min_sum_o <= "00000000000000000000000000000000";
    elsif rising_edge(fs_clk_i) then
      orbit_intlk_min_sum_swb_s0 <= orbit_intlk_min_sum_swb;
      orbit_intlk_min_sum_swb_s1 <= orbit_intlk_min_sum_swb_s0;
      orbit_intlk_min_sum_swb_s2 <= orbit_intlk_min_sum_swb_s1;
      if ((orbit_intlk_min_sum_swb_s2 = '0') and (orbit_intlk_min_sum_swb_s1 = '1')) then
        regs_o.min_sum_o <= orbit_intlk_min_sum_int;
      end if;
    end if;
  end process;
  
  
-- Maximum X Threshold
-- asynchronous std_logic_vector register : Maximum X Threshold (type RW/RO, fs_clk_i <-> clk_sys_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      orbit_intlk_trans_max_x_swb_s0 <= '0';
      orbit_intlk_trans_max_x_swb_s1 <= '0';
      orbit_intlk_trans_max_x_swb_s2 <= '0';
      regs_o.trans_max_x_o <= "00000000000000000000000000000000";
    elsif rising_edge(fs_clk_i) then
      orbit_intlk_trans_max_x_swb_s0 <= orbit_intlk_trans_max_x_swb;
      orbit_intlk_trans_max_x_swb_s1 <= orbit_intlk_trans_max_x_swb_s0;
      orbit_intlk_trans_max_x_swb_s2 <= orbit_intlk_trans_max_x_swb_s1;
      if ((orbit_intlk_trans_max_x_swb_s2 = '0') and (orbit_intlk_trans_max_x_swb_s1 = '1')) then
        regs_o.trans_max_x_o <= orbit_intlk_trans_max_x_int;
      end if;
    end if;
  end process;
  
  
-- Maximum Y Threshold
-- asynchronous std_logic_vector register : Maximum Y Threshold (type RW/RO, fs_clk_i <-> clk_sys_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      orbit_intlk_trans_max_y_swb_s0 <= '0';
      orbit_intlk_trans_max_y_swb_s1 <= '0';
      orbit_intlk_trans_max_y_swb_s2 <= '0';
      regs_o.trans_max_y_o <= "00000000000000000000000000000000";
    elsif rising_edge(fs_clk_i) then
      orbit_intlk_trans_max_y_swb_s0 <= orbit_intlk_trans_max_y_swb;
      orbit_intlk_trans_max_y_swb_s1 <= orbit_intlk_trans_max_y_swb_s0;
      orbit_intlk_trans_max_y_swb_s2 <= orbit_intlk_trans_max_y_swb_s1;
      if ((orbit_intlk_trans_max_y_swb_s2 = '0') and (orbit_intlk_trans_max_y_swb_s1 = '1')) then
        regs_o.trans_max_y_o <= orbit_intlk_trans_max_y_int;
      end if;
    end if;
  end process;
  
  
-- Maximum X Threshold
-- asynchronous std_logic_vector register : Maximum X Threshold (type RW/RO, fs_clk_i <-> clk_sys_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      orbit_intlk_ang_max_x_swb_s0 <= '0';
      orbit_intlk_ang_max_x_swb_s1 <= '0';
      orbit_intlk_ang_max_x_swb_s2 <= '0';
      regs_o.ang_max_x_o <= "00000000000000000000000000000000";
    elsif rising_edge(fs_clk_i) then
      orbit_intlk_ang_max_x_swb_s0 <= orbit_intlk_ang_max_x_swb;
      orbit_intlk_ang_max_x_swb_s1 <= orbit_intlk_ang_max_x_swb_s0;
      orbit_intlk_ang_max_x_swb_s2 <= orbit_intlk_ang_max_x_swb_s1;
      if ((orbit_intlk_ang_max_x_swb_s2 = '0') and (orbit_intlk_ang_max_x_swb_s1 = '1')) then
        regs_o.ang_max_x_o <= orbit_intlk_ang_max_x_int;
      end if;
    end if;
  end process;
  
  
-- Maximum Y Threshold
-- asynchronous std_logic_vector register : Maximum Y Threshold (type RW/RO, fs_clk_i <-> clk_sys_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      orbit_intlk_ang_max_y_swb_s0 <= '0';
      orbit_intlk_ang_max_y_swb_s1 <= '0';
      orbit_intlk_ang_max_y_swb_s2 <= '0';
      regs_o.ang_max_y_o <= "00000000000000000000000000000000";
    elsif rising_edge(fs_clk_i) then
      orbit_intlk_ang_max_y_swb_s0 <= orbit_intlk_ang_max_y_swb;
      orbit_intlk_ang_max_y_swb_s1 <= orbit_intlk_ang_max_y_swb_s0;
      orbit_intlk_ang_max_y_swb_s2 <= orbit_intlk_ang_max_y_swb_s1;
      if ((orbit_intlk_ang_max_y_swb_s2 = '0') and (orbit_intlk_ang_max_y_swb_s1 = '1')) then
        regs_o.ang_max_y_o <= orbit_intlk_ang_max_y_int;
      end if;
    end if;
  end process;
  
  
-- Minimum X Threshold
-- asynchronous std_logic_vector register : Minimum X Threshold (type RW/RO, fs_clk_i <-> clk_sys_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      orbit_intlk_trans_min_x_swb_s0 <= '0';
      orbit_intlk_trans_min_x_swb_s1 <= '0';
      orbit_intlk_trans_min_x_swb_s2 <= '0';
      regs_o.trans_min_x_o <= "00000000000000000000000000000000";
    elsif rising_edge(fs_clk_i) then
      orbit_intlk_trans_min_x_swb_s0 <= orbit_intlk_trans_min_x_swb;
      orbit_intlk_trans_min_x_swb_s1 <= orbit_intlk_trans_min_x_swb_s0;
      orbit_intlk_trans_min_x_swb_s2 <= orbit_intlk_trans_min_x_swb_s1;
      if ((orbit_intlk_trans_min_x_swb_s2 = '0') and (orbit_intlk_trans_min_x_swb_s1 = '1')) then
        regs_o.trans_min_x_o <= orbit_intlk_trans_min_x_int;
      end if;
    end if;
  end process;
  
  
-- Minimum Y Threshold
-- asynchronous std_logic_vector register : Minimum Y Threshold (type RW/RO, fs_clk_i <-> clk_sys_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      orbit_intlk_trans_min_y_swb_s0 <= '0';
      orbit_intlk_trans_min_y_swb_s1 <= '0';
      orbit_intlk_trans_min_y_swb_s2 <= '0';
      regs_o.trans_min_y_o <= "00000000000000000000000000000000";
    elsif rising_edge(fs_clk_i) then
      orbit_intlk_trans_min_y_swb_s0 <= orbit_intlk_trans_min_y_swb;
      orbit_intlk_trans_min_y_swb_s1 <= orbit_intlk_trans_min_y_swb_s0;
      orbit_intlk_trans_min_y_swb_s2 <= orbit_intlk_trans_min_y_swb_s1;
      if ((orbit_intlk_trans_min_y_swb_s2 = '0') and (orbit_intlk_trans_min_y_swb_s1 = '1')) then
        regs_o.trans_min_y_o <= orbit_intlk_trans_min_y_int;
      end if;
    end if;
  end process;
  
  
-- Minimum X Threshold
-- asynchronous std_logic_vector register : Minimum X Threshold (type RW/RO, fs_clk_i <-> clk_sys_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      orbit_intlk_ang_min_x_swb_s0 <= '0';
      orbit_intlk_ang_min_x_swb_s1 <= '0';
      orbit_intlk_ang_min_x_swb_s2 <= '0';
      regs_o.ang_min_x_o <= "00000000000000000000000000000000";
    elsif rising_edge(fs_clk_i) then
      orbit_intlk_ang_min_x_swb_s0 <= orbit_intlk_ang_min_x_swb;
      orbit_intlk_ang_min_x_swb_s1 <= orbit_intlk_ang_min_x_swb_s0;
      orbit_intlk_ang_min_x_swb_s2 <= orbit_intlk_ang_min_x_swb_s1;
      if ((orbit_intlk_ang_min_x_swb_s2 = '0') and (orbit_intlk_ang_min_x_swb_s1 = '1')) then
        regs_o.ang_min_x_o <= orbit_intlk_ang_min_x_int;
      end if;
    end if;
  end process;
  
  
-- Minimum Y Threshold
-- asynchronous std_logic_vector register : Minimum Y Threshold (type RW/RO, fs_clk_i <-> clk_sys_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      orbit_intlk_ang_min_y_swb_s0 <= '0';
      orbit_intlk_ang_min_y_swb_s1 <= '0';
      orbit_intlk_ang_min_y_swb_s2 <= '0';
      regs_o.ang_min_y_o <= "00000000000000000000000000000000";
    elsif rising_edge(fs_clk_i) then
      orbit_intlk_ang_min_y_swb_s0 <= orbit_intlk_ang_min_y_swb;
      orbit_intlk_ang_min_y_swb_s1 <= orbit_intlk_ang_min_y_swb_s0;
      orbit_intlk_ang_min_y_swb_s2 <= orbit_intlk_ang_min_y_swb_s1;
      if ((orbit_intlk_ang_min_y_swb_s2 = '0') and (orbit_intlk_ang_min_y_swb_s1 = '1')) then
        regs_o.ang_min_y_o <= orbit_intlk_ang_min_y_int;
      end if;
    end if;
  end process;
  
  
-- X translation difference
-- asynchronous std_logic_vector register : X translation difference (type RO/WO, fs_clk_i <-> clk_sys_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      orbit_intlk_trans_x_diff_lwb_s0 <= '0';
      orbit_intlk_trans_x_diff_lwb_s1 <= '0';
      orbit_intlk_trans_x_diff_lwb_s2 <= '0';
      orbit_intlk_trans_x_diff_int <= "00000000000000000000000000000000";
    elsif rising_edge(fs_clk_i) then
      orbit_intlk_trans_x_diff_lwb_s0 <= orbit_intlk_trans_x_diff_lwb;
      orbit_intlk_trans_x_diff_lwb_s1 <= orbit_intlk_trans_x_diff_lwb_s0;
      orbit_intlk_trans_x_diff_lwb_s2 <= orbit_intlk_trans_x_diff_lwb_s1;
      if ((orbit_intlk_trans_x_diff_lwb_s1 = '1') and (orbit_intlk_trans_x_diff_lwb_s2 = '0')) then
        orbit_intlk_trans_x_diff_int <= regs_i.trans_x_diff_i;
      end if;
    end if;
  end process;
  
  
-- Y translation difference
-- asynchronous std_logic_vector register : Y translation difference (type RO/WO, fs_clk_i <-> clk_sys_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      orbit_intlk_trans_y_diff_lwb_s0 <= '0';
      orbit_intlk_trans_y_diff_lwb_s1 <= '0';
      orbit_intlk_trans_y_diff_lwb_s2 <= '0';
      orbit_intlk_trans_y_diff_int <= "00000000000000000000000000000000";
    elsif rising_edge(fs_clk_i) then
      orbit_intlk_trans_y_diff_lwb_s0 <= orbit_intlk_trans_y_diff_lwb;
      orbit_intlk_trans_y_diff_lwb_s1 <= orbit_intlk_trans_y_diff_lwb_s0;
      orbit_intlk_trans_y_diff_lwb_s2 <= orbit_intlk_trans_y_diff_lwb_s1;
      if ((orbit_intlk_trans_y_diff_lwb_s1 = '1') and (orbit_intlk_trans_y_diff_lwb_s2 = '0')) then
        orbit_intlk_trans_y_diff_int <= regs_i.trans_y_diff_i;
      end if;
    end if;
  end process;
  
  
-- X angular difference
-- asynchronous std_logic_vector register : X angular difference (type RO/WO, fs_clk_i <-> clk_sys_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      orbit_intlk_ang_x_diff_lwb_s0 <= '0';
      orbit_intlk_ang_x_diff_lwb_s1 <= '0';
      orbit_intlk_ang_x_diff_lwb_s2 <= '0';
      orbit_intlk_ang_x_diff_int <= "00000000000000000000000000000000";
    elsif rising_edge(fs_clk_i) then
      orbit_intlk_ang_x_diff_lwb_s0 <= orbit_intlk_ang_x_diff_lwb;
      orbit_intlk_ang_x_diff_lwb_s1 <= orbit_intlk_ang_x_diff_lwb_s0;
      orbit_intlk_ang_x_diff_lwb_s2 <= orbit_intlk_ang_x_diff_lwb_s1;
      if ((orbit_intlk_ang_x_diff_lwb_s1 = '1') and (orbit_intlk_ang_x_diff_lwb_s2 = '0')) then
        orbit_intlk_ang_x_diff_int <= regs_i.ang_x_diff_i;
      end if;
    end if;
  end process;
  
  
-- Y angular difference
-- asynchronous std_logic_vector register : Y angular difference (type RO/WO, fs_clk_i <-> clk_sys_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      orbit_intlk_ang_y_diff_lwb_s0 <= '0';
      orbit_intlk_ang_y_diff_lwb_s1 <= '0';
      orbit_intlk_ang_y_diff_lwb_s2 <= '0';
      orbit_intlk_ang_y_diff_int <= "00000000000000000000000000000000";
    elsif rising_edge(fs_clk_i) then
      orbit_intlk_ang_y_diff_lwb_s0 <= orbit_intlk_ang_y_diff_lwb;
      orbit_intlk_ang_y_diff_lwb_s1 <= orbit_intlk_ang_y_diff_lwb_s0;
      orbit_intlk_ang_y_diff_lwb_s2 <= orbit_intlk_ang_y_diff_lwb_s1;
      if ((orbit_intlk_ang_y_diff_lwb_s1 = '1') and (orbit_intlk_ang_y_diff_lwb_s2 = '0')) then
        orbit_intlk_ang_y_diff_int <= regs_i.ang_y_diff_i;
      end if;
    end if;
  end process;
  
  
  rwaddr_reg <= wb_adr_i;
  wb_stall_o <= (not ack_sreg(0)) and (wb_stb_i and wb_cyc_i);
  wb_err_o <= '0';
  wb_rty_o <= '0';
-- ACK signal generation. Just pass the LSB of ACK counter.
  wb_ack_o <= ack_sreg(0);
end syn;
