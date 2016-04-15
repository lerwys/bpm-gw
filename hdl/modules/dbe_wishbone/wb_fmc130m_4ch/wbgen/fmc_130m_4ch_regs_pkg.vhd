---------------------------------------------------------------------------------------
-- Title          : Wishbone slave core for Control and status registers for FMC 130M 4CH
---------------------------------------------------------------------------------------
-- File           : fmc_130m_4ch_regs_pkg.vhd
-- Author         : auto-generated by wbgen2 from fmc_130m_4ch_regs.wb
-- Created        : Fri Apr 15 16:48:54 2016
-- Standard       : VHDL'87
---------------------------------------------------------------------------------------
-- THIS FILE WAS GENERATED BY wbgen2 FROM SOURCE FILE fmc_130m_4ch_regs.wb
-- DO NOT HAND-EDIT UNLESS IT'S ABSOLUTELY NECESSARY!
---------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package wb_fmc_130m_4ch_csr_wbgen2_pkg is
  
  
  -- Input registers (user design -> WB slave)
  
  type t_wb_fmc_130m_4ch_csr_in_registers is record
    fmc_status_prsnt_i                       : std_logic;
    fmc_status_pg_m2c_i                      : std_logic;
    fmc_status_clk_dir_i                     : std_logic;
    fmc_status_firmware_id_i                 : std_logic_vector(28 downto 0);
    trigger_reserved_i                       : std_logic_vector(28 downto 0);
    monitor_temp_alarm_i                     : std_logic;
    monitor_reserved_i                       : std_logic_vector(27 downto 0);
    clk_distrib_pll_status_i                 : std_logic;
    clk_distrib_reserved_i                   : std_logic_vector(27 downto 0);
    adc_reserved_i                           : std_logic_vector(27 downto 0);
    fpga_ctrl_fmc_idelay0_rdy_i              : std_logic;
    fpga_ctrl_fmc_idelay1_rdy_i              : std_logic;
    fpga_ctrl_fmc_idelay2_rdy_i              : std_logic;
    fpga_ctrl_fmc_idelay3_rdy_i              : std_logic;
    fpga_ctrl_reserved1_i                    : std_logic_vector(1 downto 0);
    fpga_ctrl_reserved2_i                    : std_logic_vector(22 downto 0);
    idelay0_cal_val_i                        : std_logic_vector(4 downto 0);
    idelay0_cal_reserved_i                   : std_logic_vector(8 downto 0);
    idelay1_cal_val_i                        : std_logic_vector(4 downto 0);
    idelay1_cal_reserved_i                   : std_logic_vector(8 downto 0);
    idelay2_cal_val_i                        : std_logic_vector(4 downto 0);
    idelay2_cal_reserved_i                   : std_logic_vector(8 downto 0);
    idelay3_cal_val_i                        : std_logic_vector(4 downto 0);
    idelay3_cal_reserved_i                   : std_logic_vector(8 downto 0);
    data0_val_i                              : std_logic_vector(31 downto 0);
    data1_val_i                              : std_logic_vector(31 downto 0);
    data2_val_i                              : std_logic_vector(31 downto 0);
    data3_val_i                              : std_logic_vector(31 downto 0);
    dcm_adc_done_i                           : std_logic;
    dcm_adc_status0_i                        : std_logic;
    dcm_reserved_i                           : std_logic_vector(26 downto 0);
    end record;
  
  constant c_wb_fmc_130m_4ch_csr_in_registers_init_value: t_wb_fmc_130m_4ch_csr_in_registers := (
    fmc_status_prsnt_i => '0',
    fmc_status_pg_m2c_i => '0',
    fmc_status_clk_dir_i => '0',
    fmc_status_firmware_id_i => (others => '0'),
    trigger_reserved_i => (others => '0'),
    monitor_temp_alarm_i => '0',
    monitor_reserved_i => (others => '0'),
    clk_distrib_pll_status_i => '0',
    clk_distrib_reserved_i => (others => '0'),
    adc_reserved_i => (others => '0'),
    fpga_ctrl_fmc_idelay0_rdy_i => '0',
    fpga_ctrl_fmc_idelay1_rdy_i => '0',
    fpga_ctrl_fmc_idelay2_rdy_i => '0',
    fpga_ctrl_fmc_idelay3_rdy_i => '0',
    fpga_ctrl_reserved1_i => (others => '0'),
    fpga_ctrl_reserved2_i => (others => '0'),
    idelay0_cal_val_i => (others => '0'),
    idelay0_cal_reserved_i => (others => '0'),
    idelay1_cal_val_i => (others => '0'),
    idelay1_cal_reserved_i => (others => '0'),
    idelay2_cal_val_i => (others => '0'),
    idelay2_cal_reserved_i => (others => '0'),
    idelay3_cal_val_i => (others => '0'),
    idelay3_cal_reserved_i => (others => '0'),
    data0_val_i => (others => '0'),
    data1_val_i => (others => '0'),
    data2_val_i => (others => '0'),
    data3_val_i => (others => '0'),
    dcm_adc_done_i => '0',
    dcm_adc_status0_i => '0',
    dcm_reserved_i => (others => '0')
    );
    
    -- Output registers (WB slave -> user design)
    
    type t_wb_fmc_130m_4ch_csr_out_registers is record
      trigger_dir_o                            : std_logic;
      trigger_term_o                           : std_logic;
      trigger_trig_val_o                       : std_logic;
      monitor_led1_o                           : std_logic;
      monitor_led2_o                           : std_logic;
      monitor_led3_o                           : std_logic;
      clk_distrib_si571_oe_o                   : std_logic;
      clk_distrib_pll_function_o               : std_logic;
      clk_distrib_clk_sel_o                    : std_logic;
      adc_rand_o                               : std_logic;
      adc_dith_o                               : std_logic;
      adc_shdn_o                               : std_logic;
      adc_pga_o                                : std_logic;
      fpga_ctrl_fmc_idelay_rst_o               : std_logic;
      fpga_ctrl_fmc_fifo_rst_o                 : std_logic;
      fpga_ctrl_test_data_en_o                 : std_logic;
      idelay0_cal_update_o                     : std_logic;
      idelay0_cal_line_o                       : std_logic_vector(16 downto 0);
      idelay0_cal_val_o                        : std_logic_vector(4 downto 0);
      idelay0_cal_val_load_o                   : std_logic;
      idelay1_cal_update_o                     : std_logic;
      idelay1_cal_line_o                       : std_logic_vector(16 downto 0);
      idelay1_cal_val_o                        : std_logic_vector(4 downto 0);
      idelay1_cal_val_load_o                   : std_logic;
      idelay2_cal_update_o                     : std_logic;
      idelay2_cal_line_o                       : std_logic_vector(16 downto 0);
      idelay2_cal_val_o                        : std_logic_vector(4 downto 0);
      idelay2_cal_val_load_o                   : std_logic;
      idelay3_cal_update_o                     : std_logic;
      idelay3_cal_line_o                       : std_logic_vector(16 downto 0);
      idelay3_cal_val_o                        : std_logic_vector(4 downto 0);
      idelay3_cal_val_load_o                   : std_logic;
      dcm_adc_en_o                             : std_logic;
      dcm_adc_phase_o                          : std_logic;
      dcm_adc_reset_o                          : std_logic;
      end record;
    
    constant c_wb_fmc_130m_4ch_csr_out_registers_init_value: t_wb_fmc_130m_4ch_csr_out_registers := (
      trigger_dir_o => '0',
      trigger_term_o => '0',
      trigger_trig_val_o => '0',
      monitor_led1_o => '0',
      monitor_led2_o => '0',
      monitor_led3_o => '0',
      clk_distrib_si571_oe_o => '0',
      clk_distrib_pll_function_o => '0',
      clk_distrib_clk_sel_o => '0',
      adc_rand_o => '0',
      adc_dith_o => '0',
      adc_shdn_o => '0',
      adc_pga_o => '0',
      fpga_ctrl_fmc_idelay_rst_o => '0',
      fpga_ctrl_fmc_fifo_rst_o => '0',
      fpga_ctrl_test_data_en_o => '0',
      idelay0_cal_update_o => '0',
      idelay0_cal_line_o => (others => '0'),
      idelay0_cal_val_o => (others => '0'),
      idelay0_cal_val_load_o => '0',
      idelay1_cal_update_o => '0',
      idelay1_cal_line_o => (others => '0'),
      idelay1_cal_val_o => (others => '0'),
      idelay1_cal_val_load_o => '0',
      idelay2_cal_update_o => '0',
      idelay2_cal_line_o => (others => '0'),
      idelay2_cal_val_o => (others => '0'),
      idelay2_cal_val_load_o => '0',
      idelay3_cal_update_o => '0',
      idelay3_cal_line_o => (others => '0'),
      idelay3_cal_val_o => (others => '0'),
      idelay3_cal_val_load_o => '0',
      dcm_adc_en_o => '0',
      dcm_adc_phase_o => '0',
      dcm_adc_reset_o => '0'
      );
    function "or" (left, right: t_wb_fmc_130m_4ch_csr_in_registers) return t_wb_fmc_130m_4ch_csr_in_registers;
    function f_x_to_zero (x:std_logic) return std_logic;
    function f_x_to_zero (x:std_logic_vector) return std_logic_vector;
