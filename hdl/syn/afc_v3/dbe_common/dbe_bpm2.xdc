#######################################################################
##                      Artix 7 AMC V3                               ##
#######################################################################

#######################################################################
##                      FMC Connector HPC1                           ##
#######################################################################

###NET  "fmc1_prsnt_i"                            LOC =  | IOSTANDARD = "LVCMOS25";   // Connected to CPU
###NET  "fmc1_pg_m2c_i"                           LOC =  | IOSTANDARD = "LVCMOS25";   // Connected to CPU

# Trigger
# LA27_P
set_property PACKAGE_PIN R3 [get_ports fmc1_trig_dir_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_trig_dir_o]
# LA27_N
set_property PACKAGE_PIN R2 [get_ports fmc1_trig_term_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_trig_term_o]
# LA33_P
set_property PACKAGE_PIN U2 [get_ports fmc1_trig_val_p_b]
set_property IOSTANDARD BLVDS_25 [get_ports fmc1_trig_val_p_b]
# LA33_N
set_property PACKAGE_PIN U1 [get_ports fmc1_trig_val_n_b]
set_property IOSTANDARD BLVDS_25 [get_ports fmc1_trig_val_n_b]

# Si571 clock gen
# LA06_P
set_property PACKAGE_PIN L5 [get_ports fmc1_si571_scl_pad_b]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_si571_scl_pad_b]
# LA06_N
set_property PACKAGE_PIN K5 [get_ports fmc1_si571_sda_pad_b]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_si571_sda_pad_b]
# LA05_P
set_property PACKAGE_PIN H4 [get_ports fmc1_si571_oe_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_si571_oe_o]

# AD9510 clock distribution PLL
# HA21_P
set_property PACKAGE_PIN G24 [get_ports fmc1_spi_ad9510_cs_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_spi_ad9510_cs_o]
# HA22_P
set_property PACKAGE_PIN J24 [get_ports fmc1_spi_ad9510_sclk_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_spi_ad9510_sclk_o]
# HA21_N
set_property PACKAGE_PIN G25 [get_ports fmc1_spi_ad9510_mosi_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_spi_ad9510_mosi_o]
# HA23_P
set_property PACKAGE_PIN K23 [get_ports fmc1_spi_ad9510_miso_i]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_spi_ad9510_miso_i]
# HA18_N
set_property PACKAGE_PIN G27 [get_ports fmc1_pll_function_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_pll_function_o]
# HA18_P
set_property PACKAGE_PIN H27 [get_ports fmc1_pll_status_i]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_pll_status_i]

#NET "fmc1_fpga_clk_p_i"                        LOC = H7  | IOSTANDARD = "LVDS_25";  // CLK0_M2C_P
#NET "fmc1_fpga_clk_n_i"                        LOC = H6  | IOSTANDARD = "LVDS_25";  // CLK0_M2C_N

# Clock reference selection (TS3USB221)
# HA22_N
set_property PACKAGE_PIN H24 [get_ports fmc1_clk_sel_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_clk_sel_o]

## EEPROM (multiplexer PCA9548) (Connected to the CPU)
## FPGA I2C SCL
#set_property PACKAGE_PIN P6 [get_ports fmc1_eeprom_scl_pad_b]
#set_property IOSTANDARD LVCMOS25 [get_ports fmc1_eeprom_scl_pad_b]
## FPGA I2C SDA
#set_property PACKAGE_PIN R11 [get_ports fmc1_eeprom_sda_pad_b]
#set_property IOSTANDARD LVCMOS25 [get_ports fmc1_eeprom_sda_pad_b]

# AMC7823 monitor
# LA30_N
set_property PACKAGE_PIN M1 [get_ports fmc1_amc7823_spi_cs_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_amc7823_spi_cs_o]
# LA31_P
set_property PACKAGE_PIN U7 [get_ports fmc1_amc7823_spi_sclk_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_amc7823_spi_sclk_o]
# LA31_N
set_property PACKAGE_PIN U6 [get_ports fmc1_amc7823_spi_mosi_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_amc7823_spi_mosi_o]
# LA30_P
set_property PACKAGE_PIN N1 [get_ports fmc1_amc7823_spi_miso_i]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_amc7823_spi_miso_i]
# LA28_N
set_property PACKAGE_PIN T7 [get_ports fmc1_amc7823_davn_i]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_amc7823_davn_i]

# ISLA216P25 ADC control pins
# LA14_P
set_property PACKAGE_PIN H9 [get_ports fmc1_adc_spi_clk_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_adc_spi_clk_o]
## LA05_N
set_property PACKAGE_PIN H3 [get_ports fmc1_adc_spi_miso_i]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_adc_spi_miso_i]
# LA14_N
set_property PACKAGE_PIN H8 [get_ports fmc1_adc_spi_mosi_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_adc_spi_mosi_o]
# LA09_P
set_property PACKAGE_PIN J4 [get_ports fmc1_adc_spi_cs_adc0_n_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_adc_spi_cs_adc0_n_o]
# LA10_P
set_property PACKAGE_PIN H2 [get_ports fmc1_adc_spi_cs_adc1_n_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_adc_spi_cs_adc1_n_o]
# LA09_N
set_property PACKAGE_PIN J3 [get_ports fmc1_adc_spi_cs_adc2_n_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_adc_spi_cs_adc2_n_o]
# LA10_N
set_property PACKAGE_PIN G2 [get_ports fmc1_adc_spi_cs_adc3_n_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_adc_spi_cs_adc3_n_o]
# HA12_N
set_property PACKAGE_PIN G34 [get_ports fmc1_adc_sleep_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_adc_sleep_o]
# HA13_P
set_property PACKAGE_PIN K25 [get_ports fmc1_adc_ext_rst_n_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_adc_ext_rst_n_o]

# ISLA216P25 ADC synchronization
# LA32_P
set_property PACKAGE_PIN R1 [get_ports fmc1_adc_clk_div_rst_p_o]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_clk_div_rst_p_o]
# LA32_N
set_property PACKAGE_PIN P1 [get_ports fmc1_adc_clk_div_rst_n_o]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_clk_div_rst_n_o]

# LEDs
# LA29_P
set_property PACKAGE_PIN P9 [get_ports fmc1_led1_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_led1_o]
# LA24_N
set_property PACKAGE_PIN M10 [get_ports fmc1_led2_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_led2_o]
# LA24_P
set_property PACKAGE_PIN M11 [get_ports fmc1_led3_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc1_led3_o]

#######################################################################
##                      FMC Connector HPC2                           ##
#######################################################################

###NET  "fmc2_prsnt_i"                            LOC =  | IOSTANDARD = "LVCMOS25";   // Connected to CPU
###NET  "fmc2_pg_m2c_i"                           LOC =  | IOSTANDARD = "LVCMOS25";   // Connected to CPU

# Trigger
# LA27_P
set_property PACKAGE_PIN AA27 [get_ports fmc2_trig_dir_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_trig_dir_o]
# LA27_N
set_property PACKAGE_PIN AA28 [get_ports fmc2_trig_term_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_trig_term_o]
# LA33_P
set_property PACKAGE_PIN V33 [get_ports fmc2_trig_val_p_b]
set_property IOSTANDARD BLVDS_25 [get_ports fmc2_trig_val_p_b]
# LA33_N
set_property PACKAGE_PIN V34 [get_ports fmc2_trig_val_n_b]
set_property IOSTANDARD BLVDS_25 [get_ports fmc2_trig_val_n_b]

# Si571 clock gen
# LA06_P
set_property PACKAGE_PIN AE23 [get_ports fmc2_si571_scl_pad_b]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_si571_scl_pad_b]
# LA06_N
set_property PACKAGE_PIN AF23 [get_ports fmc2_si571_sda_pad_b]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_si571_sda_pad_b]
# LA05_P
set_property PACKAGE_PIN AH33 [get_ports fmc2_si571_oe_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_si571_oe_o]

# AD9510 clock distribution PLL
# HA21_P
set_property PACKAGE_PIN AP29 [get_ports fmc2_spi_ad9510_cs_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_spi_ad9510_cs_o]
# HA22_P
set_property PACKAGE_PIN AL34 [get_ports fmc2_spi_ad9510_sclk_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_spi_ad9510_sclk_o]
# HA21_N
set_property PACKAGE_PIN AP30 [get_ports fmc2_spi_ad9510_mosi_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_spi_ad9510_mosi_o]
# HA23_P
set_property PACKAGE_PIN AJ33 [get_ports fmc2_spi_ad9510_miso_i]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_spi_ad9510_miso_i]
# HA18_N
set_property PACKAGE_PIN AP33 [get_ports fmc2_pll_function_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_pll_function_o]
# HA18_P
set_property PACKAGE_PIN AN33 [get_ports fmc2_pll_status_i]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_pll_status_i]

#NET "fmc2_fpga_clk_p_i"                        LOC = H7  | IOSTANDARD = "LVDS_25";  // CLK0_M2C_P
#NET "fmc2_fpga_clk_n_i"                        LOC = H6  | IOSTANDARD = "LVDS_25";  // CLK0_M2C_N

