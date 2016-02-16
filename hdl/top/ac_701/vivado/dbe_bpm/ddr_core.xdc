##################################################################################################
##
##  Xilinx, Inc. 2010            www.xilinx.com
##  Tue Feb 16 11:16:19 2016
##  Generated by MIG Version 2.3
##
##################################################################################################
##  File name :       ddr_core.xdc
##  Details :     Constraints file
##                    FPGA Family:       ARTIX7
##                    FPGA Part:         XC7A200T-FBG676
##                    Speedgrade:        -2
##                    Design Entry:      VERILOG
##                    Frequency:         0 MHz
##                    Time Period:       2500 ps
##################################################################################################

##################################################################################################
## Controller 0
## Memory Device: DDR3_SDRAM->SODIMMs->MT8JTF12864HZ-1G6
## Data Width: 64
## Time Period: 2500
## Data Mask: 1
##################################################################################################

#create_clock -period 5 [get_ports sys_clk_i]

############## NET - IOSTANDARD ##################


# PadFunction: IO_L24P_T3_33
set_property SLEW FAST [get_ports {ddr3_dq[0]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[0]}]
set_property PACKAGE_PIN AB6 [get_ports {ddr3_dq[0]}]

# PadFunction: IO_L23N_T3_33
set_property SLEW FAST [get_ports {ddr3_dq[1]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[1]}]
set_property PACKAGE_PIN AA8 [get_ports {ddr3_dq[1]}]

# PadFunction: IO_L23P_T3_33
set_property SLEW FAST [get_ports {ddr3_dq[2]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[2]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[2]}]
set_property PACKAGE_PIN Y8 [get_ports {ddr3_dq[2]}]

# PadFunction: IO_L22N_T3_33
set_property SLEW FAST [get_ports {ddr3_dq[3]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[3]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[3]}]
set_property PACKAGE_PIN AB5 [get_ports {ddr3_dq[3]}]

# PadFunction: IO_L22P_T3_33
set_property SLEW FAST [get_ports {ddr3_dq[4]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[4]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[4]}]
set_property PACKAGE_PIN AA5 [get_ports {ddr3_dq[4]}]

# PadFunction: IO_L20N_T3_33
set_property SLEW FAST [get_ports {ddr3_dq[5]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[5]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[5]}]
set_property PACKAGE_PIN Y5 [get_ports {ddr3_dq[5]}]

# PadFunction: IO_L20P_T3_33
set_property SLEW FAST [get_ports {ddr3_dq[6]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[6]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[6]}]
set_property PACKAGE_PIN Y6 [get_ports {ddr3_dq[6]}]

# PadFunction: IO_L19P_T3_33
set_property SLEW FAST [get_ports {ddr3_dq[7]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[7]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[7]}]
set_property PACKAGE_PIN Y7 [get_ports {ddr3_dq[7]}]

# PadFunction: IO_L17N_T2_33
set_property SLEW FAST [get_ports {ddr3_dq[8]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[8]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[8]}]
set_property PACKAGE_PIN AF4 [get_ports {ddr3_dq[8]}]

# PadFunction: IO_L17P_T2_33
set_property SLEW FAST [get_ports {ddr3_dq[9]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[9]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[9]}]
set_property PACKAGE_PIN AF5 [get_ports {ddr3_dq[9]}]

# PadFunction: IO_L16N_T2_33
set_property SLEW FAST [get_ports {ddr3_dq[10]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[10]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[10]}]
set_property PACKAGE_PIN AF3 [get_ports {ddr3_dq[10]}]

# PadFunction: IO_L16P_T2_33
set_property SLEW FAST [get_ports {ddr3_dq[11]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[11]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[11]}]
set_property PACKAGE_PIN AE3 [get_ports {ddr3_dq[11]}]

# PadFunction: IO_L14N_T2_SRCC_33
set_property SLEW FAST [get_ports {ddr3_dq[12]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[12]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[12]}]
set_property PACKAGE_PIN AD3 [get_ports {ddr3_dq[12]}]

# PadFunction: IO_L14P_T2_SRCC_33
set_property SLEW FAST [get_ports {ddr3_dq[13]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[13]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[13]}]
set_property PACKAGE_PIN AC3 [get_ports {ddr3_dq[13]}]

# PadFunction: IO_L13N_T2_MRCC_33
set_property SLEW FAST [get_ports {ddr3_dq[14]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[14]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[14]}]
set_property PACKAGE_PIN AB4 [get_ports {ddr3_dq[14]}]

