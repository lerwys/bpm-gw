library IEEE;
use IEEE.STD_LOGIC_1164.all;

package ipcores_pkg is

constant c_pcielanes : positive := 4;
--***************************************************************************
-- Necessary parameters for DDR core support
-- (dependent on memory chip connected to FPGA, not to be modified at will)
--***************************************************************************
constant C_DDR_DQ_WIDTH      : positive := 32;
constant C_DDR_PAYLOAD_WIDTH : positive := 256;
constant C_DDR_DQS_WIDTH     : positive := 4;
constant C_DDR_DM_WIDTH      : positive := 4;
constant C_DDR_ROW_WIDTH     : positive := 16;
constant C_DDR_BANK_WIDTH    : positive := 3;
constant C_DDR_CK_WIDTH      : positive := 1;
constant C_DDR_CKE_WIDTH     : positive := 1;
constant C_DDR_ODT_WIDTH     : positive := 1;
constant C_DDR_ADDR_WIDTH    : positive := 31;

  -- ----------------------------------------------------------------------------
  -- Component declarations
  -- ----------------------------------------------------------------------------
component pcie_core
Port (
  pci_exp_txp : out STD_LOGIC_VECTOR ( 3 downto 0 );
  pci_exp_txn : out STD_LOGIC_VECTOR ( 3 downto 0 );
  pci_exp_rxp : in STD_LOGIC_VECTOR ( 3 downto 0 );
  pci_exp_rxn : in STD_LOGIC_VECTOR ( 3 downto 0 );
  user_clk_out : out STD_LOGIC;
  user_reset_out : out STD_LOGIC;
  user_lnk_up : out STD_LOGIC;
  user_app_rdy : out STD_LOGIC;
  tx_buf_av : out STD_LOGIC_VECTOR ( 5 downto 0 );
  tx_cfg_req : out STD_LOGIC;
  tx_err_drop : out STD_LOGIC;
  s_axis_tx_tready : out STD_LOGIC;
  s_axis_tx_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
  s_axis_tx_tkeep : in STD_LOGIC_VECTOR ( 7 downto 0 );
  s_axis_tx_tlast : in STD_LOGIC;
  s_axis_tx_tvalid : in STD_LOGIC;
  s_axis_tx_tuser : in STD_LOGIC_VECTOR ( 3 downto 0 );
  tx_cfg_gnt : in STD_LOGIC;
  m_axis_rx_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
  m_axis_rx_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
  m_axis_rx_tlast : out STD_LOGIC;
  m_axis_rx_tvalid : out STD_LOGIC;
  m_axis_rx_tready : in STD_LOGIC;
  m_axis_rx_tuser : out STD_LOGIC_VECTOR ( 21 downto 0 );
  rx_np_ok : in STD_LOGIC;
  rx_np_req : in STD_LOGIC;
  fc_cpld : out STD_LOGIC_VECTOR ( 11 downto 0 );
  fc_cplh : out STD_LOGIC_VECTOR ( 7 downto 0 );
  fc_npd : out STD_LOGIC_VECTOR ( 11 downto 0 );
  fc_nph : out STD_LOGIC_VECTOR ( 7 downto 0 );
  fc_pd : out STD_LOGIC_VECTOR ( 11 downto 0 );
  fc_ph : out STD_LOGIC_VECTOR ( 7 downto 0 );
  fc_sel : in STD_LOGIC_VECTOR ( 2 downto 0 );
  cfg_mgmt_do : out STD_LOGIC_VECTOR ( 31 downto 0 );
  cfg_mgmt_rd_wr_done : out STD_LOGIC;
  cfg_status : out STD_LOGIC_VECTOR ( 15 downto 0 );
  cfg_command : out STD_LOGIC_VECTOR ( 15 downto 0 );
  cfg_dstatus : out STD_LOGIC_VECTOR ( 15 downto 0 );
  cfg_dcommand : out STD_LOGIC_VECTOR ( 15 downto 0 );
  cfg_lstatus : out STD_LOGIC_VECTOR ( 15 downto 0 );
  cfg_lcommand : out STD_LOGIC_VECTOR ( 15 downto 0 );
  cfg_dcommand2 : out STD_LOGIC_VECTOR ( 15 downto 0 );
  cfg_pcie_link_state : out STD_LOGIC_VECTOR ( 2 downto 0 );
  cfg_pmcsr_pme_en : out STD_LOGIC;
  cfg_pmcsr_powerstate : out STD_LOGIC_VECTOR ( 1 downto 0 );
  cfg_pmcsr_pme_status : out STD_LOGIC;
  cfg_received_func_lvl_rst : out STD_LOGIC;
  cfg_mgmt_di : in STD_LOGIC_VECTOR ( 31 downto 0 );
  cfg_mgmt_byte_en : in STD_LOGIC_VECTOR ( 3 downto 0 );
  cfg_mgmt_dwaddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
  cfg_mgmt_wr_en : in STD_LOGIC;
  cfg_mgmt_rd_en : in STD_LOGIC;
  cfg_mgmt_wr_readonly : in STD_LOGIC;
  cfg_err_ecrc : in STD_LOGIC;
  cfg_err_ur : in STD_LOGIC;
  cfg_err_cpl_timeout : in STD_LOGIC;
  cfg_err_cpl_unexpect : in STD_LOGIC;
  cfg_err_cpl_abort : in STD_LOGIC;
  cfg_err_posted : in STD_LOGIC;
  cfg_err_cor : in STD_LOGIC;
  cfg_err_atomic_egress_blocked : in STD_LOGIC;
  cfg_err_internal_cor : in STD_LOGIC;
  cfg_err_malformed : in STD_LOGIC;
  cfg_err_mc_blocked : in STD_LOGIC;
  cfg_err_poisoned : in STD_LOGIC;
  cfg_err_norecovery : in STD_LOGIC;
  cfg_err_tlp_cpl_header : in STD_LOGIC_VECTOR ( 47 downto 0 );
  cfg_err_cpl_rdy : out STD_LOGIC;
  cfg_err_locked : in STD_LOGIC;
  cfg_err_acs : in STD_LOGIC;
  cfg_err_internal_uncor : in STD_LOGIC;
  cfg_trn_pending : in STD_LOGIC;
  cfg_pm_halt_aspm_l0s : in STD_LOGIC;
  cfg_pm_halt_aspm_l1 : in STD_LOGIC;
  cfg_pm_force_state_en : in STD_LOGIC;
  cfg_pm_force_state : in STD_LOGIC_VECTOR ( 1 downto 0 );
  cfg_dsn : in STD_LOGIC_VECTOR ( 63 downto 0 );
  cfg_interrupt : in STD_LOGIC;
  cfg_interrupt_rdy : out STD_LOGIC;
  cfg_interrupt_assert : in STD_LOGIC;
  cfg_interrupt_di : in STD_LOGIC_VECTOR ( 7 downto 0 );
  cfg_interrupt_do : out STD_LOGIC_VECTOR ( 7 downto 0 );
  cfg_interrupt_mmenable : out STD_LOGIC_VECTOR ( 2 downto 0 );
  cfg_interrupt_msienable : out STD_LOGIC;
  cfg_interrupt_msixenable : out STD_LOGIC;
  cfg_interrupt_msixfm : out STD_LOGIC;
  cfg_interrupt_stat : in STD_LOGIC;
  cfg_pciecap_interrupt_msgnum : in STD_LOGIC_VECTOR ( 4 downto 0 );
  cfg_to_turnoff : out STD_LOGIC;
  cfg_turnoff_ok : in STD_LOGIC;
  cfg_bus_number : out STD_LOGIC_VECTOR ( 7 downto 0 );
  cfg_device_number : out STD_LOGIC_VECTOR ( 4 downto 0 );
  cfg_function_number : out STD_LOGIC_VECTOR ( 2 downto 0 );
  cfg_pm_wake : in STD_LOGIC;
  cfg_pm_send_pme_to : in STD_LOGIC;
  cfg_ds_bus_number : in STD_LOGIC_VECTOR ( 7 downto 0 );
  cfg_ds_device_number : in STD_LOGIC_VECTOR ( 4 downto 0 );
  cfg_ds_function_number : in STD_LOGIC_VECTOR ( 2 downto 0 );
  cfg_mgmt_wr_rw1c_as_rw : in STD_LOGIC;
  cfg_msg_received : out STD_LOGIC;
  cfg_msg_data : out STD_LOGIC_VECTOR ( 15 downto 0 );
  cfg_bridge_serr_en : out STD_LOGIC;
  cfg_slot_control_electromech_il_ctl_pulse : out STD_LOGIC;
  cfg_root_control_syserr_corr_err_en : out STD_LOGIC;
  cfg_root_control_syserr_non_fatal_err_en : out STD_LOGIC;
  cfg_root_control_syserr_fatal_err_en : out STD_LOGIC;
  cfg_root_control_pme_int_en : out STD_LOGIC;
  cfg_aer_rooterr_corr_err_reporting_en : out STD_LOGIC;
  cfg_aer_rooterr_non_fatal_err_reporting_en : out STD_LOGIC;
  cfg_aer_rooterr_fatal_err_reporting_en : out STD_LOGIC;
  cfg_aer_rooterr_corr_err_received : out STD_LOGIC;
  cfg_aer_rooterr_non_fatal_err_received : out STD_LOGIC;
  cfg_aer_rooterr_fatal_err_received : out STD_LOGIC;
  cfg_msg_received_err_cor : out STD_LOGIC;
  cfg_msg_received_err_non_fatal : out STD_LOGIC;
  cfg_msg_received_err_fatal : out STD_LOGIC;
  cfg_msg_received_pm_as_nak : out STD_LOGIC;
  cfg_msg_received_pm_pme : out STD_LOGIC;
  cfg_msg_received_pme_to_ack : out STD_LOGIC;
  cfg_msg_received_assert_int_a : out STD_LOGIC;
  cfg_msg_received_assert_int_b : out STD_LOGIC;
  cfg_msg_received_assert_int_c : out STD_LOGIC;
  cfg_msg_received_assert_int_d : out STD_LOGIC;
  cfg_msg_received_deassert_int_a : out STD_LOGIC;
  cfg_msg_received_deassert_int_b : out STD_LOGIC;
  cfg_msg_received_deassert_int_c : out STD_LOGIC;
  cfg_msg_received_deassert_int_d : out STD_LOGIC;
  cfg_msg_received_setslotpowerlimit : out STD_LOGIC;
  pl_directed_link_change : in STD_LOGIC_VECTOR ( 1 downto 0 );
  pl_directed_link_width : in STD_LOGIC_VECTOR ( 1 downto 0 );
  pl_directed_link_speed : in STD_LOGIC;
  pl_directed_link_auton : in STD_LOGIC;
  pl_upstream_prefer_deemph : in STD_LOGIC;
  pl_sel_lnk_rate : out STD_LOGIC;
  pl_sel_lnk_width : out STD_LOGIC_VECTOR ( 1 downto 0 );
  pl_ltssm_state : out STD_LOGIC_VECTOR ( 5 downto 0 );
  pl_lane_reversal_mode : out STD_LOGIC_VECTOR ( 1 downto 0 );
  pl_phy_lnk_up : out STD_LOGIC;
  pl_tx_pm_state : out STD_LOGIC_VECTOR ( 2 downto 0 );
  pl_rx_pm_state : out STD_LOGIC_VECTOR ( 1 downto 0 );
  pl_link_upcfg_cap : out STD_LOGIC;
  pl_link_gen2_cap : out STD_LOGIC;
  pl_link_partner_gen2_supported : out STD_LOGIC;
  pl_initial_link_width : out STD_LOGIC_VECTOR ( 2 downto 0 );
  pl_directed_change_done : out STD_LOGIC;
  pl_received_hot_rst : out STD_LOGIC;
  pl_transmit_hot_rst : in STD_LOGIC;
  pl_downstream_deemph_source : in STD_LOGIC;
  cfg_err_aer_headerlog : in STD_LOGIC_VECTOR ( 127 downto 0 );
  cfg_aer_interrupt_msgnum : in STD_LOGIC_VECTOR ( 4 downto 0 );
  cfg_err_aer_headerlog_set : out STD_LOGIC;
  cfg_aer_ecrc_check_en : out STD_LOGIC;
  cfg_aer_ecrc_gen_en : out STD_LOGIC;
  cfg_vc_tcvc_map : out STD_LOGIC_VECTOR ( 6 downto 0 );
  sys_clk : in STD_LOGIC;
  sys_rst_n : in STD_LOGIC
);
end component;