# Clock reference selection (TS3USB221)
# HA22_N
set_property PACKAGE_PIN AM34 [get_ports fmc2_clk_sel_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_clk_sel_o]

## EEPROM (multiplexer PCA9548) (Connected to the CPU)
## FPGA I2C SCL
#set_property PACKAGE_PIN P6 [get_ports fmc2_eeprom_scl_pad_b]
#set_property IOSTANDARD LVCMOS25 [get_ports fmc2_eeprom_scl_pad_b]
## FPGA I2C SDA
#set_property PACKAGE_PIN R11 [get_ports fmc2_eeprom_sda_pad_b]
#set_property IOSTANDARD LVCMOS25 [get_ports fmc2_eeprom_sda_pad_b]

# AMC7823 monitor
# LA30_N
set_property PACKAGE_PIN W34 [get_ports fmc2_amc7823_spi_cs_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_amc7823_spi_cs_o]
# LA31_P
set_property PACKAGE_PIN V31 [get_ports fmc2_amc7823_spi_sclk_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_amc7823_spi_sclk_o]
# LA31_N
set_property PACKAGE_PIN V32 [get_ports fmc2_amc7823_spi_mosi_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_amc7823_spi_mosi_o]
# LA30_P
set_property PACKAGE_PIN W33 [get_ports fmc2_amc7823_spi_miso_i]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_amc7823_spi_miso_i]
# LA28_N
set_property PACKAGE_PIN W29 [get_ports fmc2_amc7823_davn_i]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_amc7823_davn_i]

# ISLA216P25 ADC control pins
# LA14_P
set_property PACKAGE_PIN AE33 [get_ports fmc2_adc_spi_clk_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_adc_spi_clk_o]
## LA05_N
set_property PACKAGE_PIN AH34 [get_ports fmc2_adc_spi_miso_i]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_adc_spi_miso_i]
# LA14_N
set_property PACKAGE_PIN AF33 [get_ports fmc2_adc_spi_mosi_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_adc_spi_mosi_o]
# LA09_P
set_property PACKAGE_PIN AF25 [get_ports fmc2_adc_spi_cs_adc0_n_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_adc_spi_cs_adc0_n_o]
# LA10_P
set_property PACKAGE_PIN AG32 [get_ports fmc2_adc_spi_cs_adc1_n_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_adc_spi_cs_adc1_n_o]
# LA09_N
set_property PACKAGE_PIN AG25 [get_ports fmc2_adc_spi_cs_adc2_n_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_adc_spi_cs_adc2_n_o]
# LA10_N
set_property PACKAGE_PIN AH32 [get_ports fmc2_adc_spi_cs_adc3_n_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_adc_spi_cs_adc3_n_o]
# HA12_N
set_property PACKAGE_PIN AN29 [get_ports fmc2_adc_sleep_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_adc_sleep_o]
# HA13_P
set_property PACKAGE_PIN AN28 [get_ports fmc2_adc_ext_rst_n_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_adc_ext_rst_n_o]

# ISLA216P25 ADC synchronization
# LA32_P
set_property PACKAGE_PIN AA34 [get_ports fmc2_adc_clk_div_rst_p_o]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_clk_div_rst_p_o]
# LA32_N
set_property PACKAGE_PIN AB34 [get_ports fmc2_adc_clk_div_rst_n_o]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_clk_div_rst_n_o]

# LEDs
# LA29_P
set_property PACKAGE_PIN AC33 [get_ports fmc2_led1_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_led1_o]
# LA24_N
set_property PACKAGE_PIN Y33 [get_ports fmc2_led2_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_led2_o]
# LA24_P
set_property PACKAGE_PIN Y32 [get_ports fmc2_led3_o]
set_property IOSTANDARD LVCMOS25 [get_ports fmc2_led3_o]

#######################################################################
##                       FMC Connector HPC1                           #
##                         ISLA ADC lines                             #
#######################################################################

# ADC0
# HB06_CC_P
set_property PACKAGE_PIN V4 [get_ports fmc1_adc_clk0_p_i]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_clk0_p_i]
# HB06_CC_N
set_property PACKAGE_PIN W4 [get_ports fmc1_adc_clk0_n_i]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_clk0_n_i]

# HB00_CC_P
set_property PACKAGE_PIN W5 [get_ports fmc1_adc_data_ch0_p_i[0]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch0_p_i[0]]
# HB00_CC_N
set_property PACKAGE_PIN Y5 [get_ports fmc1_adc_data_ch0_n_i[0]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch0_n_i[0]]
# HB11_P
set_property PACKAGE_PIN W1 [get_ports fmc1_adc_data_ch0_p_i[1]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch0_p_i[1]]
# HB11_N
set_property PACKAGE_PIN Y1 [get_ports fmc1_adc_data_ch0_n_i[1]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch0_n_i[1]]
# HB12_P
set_property PACKAGE_PIN AC7 [get_ports fmc1_adc_data_ch0_p_i[2]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch0_p_i[2]]
# HB12_N
set_property PACKAGE_PIN AC6 [get_ports fmc1_adc_data_ch0_n_i[2]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch0_n_i[2]]
# HB10_P
set_property PACKAGE_PIN V7 [get_ports fmc1_adc_data_ch0_p_i[3]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch0_p_i[3]]
# HB10_N
set_property PACKAGE_PIN V6 [get_ports fmc1_adc_data_ch0_n_i[3]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch0_n_i[3]]
# HB15_P
set_property PACKAGE_PIN AC9 [get_ports fmc1_adc_data_ch0_p_i[4]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch0_p_i[4]]
# HB15_N
set_property PACKAGE_PIN AC8 [get_ports fmc1_adc_data_ch0_n_i[4]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch0_n_i[4]]
# HB14_P
set_property PACKAGE_PIN AC2 [get_ports fmc1_adc_data_ch0_p_i[5]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch0_p_i[5]]
# HB14_N
set_property PACKAGE_PIN AC1 [get_ports fmc1_adc_data_ch0_n_i[5]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch0_n_i[5]]
# HB18_P
set_property PACKAGE_PIN AB7 [get_ports fmc1_adc_data_ch0_p_i[6]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch0_p_i[6]]
# HB18_N
set_property PACKAGE_PIN AB6 [get_ports fmc1_adc_data_ch0_n_i[6]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch0_n_i[6]]
# HB17_CC_P
set_property PACKAGE_PIN AA5 [get_ports fmc1_adc_data_ch0_p_i[7]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch0_p_i[7]]
# HB17_CC_N
set_property PACKAGE_PIN AA4 [get_ports fmc1_adc_data_ch0_n_i[7]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch0_n_i[7]]

# ADC1
# LA18_CC_P
set_property PACKAGE_PIN P4 [get_ports fmc1_adc_clk1_p_i]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_clk1_p_i]
# LA18_CC_N
set_property PACKAGE_PIN P3 [get_ports fmc1_adc_clk1_n_i]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_clk1_n_i]

# LA17_CC_P
set_property PACKAGE_PIN T5 [get_ports fmc1_adc_data_ch1_p_i[0]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch1_p_i[0]]
# LA17_CC_N
set_property PACKAGE_PIN T4 [get_ports fmc1_adc_data_ch1_n_i[0]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch1_n_i[0]]
# LA20_P
set_property PACKAGE_PIN R10 [get_ports fmc1_adc_data_ch1_p_i[1]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch1_p_i[1]]
# LA20_N
set_property PACKAGE_PIN P10 [get_ports fmc1_adc_data_ch1_n_i[1]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch1_n_i[1]]
# LA23_P
set_property PACKAGE_PIN N3 [get_ports fmc1_adc_data_ch1_p_i[2]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch1_p_i[2]]
# LA23_N
set_property PACKAGE_PIN N2 [get_ports fmc1_adc_data_ch1_n_i[2]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch1_n_i[2]]
# LA19_P
set_property PACKAGE_PIN U5 [get_ports fmc1_adc_data_ch1_p_i[3]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch1_p_i[3]]
# LA19_N
set_property PACKAGE_PIN U4 [get_ports fmc1_adc_data_ch1_n_i[3]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch1_n_i[3]]
# LA22_P
set_property PACKAGE_PIN M5 [get_ports fmc1_adc_data_ch1_p_i[4]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch1_p_i[4]]
# LA22_N
set_property PACKAGE_PIN M4 [get_ports fmc1_adc_data_ch1_n_i[4]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch1_n_i[4]]
# LA21_P
set_property PACKAGE_PIN M7 [get_ports fmc1_adc_data_ch1_p_i[5]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch1_p_i[5]]
# LA21_N
set_property PACKAGE_PIN M6 [get_ports fmc1_adc_data_ch1_n_i[5]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch1_n_i[5]]
# LA25_P
set_property PACKAGE_PIN N8 [get_ports fmc1_adc_data_ch1_p_i[6]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch1_p_i[6]]
# LA25_N
set_property PACKAGE_PIN N7 [get_ports fmc1_adc_data_ch1_n_i[6]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch1_n_i[6]]
# LA26_P
set_property PACKAGE_PIN T3 [get_ports fmc1_adc_data_ch1_p_i[7]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch1_p_i[7]]
# LA26_N
set_property PACKAGE_PIN T2 [get_ports fmc1_adc_data_ch1_n_i[7]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch1_n_i[7]]