# PadFunction: IO_L13P_T2_MRCC_33
set_property SLEW FAST [get_ports {ddr3_dq[15]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[15]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[15]}]
set_property PACKAGE_PIN AA4 [get_ports {ddr3_dq[15]}]

# PadFunction: IO_L11N_T1_SRCC_33
set_property SLEW FAST [get_ports {ddr3_dq[16]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[16]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[16]}]
set_property PACKAGE_PIN AC2 [get_ports {ddr3_dq[16]}]

# PadFunction: IO_L11P_T1_SRCC_33
set_property SLEW FAST [get_ports {ddr3_dq[17]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[17]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[17]}]
set_property PACKAGE_PIN AB2 [get_ports {ddr3_dq[17]}]

# PadFunction: IO_L10N_T1_33
set_property SLEW FAST [get_ports {ddr3_dq[18]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[18]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[18]}]
set_property PACKAGE_PIN AF2 [get_ports {ddr3_dq[18]}]

# PadFunction: IO_L10P_T1_33
set_property SLEW FAST [get_ports {ddr3_dq[19]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[19]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[19]}]
set_property PACKAGE_PIN AE2 [get_ports {ddr3_dq[19]}]

# PadFunction: IO_L8N_T1_33
set_property SLEW FAST [get_ports {ddr3_dq[20]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[20]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[20]}]
set_property PACKAGE_PIN Y1 [get_ports {ddr3_dq[20]}]

# PadFunction: IO_L8P_T1_33
set_property SLEW FAST [get_ports {ddr3_dq[21]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[21]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[21]}]
set_property PACKAGE_PIN Y2 [get_ports {ddr3_dq[21]}]

# PadFunction: IO_L7N_T1_33
set_property SLEW FAST [get_ports {ddr3_dq[22]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[22]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[22]}]
set_property PACKAGE_PIN AC1 [get_ports {ddr3_dq[22]}]

# PadFunction: IO_L7P_T1_33
set_property SLEW FAST [get_ports {ddr3_dq[23]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[23]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[23]}]
set_property PACKAGE_PIN AB1 [get_ports {ddr3_dq[23]}]

# PadFunction: IO_L5N_T0_33
set_property SLEW FAST [get_ports {ddr3_dq[24]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[24]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[24]}]
set_property PACKAGE_PIN Y3 [get_ports {ddr3_dq[24]}]

# PadFunction: IO_L5P_T0_33
set_property SLEW FAST [get_ports {ddr3_dq[25]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[25]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[25]}]
set_property PACKAGE_PIN W3 [get_ports {ddr3_dq[25]}]

# PadFunction: IO_L4N_T0_33
set_property SLEW FAST [get_ports {ddr3_dq[26]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[26]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[26]}]
set_property PACKAGE_PIN W6 [get_ports {ddr3_dq[26]}]

# PadFunction: IO_L4P_T0_33
set_property SLEW FAST [get_ports {ddr3_dq[27]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[27]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[27]}]
set_property PACKAGE_PIN V6 [get_ports {ddr3_dq[27]}]

# PadFunction: IO_L2N_T0_33
set_property SLEW FAST [get_ports {ddr3_dq[28]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[28]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[28]}]
set_property PACKAGE_PIN W4 [get_ports {ddr3_dq[28]}]

# PadFunction: IO_L2P_T0_33
set_property SLEW FAST [get_ports {ddr3_dq[29]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[29]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[29]}]
set_property PACKAGE_PIN W5 [get_ports {ddr3_dq[29]}]

# PadFunction: IO_L1N_T0_33
set_property SLEW FAST [get_ports {ddr3_dq[30]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[30]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[30]}]
set_property PACKAGE_PIN W1 [get_ports {ddr3_dq[30]}]

# PadFunction: IO_L1P_T0_33
set_property SLEW FAST [get_ports {ddr3_dq[31]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[31]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[31]}]
set_property PACKAGE_PIN V1 [get_ports {ddr3_dq[31]}]

# PadFunction: IO_L24P_T3_35
set_property SLEW FAST [get_ports {ddr3_dq[32]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[32]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[32]}]
set_property PACKAGE_PIN G2 [get_ports {ddr3_dq[32]}]

# PadFunction: IO_L23N_T3_35
set_property SLEW FAST [get_ports {ddr3_dq[33]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[33]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[33]}]
set_property PACKAGE_PIN D1 [get_ports {ddr3_dq[33]}]