component ddr_core
Port(
  ddr3_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
  ddr3_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
  ddr3_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
  ddr3_addr : out STD_LOGIC_VECTOR ( 15 downto 0 );
  ddr3_ba : out STD_LOGIC_VECTOR ( 2 downto 0 );
  ddr3_ras_n : out STD_LOGIC;
  ddr3_cas_n : out STD_LOGIC;
  ddr3_we_n : out STD_LOGIC;
  ddr3_reset_n : out STD_LOGIC;
  ddr3_ck_p : out STD_LOGIC_VECTOR ( 0 to 0 );
  ddr3_ck_n : out STD_LOGIC_VECTOR ( 0 to 0 );
  ddr3_cke : out STD_LOGIC_VECTOR ( 0 to 0 );
  ddr3_cs_n : out STD_LOGIC_VECTOR ( 0 to 0 );
  ddr3_dm : out STD_LOGIC_VECTOR ( 3 downto 0 );
  ddr3_odt : out STD_LOGIC_VECTOR ( 0 to 0 );
  sys_clk_i : in STD_LOGIC;
  ui_clk : out STD_LOGIC;
  ui_clk_sync_rst : out STD_LOGIC;
  mmcm_locked : out STD_LOGIC;
  aresetn : in STD_LOGIC;
  app_sr_req : in STD_LOGIC;
  app_ref_req : in STD_LOGIC;
  app_zq_req : in STD_LOGIC;
  app_sr_active : out STD_LOGIC;
  app_ref_ack : out STD_LOGIC;
  app_zq_ack : out STD_LOGIC;
  s_axi_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
  s_axi_awaddr : in STD_LOGIC_VECTOR ( 30 downto 0 );
  s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
  s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
  s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
  s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
  s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
  s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
  s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
  s_axi_awvalid : in STD_LOGIC;
  s_axi_awready : out STD_LOGIC;
  s_axi_wdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
  s_axi_wstrb : in STD_LOGIC_VECTOR ( 31 downto 0 );
  s_axi_wlast : in STD_LOGIC;
  s_axi_wvalid : in STD_LOGIC;
  s_axi_wready : out STD_LOGIC;
  s_axi_bready : in STD_LOGIC;
  s_axi_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
  s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
  s_axi_bvalid : out STD_LOGIC;
  s_axi_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
  s_axi_araddr : in STD_LOGIC_VECTOR ( 30 downto 0 );
  s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
  s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
  s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
  s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
  s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
  s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
  s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
  s_axi_arvalid : in STD_LOGIC;
  s_axi_arready : out STD_LOGIC;
  s_axi_rready : in STD_LOGIC;
  s_axi_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
  s_axi_rdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
  s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
  s_axi_rlast : out STD_LOGIC;
  s_axi_rvalid : out STD_LOGIC;
  init_calib_complete : out STD_LOGIC;
  sys_rst : in STD_LOGIC
);
end component;