# ADC2
# LA01_CC_P
set_property PACKAGE_PIN J6 [get_ports fmc1_adc_clk2_p_i]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_clk2_p_i]
# LA01_CC_N
set_property PACKAGE_PIN J5 [get_ports fmc1_adc_clk2_n_i]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_clk2_n_i]

# LA04_P
set_property PACKAGE_PIN K1 [get_ports fmc1_adc_data_ch2_p_i[0]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch2_p_i[0]]
# LA04_N
set_property PACKAGE_PIN J1 [get_ports fmc1_adc_data_ch2_n_i[0]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch2_n_i[0]]
# LA03_P
set_property PACKAGE_PIN H1 [get_ports fmc1_adc_data_ch2_p_i[1]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch2_p_i[1]]
# LA03_N
set_property PACKAGE_PIN G1 [get_ports fmc1_adc_data_ch2_n_i[1]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch2_n_i[1]]
# LA08_P
set_property PACKAGE_PIN F3 [get_ports fmc1_adc_data_ch2_p_i[2]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch2_p_i[2]]
# LA08_N
set_property PACKAGE_PIN F2 [get_ports fmc1_adc_data_ch2_n_i[2]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch2_n_i[2]]
# LA07_P
set_property PACKAGE_PIN K3 [get_ports fmc1_adc_data_ch2_p_i[3]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch2_p_i[3]]
# LA07_N
set_property PACKAGE_PIN K2 [get_ports fmc1_adc_data_ch2_n_i[3]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch2_n_i[3]]
# LA12_P
set_property PACKAGE_PIN L8 [get_ports fmc1_adc_data_ch2_p_i[4]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch2_p_i[4]]
# LA12_N
set_property PACKAGE_PIN K8 [get_ports fmc1_adc_data_ch2_n_i[4]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch2_n_i[4]]
# LA13_P
set_property PACKAGE_PIN G10 [get_ports fmc1_adc_data_ch2_p_i[5]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch2_p_i[5]]
# LA13_N
set_property PACKAGE_PIN G9 [get_ports fmc1_adc_data_ch2_n_i[5]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch2_n_i[5]]
# LA11_P
set_property PACKAGE_PIN M2 [get_ports fmc1_adc_data_ch2_p_i[6]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch2_p_i[6]]
# LA11_N
set_property PACKAGE_PIN L2 [get_ports fmc1_adc_data_ch2_n_i[6]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch2_n_i[6]]
# LA16_P
set_property PACKAGE_PIN L10 [get_ports fmc1_adc_data_ch2_p_i[7]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch2_p_i[7]]
# LA16_N
set_property PACKAGE_PIN L9 [get_ports fmc1_adc_data_ch2_n_i[7]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch2_n_i[7]]

# ADC3
# HA00_CC_P
set_property PACKAGE_PIN J29 [get_ports fmc1_adc_clk3_p_i]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_clk3_p_i]
# HA00_CC_N
set_property PACKAGE_PIN H29 [get_ports fmc1_adc_clk3_n_i]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_clk3_n_i]

# HA01_CC_P
set_property PACKAGE_PIN L28 [get_ports fmc1_adc_data_ch3_p_i[0]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch3_p_i[0]]
# HA01_CC_N
set_property PACKAGE_PIN K28 [get_ports fmc1_adc_data_ch3_n_i[0]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch3_n_i[0]]
# HA04_P
set_property PACKAGE_PIN L33 [get_ports fmc1_adc_data_ch3_p_i[1]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch3_p_i[1]]
# HA04_N
set_property PACKAGE_PIN L34 [get_ports fmc1_adc_data_ch3_n_i[1]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch3_n_i[1]]
# HA05_P
set_property PACKAGE_PIN J33 [get_ports fmc1_adc_data_ch3_p_i[2]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch3_p_i[2]]
# HA05_N
set_property PACKAGE_PIN H34 [get_ports fmc1_adc_data_ch3_n_i[2]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch3_n_i[2]]
# HA09_P
set_property PACKAGE_PIN K31 [get_ports fmc1_adc_data_ch3_p_i[3]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch3_p_i[3]]
# HA09_N
set_property PACKAGE_PIN J31 [get_ports fmc1_adc_data_ch3_n_i[3]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch3_n_i[3]]
# HA03_P
set_property PACKAGE_PIN K30 [get_ports fmc1_adc_data_ch3_p_i[4]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch3_p_i[4]]
# HA03_N
set_property PACKAGE_PIN J30 [get_ports fmc1_adc_data_ch3_n_i[4]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch3_n_i[4]]
# HA02_P
set_property PACKAGE_PIN K33 [get_ports fmc1_adc_data_ch3_p_i[5]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch3_p_i[5]]
# HA02_N
set_property PACKAGE_PIN J34 [get_ports fmc1_adc_data_ch3_n_i[5]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch3_n_i[5]]
# HA07_P
set_property PACKAGE_PIN L32 [get_ports fmc1_adc_data_ch3_p_i[6]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch3_p_i[6]]
# HA07_N
set_property PACKAGE_PIN K32 [get_ports fmc1_adc_data_ch3_n_i[6]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch3_n_i[6]]
# HA06_P
set_property PACKAGE_PIN L27 [get_ports fmc1_adc_data_ch3_p_i[7]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch3_p_i[7]]
# HA06_N
set_property PACKAGE_PIN K27 [get_ports fmc1_adc_data_ch3_n_i[7]]
set_property IOSTANDARD LVDS_25 [get_ports fmc1_adc_data_ch3_n_i[7]]

#######################################################################
##                       FMC Connector HPC2                           #
##                         ISLA ADC lines                             #
#######################################################################

# ADC0
# HB06_CC_P
set_property PACKAGE_PIN R30 [get_ports fmc2_adc_clk0_p_i]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_clk0_p_i]
# HB06_CC_N
set_property PACKAGE_PIN P30 [get_ports fmc2_adc_clk0_n_i]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_clk0_n_i]

# HB00_CC_P
set_property PACKAGE_PIN U29 [get_ports fmc2_adc_data_ch0_p_i[0]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch0_p_i[0]]
# HB00_CC_N
set_property PACKAGE_PIN T29 [get_ports fmc2_adc_data_ch0_n_i[0]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch0_n_i[0]]
# HB11_P
set_property PACKAGE_PIN T27 [get_ports fmc2_adc_data_ch0_p_i[1]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch0_p_i[1]]
# HB11_N
set_property PACKAGE_PIN R27 [get_ports fmc2_adc_data_ch0_n_i[1]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch0_n_i[1]]
# HB12_P
set_property PACKAGE_PIN N31 [get_ports fmc2_adc_data_ch0_p_i[2]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch0_p_i[2]]
# HB12_N
set_property PACKAGE_PIN M32 [get_ports fmc2_adc_data_ch0_n_i[2]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch0_n_i[2]]
# HB10_P
set_property PACKAGE_PIN U25 [get_ports fmc2_adc_data_ch0_p_i[3]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch0_p_i[3]]
# HB10_N
set_property PACKAGE_PIN T25 [get_ports fmc2_adc_data_ch0_n_i[3]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch0_n_i[3]]
# HB15_P
set_property PACKAGE_PIN U30 [get_ports fmc2_adc_data_ch0_p_i[4]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch0_p_i[4]]
# HB15_N
set_property PACKAGE_PIN T30 [get_ports fmc2_adc_data_ch0_n_i[4]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch0_n_i[4]]
# HB14_P
set_property PACKAGE_PIN R31 [get_ports fmc2_adc_data_ch0_p_i[5]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch0_p_i[5]]
# HB14_N
set_property PACKAGE_PIN P31 [get_ports fmc2_adc_data_ch0_n_i[5]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch0_n_i[5]]
# HB18_P
set_property PACKAGE_PIN N29 [get_ports fmc2_adc_data_ch0_p_i[6]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch0_p_i[6]]
# HB18_N
set_property PACKAGE_PIN M29 [get_ports fmc2_adc_data_ch0_n_i[6]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch0_n_i[6]]
# HB17_CC_P
set_property PACKAGE_PIN P28 [get_ports fmc2_adc_data_ch0_p_i[7]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch0_p_i[7]]
# HB17_CC_N
set_property PACKAGE_PIN P29 [get_ports fmc2_adc_data_ch0_n_i[7]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch0_n_i[7]]

# ADC1
# LA18_CC_P
set_property PACKAGE_PIN W30 [get_ports fmc2_adc_clk1_p_i]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_clk1_p_i]
# LA18_CC_N
set_property PACKAGE_PIN W31 [get_ports fmc2_adc_clk1_n_i]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_clk1_n_i]