# PadFunction: IO_L23P_T3_35
set_property SLEW FAST [get_ports {ddr3_dq[34]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[34]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[34]}]
set_property PACKAGE_PIN E1 [get_ports {ddr3_dq[34]}]

# PadFunction: IO_L22N_T3_35
set_property SLEW FAST [get_ports {ddr3_dq[35]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[35]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[35]}]
set_property PACKAGE_PIN E2 [get_ports {ddr3_dq[35]}]

# PadFunction: IO_L22P_T3_35
set_property SLEW FAST [get_ports {ddr3_dq[36]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[36]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[36]}]
set_property PACKAGE_PIN F2 [get_ports {ddr3_dq[36]}]

# PadFunction: IO_L20N_T3_35
set_property SLEW FAST [get_ports {ddr3_dq[37]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[37]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[37]}]
set_property PACKAGE_PIN A2 [get_ports {ddr3_dq[37]}]

# PadFunction: IO_L20P_T3_35
set_property SLEW FAST [get_ports {ddr3_dq[38]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[38]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[38]}]
set_property PACKAGE_PIN A3 [get_ports {ddr3_dq[38]}]

# PadFunction: IO_L19P_T3_35
set_property SLEW FAST [get_ports {ddr3_dq[39]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[39]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[39]}]
set_property PACKAGE_PIN C2 [get_ports {ddr3_dq[39]}]

# PadFunction: IO_L17N_T2_35
set_property SLEW FAST [get_ports {ddr3_dq[40]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[40]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[40]}]
set_property PACKAGE_PIN C3 [get_ports {ddr3_dq[40]}]

# PadFunction: IO_L17P_T2_35
set_property SLEW FAST [get_ports {ddr3_dq[41]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[41]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[41]}]
set_property PACKAGE_PIN D3 [get_ports {ddr3_dq[41]}]

# PadFunction: IO_L16N_T2_35
set_property SLEW FAST [get_ports {ddr3_dq[42]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[42]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[42]}]
set_property PACKAGE_PIN A4 [get_ports {ddr3_dq[42]}]

# PadFunction: IO_L16P_T2_35
set_property SLEW FAST [get_ports {ddr3_dq[43]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[43]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[43]}]
set_property PACKAGE_PIN B4 [get_ports {ddr3_dq[43]}]

# PadFunction: IO_L14N_T2_SRCC_35
set_property SLEW FAST [get_ports {ddr3_dq[44]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[44]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[44]}]
set_property PACKAGE_PIN C4 [get_ports {ddr3_dq[44]}]

# PadFunction: IO_L14P_T2_SRCC_35
set_property SLEW FAST [get_ports {ddr3_dq[45]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[45]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[45]}]
set_property PACKAGE_PIN D4 [get_ports {ddr3_dq[45]}]

# PadFunction: IO_L13N_T2_MRCC_35
set_property SLEW FAST [get_ports {ddr3_dq[46]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[46]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[46]}]
set_property PACKAGE_PIN D5 [get_ports {ddr3_dq[46]}]

# PadFunction: IO_L13P_T2_MRCC_35
set_property SLEW FAST [get_ports {ddr3_dq[47]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[47]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[47]}]
set_property PACKAGE_PIN E5 [get_ports {ddr3_dq[47]}]

# PadFunction: IO_L11N_T1_SRCC_35
set_property SLEW FAST [get_ports {ddr3_dq[48]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[48]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[48]}]
set_property PACKAGE_PIN F4 [get_ports {ddr3_dq[48]}]

# PadFunction: IO_L11P_T1_SRCC_35
set_property SLEW FAST [get_ports {ddr3_dq[49]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[49]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[49]}]
set_property PACKAGE_PIN G4 [get_ports {ddr3_dq[49]}]

# PadFunction: IO_L10N_T1_AD15N_35
set_property SLEW FAST [get_ports {ddr3_dq[50]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[50]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[50]}]
set_property PACKAGE_PIN K6 [get_ports {ddr3_dq[50]}]

# PadFunction: IO_L10P_T1_AD15P_35
set_property SLEW FAST [get_ports {ddr3_dq[51]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[51]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[51]}]
set_property PACKAGE_PIN K7 [get_ports {ddr3_dq[51]}]

# PadFunction: IO_L8N_T1_AD14N_35
set_property SLEW FAST [get_ports {ddr3_dq[52]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[52]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[52]}]
set_property PACKAGE_PIN K8 [get_ports {ddr3_dq[52]}]