COMPONENT axi_interconnect
PORT (
  INTERCONNECT_ACLK : in STD_LOGIC;
  INTERCONNECT_ARESETN : in STD_LOGIC;
  S00_AXI_ARESET_OUT_N : out STD_LOGIC;
  S00_AXI_ACLK : in STD_LOGIC;
  S00_AXI_AWID : in STD_LOGIC_VECTOR ( 0 to 0 );
  S00_AXI_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S00_AXI_AWLEN : in STD_LOGIC_VECTOR ( 7 downto 0 );
  S00_AXI_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S00_AXI_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
  S00_AXI_AWLOCK : in STD_LOGIC;
  S00_AXI_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S00_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S00_AXI_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S00_AXI_AWVALID : in STD_LOGIC;
  S00_AXI_AWREADY : out STD_LOGIC;
  S00_AXI_WDATA : in STD_LOGIC_VECTOR ( 255 downto 0 );
  S00_AXI_WSTRB : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S00_AXI_WLAST : in STD_LOGIC;
  S00_AXI_WVALID : in STD_LOGIC;
  S00_AXI_WREADY : out STD_LOGIC;
  S00_AXI_BID : out STD_LOGIC_VECTOR ( 0 to 0 );
  S00_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
  S00_AXI_BVALID : out STD_LOGIC;
  S00_AXI_BREADY : in STD_LOGIC;
  S00_AXI_ARID : in STD_LOGIC_VECTOR ( 0 to 0 );
  S00_AXI_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S00_AXI_ARLEN : in STD_LOGIC_VECTOR ( 7 downto 0 );
  S00_AXI_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S00_AXI_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
  S00_AXI_ARLOCK : in STD_LOGIC;
  S00_AXI_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S00_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S00_AXI_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S00_AXI_ARVALID : in STD_LOGIC;
  S00_AXI_ARREADY : out STD_LOGIC;
  S00_AXI_RID : out STD_LOGIC_VECTOR ( 0 to 0 );
  S00_AXI_RDATA : out STD_LOGIC_VECTOR ( 255 downto 0 );
  S00_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
  S00_AXI_RLAST : out STD_LOGIC;
  S00_AXI_RVALID : out STD_LOGIC;
  S00_AXI_RREADY : in STD_LOGIC;
  S01_AXI_ARESET_OUT_N : out STD_LOGIC;
  S01_AXI_ACLK : in STD_LOGIC;
  S01_AXI_AWID : in STD_LOGIC_VECTOR ( 0 to 0 );
  S01_AXI_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S01_AXI_AWLEN : in STD_LOGIC_VECTOR ( 7 downto 0 );
  S01_AXI_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S01_AXI_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
  S01_AXI_AWLOCK : in STD_LOGIC;
  S01_AXI_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S01_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S01_AXI_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S01_AXI_AWVALID : in STD_LOGIC;
  S01_AXI_AWREADY : out STD_LOGIC;
  S01_AXI_WDATA : in STD_LOGIC_VECTOR ( 255 downto 0 );
  S01_AXI_WSTRB : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S01_AXI_WLAST : in STD_LOGIC;
  S01_AXI_WVALID : in STD_LOGIC;
  S01_AXI_WREADY : out STD_LOGIC;
  S01_AXI_BID : out STD_LOGIC_VECTOR ( 0 to 0 );
  S01_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
  S01_AXI_BVALID : out STD_LOGIC;
  S01_AXI_BREADY : in STD_LOGIC;
  S01_AXI_ARID : in STD_LOGIC_VECTOR ( 0 to 0 );
  S01_AXI_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S01_AXI_ARLEN : in STD_LOGIC_VECTOR ( 7 downto 0 );
  S01_AXI_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S01_AXI_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
  S01_AXI_ARLOCK : in STD_LOGIC;
  S01_AXI_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S01_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S01_AXI_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S01_AXI_ARVALID : in STD_LOGIC;
  S01_AXI_ARREADY : out STD_LOGIC;
  S01_AXI_RID : out STD_LOGIC_VECTOR ( 0 to 0 );
  S01_AXI_RDATA : out STD_LOGIC_VECTOR ( 255 downto 0 );
  S01_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
  S01_AXI_RLAST : out STD_LOGIC;
  S01_AXI_RVALID : out STD_LOGIC;
  S01_AXI_RREADY : in STD_LOGIC;
  M00_AXI_ARESET_OUT_N : out STD_LOGIC;
  M00_AXI_ACLK : in STD_LOGIC;
  M00_AXI_AWID : out STD_LOGIC_VECTOR ( 3 downto 0 );
  M00_AXI_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
  M00_AXI_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
  M00_AXI_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
  M00_AXI_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
  M00_AXI_AWLOCK : out STD_LOGIC;
  M00_AXI_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
  M00_AXI_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
  M00_AXI_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
  M00_AXI_AWVALID : out STD_LOGIC;
  M00_AXI_AWREADY : in STD_LOGIC;
  M00_AXI_WDATA : out STD_LOGIC_VECTOR ( 255 downto 0 );
  M00_AXI_WSTRB : out STD_LOGIC_VECTOR ( 31 downto 0 );
  M00_AXI_WLAST : out STD_LOGIC;
  M00_AXI_WVALID : out STD_LOGIC;
  M00_AXI_WREADY : in STD_LOGIC;
  M00_AXI_BID : in STD_LOGIC_VECTOR ( 3 downto 0 );
  M00_AXI_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
  M00_AXI_BVALID : in STD_LOGIC;
  M00_AXI_BREADY : out STD_LOGIC;
  M00_AXI_ARID : out STD_LOGIC_VECTOR ( 3 downto 0 );
  M00_AXI_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
  M00_AXI_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
  M00_AXI_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
  M00_AXI_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
  M00_AXI_ARLOCK : out STD_LOGIC;
  M00_AXI_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
  M00_AXI_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
  M00_AXI_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
  M00_AXI_ARVALID : out STD_LOGIC;
  M00_AXI_ARREADY : in STD_LOGIC;
  M00_AXI_RID : in STD_LOGIC_VECTOR ( 3 downto 0 );
  M00_AXI_RDATA : in STD_LOGIC_VECTOR ( 255 downto 0 );
  M00_AXI_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
  M00_AXI_RLAST : in STD_LOGIC;
  M00_AXI_RVALID : in STD_LOGIC;
  M00_AXI_RREADY : out STD_LOGIC
);
END COMPONENT;

