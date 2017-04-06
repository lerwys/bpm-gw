---------------------------------------------------------------------------------------
-- Title          : Wishbone slave core for BPM FSM Acquisition registers
---------------------------------------------------------------------------------------
-- File           : acq_core_regs_pkg.vhd
-- Author         : auto-generated by wbgen2 from acq_core.wb
-- Created        : Fri Mar 24 14:49:10 2017
-- Standard       : VHDL'87
---------------------------------------------------------------------------------------
-- THIS FILE WAS GENERATED BY wbgen2 FROM SOURCE FILE acq_core.wb
-- DO NOT HAND-EDIT UNLESS IT'S ABSOLUTELY NECESSARY!
---------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package acq_core_wbgen2_pkg is
  
  
  -- Input registers (user design -> WB slave)
  
  type t_acq_core_in_registers is record
    sta_fsm_state_i                          : std_logic_vector(2 downto 0);
    sta_fsm_acq_done_i                       : std_logic;
    sta_reserved1_i                          : std_logic_vector(3 downto 0);
    sta_fc_trans_done_i                      : std_logic;
    sta_fc_full_i                            : std_logic;
    sta_reserved2_i                          : std_logic_vector(5 downto 0);
    sta_ddr3_trans_done_i                    : std_logic;
    sta_reserved3_i                          : std_logic_vector(14 downto 0);
    trig_pos_i                               : std_logic_vector(31 downto 0);
    samples_cnt_i                            : std_logic_vector(31 downto 0);
    ch0_desc_int_width_i                     : std_logic_vector(15 downto 0);
    ch0_desc_num_coalesce_i                  : std_logic_vector(15 downto 0);
    ch0_atom_desc_num_atoms_i                : std_logic_vector(15 downto 0);
    ch0_atom_desc_atom_width_i               : std_logic_vector(15 downto 0);
    ch1_desc_int_width_i                     : std_logic_vector(15 downto 0);
    ch1_desc_num_coalesce_i                  : std_logic_vector(15 downto 0);
    ch1_atom_desc_num_atoms_i                : std_logic_vector(15 downto 0);
    ch1_atom_desc_atom_width_i               : std_logic_vector(15 downto 0);
    ch2_desc_int_width_i                     : std_logic_vector(15 downto 0);
    ch2_desc_num_coalesce_i                  : std_logic_vector(15 downto 0);
    ch2_atom_desc_num_atoms_i                : std_logic_vector(15 downto 0);
    ch2_atom_desc_atom_width_i               : std_logic_vector(15 downto 0);
    ch3_desc_int_width_i                     : std_logic_vector(15 downto 0);
    ch3_desc_num_coalesce_i                  : std_logic_vector(15 downto 0);
    ch3_atom_desc_num_atoms_i                : std_logic_vector(15 downto 0);
    ch3_atom_desc_atom_width_i               : std_logic_vector(15 downto 0);
    ch4_desc_int_width_i                     : std_logic_vector(15 downto 0);
    ch4_desc_num_coalesce_i                  : std_logic_vector(15 downto 0);
    ch4_atom_desc_num_atoms_i                : std_logic_vector(15 downto 0);
    ch4_atom_desc_atom_width_i               : std_logic_vector(15 downto 0);
    ch5_desc_int_width_i                     : std_logic_vector(15 downto 0);
    ch5_desc_num_coalesce_i                  : std_logic_vector(15 downto 0);
    ch5_atom_desc_num_atoms_i                : std_logic_vector(15 downto 0);
    ch5_atom_desc_atom_width_i               : std_logic_vector(15 downto 0);
    ch6_desc_int_width_i                     : std_logic_vector(15 downto 0);
    ch6_desc_num_coalesce_i                  : std_logic_vector(15 downto 0);
    ch6_atom_desc_num_atoms_i                : std_logic_vector(15 downto 0);
    ch6_atom_desc_atom_width_i               : std_logic_vector(15 downto 0);
    ch7_desc_int_width_i                     : std_logic_vector(15 downto 0);
    ch7_desc_num_coalesce_i                  : std_logic_vector(15 downto 0);
    ch7_atom_desc_num_atoms_i                : std_logic_vector(15 downto 0);
    ch7_atom_desc_atom_width_i               : std_logic_vector(15 downto 0);
    ch8_desc_int_width_i                     : std_logic_vector(15 downto 0);
    ch8_desc_num_coalesce_i                  : std_logic_vector(15 downto 0);
    ch8_atom_desc_num_atoms_i                : std_logic_vector(15 downto 0);
    ch8_atom_desc_atom_width_i               : std_logic_vector(15 downto 0);
    ch9_desc_int_width_i                     : std_logic_vector(15 downto 0);
    ch9_desc_num_coalesce_i                  : std_logic_vector(15 downto 0);
    ch9_atom_desc_num_atoms_i                : std_logic_vector(15 downto 0);
    ch9_atom_desc_atom_width_i               : std_logic_vector(15 downto 0);
    ch10_desc_int_width_i                    : std_logic_vector(15 downto 0);
    ch10_desc_num_coalesce_i                 : std_logic_vector(15 downto 0);
    ch10_atom_desc_num_atoms_i               : std_logic_vector(15 downto 0);
    ch10_atom_desc_atom_width_i              : std_logic_vector(15 downto 0);
    ch11_desc_int_width_i                    : std_logic_vector(15 downto 0);
    ch11_desc_num_coalesce_i                 : std_logic_vector(15 downto 0);
    ch11_atom_desc_num_atoms_i               : std_logic_vector(15 downto 0);
    ch11_atom_desc_atom_width_i              : std_logic_vector(15 downto 0);
    ch12_desc_int_width_i                    : std_logic_vector(15 downto 0);
    ch12_desc_num_coalesce_i                 : std_logic_vector(15 downto 0);
    ch12_atom_desc_num_atoms_i               : std_logic_vector(15 downto 0);
    ch12_atom_desc_atom_width_i              : std_logic_vector(15 downto 0);
    ch13_desc_int_width_i                    : std_logic_vector(15 downto 0);
    ch13_desc_num_coalesce_i                 : std_logic_vector(15 downto 0);
    ch13_atom_desc_num_atoms_i               : std_logic_vector(15 downto 0);
    ch13_atom_desc_atom_width_i              : std_logic_vector(15 downto 0);
    ch14_desc_int_width_i                    : std_logic_vector(15 downto 0);
    ch14_desc_num_coalesce_i                 : std_logic_vector(15 downto 0);
    ch14_atom_desc_num_atoms_i               : std_logic_vector(15 downto 0);
    ch14_atom_desc_atom_width_i              : std_logic_vector(15 downto 0);
    ch15_desc_int_width_i                    : std_logic_vector(15 downto 0);
    ch15_desc_num_coalesce_i                 : std_logic_vector(15 downto 0);
    ch15_atom_desc_num_atoms_i               : std_logic_vector(15 downto 0);
    ch15_atom_desc_atom_width_i              : std_logic_vector(15 downto 0);
    ch16_desc_int_width_i                    : std_logic_vector(15 downto 0);
    ch16_desc_num_coalesce_i                 : std_logic_vector(15 downto 0);
    ch16_atom_desc_num_atoms_i               : std_logic_vector(15 downto 0);
    ch16_atom_desc_atom_width_i              : std_logic_vector(15 downto 0);
    ch17_desc_int_width_i                    : std_logic_vector(15 downto 0);
    ch17_desc_num_coalesce_i                 : std_logic_vector(15 downto 0);
    ch17_atom_desc_num_atoms_i               : std_logic_vector(15 downto 0);
    ch17_atom_desc_atom_width_i              : std_logic_vector(15 downto 0);
    ch18_desc_int_width_i                    : std_logic_vector(15 downto 0);
    ch18_desc_num_coalesce_i                 : std_logic_vector(15 downto 0);
    ch18_atom_desc_num_atoms_i               : std_logic_vector(15 downto 0);
    ch18_atom_desc_atom_width_i              : std_logic_vector(15 downto 0);
    ch19_desc_int_width_i                    : std_logic_vector(15 downto 0);
    ch19_desc_num_coalesce_i                 : std_logic_vector(15 downto 0);
    ch19_atom_desc_num_atoms_i               : std_logic_vector(15 downto 0);
    ch19_atom_desc_atom_width_i              : std_logic_vector(15 downto 0);
    ch20_desc_int_width_i                    : std_logic_vector(15 downto 0);
    ch20_desc_num_coalesce_i                 : std_logic_vector(15 downto 0);
    ch20_atom_desc_num_atoms_i               : std_logic_vector(15 downto 0);
    ch20_atom_desc_atom_width_i              : std_logic_vector(15 downto 0);
    ch21_desc_int_width_i                    : std_logic_vector(15 downto 0);
    ch21_desc_num_coalesce_i                 : std_logic_vector(15 downto 0);
    ch21_atom_desc_num_atoms_i               : std_logic_vector(15 downto 0);
    ch21_atom_desc_atom_width_i              : std_logic_vector(15 downto 0);
    ch22_desc_int_width_i                    : std_logic_vector(15 downto 0);
    ch22_desc_num_coalesce_i                 : std_logic_vector(15 downto 0);
    ch22_atom_desc_num_atoms_i               : std_logic_vector(15 downto 0);
    ch22_atom_desc_atom_width_i              : std_logic_vector(15 downto 0);
    ch23_desc_int_width_i                    : std_logic_vector(15 downto 0);
    ch23_desc_num_coalesce_i                 : std_logic_vector(15 downto 0);
    ch23_atom_desc_num_atoms_i               : std_logic_vector(15 downto 0);
    ch23_atom_desc_atom_width_i              : std_logic_vector(15 downto 0);
    end record;
  
  constant c_acq_core_in_registers_init_value: t_acq_core_in_registers := (
    sta_fsm_state_i => (others => '0'),
    sta_fsm_acq_done_i => '0',
    sta_reserved1_i => (others => '0'),
    sta_fc_trans_done_i => '0',
    sta_fc_full_i => '0',
    sta_reserved2_i => (others => '0'),
    sta_ddr3_trans_done_i => '0',
    sta_reserved3_i => (others => '0'),
    trig_pos_i => (others => '0'),
    samples_cnt_i => (others => '0'),
    ch0_desc_int_width_i => (others => '0'),
    ch0_desc_num_coalesce_i => (others => '0'),
    ch0_atom_desc_num_atoms_i => (others => '0'),
    ch0_atom_desc_atom_width_i => (others => '0'),
    ch1_desc_int_width_i => (others => '0'),
    ch1_desc_num_coalesce_i => (others => '0'),
    ch1_atom_desc_num_atoms_i => (others => '0'),
    ch1_atom_desc_atom_width_i => (others => '0'),
    ch2_desc_int_width_i => (others => '0'),
    ch2_desc_num_coalesce_i => (others => '0'),
    ch2_atom_desc_num_atoms_i => (others => '0'),
    ch2_atom_desc_atom_width_i => (others => '0'),
    ch3_desc_int_width_i => (others => '0'),
    ch3_desc_num_coalesce_i => (others => '0'),
    ch3_atom_desc_num_atoms_i => (others => '0'),
    ch3_atom_desc_atom_width_i => (others => '0'),
    ch4_desc_int_width_i => (others => '0'),
    ch4_desc_num_coalesce_i => (others => '0'),
    ch4_atom_desc_num_atoms_i => (others => '0'),
    ch4_atom_desc_atom_width_i => (others => '0'),
    ch5_desc_int_width_i => (others => '0'),
    ch5_desc_num_coalesce_i => (others => '0'),
    ch5_atom_desc_num_atoms_i => (others => '0'),
    ch5_atom_desc_atom_width_i => (others => '0'),
    ch6_desc_int_width_i => (others => '0'),
    ch6_desc_num_coalesce_i => (others => '0'),
    ch6_atom_desc_num_atoms_i => (others => '0'),
    ch6_atom_desc_atom_width_i => (others => '0'),
    ch7_desc_int_width_i => (others => '0'),
    ch7_desc_num_coalesce_i => (others => '0'),
    ch7_atom_desc_num_atoms_i => (others => '0'),
    ch7_atom_desc_atom_width_i => (others => '0'),
    ch8_desc_int_width_i => (others => '0'),
    ch8_desc_num_coalesce_i => (others => '0'),
    ch8_atom_desc_num_atoms_i => (others => '0'),
    ch8_atom_desc_atom_width_i => (others => '0'),
    ch9_desc_int_width_i => (others => '0'),
    ch9_desc_num_coalesce_i => (others => '0'),
    ch9_atom_desc_num_atoms_i => (others => '0'),
    ch9_atom_desc_atom_width_i => (others => '0'),
    ch10_desc_int_width_i => (others => '0'),
    ch10_desc_num_coalesce_i => (others => '0'),
    ch10_atom_desc_num_atoms_i => (others => '0'),
    ch10_atom_desc_atom_width_i => (others => '0'),
    ch11_desc_int_width_i => (others => '0'),
    ch11_desc_num_coalesce_i => (others => '0'),
    ch11_atom_desc_num_atoms_i => (others => '0'),
    ch11_atom_desc_atom_width_i => (others => '0'),
    ch12_desc_int_width_i => (others => '0'),
    ch12_desc_num_coalesce_i => (others => '0'),
    ch12_atom_desc_num_atoms_i => (others => '0'),
    ch12_atom_desc_atom_width_i => (others => '0'),
    ch13_desc_int_width_i => (others => '0'),
    ch13_desc_num_coalesce_i => (others => '0'),
    ch13_atom_desc_num_atoms_i => (others => '0'),
    ch13_atom_desc_atom_width_i => (others => '0'),
    ch14_desc_int_width_i => (others => '0'),
    ch14_desc_num_coalesce_i => (others => '0'),
    ch14_atom_desc_num_atoms_i => (others => '0'),
    ch14_atom_desc_atom_width_i => (others => '0'),
    ch15_desc_int_width_i => (others => '0'),
    ch15_desc_num_coalesce_i => (others => '0'),
    ch15_atom_desc_num_atoms_i => (others => '0'),
    ch15_atom_desc_atom_width_i => (others => '0'),
    ch16_desc_int_width_i => (others => '0'),
    ch16_desc_num_coalesce_i => (others => '0'),
    ch16_atom_desc_num_atoms_i => (others => '0'),
    ch16_atom_desc_atom_width_i => (others => '0'),
    ch17_desc_int_width_i => (others => '0'),
    ch17_desc_num_coalesce_i => (others => '0'),
    ch17_atom_desc_num_atoms_i => (others => '0'),
    ch17_atom_desc_atom_width_i => (others => '0'),
    ch18_desc_int_width_i => (others => '0'),
    ch18_desc_num_coalesce_i => (others => '0'),
    ch18_atom_desc_num_atoms_i => (others => '0'),
    ch18_atom_desc_atom_width_i => (others => '0'),
    ch19_desc_int_width_i => (others => '0'),
    ch19_desc_num_coalesce_i => (others => '0'),
    ch19_atom_desc_num_atoms_i => (others => '0'),
    ch19_atom_desc_atom_width_i => (others => '0'),
    ch20_desc_int_width_i => (others => '0'),
    ch20_desc_num_coalesce_i => (others => '0'),
    ch20_atom_desc_num_atoms_i => (others => '0'),
    ch20_atom_desc_atom_width_i => (others => '0'),
    ch21_desc_int_width_i => (others => '0'),
    ch21_desc_num_coalesce_i => (others => '0'),
    ch21_atom_desc_num_atoms_i => (others => '0'),
    ch21_atom_desc_atom_width_i => (others => '0'),
    ch22_desc_int_width_i => (others => '0'),
    ch22_desc_num_coalesce_i => (others => '0'),
    ch22_atom_desc_num_atoms_i => (others => '0'),
    ch22_atom_desc_atom_width_i => (others => '0'),
    ch23_desc_int_width_i => (others => '0'),
    ch23_desc_num_coalesce_i => (others => '0'),
    ch23_atom_desc_num_atoms_i => (others => '0'),
    ch23_atom_desc_atom_width_i => (others => '0')
    );
    
    -- Output registers (WB slave -> user design)
    
    type t_acq_core_out_registers is record
      ctl_fsm_start_acq_o                      : std_logic;
      ctl_fsm_stop_acq_o                       : std_logic;
      ctl_reserved1_o                          : std_logic_vector(13 downto 0);
      ctl_fsm_acq_now_o                        : std_logic;
      ctl_reserved2_o                          : std_logic_vector(14 downto 0);
      trig_cfg_hw_trig_sel_o                   : std_logic;
      trig_cfg_hw_trig_pol_o                   : std_logic;
      trig_cfg_hw_trig_en_o                    : std_logic;
      trig_cfg_sw_trig_en_o                    : std_logic;
      trig_cfg_int_trig_sel_o                  : std_logic_vector(4 downto 0);
      trig_cfg_reserved_o                      : std_logic_vector(22 downto 0);
      trig_data_cfg_thres_filt_o               : std_logic_vector(7 downto 0);
      trig_data_cfg_reserved_o                 : std_logic_vector(23 downto 0);
      trig_data_thres_o                        : std_logic_vector(31 downto 0);
      trig_dly_o                               : std_logic_vector(31 downto 0);
      sw_trig_o                                : std_logic_vector(31 downto 0);
      sw_trig_wr_o                             : std_logic;
      shots_nb_o                               : std_logic_vector(15 downto 0);
      shots_reserved_o                         : std_logic_vector(15 downto 0);
      pre_samples_o                            : std_logic_vector(31 downto 0);
      post_samples_o                           : std_logic_vector(31 downto 0);
      ddr3_start_addr_o                        : std_logic_vector(31 downto 0);
      ddr3_end_addr_o                          : std_logic_vector(31 downto 0);
      acq_chan_ctl_which_o                     : std_logic_vector(4 downto 0);
      acq_chan_ctl_reserved_o                  : std_logic_vector(2 downto 0);
      acq_chan_ctl_dtrig_which_o               : std_logic_vector(4 downto 0);
      acq_chan_ctl_reserved1_o                 : std_logic_vector(18 downto 0);
      end record;
    
    constant c_acq_core_out_registers_init_value: t_acq_core_out_registers := (
      ctl_fsm_start_acq_o => '0',
      ctl_fsm_stop_acq_o => '0',
      ctl_reserved1_o => (others => '0'),
      ctl_fsm_acq_now_o => '0',
      ctl_reserved2_o => (others => '0'),
      trig_cfg_hw_trig_sel_o => '0',
      trig_cfg_hw_trig_pol_o => '0',
      trig_cfg_hw_trig_en_o => '0',
      trig_cfg_sw_trig_en_o => '0',
      trig_cfg_int_trig_sel_o => (others => '0'),
      trig_cfg_reserved_o => (others => '0'),
      trig_data_cfg_thres_filt_o => (others => '0'),
      trig_data_cfg_reserved_o => (others => '0'),
      trig_data_thres_o => (others => '0'),
      trig_dly_o => (others => '0'),
      sw_trig_o => (others => '0'),
      sw_trig_wr_o => '0',
      shots_nb_o => (others => '0'),
      shots_reserved_o => (others => '0'),
      pre_samples_o => (others => '0'),
      post_samples_o => (others => '0'),
      ddr3_start_addr_o => (others => '0'),
      ddr3_end_addr_o => (others => '0'),
      acq_chan_ctl_which_o => (others => '0'),
      acq_chan_ctl_reserved_o => (others => '0'),
      acq_chan_ctl_dtrig_which_o => (others => '0'),
      acq_chan_ctl_reserved1_o => (others => '0')
      );
    function "or" (left, right: t_acq_core_in_registers) return t_acq_core_in_registers;
    function f_x_to_zero (x:std_logic) return std_logic;
    function f_x_to_zero (x:std_logic_vector) return std_logic_vector;