# PadFunction: IO_L8P_T1_AD14P_35
set_property SLEW FAST [get_ports {ddr3_dq[53]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[53]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[53]}]
set_property PACKAGE_PIN L8 [get_ports {ddr3_dq[53]}]

# PadFunction: IO_L7N_T1_AD6N_35
set_property SLEW FAST [get_ports {ddr3_dq[54]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[54]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[54]}]
set_property PACKAGE_PIN J5 [get_ports {ddr3_dq[54]}]

# PadFunction: IO_L7P_T1_AD6P_35
set_property SLEW FAST [get_ports {ddr3_dq[55]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[55]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[55]}]
set_property PACKAGE_PIN J6 [get_ports {ddr3_dq[55]}]

# PadFunction: IO_L5N_T0_AD13N_35
set_property SLEW FAST [get_ports {ddr3_dq[56]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[56]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[56]}]
set_property PACKAGE_PIN G6 [get_ports {ddr3_dq[56]}]

# PadFunction: IO_L5P_T0_AD13P_35
set_property SLEW FAST [get_ports {ddr3_dq[57]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[57]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[57]}]
set_property PACKAGE_PIN H6 [get_ports {ddr3_dq[57]}]

# PadFunction: IO_L4N_T0_35
set_property SLEW FAST [get_ports {ddr3_dq[58]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[58]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[58]}]
set_property PACKAGE_PIN F7 [get_ports {ddr3_dq[58]}]

# PadFunction: IO_L4P_T0_35
set_property SLEW FAST [get_ports {ddr3_dq[59]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[59]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[59]}]
set_property PACKAGE_PIN F8 [get_ports {ddr3_dq[59]}]

# PadFunction: IO_L2N_T0_AD12N_35
set_property SLEW FAST [get_ports {ddr3_dq[60]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[60]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[60]}]
set_property PACKAGE_PIN G8 [get_ports {ddr3_dq[60]}]

# PadFunction: IO_L2P_T0_AD12P_35
set_property SLEW FAST [get_ports {ddr3_dq[61]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[61]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[61]}]
set_property PACKAGE_PIN H8 [get_ports {ddr3_dq[61]}]

# PadFunction: IO_L1N_T0_AD4N_35
set_property SLEW FAST [get_ports {ddr3_dq[62]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[62]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[62]}]
set_property PACKAGE_PIN D6 [get_ports {ddr3_dq[62]}]

# PadFunction: IO_L1P_T0_AD4P_35
set_property SLEW FAST [get_ports {ddr3_dq[63]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dq[63]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[63]}]
set_property PACKAGE_PIN E6 [get_ports {ddr3_dq[63]}]

# PadFunction: IO_L5N_T0_34
set_property SLEW FAST [get_ports {ddr3_addr[13]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[13]}]
set_property PACKAGE_PIN N6 [get_ports {ddr3_addr[13]}]

# PadFunction: IO_L2N_T0_34
set_property SLEW FAST [get_ports {ddr3_addr[12]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[12]}]
set_property PACKAGE_PIN L7 [get_ports {ddr3_addr[12]}]

# PadFunction: IO_L4P_T0_34
set_property SLEW FAST [get_ports {ddr3_addr[11]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[11]}]
set_property PACKAGE_PIN L5 [get_ports {ddr3_addr[11]}]

# PadFunction: IO_L5P_T0_34
set_property SLEW FAST [get_ports {ddr3_addr[10]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[10]}]
set_property PACKAGE_PIN N7 [get_ports {ddr3_addr[10]}]

# PadFunction: IO_L1P_T0_34
set_property SLEW FAST [get_ports {ddr3_addr[9]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[9]}]
set_property PACKAGE_PIN K3 [get_ports {ddr3_addr[9]}]

# PadFunction: IO_L10N_T1_34
set_property SLEW FAST [get_ports {ddr3_addr[8]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[8]}]
set_property PACKAGE_PIN H1 [get_ports {ddr3_addr[8]}]

# PadFunction: IO_L6P_T0_34
set_property SLEW FAST [get_ports {ddr3_addr[7]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[7]}]
set_property PACKAGE_PIN M6 [get_ports {ddr3_addr[7]}]

# PadFunction: IO_L7P_T1_34
set_property SLEW FAST [get_ports {ddr3_addr[6]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[6]}]
set_property PACKAGE_PIN K1 [get_ports {ddr3_addr[6]}]