# LA17_CC_P
set_property PACKAGE_PIN AB31 [get_ports fmc2_adc_data_ch1_p_i[0]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch1_p_i[0]]
# LA17_CC_N
set_property PACKAGE_PIN AB32 [get_ports fmc2_adc_data_ch1_n_i[0]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch1_n_i[0]]
# LA20_P
set_property PACKAGE_PIN AB24 [get_ports fmc2_adc_data_ch1_p_i[1]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch1_p_i[1]]
# LA20_N
set_property PACKAGE_PIN AB25 [get_ports fmc2_adc_data_ch1_n_i[1]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch1_n_i[1]]
# LA23_P
set_property PACKAGE_PIN W25 [get_ports fmc2_adc_data_ch1_p_i[2]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch1_p_i[2]]
# LA23_N
set_property PACKAGE_PIN Y25 [get_ports fmc2_adc_data_ch1_n_i[2]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch1_n_i[2]]
# LA19_P
set_property PACKAGE_PIN AB26 [get_ports fmc2_adc_data_ch1_p_i[3]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch1_p_i[3]]
# LA19_N
set_property PACKAGE_PIN AB27 [get_ports fmc2_adc_data_ch1_n_i[3]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch1_n_i[3]]
# LA22_P
set_property PACKAGE_PIN AA24 [get_ports fmc2_adc_data_ch1_p_i[4]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch1_p_i[4]]
# LA22_N
set_property PACKAGE_PIN AA25 [get_ports fmc2_adc_data_ch1_n_i[4]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch1_n_i[4]]
# LA21_P
set_property PACKAGE_PIN AA32 [get_ports fmc2_adc_data_ch1_p_i[5]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch1_p_i[5]]
# LA21_N
set_property PACKAGE_PIN AA33 [get_ports fmc2_adc_data_ch1_n_i[5]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch1_n_i[5]]
# LA25_P
set_property PACKAGE_PIN AA29 [get_ports fmc2_adc_data_ch1_p_i[6]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch1_p_i[6]]
# LA25_N
set_property PACKAGE_PIN AB29 [get_ports fmc2_adc_data_ch1_n_i[6]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch1_n_i[6]]
# LA26_P
set_property PACKAGE_PIN AC31 [get_ports fmc2_adc_data_ch1_p_i[7]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch1_p_i[7]]
# LA26_N
set_property PACKAGE_PIN AC32 [get_ports fmc2_adc_data_ch1_n_i[7]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch1_n_i[7]]

# ADC2
# LA01_CC_P
set_property PACKAGE_PIN AF29 [get_ports fmc2_adc_clk2_p_i]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_clk2_p_i]
# LA01_CC_N
set_property PACKAGE_PIN AF30 [get_ports fmc2_adc_clk2_n_i]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_clk2_n_i]

# LA04_P
set_property PACKAGE_PIN AC26 [get_ports fmc2_adc_data_ch2_p_i[0]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch2_p_i[0]]
# LA04_N
set_property PACKAGE_PIN AC27 [get_ports fmc2_adc_data_ch2_n_i[0]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch2_n_i[0]]
# LA03_P
set_property PACKAGE_PIN AG24 [get_ports fmc2_adc_data_ch2_p_i[1]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch2_p_i[1]]
# LA03_N
set_property PACKAGE_PIN AH24 [get_ports fmc2_adc_data_ch2_n_i[1]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch2_n_i[1]]
# LA08_P
set_property PACKAGE_PIN AD25 [get_ports fmc2_adc_data_ch2_p_i[2]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch2_p_i[2]]
# LA08_N
set_property PACKAGE_PIN AE25 [get_ports fmc2_adc_data_ch2_n_i[2]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch2_n_i[2]]
# LA07_P
set_property PACKAGE_PIN AG27 [get_ports fmc2_adc_data_ch2_p_i[3]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch2_p_i[3]]
# LA07_N
set_property PACKAGE_PIN AH27 [get_ports fmc2_adc_data_ch2_n_i[3]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch2_n_i[3]]
# LA12_P
set_property PACKAGE_PIN AE27 [get_ports fmc2_adc_data_ch2_p_i[4]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch2_p_i[4]]
# LA12_N
set_property PACKAGE_PIN AF27 [get_ports fmc2_adc_data_ch2_n_i[4]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch2_n_i[4]]
# LA13_P
set_property PACKAGE_PIN AF34 [get_ports fmc2_adc_data_ch2_p_i[5]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch2_p_i[5]]
# LA13_N
set_property PACKAGE_PIN AG34 [get_ports fmc2_adc_data_ch2_n_i[5]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch2_n_i[5]]
# LA11_P
set_property PACKAGE_PIN AD30 [get_ports fmc2_adc_data_ch2_p_i[6]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch2_p_i[6]]
# LA11_N
set_property PACKAGE_PIN AE30 [get_ports fmc2_adc_data_ch2_n_i[6]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch2_n_i[6]]
# LA16_P
set_property PACKAGE_PIN AD33 [get_ports fmc2_adc_data_ch2_p_i[7]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch2_p_i[7]]
# LA16_N
set_property PACKAGE_PIN AD34 [get_ports fmc2_adc_data_ch2_n_i[7]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch2_n_i[7]]

# ADC3
# HA00_CC_P
set_property PACKAGE_PIN AL30 [get_ports fmc2_adc_clk3_p_i]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_clk3_p_i]
# HA00_CC_N
set_property PACKAGE_PIN AM30 [get_ports fmc2_adc_clk3_n_i]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_clk3_n_i]

# HA01_CC_P
set_property PACKAGE_PIN AL28 [get_ports fmc2_adc_data_ch3_p_i[0]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch3_p_i[0]]
# HA01_CC_N
set_property PACKAGE_PIN AL29 [get_ports fmc2_adc_data_ch3_n_i[0]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch3_n_i[0]]
# HA04_P
set_property PACKAGE_PIN AJ25 [get_ports fmc2_adc_data_ch3_p_i[1]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch3_p_i[1]]
# HA04_N
set_property PACKAGE_PIN AK25 [get_ports fmc2_adc_data_ch3_n_i[1]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch3_n_i[1]]
# HA05_P
set_property PACKAGE_PIN AL25 [get_ports fmc2_adc_data_ch3_p_i[2]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch3_p_i[2]]
# HA05_N
set_property PACKAGE_PIN AM25 [get_ports fmc2_adc_data_ch3_n_i[2]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch3_n_i[2]]
# HA09_P
set_property PACKAGE_PIN AJ26 [get_ports fmc2_adc_data_ch3_p_i[3]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch3_p_i[3]]
# HA09_N
set_property PACKAGE_PIN AK26 [get_ports fmc2_adc_data_ch3_n_i[3]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch3_n_i[3]]
# HA03_P
set_property PACKAGE_PIN AM26 [get_ports fmc2_adc_data_ch3_p_i[4]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch3_p_i[4]]
# HA03_N
set_property PACKAGE_PIN AN26 [get_ports fmc2_adc_data_ch3_n_i[4]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch3_n_i[4]]
# HA02_P
set_property PACKAGE_PIN AN31 [get_ports fmc2_adc_data_ch3_p_i[5]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch3_p_i[5]]
# HA02_N
set_property PACKAGE_PIN AP31 [get_ports fmc2_adc_data_ch3_n_i[5]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch3_n_i[5]]
# HA07_P
set_property PACKAGE_PIN AM31 [get_ports fmc2_adc_data_ch3_p_i[6]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch3_p_i[6]]
# HA07_N
set_property PACKAGE_PIN AN32 [get_ports fmc2_adc_data_ch3_n_i[6]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch3_n_i[6]]
# HA06_P
set_property PACKAGE_PIN AL32 [get_ports fmc2_adc_data_ch3_p_i[7]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch3_p_i[7]]
# HA06_N
set_property PACKAGE_PIN AM32 [get_ports fmc2_adc_data_ch3_n_i[7]]
set_property IOSTANDARD LVDS_25 [get_ports fmc2_adc_data_ch3_n_i[7]]

#######################################################################
##                         DIFF TERM                                 ##
#######################################################################

set_property DIFF_TERM TRUE [get_ports fmc1_trig_val_p_b]
set_property DIFF_TERM TRUE [get_ports fmc1_trig_val_n_b]

set_property DIFF_TERM TRUE [get_ports fmc2_trig_val_p_b]
set_property DIFF_TERM TRUE [get_ports fmc2_trig_val_n_b]

set_property DIFF_TERM TRUE [get_ports fmc1_fpga_clk_p_i]
set_property DIFF_TERM TRUE [get_ports fmc1_fpga_clk_n_i]

set_property DIFF_TERM TRUE [get_ports fmc2_fpga_clk_p_i]
set_property DIFF_TERM TRUE [get_ports fmc2_fpga_clk_n_i]

# ISLA clock dividers
set_property DIFF_TERM TRUE [get_ports fmc1_adc_clk_div_rst_p_o]
set_property DIFF_TERM TRUE [get_ports fmc1_adc_clk_div_rst_n_o]

set_property DIFF_TERM TRUE [get_ports fmc2_adc_clk_div_rst_p_o]
set_property DIFF_TERM TRUE [get_ports fmc2_adc_clk_div_rst_n_o]

# ISLA clocks
set_property DIFF_TERM TRUE [get_ports fmc1_adc_clk0_p_i]
set_property DIFF_TERM TRUE [get_ports fmc1_adc_clk0_n_i]