component axi_interconnect_bpm
Port (
  INTERCONNECT_ACLK : in STD_LOGIC;
  INTERCONNECT_ARESETN : in STD_LOGIC;
  S00_AXI_ARESET_OUT_N : out STD_LOGIC;
  S00_AXI_ACLK : in STD_LOGIC;
  S00_AXI_AWID : in STD_LOGIC_VECTOR ( 0 to 0 );
  S00_AXI_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S00_AXI_AWLEN : in STD_LOGIC_VECTOR ( 7 downto 0 );
  S00_AXI_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S00_AXI_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
  S00_AXI_AWLOCK : in STD_LOGIC;
  S00_AXI_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S00_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S00_AXI_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S00_AXI_AWVALID : in STD_LOGIC;
  S00_AXI_AWREADY : out STD_LOGIC;
  S00_AXI_WDATA : in STD_LOGIC_VECTOR ( 255 downto 0 );
  S00_AXI_WSTRB : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S00_AXI_WLAST : in STD_LOGIC;
  S00_AXI_WVALID : in STD_LOGIC;
  S00_AXI_WREADY : out STD_LOGIC;
  S00_AXI_BID : out STD_LOGIC_VECTOR ( 0 to 0 );
  S00_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
  S00_AXI_BVALID : out STD_LOGIC;
  S00_AXI_BREADY : in STD_LOGIC;
  S00_AXI_ARID : in STD_LOGIC_VECTOR ( 0 to 0 );
  S00_AXI_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S00_AXI_ARLEN : in STD_LOGIC_VECTOR ( 7 downto 0 );
  S00_AXI_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S00_AXI_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
  S00_AXI_ARLOCK : in STD_LOGIC;
  S00_AXI_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S00_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S00_AXI_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S00_AXI_ARVALID : in STD_LOGIC;
  S00_AXI_ARREADY : out STD_LOGIC;
  S00_AXI_RID : out STD_LOGIC_VECTOR ( 0 to 0 );
  S00_AXI_RDATA : out STD_LOGIC_VECTOR ( 255 downto 0 );
  S00_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
  S00_AXI_RLAST : out STD_LOGIC;
  S00_AXI_RVALID : out STD_LOGIC;
  S00_AXI_RREADY : in STD_LOGIC;
  S01_AXI_ARESET_OUT_N : out STD_LOGIC;
  S01_AXI_ACLK : in STD_LOGIC;
  S01_AXI_AWID : in STD_LOGIC_VECTOR ( 0 to 0 );
  S01_AXI_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S01_AXI_AWLEN : in STD_LOGIC_VECTOR ( 7 downto 0 );
  S01_AXI_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S01_AXI_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
  S01_AXI_AWLOCK : in STD_LOGIC;
  S01_AXI_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S01_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S01_AXI_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S01_AXI_AWVALID : in STD_LOGIC;
  S01_AXI_AWREADY : out STD_LOGIC;
  S01_AXI_WDATA : in STD_LOGIC_VECTOR ( 255 downto 0 );
  S01_AXI_WSTRB : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S01_AXI_WLAST : in STD_LOGIC;
  S01_AXI_WVALID : in STD_LOGIC;
  S01_AXI_WREADY : out STD_LOGIC;
  S01_AXI_BID : out STD_LOGIC_VECTOR ( 0 to 0 );
  S01_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
  S01_AXI_BVALID : out STD_LOGIC;
  S01_AXI_BREADY : in STD_LOGIC;
  S01_AXI_ARID : in STD_LOGIC_VECTOR ( 0 to 0 );
  S01_AXI_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S01_AXI_ARLEN : in STD_LOGIC_VECTOR ( 7 downto 0 );
  S01_AXI_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S01_AXI_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
  S01_AXI_ARLOCK : in STD_LOGIC;
  S01_AXI_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S01_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S01_AXI_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S01_AXI_ARVALID : in STD_LOGIC;
  S01_AXI_ARREADY : out STD_LOGIC;
  S01_AXI_RID : out STD_LOGIC_VECTOR ( 0 to 0 );
  S01_AXI_RDATA : out STD_LOGIC_VECTOR ( 255 downto 0 );
  S01_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
  S01_AXI_RLAST : out STD_LOGIC;
  S01_AXI_RVALID : out STD_LOGIC;
  S01_AXI_RREADY : in STD_LOGIC;
  S02_AXI_ARESET_OUT_N : out STD_LOGIC;
  S02_AXI_ACLK : in STD_LOGIC;
  S02_AXI_AWID : in STD_LOGIC_VECTOR ( 0 to 0 );
  S02_AXI_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S02_AXI_AWLEN : in STD_LOGIC_VECTOR ( 7 downto 0 );
  S02_AXI_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S02_AXI_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
  S02_AXI_AWLOCK : in STD_LOGIC;
  S02_AXI_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S02_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S02_AXI_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S02_AXI_AWVALID : in STD_LOGIC;
  S02_AXI_AWREADY : out STD_LOGIC;
  S02_AXI_WDATA : in STD_LOGIC_VECTOR ( 255 downto 0 );
  S02_AXI_WSTRB : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S02_AXI_WLAST : in STD_LOGIC;
  S02_AXI_WVALID : in STD_LOGIC;
  S02_AXI_WREADY : out STD_LOGIC;
  S02_AXI_BID : out STD_LOGIC_VECTOR ( 0 to 0 );
  S02_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
  S02_AXI_BVALID : out STD_LOGIC;
  S02_AXI_BREADY : in STD_LOGIC;
  S02_AXI_ARID : in STD_LOGIC_VECTOR ( 0 to 0 );
  S02_AXI_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S02_AXI_ARLEN : in STD_LOGIC_VECTOR ( 7 downto 0 );
  S02_AXI_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S02_AXI_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
  S02_AXI_ARLOCK : in STD_LOGIC;
  S02_AXI_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S02_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S02_AXI_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S02_AXI_ARVALID : in STD_LOGIC;
  S02_AXI_ARREADY : out STD_LOGIC;
  S02_AXI_RID : out STD_LOGIC_VECTOR ( 0 to 0 );
  S02_AXI_RDATA : out STD_LOGIC_VECTOR ( 255 downto 0 );
  S02_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
  S02_AXI_RLAST : out STD_LOGIC;
  S02_AXI_RVALID : out STD_LOGIC;
  S02_AXI_RREADY : in STD_LOGIC;
  S03_AXI_ARESET_OUT_N : out STD_LOGIC;
  S03_AXI_ACLK : in STD_LOGIC;
  S03_AXI_AWID : in STD_LOGIC_VECTOR ( 0 to 0 );
  S03_AXI_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S03_AXI_AWLEN : in STD_LOGIC_VECTOR ( 7 downto 0 );
  S03_AXI_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S03_AXI_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
  S03_AXI_AWLOCK : in STD_LOGIC;
  S03_AXI_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S03_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S03_AXI_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S03_AXI_AWVALID : in STD_LOGIC;
  S03_AXI_AWREADY : out STD_LOGIC;
  S03_AXI_WDATA : in STD_LOGIC_VECTOR ( 255 downto 0 );
  S03_AXI_WSTRB : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S03_AXI_WLAST : in STD_LOGIC;
  S03_AXI_WVALID : in STD_LOGIC;
  S03_AXI_WREADY : out STD_LOGIC;
  S03_AXI_BID : out STD_LOGIC_VECTOR ( 0 to 0 );
  S03_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
  S03_AXI_BVALID : out STD_LOGIC;
  S03_AXI_BREADY : in STD_LOGIC;
  S03_AXI_ARID : in STD_LOGIC_VECTOR ( 0 to 0 );
  S03_AXI_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S03_AXI_ARLEN : in STD_LOGIC_VECTOR ( 7 downto 0 );
  S03_AXI_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S03_AXI_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
  S03_AXI_ARLOCK : in STD_LOGIC;
  S03_AXI_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S03_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S03_AXI_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S03_AXI_ARVALID : in STD_LOGIC;
  S03_AXI_ARREADY : out STD_LOGIC;
  S03_AXI_RID : out STD_LOGIC_VECTOR ( 0 to 0 );
  S03_AXI_RDATA : out STD_LOGIC_VECTOR ( 255 downto 0 );
  S03_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
  S03_AXI_RLAST : out STD_LOGIC;
  S03_AXI_RVALID : out STD_LOGIC;
  S03_AXI_RREADY : in STD_LOGIC;
  S04_AXI_ARESET_OUT_N : out STD_LOGIC;
  S04_AXI_ACLK : in STD_LOGIC;
  S04_AXI_AWID : in STD_LOGIC_VECTOR ( 0 to 0 );
  S04_AXI_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S04_AXI_AWLEN : in STD_LOGIC_VECTOR ( 7 downto 0 );
  S04_AXI_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S04_AXI_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
  S04_AXI_AWLOCK : in STD_LOGIC;
  S04_AXI_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S04_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S04_AXI_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S04_AXI_AWVALID : in STD_LOGIC;
  S04_AXI_AWREADY : out STD_LOGIC;
  S04_AXI_WDATA : in STD_LOGIC_VECTOR ( 255 downto 0 );
  S04_AXI_WSTRB : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S04_AXI_WLAST : in STD_LOGIC;
  S04_AXI_WVALID : in STD_LOGIC;
  S04_AXI_WREADY : out STD_LOGIC;
  S04_AXI_BID : out STD_LOGIC_VECTOR ( 0 to 0 );
  S04_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
  S04_AXI_BVALID : out STD_LOGIC;
  S04_AXI_BREADY : in STD_LOGIC;
  S04_AXI_ARID : in STD_LOGIC_VECTOR ( 0 to 0 );
  S04_AXI_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S04_AXI_ARLEN : in STD_LOGIC_VECTOR ( 7 downto 0 );
  S04_AXI_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S04_AXI_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
  S04_AXI_ARLOCK : in STD_LOGIC;
  S04_AXI_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S04_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S04_AXI_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S04_AXI_ARVALID : in STD_LOGIC;
  S04_AXI_ARREADY : out STD_LOGIC;
  S04_AXI_RID : out STD_LOGIC_VECTOR ( 0 to 0 );
  S04_AXI_RDATA : out STD_LOGIC_VECTOR ( 255 downto 0 );
  S04_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
  S04_AXI_RLAST : out STD_LOGIC;
  S04_AXI_RVALID : out STD_LOGIC;
  S04_AXI_RREADY : in STD_LOGIC;
  S05_AXI_ARESET_OUT_N : out STD_LOGIC;
  S05_AXI_ACLK : in STD_LOGIC;
  S05_AXI_AWID : in STD_LOGIC_VECTOR ( 0 to 0 );
  S05_AXI_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S05_AXI_AWLEN : in STD_LOGIC_VECTOR ( 7 downto 0 );
  S05_AXI_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S05_AXI_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
  S05_AXI_AWLOCK : in STD_LOGIC;
  S05_AXI_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S05_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S05_AXI_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S05_AXI_AWVALID : in STD_LOGIC;
  S05_AXI_AWREADY : out STD_LOGIC;
  S05_AXI_WDATA : in STD_LOGIC_VECTOR ( 255 downto 0 );
  S05_AXI_WSTRB : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S05_AXI_WLAST : in STD_LOGIC;
  S05_AXI_WVALID : in STD_LOGIC;
  S05_AXI_WREADY : out STD_LOGIC;
  S05_AXI_BID : out STD_LOGIC_VECTOR ( 0 to 0 );
  S05_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
  S05_AXI_BVALID : out STD_LOGIC;
  S05_AXI_BREADY : in STD_LOGIC;
  S05_AXI_ARID : in STD_LOGIC_VECTOR ( 0 to 0 );
  S05_AXI_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S05_AXI_ARLEN : in STD_LOGIC_VECTOR ( 7 downto 0 );
  S05_AXI_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S05_AXI_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
  S05_AXI_ARLOCK : in STD_LOGIC;
  S05_AXI_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S05_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S05_AXI_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S05_AXI_ARVALID : in STD_LOGIC;
  S05_AXI_ARREADY : out STD_LOGIC;
  S05_AXI_RID : out STD_LOGIC_VECTOR ( 0 to 0 );
  S05_AXI_RDATA : out STD_LOGIC_VECTOR ( 255 downto 0 );
  S05_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
  S05_AXI_RLAST : out STD_LOGIC;
  S05_AXI_RVALID : out STD_LOGIC;
  S05_AXI_RREADY : in STD_LOGIC;
  S06_AXI_ARESET_OUT_N : out STD_LOGIC;
  S06_AXI_ACLK : in STD_LOGIC;
  S06_AXI_AWID : in STD_LOGIC_VECTOR ( 0 to 0 );
  S06_AXI_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S06_AXI_AWLEN : in STD_LOGIC_VECTOR ( 7 downto 0 );
  S06_AXI_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S06_AXI_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
  S06_AXI_AWLOCK : in STD_LOGIC;
  S06_AXI_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S06_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S06_AXI_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S06_AXI_AWVALID : in STD_LOGIC;
  S06_AXI_AWREADY : out STD_LOGIC;
  S06_AXI_WDATA : in STD_LOGIC_VECTOR ( 255 downto 0 );
  S06_AXI_WSTRB : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S06_AXI_WLAST : in STD_LOGIC;
  S06_AXI_WVALID : in STD_LOGIC;
  S06_AXI_WREADY : out STD_LOGIC;
  S06_AXI_BID : out STD_LOGIC_VECTOR ( 0 to 0 );
  S06_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
  S06_AXI_BVALID : out STD_LOGIC;
  S06_AXI_BREADY : in STD_LOGIC;
  S06_AXI_ARID : in STD_LOGIC_VECTOR ( 0 to 0 );
  S06_AXI_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S06_AXI_ARLEN : in STD_LOGIC_VECTOR ( 7 downto 0 );
  S06_AXI_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S06_AXI_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
  S06_AXI_ARLOCK : in STD_LOGIC;
  S06_AXI_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S06_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S06_AXI_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S06_AXI_ARVALID : in STD_LOGIC;
  S06_AXI_ARREADY : out STD_LOGIC;
  S06_AXI_RID : out STD_LOGIC_VECTOR ( 0 to 0 );
  S06_AXI_RDATA : out STD_LOGIC_VECTOR ( 255 downto 0 );
  S06_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
  S06_AXI_RLAST : out STD_LOGIC;
  S06_AXI_RVALID : out STD_LOGIC;
  S06_AXI_RREADY : in STD_LOGIC;
  S07_AXI_ARESET_OUT_N : out STD_LOGIC;
  S07_AXI_ACLK : in STD_LOGIC;
  S07_AXI_AWID : in STD_LOGIC_VECTOR ( 0 to 0 );
  S07_AXI_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S07_AXI_AWLEN : in STD_LOGIC_VECTOR ( 7 downto 0 );
  S07_AXI_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S07_AXI_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
  S07_AXI_AWLOCK : in STD_LOGIC;
  S07_AXI_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S07_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S07_AXI_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S07_AXI_AWVALID : in STD_LOGIC;
  S07_AXI_AWREADY : out STD_LOGIC;
  S07_AXI_WDATA : in STD_LOGIC_VECTOR ( 255 downto 0 );
  S07_AXI_WSTRB : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S07_AXI_WLAST : in STD_LOGIC;
  S07_AXI_WVALID : in STD_LOGIC;
  S07_AXI_WREADY : out STD_LOGIC;
  S07_AXI_BID : out STD_LOGIC_VECTOR ( 0 to 0 );
  S07_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
  S07_AXI_BVALID : out STD_LOGIC;
  S07_AXI_BREADY : in STD_LOGIC;
  S07_AXI_ARID : in STD_LOGIC_VECTOR ( 0 to 0 );
  S07_AXI_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S07_AXI_ARLEN : in STD_LOGIC_VECTOR ( 7 downto 0 );
  S07_AXI_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S07_AXI_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
  S07_AXI_ARLOCK : in STD_LOGIC;
  S07_AXI_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S07_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S07_AXI_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S07_AXI_ARVALID : in STD_LOGIC;
  S07_AXI_ARREADY : out STD_LOGIC;
  S07_AXI_RID : out STD_LOGIC_VECTOR ( 0 to 0 );
  S07_AXI_RDATA : out STD_LOGIC_VECTOR ( 255 downto 0 );
  S07_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
  S07_AXI_RLAST : out STD_LOGIC;
  S07_AXI_RVALID : out STD_LOGIC;
  S07_AXI_RREADY : in STD_LOGIC;
  M00_AXI_ARESET_OUT_N : out STD_LOGIC;
  M00_AXI_ACLK : in STD_LOGIC;
  M00_AXI_AWID : out STD_LOGIC_VECTOR ( 3 downto 0 );
  M00_AXI_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
  M00_AXI_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
  M00_AXI_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
  M00_AXI_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
  M00_AXI_AWLOCK : out STD_LOGIC;
  M00_AXI_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
  M00_AXI_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
  M00_AXI_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
  M00_AXI_AWVALID : out STD_LOGIC;
  M00_AXI_AWREADY : in STD_LOGIC;
  M00_AXI_WDATA : out STD_LOGIC_VECTOR ( 255 downto 0 );
  M00_AXI_WSTRB : out STD_LOGIC_VECTOR ( 31 downto 0 );
  M00_AXI_WLAST : out STD_LOGIC;
  M00_AXI_WVALID : out STD_LOGIC;
  M00_AXI_WREADY : in STD_LOGIC;
  M00_AXI_BID : in STD_LOGIC_VECTOR ( 3 downto 0 );
  M00_AXI_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
  M00_AXI_BVALID : in STD_LOGIC;
  M00_AXI_BREADY : out STD_LOGIC;
  M00_AXI_ARID : out STD_LOGIC_VECTOR ( 3 downto 0 );
  M00_AXI_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
  M00_AXI_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
  M00_AXI_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
  M00_AXI_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
  M00_AXI_ARLOCK : out STD_LOGIC;
  M00_AXI_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
  M00_AXI_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
  M00_AXI_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
  M00_AXI_ARVALID : out STD_LOGIC;
  M00_AXI_ARREADY : in STD_LOGIC;
  M00_AXI_RID : in STD_LOGIC_VECTOR ( 3 downto 0 );
  M00_AXI_RDATA : in STD_LOGIC_VECTOR ( 255 downto 0 );
  M00_AXI_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
  M00_AXI_RLAST : in STD_LOGIC;
  M00_AXI_RVALID : in STD_LOGIC;
  M00_AXI_RREADY : out STD_LOGIC
);
end component;