# PadFunction: IO_L2P_T0_34
set_property SLEW FAST [get_ports {ddr3_addr[5]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[5]}]
set_property PACKAGE_PIN M7 [get_ports {ddr3_addr[5]}]

# PadFunction: IO_L4N_T0_34
set_property SLEW FAST [get_ports {ddr3_addr[4]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[4]}]
set_property PACKAGE_PIN K5 [get_ports {ddr3_addr[4]}]

# PadFunction: IO_L3N_T0_DQS_34
set_property SLEW FAST [get_ports {ddr3_addr[3]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[3]}]
set_property PACKAGE_PIN L4 [get_ports {ddr3_addr[3]}]

# PadFunction: IO_L7N_T1_34
set_property SLEW FAST [get_ports {ddr3_addr[2]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[2]}]
set_property PACKAGE_PIN J1 [get_ports {ddr3_addr[2]}]

# PadFunction: IO_L1N_T0_34
set_property SLEW FAST [get_ports {ddr3_addr[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[1]}]
set_property PACKAGE_PIN J3 [get_ports {ddr3_addr[1]}]

# PadFunction: IO_L3P_T0_DQS_34
set_property SLEW FAST [get_ports {ddr3_addr[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[0]}]
set_property PACKAGE_PIN M4 [get_ports {ddr3_addr[0]}]

# PadFunction: IO_L10P_T1_34
set_property SLEW FAST [get_ports {ddr3_ba[2]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_ba[2]}]
set_property PACKAGE_PIN H2 [get_ports {ddr3_ba[2]}]

# PadFunction: IO_L9N_T1_DQS_34
set_property SLEW FAST [get_ports {ddr3_ba[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_ba[1]}]
set_property PACKAGE_PIN M1 [get_ports {ddr3_ba[1]}]

# PadFunction: IO_L9P_T1_DQS_34
set_property SLEW FAST [get_ports {ddr3_ba[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_ba[0]}]
set_property PACKAGE_PIN N1 [get_ports {ddr3_ba[0]}]

# PadFunction: IO_L15N_T2_DQS_34
set_property SLEW FAST [get_ports {ddr3_ras_n}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_ras_n}]
set_property PACKAGE_PIN P1 [get_ports {ddr3_ras_n}]

# PadFunction: IO_L16P_T2_34
set_property SLEW FAST [get_ports {ddr3_cas_n}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_cas_n}]
set_property PACKAGE_PIN T4 [get_ports {ddr3_cas_n}]

# PadFunction: IO_L15P_T2_DQS_34
set_property SLEW FAST [get_ports {ddr3_we_n}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_we_n}]
set_property PACKAGE_PIN R1 [get_ports {ddr3_we_n}]

# PadFunction: IO_0_34
set_property SLEW FAST [get_ports {ddr3_reset_n}]
set_property IOSTANDARD LVCMOS15 [get_ports {ddr3_reset_n}]
set_property PACKAGE_PIN N8 [get_ports {ddr3_reset_n}]

# PadFunction: IO_L14P_T2_SRCC_34
set_property SLEW FAST [get_ports {ddr3_cke[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_cke[0]}]
set_property PACKAGE_PIN P4 [get_ports {ddr3_cke[0]}]

# PadFunction: IO_L17N_T2_34
set_property SLEW FAST [get_ports {ddr3_odt[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_odt[0]}]
set_property PACKAGE_PIN R2 [get_ports {ddr3_odt[0]}]

# PadFunction: IO_L16N_T2_34
set_property SLEW FAST [get_ports {ddr3_cs_n[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_cs_n[0]}]
set_property PACKAGE_PIN T3 [get_ports {ddr3_cs_n[0]}]

# PadFunction: IO_L24N_T3_33
set_property SLEW FAST [get_ports {ddr3_dm[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dm[0]}]
set_property PACKAGE_PIN AC6 [get_ports {ddr3_dm[0]}]

# PadFunction: IO_L18P_T2_33
set_property SLEW FAST [get_ports {ddr3_dm[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dm[1]}]
set_property PACKAGE_PIN AC4 [get_ports {ddr3_dm[1]}]

# PadFunction: IO_L12P_T1_MRCC_33
set_property SLEW FAST [get_ports {ddr3_dm[2]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dm[2]}]
set_property PACKAGE_PIN AA3 [get_ports {ddr3_dm[2]}]

# PadFunction: IO_L6P_T0_33
set_property SLEW FAST [get_ports {ddr3_dm[3]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dm[3]}]
set_property PACKAGE_PIN U7 [get_ports {ddr3_dm[3]}]

# PadFunction: IO_L24N_T3_35
set_property SLEW FAST [get_ports {ddr3_dm[4]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dm[4]}]
set_property PACKAGE_PIN G1 [get_ports {ddr3_dm[4]}]

# PadFunction: IO_L18P_T2_35
set_property SLEW FAST [get_ports {ddr3_dm[5]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dm[5]}]
set_property PACKAGE_PIN F3 [get_ports {ddr3_dm[5]}]

# PadFunction: IO_L12P_T1_MRCC_35
set_property SLEW FAST [get_ports {ddr3_dm[6]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dm[6]}]
set_property PACKAGE_PIN G5 [get_ports {ddr3_dm[6]}]

# PadFunction: IO_L6P_T0_35
set_property SLEW FAST [get_ports {ddr3_dm[7]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dm[7]}]
set_property PACKAGE_PIN H9 [get_ports {ddr3_dm[7]}]

# PadFunction: IO_L21P_T3_DQS_33
set_property SLEW FAST [get_ports {ddr3_dqs_p[0]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dqs_p[0]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs_p[0]}]
set_property PACKAGE_PIN V8 [get_ports {ddr3_dqs_p[0]}]

# PadFunction: IO_L21N_T3_DQS_33
set_property SLEW FAST [get_ports {ddr3_dqs_n[0]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dqs_n[0]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs_n[0]}]
set_property PACKAGE_PIN W8 [get_ports {ddr3_dqs_n[0]}]

# PadFunction: IO_L15P_T2_DQS_33
set_property SLEW FAST [get_ports {ddr3_dqs_p[1]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dqs_p[1]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs_p[1]}]
set_property PACKAGE_PIN AD5 [get_ports {ddr3_dqs_p[1]}]

# PadFunction: IO_L15N_T2_DQS_33
set_property SLEW FAST [get_ports {ddr3_dqs_n[1]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dqs_n[1]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs_n[1]}]
set_property PACKAGE_PIN AE5 [get_ports {ddr3_dqs_n[1]}]

# PadFunction: IO_L9P_T1_DQS_33
set_property SLEW FAST [get_ports {ddr3_dqs_p[2]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dqs_p[2]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs_p[2]}]
set_property PACKAGE_PIN AD1 [get_ports {ddr3_dqs_p[2]}]

# PadFunction: IO_L9N_T1_DQS_33
set_property SLEW FAST [get_ports {ddr3_dqs_n[2]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dqs_n[2]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs_n[2]}]
set_property PACKAGE_PIN AE1 [get_ports {ddr3_dqs_n[2]}]

# PadFunction: IO_L3P_T0_DQS_33
set_property SLEW FAST [get_ports {ddr3_dqs_p[3]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dqs_p[3]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs_p[3]}]
set_property PACKAGE_PIN V3 [get_ports {ddr3_dqs_p[3]}]

# PadFunction: IO_L3N_T0_DQS_33
set_property SLEW FAST [get_ports {ddr3_dqs_n[3]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dqs_n[3]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs_n[3]}]
set_property PACKAGE_PIN V2 [get_ports {ddr3_dqs_n[3]}]

# PadFunction: IO_L21P_T3_DQS_35
set_property SLEW FAST [get_ports {ddr3_dqs_p[4]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dqs_p[4]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs_p[4]}]
set_property PACKAGE_PIN C1 [get_ports {ddr3_dqs_p[4]}]

# PadFunction: IO_L21N_T3_DQS_35
set_property SLEW FAST [get_ports {ddr3_dqs_n[4]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dqs_n[4]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs_n[4]}]
set_property PACKAGE_PIN B1 [get_ports {ddr3_dqs_n[4]}]

# PadFunction: IO_L15P_T2_DQS_35
set_property SLEW FAST [get_ports {ddr3_dqs_p[5]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dqs_p[5]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs_p[5]}]
set_property PACKAGE_PIN B5 [get_ports {ddr3_dqs_p[5]}]

# PadFunction: IO_L15N_T2_DQS_35
set_property SLEW FAST [get_ports {ddr3_dqs_n[5]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dqs_n[5]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs_n[5]}]
set_property PACKAGE_PIN A5 [get_ports {ddr3_dqs_n[5]}]

# PadFunction: IO_L9P_T1_DQS_AD7P_35
set_property SLEW FAST [get_ports {ddr3_dqs_p[6]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dqs_p[6]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs_p[6]}]
set_property PACKAGE_PIN J4 [get_ports {ddr3_dqs_p[6]}]

# PadFunction: IO_L9N_T1_DQS_AD7N_35
set_property SLEW FAST [get_ports {ddr3_dqs_n[6]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dqs_n[6]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs_n[6]}]
set_property PACKAGE_PIN H4 [get_ports {ddr3_dqs_n[6]}]

# PadFunction: IO_L3P_T0_DQS_AD5P_35
set_property SLEW FAST [get_ports {ddr3_dqs_p[7]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dqs_p[7]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs_p[7]}]
set_property PACKAGE_PIN H7 [get_ports {ddr3_dqs_p[7]}]

# PadFunction: IO_L3N_T0_DQS_AD5N_35
set_property SLEW FAST [get_ports {ddr3_dqs_n[7]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddr3_dqs_n[7]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs_n[7]}]
set_property PACKAGE_PIN G7 [get_ports {ddr3_dqs_n[7]}]

# PadFunction: IO_L11P_T1_SRCC_34
set_property SLEW FAST [get_ports {ddr3_ck_p[0]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_ck_p[0]}]
set_property PACKAGE_PIN M2 [get_ports {ddr3_ck_p[0]}]

# PadFunction: IO_L11N_T1_SRCC_34
set_property SLEW FAST [get_ports {ddr3_ck_n[0]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_ck_n[0]}]
set_property PACKAGE_PIN L2 [get_ports {ddr3_ck_n[0]}]



set_property LOC PHASER_OUT_PHY_X1Y7 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/phaser_out}]
set_property LOC PHASER_OUT_PHY_X1Y6 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/phaser_out}]
set_property LOC PHASER_OUT_PHY_X1Y5 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/phaser_out}]
set_property LOC PHASER_OUT_PHY_X1Y4 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/phaser_out}]
set_property LOC PHASER_OUT_PHY_X1Y11 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/phaser_out}]
set_property LOC PHASER_OUT_PHY_X1Y10 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/phaser_out}]
set_property LOC PHASER_OUT_PHY_X1Y9 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/phaser_out}]
set_property LOC PHASER_OUT_PHY_X1Y15 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/phaser_out}]
set_property LOC PHASER_OUT_PHY_X1Y14 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/phaser_out}]
set_property LOC PHASER_OUT_PHY_X1Y13 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/phaser_out}]
set_property LOC PHASER_OUT_PHY_X1Y12 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/phaser_out}]