set_property DIFF_TERM TRUE [get_ports fmc1_adc_clk1_p_i]
set_property DIFF_TERM TRUE [get_ports fmc1_adc_clk1_n_i]

set_property DIFF_TERM TRUE [get_ports fmc1_adc_clk2_p_i]
set_property DIFF_TERM TRUE [get_ports fmc1_adc_clk2_n_i]

set_property DIFF_TERM TRUE [get_ports fmc1_adc_clk3_p_i]
set_property DIFF_TERM TRUE [get_ports fmc1_adc_clk3_n_i]

set_property DIFF_TERM TRUE [get_ports fmc2_adc_clk0_p_i]
set_property DIFF_TERM TRUE [get_ports fmc2_adc_clk0_n_i]

set_property DIFF_TERM TRUE [get_ports fmc2_adc_clk1_p_i]
set_property DIFF_TERM TRUE [get_ports fmc2_adc_clk1_n_i]

set_property DIFF_TERM TRUE [get_ports fmc2_adc_clk2_p_i]
set_property DIFF_TERM TRUE [get_ports fmc2_adc_clk2_n_i]

set_property DIFF_TERM TRUE [get_ports fmc2_adc_clk3_p_i]
set_property DIFF_TERM TRUE [get_ports fmc2_adc_clk3_n_i]

# ISLA data
set_property DIFF_TERM TRUE [get_ports fmc1_adc_data_ch0_p_i[*]]
set_property DIFF_TERM TRUE [get_ports fmc1_adc_data_ch0_n_i[*]]

set_property DIFF_TERM TRUE [get_ports fmc1_adc_data_ch1_p_i[*]]
set_property DIFF_TERM TRUE [get_ports fmc1_adc_data_ch1_n_i[*]]

set_property DIFF_TERM TRUE [get_ports fmc1_adc_data_ch2_p_i[*]]
set_property DIFF_TERM TRUE [get_ports fmc1_adc_data_ch2_n_i[*]]

set_property DIFF_TERM TRUE [get_ports fmc1_adc_data_ch3_p_i[*]]
set_property DIFF_TERM TRUE [get_ports fmc1_adc_data_ch3_n_i[*]]

set_property DIFF_TERM TRUE [get_ports fmc2_adc_data_ch0_p_i[*]]
set_property DIFF_TERM TRUE [get_ports fmc2_adc_data_ch0_n_i[*]]

set_property DIFF_TERM TRUE [get_ports fmc2_adc_data_ch1_p_i[*]]
set_property DIFF_TERM TRUE [get_ports fmc2_adc_data_ch1_n_i[*]]

set_property DIFF_TERM TRUE [get_ports fmc2_adc_data_ch2_p_i[*]]
set_property DIFF_TERM TRUE [get_ports fmc2_adc_data_ch2_n_i[*]]

set_property DIFF_TERM TRUE [get_ports fmc2_adc_data_ch3_p_i[*]]
set_property DIFF_TERM TRUE [get_ports fmc2_adc_data_ch3_n_i[*]]

#######################################################################
##                    Timing constraints                             ##
#######################################################################

# Overrides default_delay hdl parameter for the VARIABLE mode.
# For Artix7: Average Tap Delay at 200 MHz = 78 ps, at 300 MHz = 52 ps ???
set_property IDELAY_VALUE 21 [get_cells -hier -filter {NAME =~ *cmp1_xwb_fmc250m_4ch/cmp_wb_fmc250m_4ch/cmp_fmc_adc_iface/gen_adc_data_chains[0].gen_adc_data_chains_check.cmp_fmc_adc_data/gen_adc_data[*].gen_adc_data_7series_iodelay.gen_adc_data_var_loadable_iodelay.cmp_adc_data_iodelay}]
set_property IDELAY_VALUE 22 [get_cells -hier -filter {NAME =~ *cmp2_xwb_fmc250m_4ch/cmp_wb_fmc250m_4ch/cmp_fmc_adc_iface/gen_adc_data_chains[0].gen_adc_data_chains_check.cmp_fmc_adc_data/gen_adc_data[*].gen_adc_data_7series_iodelay.gen_adc_data_var_loadable_iodelay.cmp_adc_data_iodelay}]
set_property IDELAY_VALUE 23 [get_cells -hier -filter {NAME =~ *cmp1_xwb_fmc250m_4ch/cmp_wb_fmc250m_4ch/cmp_fmc_adc_iface/gen_adc_data_chains[1].gen_adc_data_chains_check.cmp_fmc_adc_data/gen_adc_data[*].gen_adc_data_7series_iodelay.gen_adc_data_var_loadable_iodelay.cmp_adc_data_iodelay}]
set_property IDELAY_VALUE 21 [get_cells -hier -filter {NAME =~ *cmp2_xwb_fmc250m_4ch/cmp_wb_fmc250m_4ch/cmp_fmc_adc_iface/gen_adc_data_chains[1].gen_adc_data_chains_check.cmp_fmc_adc_data/gen_adc_data[*].gen_adc_data_7series_iodelay.gen_adc_data_var_loadable_iodelay.cmp_adc_data_iodelay}]
set_property IDELAY_VALUE 20 [get_cells -hier -filter {NAME =~ *cmp1_xwb_fmc250m_4ch/cmp_wb_fmc250m_4ch/cmp_fmc_adc_iface/gen_adc_data_chains[2].gen_adc_data_chains_check.cmp_fmc_adc_data/gen_adc_data[*].gen_adc_data_7series_iodelay.gen_adc_data_var_loadable_iodelay.cmp_adc_data_iodelay}]
set_property IDELAY_VALUE 22 [get_cells -hier -filter {NAME =~ *cmp2_xwb_fmc250m_4ch/cmp_wb_fmc250m_4ch/cmp_fmc_adc_iface/gen_adc_data_chains[2].gen_adc_data_chains_check.cmp_fmc_adc_data/gen_adc_data[*].gen_adc_data_7series_iodelay.gen_adc_data_var_loadable_iodelay.cmp_adc_data_iodelay}]
set_property IDELAY_VALUE 23 [get_cells -hier -filter {NAME =~ *cmp1_xwb_fmc250m_4ch/cmp_wb_fmc250m_4ch/cmp_fmc_adc_iface/gen_adc_data_chains[3].gen_adc_data_chains_check.cmp_fmc_adc_data/gen_adc_data[*].gen_adc_data_7series_iodelay.gen_adc_data_var_loadable_iodelay.cmp_adc_data_iodelay}]
set_property IDELAY_VALUE 21 [get_cells -hier -filter {NAME =~ *cmp2_xwb_fmc250m_4ch/cmp_wb_fmc250m_4ch/cmp_fmc_adc_iface/gen_adc_data_chains[3].gen_adc_data_chains_check.cmp_fmc_adc_data/gen_adc_data[*].gen_adc_data_7series_iodelay.gen_adc_data_var_loadable_iodelay.cmp_adc_data_iodelay}]

# Overrides default_delay hdl parameter
set_property IDELAY_VALUE 0 [get_cells -hier -filter {NAME =~ *cmp1_xwb_fmc250m_4ch/cmp_wb_fmc250m_4ch/cmp_fmc_adc_iface/gen_clock_chains[0].gen_clock_chains_check.cmp_fmc_adc_clk/gen_adc_clk_7series_iodelay.gen_adc_clk_var_load_iodelay.cmp_ibufds_clk_iodelay}]
set_property IDELAY_VALUE 0 [get_cells -hier -filter {NAME =~ *cmp2_xwb_fmc250m_4ch/cmp_wb_fmc250m_4ch/cmp_fmc_adc_iface/gen_clock_chains[0].gen_clock_chains_check.cmp_fmc_adc_clk/gen_adc_clk_7series_iodelay.gen_adc_clk_var_load_iodelay.cmp_ibufds_clk_iodelay}]
set_property IDELAY_VALUE 0 [get_cells -hier -filter {NAME =~ *cmp1_xwb_fmc250m_4ch/cmp_wb_fmc250m_4ch/cmp_fmc_adc_iface/gen_clock_chains[1].gen_clock_chains_check.cmp_fmc_adc_clk/gen_adc_clk_7series_iodelay.gen_adc_clk_var_load_iodelay.cmp_ibufds_clk_iodelay}]
set_property IDELAY_VALUE 0 [get_cells -hier -filter {NAME =~ *cmp2_xwb_fmc250m_4ch/cmp_wb_fmc250m_4ch/cmp_fmc_adc_iface/gen_clock_chains[1].gen_clock_chains_check.cmp_fmc_adc_clk/gen_adc_clk_7series_iodelay.gen_adc_clk_var_load_iodelay.cmp_ibufds_clk_iodelay}]
set_property IDELAY_VALUE 0 [get_cells -hier -filter {NAME =~ *cmp1_xwb_fmc250m_4ch/cmp_wb_fmc250m_4ch/cmp_fmc_adc_iface/gen_clock_chains[2].gen_clock_chains_check.cmp_fmc_adc_clk/gen_adc_clk_7series_iodelay.gen_adc_clk_var_load_iodelay.cmp_ibufds_clk_iodelay}]
set_property IDELAY_VALUE 0 [get_cells -hier -filter {NAME =~ *cmp2_xwb_fmc250m_4ch/cmp_wb_fmc250m_4ch/cmp_fmc_adc_iface/gen_clock_chains[2].gen_clock_chains_check.cmp_fmc_adc_clk/gen_adc_clk_7series_iodelay.gen_adc_clk_var_load_iodelay.cmp_ibufds_clk_iodelay}]
set_property IDELAY_VALUE 0 [get_cells -hier -filter {NAME =~ *cmp1_xwb_fmc250m_4ch/cmp_wb_fmc250m_4ch/cmp_fmc_adc_iface/gen_clock_chains[3].gen_clock_chains_check.cmp_fmc_adc_clk/gen_adc_clk_7series_iodelay.gen_adc_clk_var_load_iodelay.cmp_ibufds_clk_iodelay}]
set_property IDELAY_VALUE 0 [get_cells -hier -filter {NAME =~ *cmp2_xwb_fmc250m_4ch/cmp_wb_fmc250m_4ch/cmp_fmc_adc_iface/gen_clock_chains[3].gen_clock_chains_check.cmp_fmc_adc_clk/gen_adc_clk_7series_iodelay.gen_adc_clk_var_load_iodelay.cmp_ibufds_clk_iodelay}]