end package;

package body acq_core_wbgen2_pkg is
function f_x_to_zero (x:std_logic) return std_logic is
begin
if x = '1' then
return '1';
else
return '0';
end if;
end function;
function f_x_to_zero (x:std_logic_vector) return std_logic_vector is
variable tmp: std_logic_vector(x'length-1 downto 0);
begin
for i in 0 to x'length-1 loop
if(x(i) = 'X' or x(i) = 'U') then
tmp(i):= '0';
else
tmp(i):=x(i);
end if; 
end loop; 
return tmp;
end function;
function "or" (left, right: t_acq_core_in_registers) return t_acq_core_in_registers is
variable tmp: t_acq_core_in_registers;
begin
tmp.sta_fsm_state_i := f_x_to_zero(left.sta_fsm_state_i) or f_x_to_zero(right.sta_fsm_state_i);
tmp.sta_fsm_acq_done_i := f_x_to_zero(left.sta_fsm_acq_done_i) or f_x_to_zero(right.sta_fsm_acq_done_i);
tmp.sta_reserved1_i := f_x_to_zero(left.sta_reserved1_i) or f_x_to_zero(right.sta_reserved1_i);
tmp.sta_fc_trans_done_i := f_x_to_zero(left.sta_fc_trans_done_i) or f_x_to_zero(right.sta_fc_trans_done_i);
tmp.sta_fc_full_i := f_x_to_zero(left.sta_fc_full_i) or f_x_to_zero(right.sta_fc_full_i);
tmp.sta_reserved2_i := f_x_to_zero(left.sta_reserved2_i) or f_x_to_zero(right.sta_reserved2_i);
tmp.sta_ddr3_trans_done_i := f_x_to_zero(left.sta_ddr3_trans_done_i) or f_x_to_zero(right.sta_ddr3_trans_done_i);
tmp.sta_reserved3_i := f_x_to_zero(left.sta_reserved3_i) or f_x_to_zero(right.sta_reserved3_i);
tmp.trig_pos_i := f_x_to_zero(left.trig_pos_i) or f_x_to_zero(right.trig_pos_i);
tmp.samples_cnt_i := f_x_to_zero(left.samples_cnt_i) or f_x_to_zero(right.samples_cnt_i);
tmp.ch0_desc_int_width_i := f_x_to_zero(left.ch0_desc_int_width_i) or f_x_to_zero(right.ch0_desc_int_width_i);
tmp.ch0_desc_num_coalesce_i := f_x_to_zero(left.ch0_desc_num_coalesce_i) or f_x_to_zero(right.ch0_desc_num_coalesce_i);
tmp.ch0_atom_desc_num_atoms_i := f_x_to_zero(left.ch0_atom_desc_num_atoms_i) or f_x_to_zero(right.ch0_atom_desc_num_atoms_i);
tmp.ch0_atom_desc_atom_width_i := f_x_to_zero(left.ch0_atom_desc_atom_width_i) or f_x_to_zero(right.ch0_atom_desc_atom_width_i);
tmp.ch1_desc_int_width_i := f_x_to_zero(left.ch1_desc_int_width_i) or f_x_to_zero(right.ch1_desc_int_width_i);
tmp.ch1_desc_num_coalesce_i := f_x_to_zero(left.ch1_desc_num_coalesce_i) or f_x_to_zero(right.ch1_desc_num_coalesce_i);
tmp.ch1_atom_desc_num_atoms_i := f_x_to_zero(left.ch1_atom_desc_num_atoms_i) or f_x_to_zero(right.ch1_atom_desc_num_atoms_i);
tmp.ch1_atom_desc_atom_width_i := f_x_to_zero(left.ch1_atom_desc_atom_width_i) or f_x_to_zero(right.ch1_atom_desc_atom_width_i);
tmp.ch2_desc_int_width_i := f_x_to_zero(left.ch2_desc_int_width_i) or f_x_to_zero(right.ch2_desc_int_width_i);
tmp.ch2_desc_num_coalesce_i := f_x_to_zero(left.ch2_desc_num_coalesce_i) or f_x_to_zero(right.ch2_desc_num_coalesce_i);
tmp.ch2_atom_desc_num_atoms_i := f_x_to_zero(left.ch2_atom_desc_num_atoms_i) or f_x_to_zero(right.ch2_atom_desc_num_atoms_i);
tmp.ch2_atom_desc_atom_width_i := f_x_to_zero(left.ch2_atom_desc_atom_width_i) or f_x_to_zero(right.ch2_atom_desc_atom_width_i);
tmp.ch3_desc_int_width_i := f_x_to_zero(left.ch3_desc_int_width_i) or f_x_to_zero(right.ch3_desc_int_width_i);
tmp.ch3_desc_num_coalesce_i := f_x_to_zero(left.ch3_desc_num_coalesce_i) or f_x_to_zero(right.ch3_desc_num_coalesce_i);
tmp.ch3_atom_desc_num_atoms_i := f_x_to_zero(left.ch3_atom_desc_num_atoms_i) or f_x_to_zero(right.ch3_atom_desc_num_atoms_i);
tmp.ch3_atom_desc_atom_width_i := f_x_to_zero(left.ch3_atom_desc_atom_width_i) or f_x_to_zero(right.ch3_atom_desc_atom_width_i);
tmp.ch4_desc_int_width_i := f_x_to_zero(left.ch4_desc_int_width_i) or f_x_to_zero(right.ch4_desc_int_width_i);
tmp.ch4_desc_num_coalesce_i := f_x_to_zero(left.ch4_desc_num_coalesce_i) or f_x_to_zero(right.ch4_desc_num_coalesce_i);
tmp.ch4_atom_desc_num_atoms_i := f_x_to_zero(left.ch4_atom_desc_num_atoms_i) or f_x_to_zero(right.ch4_atom_desc_num_atoms_i);
tmp.ch4_atom_desc_atom_width_i := f_x_to_zero(left.ch4_atom_desc_atom_width_i) or f_x_to_zero(right.ch4_atom_desc_atom_width_i);
tmp.ch5_desc_int_width_i := f_x_to_zero(left.ch5_desc_int_width_i) or f_x_to_zero(right.ch5_desc_int_width_i);
tmp.ch5_desc_num_coalesce_i := f_x_to_zero(left.ch5_desc_num_coalesce_i) or f_x_to_zero(right.ch5_desc_num_coalesce_i);
tmp.ch5_atom_desc_num_atoms_i := f_x_to_zero(left.ch5_atom_desc_num_atoms_i) or f_x_to_zero(right.ch5_atom_desc_num_atoms_i);
tmp.ch5_atom_desc_atom_width_i := f_x_to_zero(left.ch5_atom_desc_atom_width_i) or f_x_to_zero(right.ch5_atom_desc_atom_width_i);
tmp.ch6_desc_int_width_i := f_x_to_zero(left.ch6_desc_int_width_i) or f_x_to_zero(right.ch6_desc_int_width_i);
tmp.ch6_desc_num_coalesce_i := f_x_to_zero(left.ch6_desc_num_coalesce_i) or f_x_to_zero(right.ch6_desc_num_coalesce_i);
tmp.ch6_atom_desc_num_atoms_i := f_x_to_zero(left.ch6_atom_desc_num_atoms_i) or f_x_to_zero(right.ch6_atom_desc_num_atoms_i);
tmp.ch6_atom_desc_atom_width_i := f_x_to_zero(left.ch6_atom_desc_atom_width_i) or f_x_to_zero(right.ch6_atom_desc_atom_width_i);
tmp.ch7_desc_int_width_i := f_x_to_zero(left.ch7_desc_int_width_i) or f_x_to_zero(right.ch7_desc_int_width_i);
tmp.ch7_desc_num_coalesce_i := f_x_to_zero(left.ch7_desc_num_coalesce_i) or f_x_to_zero(right.ch7_desc_num_coalesce_i);
tmp.ch7_atom_desc_num_atoms_i := f_x_to_zero(left.ch7_atom_desc_num_atoms_i) or f_x_to_zero(right.ch7_atom_desc_num_atoms_i);
tmp.ch7_atom_desc_atom_width_i := f_x_to_zero(left.ch7_atom_desc_atom_width_i) or f_x_to_zero(right.ch7_atom_desc_atom_width_i);
tmp.ch8_desc_int_width_i := f_x_to_zero(left.ch8_desc_int_width_i) or f_x_to_zero(right.ch8_desc_int_width_i);
tmp.ch8_desc_num_coalesce_i := f_x_to_zero(left.ch8_desc_num_coalesce_i) or f_x_to_zero(right.ch8_desc_num_coalesce_i);
tmp.ch8_atom_desc_num_atoms_i := f_x_to_zero(left.ch8_atom_desc_num_atoms_i) or f_x_to_zero(right.ch8_atom_desc_num_atoms_i);
tmp.ch8_atom_desc_atom_width_i := f_x_to_zero(left.ch8_atom_desc_atom_width_i) or f_x_to_zero(right.ch8_atom_desc_atom_width_i);
tmp.ch9_desc_int_width_i := f_x_to_zero(left.ch9_desc_int_width_i) or f_x_to_zero(right.ch9_desc_int_width_i);
tmp.ch9_desc_num_coalesce_i := f_x_to_zero(left.ch9_desc_num_coalesce_i) or f_x_to_zero(right.ch9_desc_num_coalesce_i);
tmp.ch9_atom_desc_num_atoms_i := f_x_to_zero(left.ch9_atom_desc_num_atoms_i) or f_x_to_zero(right.ch9_atom_desc_num_atoms_i);
tmp.ch9_atom_desc_atom_width_i := f_x_to_zero(left.ch9_atom_desc_atom_width_i) or f_x_to_zero(right.ch9_atom_desc_atom_width_i);
tmp.ch10_desc_int_width_i := f_x_to_zero(left.ch10_desc_int_width_i) or f_x_to_zero(right.ch10_desc_int_width_i);
tmp.ch10_desc_num_coalesce_i := f_x_to_zero(left.ch10_desc_num_coalesce_i) or f_x_to_zero(right.ch10_desc_num_coalesce_i);
tmp.ch10_atom_desc_num_atoms_i := f_x_to_zero(left.ch10_atom_desc_num_atoms_i) or f_x_to_zero(right.ch10_atom_desc_num_atoms_i);
tmp.ch10_atom_desc_atom_width_i := f_x_to_zero(left.ch10_atom_desc_atom_width_i) or f_x_to_zero(right.ch10_atom_desc_atom_width_i);
tmp.ch11_desc_int_width_i := f_x_to_zero(left.ch11_desc_int_width_i) or f_x_to_zero(right.ch11_desc_int_width_i);
tmp.ch11_desc_num_coalesce_i := f_x_to_zero(left.ch11_desc_num_coalesce_i) or f_x_to_zero(right.ch11_desc_num_coalesce_i);
tmp.ch11_atom_desc_num_atoms_i := f_x_to_zero(left.ch11_atom_desc_num_atoms_i) or f_x_to_zero(right.ch11_atom_desc_num_atoms_i);
tmp.ch11_atom_desc_atom_width_i := f_x_to_zero(left.ch11_atom_desc_atom_width_i) or f_x_to_zero(right.ch11_atom_desc_atom_width_i);
tmp.ch12_desc_int_width_i := f_x_to_zero(left.ch12_desc_int_width_i) or f_x_to_zero(right.ch12_desc_int_width_i);
tmp.ch12_desc_num_coalesce_i := f_x_to_zero(left.ch12_desc_num_coalesce_i) or f_x_to_zero(right.ch12_desc_num_coalesce_i);
tmp.ch12_atom_desc_num_atoms_i := f_x_to_zero(left.ch12_atom_desc_num_atoms_i) or f_x_to_zero(right.ch12_atom_desc_num_atoms_i);
tmp.ch12_atom_desc_atom_width_i := f_x_to_zero(left.ch12_atom_desc_atom_width_i) or f_x_to_zero(right.ch12_atom_desc_atom_width_i);
tmp.ch13_desc_int_width_i := f_x_to_zero(left.ch13_desc_int_width_i) or f_x_to_zero(right.ch13_desc_int_width_i);
tmp.ch13_desc_num_coalesce_i := f_x_to_zero(left.ch13_desc_num_coalesce_i) or f_x_to_zero(right.ch13_desc_num_coalesce_i);
tmp.ch13_atom_desc_num_atoms_i := f_x_to_zero(left.ch13_atom_desc_num_atoms_i) or f_x_to_zero(right.ch13_atom_desc_num_atoms_i);
tmp.ch13_atom_desc_atom_width_i := f_x_to_zero(left.ch13_atom_desc_atom_width_i) or f_x_to_zero(right.ch13_atom_desc_atom_width_i);
tmp.ch14_desc_int_width_i := f_x_to_zero(left.ch14_desc_int_width_i) or f_x_to_zero(right.ch14_desc_int_width_i);
tmp.ch14_desc_num_coalesce_i := f_x_to_zero(left.ch14_desc_num_coalesce_i) or f_x_to_zero(right.ch14_desc_num_coalesce_i);
tmp.ch14_atom_desc_num_atoms_i := f_x_to_zero(left.ch14_atom_desc_num_atoms_i) or f_x_to_zero(right.ch14_atom_desc_num_atoms_i);
tmp.ch14_atom_desc_atom_width_i := f_x_to_zero(left.ch14_atom_desc_atom_width_i) or f_x_to_zero(right.ch14_atom_desc_atom_width_i);
tmp.ch15_desc_int_width_i := f_x_to_zero(left.ch15_desc_int_width_i) or f_x_to_zero(right.ch15_desc_int_width_i);
tmp.ch15_desc_num_coalesce_i := f_x_to_zero(left.ch15_desc_num_coalesce_i) or f_x_to_zero(right.ch15_desc_num_coalesce_i);
tmp.ch15_atom_desc_num_atoms_i := f_x_to_zero(left.ch15_atom_desc_num_atoms_i) or f_x_to_zero(right.ch15_atom_desc_num_atoms_i);
tmp.ch15_atom_desc_atom_width_i := f_x_to_zero(left.ch15_atom_desc_atom_width_i) or f_x_to_zero(right.ch15_atom_desc_atom_width_i);
tmp.ch16_desc_int_width_i := f_x_to_zero(left.ch16_desc_int_width_i) or f_x_to_zero(right.ch16_desc_int_width_i);
tmp.ch16_desc_num_coalesce_i := f_x_to_zero(left.ch16_desc_num_coalesce_i) or f_x_to_zero(right.ch16_desc_num_coalesce_i);
tmp.ch16_atom_desc_num_atoms_i := f_x_to_zero(left.ch16_atom_desc_num_atoms_i) or f_x_to_zero(right.ch16_atom_desc_num_atoms_i);
tmp.ch16_atom_desc_atom_width_i := f_x_to_zero(left.ch16_atom_desc_atom_width_i) or f_x_to_zero(right.ch16_atom_desc_atom_width_i);
tmp.ch17_desc_int_width_i := f_x_to_zero(left.ch17_desc_int_width_i) or f_x_to_zero(right.ch17_desc_int_width_i);
tmp.ch17_desc_num_coalesce_i := f_x_to_zero(left.ch17_desc_num_coalesce_i) or f_x_to_zero(right.ch17_desc_num_coalesce_i);
tmp.ch17_atom_desc_num_atoms_i := f_x_to_zero(left.ch17_atom_desc_num_atoms_i) or f_x_to_zero(right.ch17_atom_desc_num_atoms_i);
tmp.ch17_atom_desc_atom_width_i := f_x_to_zero(left.ch17_atom_desc_atom_width_i) or f_x_to_zero(right.ch17_atom_desc_atom_width_i);
tmp.ch18_desc_int_width_i := f_x_to_zero(left.ch18_desc_int_width_i) or f_x_to_zero(right.ch18_desc_int_width_i);
tmp.ch18_desc_num_coalesce_i := f_x_to_zero(left.ch18_desc_num_coalesce_i) or f_x_to_zero(right.ch18_desc_num_coalesce_i);
tmp.ch18_atom_desc_num_atoms_i := f_x_to_zero(left.ch18_atom_desc_num_atoms_i) or f_x_to_zero(right.ch18_atom_desc_num_atoms_i);
tmp.ch18_atom_desc_atom_width_i := f_x_to_zero(left.ch18_atom_desc_atom_width_i) or f_x_to_zero(right.ch18_atom_desc_atom_width_i);
tmp.ch19_desc_int_width_i := f_x_to_zero(left.ch19_desc_int_width_i) or f_x_to_zero(right.ch19_desc_int_width_i);
tmp.ch19_desc_num_coalesce_i := f_x_to_zero(left.ch19_desc_num_coalesce_i) or f_x_to_zero(right.ch19_desc_num_coalesce_i);
tmp.ch19_atom_desc_num_atoms_i := f_x_to_zero(left.ch19_atom_desc_num_atoms_i) or f_x_to_zero(right.ch19_atom_desc_num_atoms_i);
tmp.ch19_atom_desc_atom_width_i := f_x_to_zero(left.ch19_atom_desc_atom_width_i) or f_x_to_zero(right.ch19_atom_desc_atom_width_i);
tmp.ch20_desc_int_width_i := f_x_to_zero(left.ch20_desc_int_width_i) or f_x_to_zero(right.ch20_desc_int_width_i);
tmp.ch20_desc_num_coalesce_i := f_x_to_zero(left.ch20_desc_num_coalesce_i) or f_x_to_zero(right.ch20_desc_num_coalesce_i);
tmp.ch20_atom_desc_num_atoms_i := f_x_to_zero(left.ch20_atom_desc_num_atoms_i) or f_x_to_zero(right.ch20_atom_desc_num_atoms_i);
tmp.ch20_atom_desc_atom_width_i := f_x_to_zero(left.ch20_atom_desc_atom_width_i) or f_x_to_zero(right.ch20_atom_desc_atom_width_i);
tmp.ch21_desc_int_width_i := f_x_to_zero(left.ch21_desc_int_width_i) or f_x_to_zero(right.ch21_desc_int_width_i);
tmp.ch21_desc_num_coalesce_i := f_x_to_zero(left.ch21_desc_num_coalesce_i) or f_x_to_zero(right.ch21_desc_num_coalesce_i);
tmp.ch21_atom_desc_num_atoms_i := f_x_to_zero(left.ch21_atom_desc_num_atoms_i) or f_x_to_zero(right.ch21_atom_desc_num_atoms_i);
tmp.ch21_atom_desc_atom_width_i := f_x_to_zero(left.ch21_atom_desc_atom_width_i) or f_x_to_zero(right.ch21_atom_desc_atom_width_i);
tmp.ch22_desc_int_width_i := f_x_to_zero(left.ch22_desc_int_width_i) or f_x_to_zero(right.ch22_desc_int_width_i);
tmp.ch22_desc_num_coalesce_i := f_x_to_zero(left.ch22_desc_num_coalesce_i) or f_x_to_zero(right.ch22_desc_num_coalesce_i);
tmp.ch22_atom_desc_num_atoms_i := f_x_to_zero(left.ch22_atom_desc_num_atoms_i) or f_x_to_zero(right.ch22_atom_desc_num_atoms_i);
tmp.ch22_atom_desc_atom_width_i := f_x_to_zero(left.ch22_atom_desc_atom_width_i) or f_x_to_zero(right.ch22_atom_desc_atom_width_i);
tmp.ch23_desc_int_width_i := f_x_to_zero(left.ch23_desc_int_width_i) or f_x_to_zero(right.ch23_desc_int_width_i);
tmp.ch23_desc_num_coalesce_i := f_x_to_zero(left.ch23_desc_num_coalesce_i) or f_x_to_zero(right.ch23_desc_num_coalesce_i);
tmp.ch23_atom_desc_num_atoms_i := f_x_to_zero(left.ch23_atom_desc_num_atoms_i) or f_x_to_zero(right.ch23_atom_desc_num_atoms_i);
tmp.ch23_atom_desc_atom_width_i := f_x_to_zero(left.ch23_atom_desc_atom_width_i) or f_x_to_zero(right.ch23_atom_desc_atom_width_i);
return tmp;
end function;
end package body;