set_property LOC PHASER_IN_PHY_X1Y7 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/phaser_in_gen.phaser_in}]
set_property LOC PHASER_IN_PHY_X1Y6 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/phaser_in_gen.phaser_in}]
set_property LOC PHASER_IN_PHY_X1Y5 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/phaser_in_gen.phaser_in}]
set_property LOC PHASER_IN_PHY_X1Y4 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/phaser_in_gen.phaser_in}]
## set_property LOC PHASER_IN_PHY_X1Y11 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/phaser_in_gen.phaser_in}]
## set_property LOC PHASER_IN_PHY_X1Y10 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/phaser_in_gen.phaser_in}]
## set_property LOC PHASER_IN_PHY_X1Y9 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/phaser_in_gen.phaser_in}]
set_property LOC PHASER_IN_PHY_X1Y15 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/phaser_in_gen.phaser_in}]
set_property LOC PHASER_IN_PHY_X1Y14 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/phaser_in_gen.phaser_in}]
set_property LOC PHASER_IN_PHY_X1Y13 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/phaser_in_gen.phaser_in}]
set_property LOC PHASER_IN_PHY_X1Y12 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/phaser_in_gen.phaser_in}]



set_property LOC OUT_FIFO_X1Y7 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/out_fifo}]
set_property LOC OUT_FIFO_X1Y6 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/out_fifo}]
set_property LOC OUT_FIFO_X1Y5 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/out_fifo}]
set_property LOC OUT_FIFO_X1Y4 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/out_fifo}]
set_property LOC OUT_FIFO_X1Y11 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/out_fifo}]
set_property LOC OUT_FIFO_X1Y10 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/out_fifo}]
set_property LOC OUT_FIFO_X1Y9 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/out_fifo}]
set_property LOC OUT_FIFO_X1Y15 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/out_fifo}]
set_property LOC OUT_FIFO_X1Y14 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/out_fifo}]
set_property LOC OUT_FIFO_X1Y13 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/out_fifo}]
set_property LOC OUT_FIFO_X1Y12 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/out_fifo}]