#######################################################################
##                          Clocks                                   ##
#######################################################################

# Clock aux
set clk_aux_period_double                          [expr $clk_aux_period * 2.000]

# DDR3 clock generated by IP
set clk_pll_ddr_period                             [get_property PERIOD [get_clocks clk_pll_i]]
set clk_pll_ddr_period_less                        [expr $clk_pll_ddr_period - 1.000]

# PCIE clock generated by IP
set clk_125mhz_period                             [get_property PERIOD [get_clocks clk_125mhz]]

# real jitter is about 22ps peak-to-peak
create_clock -period 4.500 -name fmc1_adc_clk0_p_i [get_ports fmc1_adc_clk0_p_i]
set_input_jitter fmc1_adc_clk0_p_i 0.050
create_clock -period 4.500 -name fmc2_adc_clk0_p_i [get_ports fmc2_adc_clk0_p_i]
set_input_jitter fmc2_adc_clk0_p_i 0.050

create_clock -period 4.500 -name fmc1_adc_clk1_p_i [get_ports fmc1_adc_clk1_p_i]
set_input_jitter fmc1_adc_clk1_p_i 0.050
create_clock -period 4.500 -name fmc2_adc_clk1_p_i [get_ports fmc2_adc_clk1_p_i]
set_input_jitter fmc2_adc_clk1_p_i 0.050

create_clock -period 4.500 -name fmc1_adc_clk2_p_i [get_ports fmc1_adc_clk2_p_i]
set_input_jitter fmc1_adc_clk2_p_i 0.050
create_clock -period 4.500 -name fmc2_adc_clk2_p_i [get_ports fmc2_adc_clk2_p_i]
set_input_jitter fmc2_adc_clk2_p_i 0.050

create_clock -period 4.500 -name fmc1_adc_clk3_p_i [get_ports fmc1_adc_clk3_p_i]
set_input_jitter fmc1_adc_clk3_p_i 0.050
create_clock -period 4.500 -name fmc2_adc_clk3_p_i [get_ports fmc2_adc_clk3_p_i]
set_input_jitter fmc2_adc_clk3_p_i 0.050

# ADC generated clocks
create_generated_clock -name fmc1_ref_clk          [get_pins -hier -filter {NAME =~ *cmp1_xwb_fmc*cmp_mmcm_adc_clk/CLKOUT0}]
set fmc1_ref_clk_period                            [get_property PERIOD [get_clocks fmc1_ref_clk]]
set fmc1_ref_clk_period_double                     [expr $fmc1_ref_clk_period * 2.000]
create_generated_clock -name fmc1_ref_clk_2x       [get_pins -hier -filter {NAME =~ *cmp1_xwb_fmc*cmp_mmcm_adc_clk/CLKOUT1}]
set fmc1_ref_clk_2x_period                         [get_property PERIOD [get_clocks fmc1_ref_clk_2x]]

create_generated_clock -name fmc2_ref_clk          [get_pins -hier -filter {NAME =~ *cmp2_xwb_fmc*cmp_mmcm_adc_clk/CLKOUT0}]
set fmc2_ref_clk_period                            [get_property PERIOD [get_clocks fmc2_ref_clk]]
set fmc2_ref_clk_period_double                     [expr $fmc2_ref_clk_period * 2.000]
create_generated_clock -name fmc2_ref_clk_2x       [get_pins -hier -filter {NAME =~ *cmp2_xwb_fmc*cmp_mmcm_adc_clk/CLKOUT1}]
set fmc2_ref_clk_2x_period                         [get_property PERIOD [get_clocks fmc2_ref_clk_2x]]

#######################################################################
##                               Clocks                              ##
#######################################################################

# including 50ps jitter, for 130MHz clock
# since design uses copy of input ADC clock
# there is additional delay for clock/ data (tC)
# ADC Data <-> Clocks Constraints (ISLA216P)
#
# From the data sheet (page 11)
#
#Output Clock to Data Propagation Delay (LVDS Mode):
# tdc Rising/Falling Edge -0.1 (min) 0.16 (typ) 0.5 (max) ns
#
#Constraint recommended by an Intersil Employee
#
#TIMEGRP "datain18_p_group" OFFSET = IN -200 ps VALID 1200 ps BEFORE "clkin18_p" RISING;
#
#This is setup for a 250MHz clock (4ns period).  The ISLA216P25 specifies
# tDC as -0.1 to +0.5 ns.  The constraint adds an additional 100ps to each side
# to account for potential skew due to the pcb.  So, the tDC ends up being -0.2
# to 0.6 ns.  The value after IN in the constraint equal tDC min (-200ps). 
# The  value after VALID = Period/2 + tDC min – tDC max (4000ps/2 + -200ps –
# 600ps = 1200ps).  (The period is divided by two because the data is DDR.)
#
#
#         OFFSET
#        +---+
#
#             --------      --------
# CLK         |      |      |      |      |
#                    --------      --------
#        --------------------------------
# DATA   |      ||      ||      ||      |
#        --------------------------------
#
#        +------+
#         VALID
#

set_input_delay -clock [get_clocks fmc1_adc_clk0_p_i] -max -add_delay -0.200 [get_ports {fmc1_adc_data_ch0_p_i[*]}] -rise
set_input_delay -clock [get_clocks fmc1_adc_clk0_p_i] -min -add_delay 1.200  [get_ports {fmc1_adc_data_ch0_p_i[*]}] -rise
set_input_delay -clock [get_clocks fmc1_adc_clk0_p_i] -max -add_delay -0.200 [get_ports {fmc1_adc_data_ch0_p_i[*]}] -fall
set_input_delay -clock [get_clocks fmc1_adc_clk0_p_i] -min -add_delay 1.200  [get_ports {fmc1_adc_data_ch0_p_i[*]}] -fall
set_input_delay -clock [get_clocks fmc1_adc_clk1_p_i] -max -add_delay -0.200 [get_ports {fmc1_adc_data_ch1_p_i[*]}] -rise
set_input_delay -clock [get_clocks fmc1_adc_clk1_p_i] -min -add_delay 1.200  [get_ports {fmc1_adc_data_ch1_p_i[*]}] -rise
set_input_delay -clock [get_clocks fmc1_adc_clk1_p_i] -max -add_delay -0.200 [get_ports {fmc1_adc_data_ch1_p_i[*]}] -fall
set_input_delay -clock [get_clocks fmc1_adc_clk1_p_i] -min -add_delay 1.200  [get_ports {fmc1_adc_data_ch1_p_i[*]}] -fall
set_input_delay -clock [get_clocks fmc1_adc_clk2_p_i] -max -add_delay -0.200 [get_ports {fmc1_adc_data_ch2_p_i[*]}] -rise
set_input_delay -clock [get_clocks fmc1_adc_clk2_p_i] -min -add_delay 1.200  [get_ports {fmc1_adc_data_ch2_p_i[*]}] -rise
set_input_delay -clock [get_clocks fmc1_adc_clk2_p_i] -max -add_delay -0.200 [get_ports {fmc1_adc_data_ch2_p_i[*]}] -fall
set_input_delay -clock [get_clocks fmc1_adc_clk2_p_i] -min -add_delay 1.200  [get_ports {fmc1_adc_data_ch2_p_i[*]}] -fall
set_input_delay -clock [get_clocks fmc1_adc_clk3_p_i] -max -add_delay -0.200 [get_ports {fmc1_adc_data_ch3_p_i[*]}] -rise
set_input_delay -clock [get_clocks fmc1_adc_clk3_p_i] -min -add_delay 1.200  [get_ports {fmc1_adc_data_ch3_p_i[*]}] -rise
set_input_delay -clock [get_clocks fmc1_adc_clk3_p_i] -max -add_delay -0.200 [get_ports {fmc1_adc_data_ch3_p_i[*]}] -fall
set_input_delay -clock [get_clocks fmc1_adc_clk3_p_i] -min -add_delay 1.200  [get_ports {fmc1_adc_data_ch3_p_i[*]}] -fall