COMPONENT axi_datamover_0
PORT (
  m_axi_mm2s_aclk : in STD_LOGIC;
  m_axi_mm2s_aresetn : in STD_LOGIC;
  mm2s_err : out STD_LOGIC;
  m_axis_mm2s_cmdsts_aclk : in STD_LOGIC;
  m_axis_mm2s_cmdsts_aresetn : in STD_LOGIC;
  s_axis_mm2s_cmd_tvalid : in STD_LOGIC;
  s_axis_mm2s_cmd_tready : out STD_LOGIC;
  s_axis_mm2s_cmd_tdata : in STD_LOGIC_VECTOR ( 71 downto 0 );
  m_axis_mm2s_sts_tvalid : out STD_LOGIC;
  m_axis_mm2s_sts_tready : in STD_LOGIC;
  m_axis_mm2s_sts_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
  m_axis_mm2s_sts_tkeep : out STD_LOGIC_VECTOR ( 0 to 0 );
  m_axis_mm2s_sts_tlast : out STD_LOGIC;
  m_axi_mm2s_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
  m_axi_mm2s_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
  m_axi_mm2s_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
  m_axi_mm2s_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
  m_axi_mm2s_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
  m_axi_mm2s_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
  m_axi_mm2s_aruser : out STD_LOGIC_VECTOR ( 3 downto 0 );
  m_axi_mm2s_arvalid : out STD_LOGIC;
  m_axi_mm2s_arready : in STD_LOGIC;
  m_axi_mm2s_rdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
  m_axi_mm2s_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
  m_axi_mm2s_rlast : in STD_LOGIC;
  m_axi_mm2s_rvalid : in STD_LOGIC;
  m_axi_mm2s_rready : out STD_LOGIC;
  m_axis_mm2s_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
  m_axis_mm2s_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
  m_axis_mm2s_tlast : out STD_LOGIC;
  m_axis_mm2s_tvalid : out STD_LOGIC;
  m_axis_mm2s_tready : in STD_LOGIC;
  m_axi_s2mm_aclk : in STD_LOGIC;
  m_axi_s2mm_aresetn : in STD_LOGIC;
  s2mm_err : out STD_LOGIC;
  m_axis_s2mm_cmdsts_awclk : in STD_LOGIC;
  m_axis_s2mm_cmdsts_aresetn : in STD_LOGIC;
  s_axis_s2mm_cmd_tvalid : in STD_LOGIC;
  s_axis_s2mm_cmd_tready : out STD_LOGIC;
  s_axis_s2mm_cmd_tdata : in STD_LOGIC_VECTOR ( 71 downto 0 );
  m_axis_s2mm_sts_tvalid : out STD_LOGIC;
  m_axis_s2mm_sts_tready : in STD_LOGIC;
  m_axis_s2mm_sts_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
  m_axis_s2mm_sts_tkeep : out STD_LOGIC_VECTOR ( 0 to 0 );
  m_axis_s2mm_sts_tlast : out STD_LOGIC;
  m_axi_s2mm_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
  m_axi_s2mm_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
  m_axi_s2mm_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
  m_axi_s2mm_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
  m_axi_s2mm_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
  m_axi_s2mm_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
  m_axi_s2mm_awuser : out STD_LOGIC_VECTOR ( 3 downto 0 );
  m_axi_s2mm_awvalid : out STD_LOGIC;
  m_axi_s2mm_awready : in STD_LOGIC;
  m_axi_s2mm_wdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
  m_axi_s2mm_wstrb : out STD_LOGIC_VECTOR ( 31 downto 0 );
  m_axi_s2mm_wlast : out STD_LOGIC;
  m_axi_s2mm_wvalid : out STD_LOGIC;
  m_axi_s2mm_wready : in STD_LOGIC;
  m_axi_s2mm_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
  m_axi_s2mm_bvalid : in STD_LOGIC;
  m_axi_s2mm_bready : out STD_LOGIC;
  s_axis_s2mm_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
  s_axis_s2mm_tkeep : in STD_LOGIC_VECTOR ( 7 downto 0 );
  s_axis_s2mm_tlast : in STD_LOGIC;
  s_axis_s2mm_tvalid : in STD_LOGIC;
  s_axis_s2mm_tready : out STD_LOGIC
);
END COMPONENT;