set_property LOC IN_FIFO_X1Y7 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/in_fifo_gen.in_fifo}]
set_property LOC IN_FIFO_X1Y6 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/in_fifo_gen.in_fifo}]
set_property LOC IN_FIFO_X1Y5 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/in_fifo_gen.in_fifo}]
set_property LOC IN_FIFO_X1Y4 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/in_fifo_gen.in_fifo}]
set_property LOC IN_FIFO_X1Y15 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/in_fifo_gen.in_fifo}]
set_property LOC IN_FIFO_X1Y14 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/in_fifo_gen.in_fifo}]
set_property LOC IN_FIFO_X1Y13 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/in_fifo_gen.in_fifo}]
set_property LOC IN_FIFO_X1Y12 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/in_fifo_gen.in_fifo}]

set_property LOC PHY_CONTROL_X1Y1 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/phy_control_i}]
set_property LOC PHY_CONTROL_X1Y2 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_1.u_ddr_phy_4lanes/phy_control_i}]
set_property LOC PHY_CONTROL_X1Y3 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/phy_control_i}]

set_property LOC PHASER_REF_X1Y1 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/phaser_ref_i}]
set_property LOC PHASER_REF_X1Y2 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_1.u_ddr_phy_4lanes/phaser_ref_i}]
set_property LOC PHASER_REF_X1Y3 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/phaser_ref_i}]