set_input_delay -clock [get_clocks fmc2_adc_clk0_p_i] -max -add_delay -0.200 [get_ports {fmc2_adc_data_ch0_p_i[*]}] -rise
set_input_delay -clock [get_clocks fmc2_adc_clk0_p_i] -min -add_delay 1.200  [get_ports {fmc2_adc_data_ch0_p_i[*]}] -rise
set_input_delay -clock [get_clocks fmc2_adc_clk0_p_i] -max -add_delay -0.200 [get_ports {fmc2_adc_data_ch0_p_i[*]}] -fall
set_input_delay -clock [get_clocks fmc2_adc_clk0_p_i] -min -add_delay 1.200  [get_ports {fmc2_adc_data_ch0_p_i[*]}] -fall
set_input_delay -clock [get_clocks fmc2_adc_clk1_p_i] -max -add_delay -0.200 [get_ports {fmc2_adc_data_ch1_p_i[*]}] -rise
set_input_delay -clock [get_clocks fmc2_adc_clk1_p_i] -min -add_delay 1.200  [get_ports {fmc2_adc_data_ch1_p_i[*]}] -rise
set_input_delay -clock [get_clocks fmc2_adc_clk1_p_i] -max -add_delay -0.200 [get_ports {fmc2_adc_data_ch1_p_i[*]}] -fall
set_input_delay -clock [get_clocks fmc2_adc_clk1_p_i] -min -add_delay 1.200  [get_ports {fmc2_adc_data_ch1_p_i[*]}] -fall
set_input_delay -clock [get_clocks fmc2_adc_clk2_p_i] -max -add_delay -0.200 [get_ports {fmc2_adc_data_ch2_p_i[*]}] -rise
set_input_delay -clock [get_clocks fmc2_adc_clk2_p_i] -min -add_delay 1.200  [get_ports {fmc2_adc_data_ch2_p_i[*]}] -rise
set_input_delay -clock [get_clocks fmc2_adc_clk2_p_i] -max -add_delay -0.200 [get_ports {fmc2_adc_data_ch2_p_i[*]}] -fall
set_input_delay -clock [get_clocks fmc2_adc_clk2_p_i] -min -add_delay 1.200  [get_ports {fmc2_adc_data_ch2_p_i[*]}] -fall
set_input_delay -clock [get_clocks fmc2_adc_clk3_p_i] -max -add_delay -0.200 [get_ports {fmc2_adc_data_ch3_p_i[*]}] -rise
set_input_delay -clock [get_clocks fmc2_adc_clk3_p_i] -min -add_delay 1.200  [get_ports {fmc2_adc_data_ch3_p_i[*]}] -rise
set_input_delay -clock [get_clocks fmc2_adc_clk3_p_i] -max -add_delay -0.200 [get_ports {fmc2_adc_data_ch3_p_i[*]}] -fall
set_input_delay -clock [get_clocks fmc2_adc_clk3_p_i] -min -add_delay 1.200  [get_ports {fmc2_adc_data_ch3_p_i[*]}] -fall

#######################################################################
##                                Data                               ##
#######################################################################

# Constraint all IDELAY blocks to the same IDELAY control as the DDR 3, so the tool will replicate it as needed
set_property IODELAY_GROUP DDR_CORE_IODELAY_MIG0 [get_cells -hier -filter {NAME =~ *cmp1_xwb_fmc250m_4ch/cmp_wb_fmc250m_4ch/cmp_fmc_adc_iface/gen_adc_data_chains[*].gen_adc_data_chains_check.cmp_fmc_adc_data/gen_adc_data[*].gen_adc_data_7series_iodelay.gen_adc_data_var_loadable_iodelay.cmp_adc_data_iodelay}]
set_property IODELAY_GROUP DDR_CORE_IODELAY_MIG0 [get_cells -hier -filter {NAME =~ *cmp1_xwb_fmc250m_4ch/cmp_wb_fmc250m_4ch/cmp_fmc_adc_iface/gen_clock_chains[*].gen_clock_chains_check.cmp_fmc_adc_clk/gen_adc_clk_7series_iodelay.gen_adc_clk_var_load_iodelay.cmp_ibufds_clk_iodelay}]

set_property IODELAY_GROUP DDR_CORE_IODELAY_MIG0 [get_cells -hier -filter {NAME =~ *cmp2_xwb_fmc250m_4ch/cmp_wb_fmc250m_4ch/cmp_fmc_adc_iface/gen_adc_data_chains[*].gen_adc_data_chains_check.cmp_fmc_adc_data/gen_adc_data[*].gen_adc_data_7series_iodelay.gen_adc_data_var_loadable_iodelay.cmp_adc_data_iodelay}]
set_property IODELAY_GROUP DDR_CORE_IODELAY_MIG0 [get_cells -hier -filter {NAME =~ *cmp2_xwb_fmc250m_4ch/cmp_wb_fmc250m_4ch/cmp_fmc_adc_iface/gen_clock_chains[*].gen_clock_chains_check.cmp_fmc_adc_clk/gen_adc_clk_7series_iodelay.gen_adc_clk_var_load_iodelay.cmp_ibufds_clk_iodelay}]

#######################################################################
##                              CDC                                  ##
#######################################################################

# From Wishbone To ADC/ADC2x. These are slow control registers taken care of synched by FFs.
set_max_delay -datapath_only -from               [get_clocks clk_sys] -to [get_clocks fmc1_ref_clk]    $clk_sys_period
set_max_delay -datapath_only -from               [get_clocks clk_sys] -to [get_clocks fmc2_ref_clk]    $clk_sys_period
set_max_delay -datapath_only -from               [get_clocks clk_sys] -to [get_clocks fmc1_ref_clk_2x] $clk_sys_period
set_max_delay -datapath_only -from               [get_clocks clk_sys] -to [get_clocks fmc2_ref_clk_2x] $clk_sys_period

# From ADC/ADC2x To Wishbone. These are status registers taken care of synched by FFs.
set_max_delay -datapath_only -from               [get_clocks fmc1_ref_clk]    -to [get_clocks clk_sys] $fmc1_ref_clk_period
set_max_delay -datapath_only -from               [get_clocks fmc2_ref_clk]    -to [get_clocks clk_sys] $fmc2_ref_clk_period
set_max_delay -datapath_only -from               [get_clocks fmc1_ref_clk_2x] -to [get_clocks clk_sys] $fmc1_ref_clk_2x_period
set_max_delay -datapath_only -from               [get_clocks fmc2_ref_clk_2x] -to [get_clocks clk_sys] $fmc2_ref_clk_2x_period

# This path happens only in the control path for setting control parameters
set_max_delay -datapath_only -from               [get_clocks fmc1_ref_clk] -to [get_clocks fmc1_ref_clk_2x] $fmc1_ref_clk_period
set_max_delay -datapath_only -from               [get_clocks fmc2_ref_clk] -to [get_clocks fmc2_ref_clk_2x] $fmc2_ref_clk_period

# FIFO CDC timimng. Using < faster clock period
set_max_delay -datapath_only -from               [get_clocks clk_pll_i]    -to [get_clocks fmc1_ref_clk]   $clk_pll_ddr_period_less
set_max_delay -datapath_only -from               [get_clocks fmc1_ref_clk] -to [get_clocks clk_pll_i]      $clk_pll_ddr_period_less

set_max_delay -datapath_only -from               [get_clocks clk_pll_i]    -to [get_clocks fmc2_ref_clk]   $clk_pll_ddr_period_less
set_max_delay -datapath_only -from               [get_clocks fmc2_ref_clk] -to [get_clocks clk_pll_i]      $clk_pll_ddr_period_less

# Clk AUX and FMC ref clk are synchronized using full feedback synchronizers.
# The CDC path could be ignored, but let's give 2x the destination clock period.
# From ADC/ADC2x To Wishbone. These are status registers taken care of synched by FFs.
set_max_delay -datapath_only -from               [get_clocks fmc1_ref_clk]    -to [get_clocks clk_aux]      $clk_aux_period_double
set_max_delay -datapath_only -from               [get_clocks fmc2_ref_clk]    -to [get_clocks clk_aux]      $clk_aux_period_double
set_max_delay -datapath_only -from               [get_clocks clk_aux]         -to [get_clocks fmc1_ref_clk] $fmc1_ref_clk_period_double
set_max_delay -datapath_only -from               [get_clocks clk_aux]         -to [get_clocks fmc2_ref_clk] $fmc2_ref_clk_period_double