component axi_datamover_bpm
Port (
  m_axi_mm2s_aclk : in STD_LOGIC;
  m_axi_mm2s_aresetn : in STD_LOGIC;
  mm2s_err : out STD_LOGIC;
  m_axis_mm2s_cmdsts_aclk : in STD_LOGIC;
  m_axis_mm2s_cmdsts_aresetn : in STD_LOGIC;
  s_axis_mm2s_cmd_tvalid : in STD_LOGIC;
  s_axis_mm2s_cmd_tready : out STD_LOGIC;
  s_axis_mm2s_cmd_tdata : in STD_LOGIC_VECTOR ( 71 downto 0 );
  m_axis_mm2s_sts_tvalid : out STD_LOGIC;
  m_axis_mm2s_sts_tready : in STD_LOGIC;
  m_axis_mm2s_sts_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
  m_axis_mm2s_sts_tkeep : out STD_LOGIC_VECTOR ( 0 to 0 );
  m_axis_mm2s_sts_tlast : out STD_LOGIC;
  m_axi_mm2s_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
  m_axi_mm2s_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
  m_axi_mm2s_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
  m_axi_mm2s_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
  m_axi_mm2s_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
  m_axi_mm2s_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
  m_axi_mm2s_aruser : out STD_LOGIC_VECTOR ( 3 downto 0 );
  m_axi_mm2s_arvalid : out STD_LOGIC;
  m_axi_mm2s_arready : in STD_LOGIC;
  m_axi_mm2s_rdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
  m_axi_mm2s_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
  m_axi_mm2s_rlast : in STD_LOGIC;
  m_axi_mm2s_rvalid : in STD_LOGIC;
  m_axi_mm2s_rready : out STD_LOGIC;
  m_axis_mm2s_tdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
  m_axis_mm2s_tkeep : out STD_LOGIC_VECTOR ( 31 downto 0 );
  m_axis_mm2s_tlast : out STD_LOGIC;
  m_axis_mm2s_tvalid : out STD_LOGIC;
  m_axis_mm2s_tready : in STD_LOGIC;
  m_axi_s2mm_aclk : in STD_LOGIC;
  m_axi_s2mm_aresetn : in STD_LOGIC;
  s2mm_err : out STD_LOGIC;
  m_axis_s2mm_cmdsts_awclk : in STD_LOGIC;
  m_axis_s2mm_cmdsts_aresetn : in STD_LOGIC;
  s_axis_s2mm_cmd_tvalid : in STD_LOGIC;
  s_axis_s2mm_cmd_tready : out STD_LOGIC;
  s_axis_s2mm_cmd_tdata : in STD_LOGIC_VECTOR ( 71 downto 0 );
  m_axis_s2mm_sts_tvalid : out STD_LOGIC;
  m_axis_s2mm_sts_tready : in STD_LOGIC;
  m_axis_s2mm_sts_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
  m_axis_s2mm_sts_tkeep : out STD_LOGIC_VECTOR ( 0 to 0 );
  m_axis_s2mm_sts_tlast : out STD_LOGIC;
  m_axi_s2mm_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
  m_axi_s2mm_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
  m_axi_s2mm_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
  m_axi_s2mm_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
  m_axi_s2mm_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
  m_axi_s2mm_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
  m_axi_s2mm_awuser : out STD_LOGIC_VECTOR ( 3 downto 0 );
  m_axi_s2mm_awvalid : out STD_LOGIC;
  m_axi_s2mm_awready : in STD_LOGIC;
  m_axi_s2mm_wdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
  m_axi_s2mm_wstrb : out STD_LOGIC_VECTOR ( 31 downto 0 );
  m_axi_s2mm_wlast : out STD_LOGIC;
  m_axi_s2mm_wvalid : out STD_LOGIC;
  m_axi_s2mm_wready : in STD_LOGIC;
  m_axi_s2mm_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
  m_axi_s2mm_bvalid : in STD_LOGIC;
  m_axi_s2mm_bready : out STD_LOGIC;
  s_axis_s2mm_tdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
  s_axis_s2mm_tkeep : in STD_LOGIC_VECTOR ( 31 downto 0 );
  s_axis_s2mm_tlast : in STD_LOGIC;
  s_axis_s2mm_tvalid : in STD_LOGIC;
  s_axis_s2mm_tready : out STD_LOGIC
);
end component;

end package;