set_property LOC OLOGIC_X1Y93 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/ddr_byte_group_io/*slave_ts}]
set_property LOC OLOGIC_X1Y81 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/ddr_byte_group_io/*slave_ts}]
set_property LOC OLOGIC_X1Y69 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/ddr_byte_group_io/*slave_ts}]
set_property LOC OLOGIC_X1Y57 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/ddr_byte_group_io/*slave_ts}]
set_property LOC OLOGIC_X1Y193 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/ddr_byte_group_io/*slave_ts}]
set_property LOC OLOGIC_X1Y181 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/ddr_byte_group_io/*slave_ts}]
set_property LOC OLOGIC_X1Y169 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/ddr_byte_group_io/*slave_ts}]
set_property LOC OLOGIC_X1Y157 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/ddr_byte_group_io/*slave_ts}]

set_property LOC PLLE2_ADV_X1Y2 [get_cells -hier -filter {NAME =~ */u_ddr3_infrastructure/plle2_i}]
set_property LOC MMCME2_ADV_X1Y2 [get_cells -hier -filter {NAME =~ */u_ddr3_infrastructure/gen_mmcm.mmcm_i}]


set_multicycle_path -from [get_cells -hier -filter {NAME =~ */mc0/mc_read_idle_r_reg}] \
                    -to   [get_cells -hier -filter {NAME =~ */input_[?].iserdes_dq_.iserdesdq}] \
                    -setup 6

set_multicycle_path -from [get_cells -hier -filter {NAME =~ */mc0/mc_read_idle_r_reg}] \
                    -to   [get_cells -hier -filter {NAME =~ */input_[?].iserdes_dq_.iserdesdq}] \
                    -hold 5



set_false_path -through [get_pins -filter {NAME =~ */DQSFOUND} -of [get_cells -hier -filter {REF_NAME == PHASER_IN_PHY}]]

set_multicycle_path -through [get_pins -filter {NAME =~ */OSERDESRST} -of [get_cells -hier -filter {REF_NAME == PHASER_OUT_PHY}]] -setup 2 -start
set_multicycle_path -through [get_pins -filter {NAME =~ */OSERDESRST} -of [get_cells -hier -filter {REF_NAME == PHASER_OUT_PHY}]] -hold 1 -start

set_max_delay -datapath_only -from [get_cells -hier -filter {NAME =~ *temp_mon_enabled.u_tempmon/* && IS_SEQUENTIAL}] -to [get_cells -hier -filter {NAME =~ *temp_mon_enabled.u_tempmon/device_temp_sync_r1*}] 20
set_max_delay -from [get_cells -hier *rstdiv0_sync_r1_reg*] -to [get_pins -filter {NAME =~ */RESET} -of [get_cells -hier -filter {REF_NAME == PHY_CONTROL}]] -datapath_only 5

set_max_delay -datapath_only -from [get_cells -hier -filter {NAME =~ *ddr3_infrastructure/rstdiv0_sync_r1_reg*}] -to [get_cells -hier -filter {NAME =~ *temp_mon_enabled.u_tempmon/xadc_supplied_temperature.rst_r1*}] 20