end package;

package body wb_fmc_130m_4ch_csr_wbgen2_pkg is
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
function "or" (left, right: t_wb_fmc_130m_4ch_csr_in_registers) return t_wb_fmc_130m_4ch_csr_in_registers is
variable tmp: t_wb_fmc_130m_4ch_csr_in_registers;
begin
tmp.fmc_status_prsnt_i := f_x_to_zero(left.fmc_status_prsnt_i) or f_x_to_zero(right.fmc_status_prsnt_i);
tmp.fmc_status_pg_m2c_i := f_x_to_zero(left.fmc_status_pg_m2c_i) or f_x_to_zero(right.fmc_status_pg_m2c_i);
tmp.fmc_status_clk_dir_i := f_x_to_zero(left.fmc_status_clk_dir_i) or f_x_to_zero(right.fmc_status_clk_dir_i);
tmp.fmc_status_firmware_id_i := f_x_to_zero(left.fmc_status_firmware_id_i) or f_x_to_zero(right.fmc_status_firmware_id_i);
tmp.trigger_reserved_i := f_x_to_zero(left.trigger_reserved_i) or f_x_to_zero(right.trigger_reserved_i);
tmp.monitor_temp_alarm_i := f_x_to_zero(left.monitor_temp_alarm_i) or f_x_to_zero(right.monitor_temp_alarm_i);
tmp.monitor_reserved_i := f_x_to_zero(left.monitor_reserved_i) or f_x_to_zero(right.monitor_reserved_i);
tmp.clk_distrib_pll_status_i := f_x_to_zero(left.clk_distrib_pll_status_i) or f_x_to_zero(right.clk_distrib_pll_status_i);
tmp.clk_distrib_reserved_i := f_x_to_zero(left.clk_distrib_reserved_i) or f_x_to_zero(right.clk_distrib_reserved_i);
tmp.adc_reserved_i := f_x_to_zero(left.adc_reserved_i) or f_x_to_zero(right.adc_reserved_i);
tmp.fpga_ctrl_fmc_idelay0_rdy_i := f_x_to_zero(left.fpga_ctrl_fmc_idelay0_rdy_i) or f_x_to_zero(right.fpga_ctrl_fmc_idelay0_rdy_i);
tmp.fpga_ctrl_fmc_idelay1_rdy_i := f_x_to_zero(left.fpga_ctrl_fmc_idelay1_rdy_i) or f_x_to_zero(right.fpga_ctrl_fmc_idelay1_rdy_i);
tmp.fpga_ctrl_fmc_idelay2_rdy_i := f_x_to_zero(left.fpga_ctrl_fmc_idelay2_rdy_i) or f_x_to_zero(right.fpga_ctrl_fmc_idelay2_rdy_i);
tmp.fpga_ctrl_fmc_idelay3_rdy_i := f_x_to_zero(left.fpga_ctrl_fmc_idelay3_rdy_i) or f_x_to_zero(right.fpga_ctrl_fmc_idelay3_rdy_i);
tmp.fpga_ctrl_reserved1_i := f_x_to_zero(left.fpga_ctrl_reserved1_i) or f_x_to_zero(right.fpga_ctrl_reserved1_i);
tmp.fpga_ctrl_reserved2_i := f_x_to_zero(left.fpga_ctrl_reserved2_i) or f_x_to_zero(right.fpga_ctrl_reserved2_i);
tmp.idelay0_cal_val_i := f_x_to_zero(left.idelay0_cal_val_i) or f_x_to_zero(right.idelay0_cal_val_i);
tmp.idelay0_cal_reserved_i := f_x_to_zero(left.idelay0_cal_reserved_i) or f_x_to_zero(right.idelay0_cal_reserved_i);
tmp.idelay1_cal_val_i := f_x_to_zero(left.idelay1_cal_val_i) or f_x_to_zero(right.idelay1_cal_val_i);
tmp.idelay1_cal_reserved_i := f_x_to_zero(left.idelay1_cal_reserved_i) or f_x_to_zero(right.idelay1_cal_reserved_i);
tmp.idelay2_cal_val_i := f_x_to_zero(left.idelay2_cal_val_i) or f_x_to_zero(right.idelay2_cal_val_i);
tmp.idelay2_cal_reserved_i := f_x_to_zero(left.idelay2_cal_reserved_i) or f_x_to_zero(right.idelay2_cal_reserved_i);
tmp.idelay3_cal_val_i := f_x_to_zero(left.idelay3_cal_val_i) or f_x_to_zero(right.idelay3_cal_val_i);
tmp.idelay3_cal_reserved_i := f_x_to_zero(left.idelay3_cal_reserved_i) or f_x_to_zero(right.idelay3_cal_reserved_i);
tmp.data0_val_i := f_x_to_zero(left.data0_val_i) or f_x_to_zero(right.data0_val_i);
tmp.data1_val_i := f_x_to_zero(left.data1_val_i) or f_x_to_zero(right.data1_val_i);
tmp.data2_val_i := f_x_to_zero(left.data2_val_i) or f_x_to_zero(right.data2_val_i);
tmp.data3_val_i := f_x_to_zero(left.data3_val_i) or f_x_to_zero(right.data3_val_i);
tmp.dcm_adc_done_i := f_x_to_zero(left.dcm_adc_done_i) or f_x_to_zero(right.dcm_adc_done_i);
tmp.dcm_adc_status0_i := f_x_to_zero(left.dcm_adc_status0_i) or f_x_to_zero(right.dcm_adc_status0_i);
tmp.dcm_reserved_i := f_x_to_zero(left.dcm_reserved_i) or f_x_to_zero(right.dcm_reserved_i);
return tmp;
end function;
end package body;