# This path is only valid after acq_start signal, which is controlled by software and
# is activated many many miliseconds after all of the other. So, give it 2x the clock
# period
set_max_delay -datapath_only -from [get_pins -hier -filter {NAME =~ *acq_core/*/regs_o_reg[acq_chan_ctl_which_o][*]/C}] -to [get_clocks fmc1_ref_clk] $fmc1_ref_clk_period_double
set_max_delay -datapath_only -from [get_pins -hier -filter {NAME =~ *acq_core/*/regs_o_reg[acq_chan_ctl_which_o][*]/C}] -to [get_clocks fmc2_ref_clk] $fmc2_ref_clk_period_double
set_max_delay -datapath_only -from [get_pins -hier -filter {NAME =~ *acq_core/*/regs_o_reg[acq_chan_ctl_which_o][*]/C}] -to [get_clocks fmc1_ref_clk] $fmc1_ref_clk_period_double
set_max_delay -datapath_only -from [get_pins -hier -filter {NAME =~ *acq_core/*/regs_o_reg[acq_chan_ctl_which_o][*]/C}] -to [get_clocks fmc2_ref_clk] $fmc2_ref_clk_period_double
set_max_delay -datapath_only -from [get_pins -hier -filter {NAME =~ *acq_core/*/regs_o_reg[*samples_o][*]/C}] -to [get_clocks fmc1_ref_clk] $fmc1_ref_clk_period_double
set_max_delay -datapath_only -from [get_pins -hier -filter {NAME =~ *acq_core/*/regs_o_reg[*samples_o][*]/C}] -to [get_clocks fmc2_ref_clk] $fmc2_ref_clk_period_double

# Use Distributed RAM, as these FIFOs are small and sparse through the module
# Cannot make this work with hierarchical matching... only by specifying the
# whole topology
set_property RAM_STYLE DISTRIBUTED [get_cells -hier -filter {NAME =~ */cmp_position_calc_cdc_fifo/mem_reg*}]

# Use Distributed RAMs for FMC ADC CDC FIFOs. They are small and sparse.
set_property RAM_STYLE DISTRIBUTED [get_cells -hier -filter {NAME =~ */cmp_fmc_adc_iface/*/cmp_adc_data_async_fifo/mem_reg*}]

#######################################################################
##                      Placement Constraints                        ##
#######################################################################

# Constrain the PCIe core elements placement, so that it won't fail
# timing analysis.
# Comment out because we use nonstandard GTP location
#create_pblock GRP_pcie_core
#add_cells_to_pblock [get_pblocks GRP_pcie_core] [get_cells -hier -filter {NAME =~ *pcie_core_i/*}]
#resize_pblock [get_pblocks GRP_pcie_core] -add {CLOCKREGION_X0Y4:CLOCKREGION_X0Y4}
#
## Place the DMA design not far from PCIe core, otherwise it also breaks timing
#create_pblock GRP_ddr_core
#add_cells_to_pblock [get_pblocks GRP_ddr_core] [get_cells -hier -filter  {NAME =~ *pcie_core_i/DDRs_ctrl_module/ddr_core_inst/*]]
#resize_pblock [get_pblocks GRP_ddr_core] -add {CLOCKREGION_X1Y0:CLOCKREGION_X1Y1}
#
## Place DDR core temperature monitor
#create_pblock GRP_ddr_core_temp_mon
#add_cells_to_pblock [get_pblocks GRP_ddr_core_temp_mon] [get_cells -quiet -hier -filter [NAME =~ *u_ddr_core/temp_mon_enabled.u_tempmon/*]]
#resize_pblock [get_pblocks GRP_ddr_core_temp_mon] -add {CLOCKREGION_X0Y2:CLOCKREGION_X0Y3}
#
## The FMC #1 is poor placed on PCB, so we constraint it to the rightmost clock regions of the FPGA
#create_pblock GRP_fmc1
#add_cells_to_pblock [get_pblocks GRP_fmc1] [get_cells -hier -filter {NAME =~ *cmp1_xwb_fmc250m_4ch/*}]
#resize_pblock [get_pblocks GRP_fmc1] -add {CLOCKREGION_X1Y2:CLOCKREGION_X1Y4}
#
#create_pblock GRP_fmc2
#add_cells_to_pblock [get_pblocks GRP_fmc2] [get_cells -hier -filter {NAME =~ *cmp2_xwb_fmc250m_4ch/*}]
#resize_pblock [get_pblocks GRP_fmc2] -add {CLOCKREGION_X0Y0:CLOCKREGION_X0Y2}
#
## Constraint Position Calc Cores
#create_pblock GRP_position_calc_core1
#add_cells_to_pblock [get_pblocks GRP_position_calc_core1] [get_cells -hier -filter {NAME =~ *cmp1_xwb_position_calc_core/cmp_wb_position_calc_core/*}]
#resize_pblock [get_pblocks GRP_position_calc_core1] -add {CLOCKREGION_X1Y2:CLOCKREGION_X1Y4}
#
#create_pblock GRP_position_calc_core2
#add_cells_to_pblock [get_pblocks GRP_position_calc_core2] [get_cells -hier -filter {NAME =~ *cmp2_xwb_position_calc_core/cmp_wb_position_calc_core/*}]
#resize_pblock [get_pblocks GRP_position_calc_core2] -add {CLOCKREGION_X0Y0:CLOCKREGION_X0Y2}
#
## Place acquisition core 0
#create_pblock GRP_acq_core_0
#add_cells_to_pblock [get_pblocks GRP_acq_core_0] [get_cells -hier -filter {NAME =~ */cmp_wb_facq_core_mux/gen_facq_core[0].*}]
#resize_pblock [get_pblocks GRP_acq_core_0] -add {CLOCKREGION_X0Y3:CLOCKREGION_X1Y3} -remove {CLOCKREGION_X0Y4:CLOCKREGION_X1Y4}

#######################################################################
##                         CE Constraints                            ##
#######################################################################

## TBT CORDIC CE. Uses ce_tbt_cordic as CE
set tbt_cordic_fanouts [get_cells -of_objects [ \
    filter -regexp [ \
        all_fanout -flat -endpoints_only -from [ \
            # Get from all CE pins on CORDIC design: the PINs that are driving the NET.
            # This is needed (really?) in our case as the CE driver, in the case of
            # the channel #0 get optimized out and replaced by another NET.
            get_pins -of_objects [ \
                get_nets -segments -of_objects [ \
                    get_pins -hierarchical  -filter { \
                        NAME =~ *position_calc*cmp_tbt_cordic/cmp_cordic_core/*CE \
                    } \
                ] \
            ] -filter {IS_LEAF && (DIRECTION == "OUT")} \
        ] \
    ] \
    {NAME =~ .*cmp_tbt_cordic/.*} \
]]

set_multicycle_path 4 -setup -from  $tbt_cordic_fanouts
set_multicycle_path 3 -hold -from   $tbt_cordic_fanouts

## FOFB CORDIC CE. Uses ce_fofb_cordic as CE
set fofb_cordic_fanouts [get_cells -of_objects [ \
    filter -regexp [ \
        all_fanout -flat -endpoints_only -from [ \
            # Get from all CE pins on CORDIC design: the PINs that are driving the NET.
            # This is needed (really?) in our case as the CE driver, in the case of
            # the channel #0 get optimized out and replaced by another NET.
            get_pins -of_objects [ \
                get_nets -segments -of_objects [ \
                    get_pins -hierarchical  -filter { \
                        NAME =~ *position_calc*cmp_fofb_cordic/cmp_cordic_core/*CE \
                    } \
                ] \
            ] -filter {IS_LEAF && (DIRECTION == "OUT")} \
        ] \
    ] \
    {NAME =~ .*cmp_fofb_cordic/.*} \
]]

set_multicycle_path 4 -setup -from  $fofb_cordic_fanouts
set_multicycle_path 3 -hold -from   $fofb_cordic_fanouts

## CIC MONIT 1 CE. Uses ce_fofb_cordic as CE
set monit1_ce_fanouts [get_cells -of_objects [ \
    filter -regexp [ \
        all_fanout -flat -endpoints_only -from [ \
            # Get from a known CE pin on CORDIC design: the PIN that is driving the NET
            # This is needed (really?) in our case as the CE driver, in the case of
            # the channel #0 get optimized out and replaced by another NET.
            get_pins -of_objects [ \
                get_nets -segments -of_objects [ \
                    get_pins -hierarchical  -filter { \
                        NAME =~ *position_calc*cmp_monit1_cic/*CE \
                    } \
                ] \
            ] -filter {IS_LEAF && (DIRECTION == "OUT")} \
        ] \
    ] \
    {NAME =~ .*cmp_monit1_cic/.*} \
]]

set_multicycle_path 4 -setup -from  $monit1_ce_fanouts
set_multicycle_path 3 -hold -from   $monit1_ce_fanouts

## CIC MONIT 2 CE. uses ce_monit1 as CE
set monit2_ce_fanouts [get_cells -of_objects [ \
    filter -regexp [ \
        all_fanout -flat -endpoints_only -from [ \
            # Get from a known CE pin on CORDIC design: the PIN that is driving the NET
            # This is needed (really?) in our case as the CE driver, in the case of
            # the channel #0 get optimized out and replaced by another NET.
            get_pins -of_objects [ \
                get_nets -segments -of_objects [ \
                    get_pins -hierarchical  -filter { \
                        NAME =~ *position_calc*cmp_monit2_cic/*CE \
                    } \
                ] \
            ] -filter {IS_LEAF && (DIRECTION == "OUT")} \
        ] \
    ] \
    {NAME =~ .*cmp_monit2_cic/.*} \
]]

set_multicycle_path 4 -setup -from  $monit2_ce_fanouts
set_multicycle_path 3 -hold -from   $monit2_ce_fanouts
