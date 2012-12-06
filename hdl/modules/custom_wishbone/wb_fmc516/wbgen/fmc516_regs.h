/*
  Register definitions for slave core: FMC ADC 250MS/s core registers

  * File           : fmc516_regs.h
  * Author         : auto-generated by wbgen2 from wb_fmc516_regs.wb
  * Created        : Thu Dec  6 16:10:54 2012
  * Standard       : ANSI C

    THIS FILE WAS GENERATED BY wbgen2 FROM SOURCE FILE wb_fmc516_regs.wb
    DO NOT HAND-EDIT UNLESS IT'S ABSOLUTELY NECESSARY!

*/

#ifndef __WBGEN2_REGDEFS_WB_FMC516_REGS_WB
#define __WBGEN2_REGDEFS_WB_FMC516_REGS_WB

#include <inttypes.h>

#if defined( __GNUC__)
#define PACKED __attribute__ ((packed))
#else
#error "Unsupported compiler?"
#endif

#ifndef __WBGEN2_MACROS_DEFINED__
#define __WBGEN2_MACROS_DEFINED__
#define WBGEN2_GEN_MASK(offset, size) (((1<<(size))-1) << (offset))
#define WBGEN2_GEN_WRITE(value, offset, size) (((value) & ((1<<(size))-1)) << (offset))
#define WBGEN2_GEN_READ(reg, offset, size) (((reg) >> (offset)) & ((1<<(size))-1))
#define WBGEN2_SIGN_EXTEND(value, bits) (((value) & (1<<bits) ? ~((1<<(bits))-1): 0 ) | (value))
#endif


/* definitions for register: Status register */

/* definitions for field: LMK (Clock Distribution CI) locked status in reg: Status register */
#define FMC516_FMC_STA_LMK_LOCKED             WBGEN2_GEN_MASK(0, 1)

/* definitions for field: MMCM locked status in reg: Status register */
#define FMC516_FMC_STA_MMCM_LOCKED            WBGEN2_GEN_MASK(1, 1)

/* definitions for field: FMC power good status in reg: Status register */
#define FMC516_FMC_STA_PWR_GOOD               WBGEN2_GEN_MASK(2, 1)

/* definitions for field: FMC board present status in reg: Status register */
#define FMC516_FMC_STA_PRST                   WBGEN2_GEN_MASK(3, 1)

/* definitions for field: Reserved in reg: Status register */
#define FMC516_FMC_STA_RESERVED_MASK          WBGEN2_GEN_MASK(4, 28)
#define FMC516_FMC_STA_RESERVED_SHIFT         4
#define FMC516_FMC_STA_RESERVED_W(value)      WBGEN2_GEN_WRITE(value, 4, 28)
#define FMC516_FMC_STA_RESERVED_R(reg)        WBGEN2_GEN_READ(reg, 4, 28)

/* definitions for register: Control register */

/* definitions for field: Enable test data in reg: Control register */
#define FMC516_FMC_CTL_TEST_DATA_EN           WBGEN2_GEN_MASK(0, 1)

/* definitions for field: Manual LED 0 in reg: Control register */
#define FMC516_FMC_CTL_LED_0                  WBGEN2_GEN_MASK(1, 1)

/* definitions for field: Manual LED 1 in reg: Control register */
#define FMC516_FMC_CTL_LED_1                  WBGEN2_GEN_MASK(2, 1)

/* definitions for field: Internal/External clock distribution selection in reg: Control register */
#define FMC516_FMC_CTL_CLK_SEL                WBGEN2_GEN_MASK(3, 1)

/* definitions for field: VCXO Ouput enable selection in reg: Control register */
#define FMC516_FMC_CTL_VCXO_OUT_EN            WBGEN2_GEN_MASK(4, 1)

/* definitions for field: Reserved in reg: Control register */
#define FMC516_FMC_CTL_RESERVED_MASK          WBGEN2_GEN_MASK(5, 27)
#define FMC516_FMC_CTL_RESERVED_SHIFT         5
#define FMC516_FMC_CTL_RESERVED_W(value)      WBGEN2_GEN_WRITE(value, 5, 27)
#define FMC516_FMC_CTL_RESERVED_R(reg)        WBGEN2_GEN_READ(reg, 5, 27)

/* definitions for register: Trigger configuration */

/* definitions for field: Hardware trigger polarity in reg: Trigger configuration */
#define FMC516_TRIG_CFG_HW_TRIG_POL           WBGEN2_GEN_MASK(0, 1)

/* definitions for field: Hardware trigger enable in reg: Trigger configuration */
#define FMC516_TRIG_CFG_HW_TRIG_EN            WBGEN2_GEN_MASK(1, 1)

/* definitions for field: Reserved in reg: Trigger configuration */
#define FMC516_TRIG_CFG_RESERVED_MASK         WBGEN2_GEN_MASK(2, 30)
#define FMC516_TRIG_CFG_RESERVED_SHIFT        2
#define FMC516_TRIG_CFG_RESERVED_W(value)     WBGEN2_GEN_WRITE(value, 2, 30)
#define FMC516_TRIG_CFG_RESERVED_R(reg)       WBGEN2_GEN_READ(reg, 2, 30)

/* definitions for register: Global ADC Status register */

/* definitions for field: FMC ADC clock chains in reg: Global ADC Status register */
#define FMC516_ADC_STA_CLK_CHAINS_MASK        WBGEN2_GEN_MASK(0, 4)
#define FMC516_ADC_STA_CLK_CHAINS_SHIFT       0
#define FMC516_ADC_STA_CLK_CHAINS_W(value)    WBGEN2_GEN_WRITE(value, 0, 4)
#define FMC516_ADC_STA_CLK_CHAINS_R(reg)      WBGEN2_GEN_READ(reg, 0, 4)

/* definitions for field: Reserved in reg: Global ADC Status register */
#define FMC516_ADC_STA_RESERVED_CLK_CHAINS_MASK WBGEN2_GEN_MASK(4, 4)
#define FMC516_ADC_STA_RESERVED_CLK_CHAINS_SHIFT 4
#define FMC516_ADC_STA_RESERVED_CLK_CHAINS_W(value) WBGEN2_GEN_WRITE(value, 4, 4)
#define FMC516_ADC_STA_RESERVED_CLK_CHAINS_R(reg) WBGEN2_GEN_READ(reg, 4, 4)

/* definitions for field: FMC ADC Data chains in reg: Global ADC Status register */
#define FMC516_ADC_STA_DATA_CHAINS_MASK       WBGEN2_GEN_MASK(8, 4)
#define FMC516_ADC_STA_DATA_CHAINS_SHIFT      8
#define FMC516_ADC_STA_DATA_CHAINS_W(value)   WBGEN2_GEN_WRITE(value, 8, 4)
#define FMC516_ADC_STA_DATA_CHAINS_R(reg)     WBGEN2_GEN_READ(reg, 8, 4)

/* definitions for field: Reserved in reg: Global ADC Status register */
#define FMC516_ADC_STA_RESERVED_DATA_CHAINS_MASK WBGEN2_GEN_MASK(12, 4)
#define FMC516_ADC_STA_RESERVED_DATA_CHAINS_SHIFT 12
#define FMC516_ADC_STA_RESERVED_DATA_CHAINS_W(value) WBGEN2_GEN_WRITE(value, 12, 4)
#define FMC516_ADC_STA_RESERVED_DATA_CHAINS_R(reg) WBGEN2_GEN_READ(reg, 12, 4)

/* definitions for field: FMC ADC packet size in reg: Global ADC Status register */
#define FMC516_ADC_STA_ADC_PKT_SIZE_MASK      WBGEN2_GEN_MASK(16, 16)
#define FMC516_ADC_STA_ADC_PKT_SIZE_SHIFT     16
#define FMC516_ADC_STA_ADC_PKT_SIZE_W(value)  WBGEN2_GEN_WRITE(value, 16, 16)
#define FMC516_ADC_STA_ADC_PKT_SIZE_R(reg)    WBGEN2_GEN_READ(reg, 16, 16)

/* definitions for register: Global ADC Control register */

/* definitions for field: Reset/Update ADC clock/data chains delay in reg: Global ADC Control register */
#define FMC516_ADC_CTL_UPDATE_DLY             WBGEN2_GEN_MASK(0, 1)

/* definitions for field: Reset ADCs in reg: Global ADC Control register */
#define FMC516_ADC_CTL_RST_ADCS               WBGEN2_GEN_MASK(1, 1)

/* definitions for field: Reset Div ADCs in reg: Global ADC Control register */
#define FMC516_ADC_CTL_RST_DIV_ADCS           WBGEN2_GEN_MASK(2, 1)

/* definitions for field: Reserved in reg: Global ADC Control register */
#define FMC516_ADC_CTL_RESERVED_MASK          WBGEN2_GEN_MASK(3, 29)
#define FMC516_ADC_CTL_RESERVED_SHIFT         3
#define FMC516_ADC_CTL_RESERVED_W(value)      WBGEN2_GEN_WRITE(value, 3, 29)
#define FMC516_ADC_CTL_RESERVED_R(reg)        WBGEN2_GEN_READ(reg, 3, 29)

/* definitions for register: Channel 0 status register */

/* definitions for field: Channel 0 current ADC value in reg: Channel 0 status register */
#define FMC516_CH0_STA_VAL_MASK               WBGEN2_GEN_MASK(0, 16)
#define FMC516_CH0_STA_VAL_SHIFT              0
#define FMC516_CH0_STA_VAL_W(value)           WBGEN2_GEN_WRITE(value, 0, 16)
#define FMC516_CH0_STA_VAL_R(reg)             WBGEN2_GEN_READ(reg, 0, 16)

/* definitions for field: Reserved in reg: Channel 0 status register */
#define FMC516_CH0_STA_RESERVED_MASK          WBGEN2_GEN_MASK(16, 16)
#define FMC516_CH0_STA_RESERVED_SHIFT         16
#define FMC516_CH0_STA_RESERVED_W(value)      WBGEN2_GEN_WRITE(value, 16, 16)
#define FMC516_CH0_STA_RESERVED_R(reg)        WBGEN2_GEN_READ(reg, 16, 16)

/* definitions for register: Channel 0 control register */

/* definitions for field: ADC clock chain delay in reg: Channel 0 control register */
#define FMC516_CH0_CTL_CLK_CHAIN_DLY_MASK     WBGEN2_GEN_MASK(0, 5)
#define FMC516_CH0_CTL_CLK_CHAIN_DLY_SHIFT    0
#define FMC516_CH0_CTL_CLK_CHAIN_DLY_W(value) WBGEN2_GEN_WRITE(value, 0, 5)
#define FMC516_CH0_CTL_CLK_CHAIN_DLY_R(reg)   WBGEN2_GEN_READ(reg, 0, 5)

/* definitions for field: Reserved in reg: Channel 0 control register */
#define FMC516_CH0_CTL_RESERVED_CLK_CHAIN_DLY_MASK WBGEN2_GEN_MASK(5, 3)
#define FMC516_CH0_CTL_RESERVED_CLK_CHAIN_DLY_SHIFT 5
#define FMC516_CH0_CTL_RESERVED_CLK_CHAIN_DLY_W(value) WBGEN2_GEN_WRITE(value, 5, 3)
#define FMC516_CH0_CTL_RESERVED_CLK_CHAIN_DLY_R(reg) WBGEN2_GEN_READ(reg, 5, 3)

/* definitions for field: ADC data chain delay in reg: Channel 0 control register */
#define FMC516_CH0_CTL_DATA_CHAIN_DLY_MASK    WBGEN2_GEN_MASK(8, 5)
#define FMC516_CH0_CTL_DATA_CHAIN_DLY_SHIFT   8
#define FMC516_CH0_CTL_DATA_CHAIN_DLY_W(value) WBGEN2_GEN_WRITE(value, 8, 5)
#define FMC516_CH0_CTL_DATA_CHAIN_DLY_R(reg)  WBGEN2_GEN_READ(reg, 8, 5)

/* definitions for field: Reserved in reg: Channel 0 control register */
#define FMC516_CH0_CTL_RESERVED_DATA_CHAIN_DLY_MASK WBGEN2_GEN_MASK(13, 3)
#define FMC516_CH0_CTL_RESERVED_DATA_CHAIN_DLY_SHIFT 13
#define FMC516_CH0_CTL_RESERVED_DATA_CHAIN_DLY_W(value) WBGEN2_GEN_WRITE(value, 13, 3)
#define FMC516_CH0_CTL_RESERVED_DATA_CHAIN_DLY_R(reg) WBGEN2_GEN_READ(reg, 13, 3)

/* definitions for field: Increment ADC clock chains delay in reg: Channel 0 control register */
#define FMC516_CH0_CTL_INC_CHAIN_DLY          WBGEN2_GEN_MASK(16, 1)

/* definitions for field: Decrement ADC clock chains delay in reg: Channel 0 control register */
#define FMC516_CH0_CTL_DEC_CHAIN_DLY          WBGEN2_GEN_MASK(17, 1)

/* definitions for field: Reserved in reg: Channel 0 control register */
#define FMC516_CH0_CTL_RESERVED_MASK          WBGEN2_GEN_MASK(18, 14)
#define FMC516_CH0_CTL_RESERVED_SHIFT         18
#define FMC516_CH0_CTL_RESERVED_W(value)      WBGEN2_GEN_WRITE(value, 18, 14)
#define FMC516_CH0_CTL_RESERVED_R(reg)        WBGEN2_GEN_READ(reg, 18, 14)

/* definitions for register: Channel 1 status register */

/* definitions for field: Channel 1 current ADC value in reg: Channel 1 status register */
#define FMC516_CH1_STA_VAL_MASK               WBGEN2_GEN_MASK(0, 16)
#define FMC516_CH1_STA_VAL_SHIFT              0
#define FMC516_CH1_STA_VAL_W(value)           WBGEN2_GEN_WRITE(value, 0, 16)
#define FMC516_CH1_STA_VAL_R(reg)             WBGEN2_GEN_READ(reg, 0, 16)

/* definitions for field: Reserved in reg: Channel 1 status register */
#define FMC516_CH1_STA_RESERVED_MASK          WBGEN2_GEN_MASK(16, 16)
#define FMC516_CH1_STA_RESERVED_SHIFT         16
#define FMC516_CH1_STA_RESERVED_W(value)      WBGEN2_GEN_WRITE(value, 16, 16)
#define FMC516_CH1_STA_RESERVED_R(reg)        WBGEN2_GEN_READ(reg, 16, 16)

/* definitions for register: Channel 1 control register */

/* definitions for field: ADC clock chain delay in reg: Channel 1 control register */
#define FMC516_CH1_CTL_CLK_CHAIN_DLY_MASK     WBGEN2_GEN_MASK(0, 5)
#define FMC516_CH1_CTL_CLK_CHAIN_DLY_SHIFT    0
#define FMC516_CH1_CTL_CLK_CHAIN_DLY_W(value) WBGEN2_GEN_WRITE(value, 0, 5)
#define FMC516_CH1_CTL_CLK_CHAIN_DLY_R(reg)   WBGEN2_GEN_READ(reg, 0, 5)

/* definitions for field: Reserved in reg: Channel 1 control register */
#define FMC516_CH1_CTL_RESERVED_CLK_CHAIN_DLY_MASK WBGEN2_GEN_MASK(5, 3)
#define FMC516_CH1_CTL_RESERVED_CLK_CHAIN_DLY_SHIFT 5
#define FMC516_CH1_CTL_RESERVED_CLK_CHAIN_DLY_W(value) WBGEN2_GEN_WRITE(value, 5, 3)
#define FMC516_CH1_CTL_RESERVED_CLK_CHAIN_DLY_R(reg) WBGEN2_GEN_READ(reg, 5, 3)

/* definitions for field: ADC data chain delay in reg: Channel 1 control register */
#define FMC516_CH1_CTL_DATA_CHAIN_DLY_MASK    WBGEN2_GEN_MASK(8, 5)
#define FMC516_CH1_CTL_DATA_CHAIN_DLY_SHIFT   8
#define FMC516_CH1_CTL_DATA_CHAIN_DLY_W(value) WBGEN2_GEN_WRITE(value, 8, 5)
#define FMC516_CH1_CTL_DATA_CHAIN_DLY_R(reg)  WBGEN2_GEN_READ(reg, 8, 5)

/* definitions for field: Reserved in reg: Channel 1 control register */
#define FMC516_CH1_CTL_RESERVED_DATA_CHAIN_DLY_MASK WBGEN2_GEN_MASK(13, 3)
#define FMC516_CH1_CTL_RESERVED_DATA_CHAIN_DLY_SHIFT 13
#define FMC516_CH1_CTL_RESERVED_DATA_CHAIN_DLY_W(value) WBGEN2_GEN_WRITE(value, 13, 3)
#define FMC516_CH1_CTL_RESERVED_DATA_CHAIN_DLY_R(reg) WBGEN2_GEN_READ(reg, 13, 3)

/* definitions for field: Increment ADC clock chains delay in reg: Channel 1 control register */
#define FMC516_CH1_CTL_INC_CHAIN_DLY          WBGEN2_GEN_MASK(16, 1)

/* definitions for field: Decrement ADC clock chains delay in reg: Channel 1 control register */
#define FMC516_CH1_CTL_DEC_CHAIN_DLY          WBGEN2_GEN_MASK(17, 1)

/* definitions for field: Reserved in reg: Channel 1 control register */
#define FMC516_CH1_CTL_RESERVED_MASK          WBGEN2_GEN_MASK(18, 14)
#define FMC516_CH1_CTL_RESERVED_SHIFT         18
#define FMC516_CH1_CTL_RESERVED_W(value)      WBGEN2_GEN_WRITE(value, 18, 14)
#define FMC516_CH1_CTL_RESERVED_R(reg)        WBGEN2_GEN_READ(reg, 18, 14)

/* definitions for register: Channel 2 status register */

/* definitions for field: Channel 2 current ADC value in reg: Channel 2 status register */
#define FMC516_CH2_STA_VAL_MASK               WBGEN2_GEN_MASK(0, 16)
#define FMC516_CH2_STA_VAL_SHIFT              0
#define FMC516_CH2_STA_VAL_W(value)           WBGEN2_GEN_WRITE(value, 0, 16)
#define FMC516_CH2_STA_VAL_R(reg)             WBGEN2_GEN_READ(reg, 0, 16)

/* definitions for field: Reserved in reg: Channel 2 status register */
#define FMC516_CH2_STA_RESERVED_MASK          WBGEN2_GEN_MASK(16, 16)
#define FMC516_CH2_STA_RESERVED_SHIFT         16
#define FMC516_CH2_STA_RESERVED_W(value)      WBGEN2_GEN_WRITE(value, 16, 16)
#define FMC516_CH2_STA_RESERVED_R(reg)        WBGEN2_GEN_READ(reg, 16, 16)

/* definitions for register: Channel 2 control register */

/* definitions for field: ADC clock chain delay in reg: Channel 2 control register */
#define FMC516_CH2_CTL_CLK_CHAIN_DLY_MASK     WBGEN2_GEN_MASK(0, 5)
#define FMC516_CH2_CTL_CLK_CHAIN_DLY_SHIFT    0
#define FMC516_CH2_CTL_CLK_CHAIN_DLY_W(value) WBGEN2_GEN_WRITE(value, 0, 5)
#define FMC516_CH2_CTL_CLK_CHAIN_DLY_R(reg)   WBGEN2_GEN_READ(reg, 0, 5)

/* definitions for field: Reserved in reg: Channel 2 control register */
#define FMC516_CH2_CTL_RESERVED_CLK_CHAIN_DLY_MASK WBGEN2_GEN_MASK(5, 3)
#define FMC516_CH2_CTL_RESERVED_CLK_CHAIN_DLY_SHIFT 5
#define FMC516_CH2_CTL_RESERVED_CLK_CHAIN_DLY_W(value) WBGEN2_GEN_WRITE(value, 5, 3)
#define FMC516_CH2_CTL_RESERVED_CLK_CHAIN_DLY_R(reg) WBGEN2_GEN_READ(reg, 5, 3)

/* definitions for field: ADC data chain delay in reg: Channel 2 control register */
#define FMC516_CH2_CTL_DATA_CHAIN_DLY_MASK    WBGEN2_GEN_MASK(8, 5)
#define FMC516_CH2_CTL_DATA_CHAIN_DLY_SHIFT   8
#define FMC516_CH2_CTL_DATA_CHAIN_DLY_W(value) WBGEN2_GEN_WRITE(value, 8, 5)
#define FMC516_CH2_CTL_DATA_CHAIN_DLY_R(reg)  WBGEN2_GEN_READ(reg, 8, 5)

/* definitions for field: Reserved in reg: Channel 2 control register */
#define FMC516_CH2_CTL_RESERVED_DATA_CHAIN_DLY_MASK WBGEN2_GEN_MASK(13, 3)
#define FMC516_CH2_CTL_RESERVED_DATA_CHAIN_DLY_SHIFT 13
#define FMC516_CH2_CTL_RESERVED_DATA_CHAIN_DLY_W(value) WBGEN2_GEN_WRITE(value, 13, 3)
#define FMC516_CH2_CTL_RESERVED_DATA_CHAIN_DLY_R(reg) WBGEN2_GEN_READ(reg, 13, 3)

/* definitions for field: Increment ADC clock chains delay in reg: Channel 2 control register */
#define FMC516_CH2_CTL_INC_CHAIN_DLY          WBGEN2_GEN_MASK(16, 1)

/* definitions for field: Decrement ADC clock chains delay in reg: Channel 2 control register */
#define FMC516_CH2_CTL_DEC_CHAIN_DLY          WBGEN2_GEN_MASK(17, 1)

/* definitions for field: Reserved in reg: Channel 2 control register */
#define FMC516_CH2_CTL_RESERVED_MASK          WBGEN2_GEN_MASK(18, 14)
#define FMC516_CH2_CTL_RESERVED_SHIFT         18
#define FMC516_CH2_CTL_RESERVED_W(value)      WBGEN2_GEN_WRITE(value, 18, 14)
#define FMC516_CH2_CTL_RESERVED_R(reg)        WBGEN2_GEN_READ(reg, 18, 14)

/* definitions for register: Channel 3 status register */

/* definitions for field: Channel 3 current ADC value in reg: Channel 3 status register */
#define FMC516_CH3_STA_VAL_MASK               WBGEN2_GEN_MASK(0, 16)
#define FMC516_CH3_STA_VAL_SHIFT              0
#define FMC516_CH3_STA_VAL_W(value)           WBGEN2_GEN_WRITE(value, 0, 16)
#define FMC516_CH3_STA_VAL_R(reg)             WBGEN2_GEN_READ(reg, 0, 16)

/* definitions for field: Reserved in reg: Channel 3 status register */
#define FMC516_CH3_STA_RESERVED_MASK          WBGEN2_GEN_MASK(16, 16)
#define FMC516_CH3_STA_RESERVED_SHIFT         16
#define FMC516_CH3_STA_RESERVED_W(value)      WBGEN2_GEN_WRITE(value, 16, 16)
#define FMC516_CH3_STA_RESERVED_R(reg)        WBGEN2_GEN_READ(reg, 16, 16)

/* definitions for register: Channel 3 control register */

/* definitions for field: ADC clock chain delay in reg: Channel 3 control register */
#define FMC516_CH3_CTL_CLK_CHAIN_DLY_MASK     WBGEN2_GEN_MASK(0, 5)
#define FMC516_CH3_CTL_CLK_CHAIN_DLY_SHIFT    0
#define FMC516_CH3_CTL_CLK_CHAIN_DLY_W(value) WBGEN2_GEN_WRITE(value, 0, 5)
#define FMC516_CH3_CTL_CLK_CHAIN_DLY_R(reg)   WBGEN2_GEN_READ(reg, 0, 5)

/* definitions for field: Reserved in reg: Channel 3 control register */
#define FMC516_CH3_CTL_RESERVED_CLK_CHAIN_DLY_MASK WBGEN2_GEN_MASK(5, 3)
#define FMC516_CH3_CTL_RESERVED_CLK_CHAIN_DLY_SHIFT 5
#define FMC516_CH3_CTL_RESERVED_CLK_CHAIN_DLY_W(value) WBGEN2_GEN_WRITE(value, 5, 3)
#define FMC516_CH3_CTL_RESERVED_CLK_CHAIN_DLY_R(reg) WBGEN2_GEN_READ(reg, 5, 3)

/* definitions for field: ADC data chain delay in reg: Channel 3 control register */
#define FMC516_CH3_CTL_DATA_CHAIN_DLY_MASK    WBGEN2_GEN_MASK(8, 5)
#define FMC516_CH3_CTL_DATA_CHAIN_DLY_SHIFT   8
#define FMC516_CH3_CTL_DATA_CHAIN_DLY_W(value) WBGEN2_GEN_WRITE(value, 8, 5)
#define FMC516_CH3_CTL_DATA_CHAIN_DLY_R(reg)  WBGEN2_GEN_READ(reg, 8, 5)

/* definitions for field: Reserved in reg: Channel 3 control register */
#define FMC516_CH3_CTL_RESERVED_DATA_CHAIN_DLY_MASK WBGEN2_GEN_MASK(13, 3)
#define FMC516_CH3_CTL_RESERVED_DATA_CHAIN_DLY_SHIFT 13
#define FMC516_CH3_CTL_RESERVED_DATA_CHAIN_DLY_W(value) WBGEN2_GEN_WRITE(value, 13, 3)
#define FMC516_CH3_CTL_RESERVED_DATA_CHAIN_DLY_R(reg) WBGEN2_GEN_READ(reg, 13, 3)

/* definitions for field: Increment ADC clock chains delay in reg: Channel 3 control register */
#define FMC516_CH3_CTL_INC_CHAIN_DLY          WBGEN2_GEN_MASK(16, 1)

/* definitions for field: Decrement ADC clock chains delay in reg: Channel 3 control register */
#define FMC516_CH3_CTL_DEC_CHAIN_DLY          WBGEN2_GEN_MASK(17, 1)

/* definitions for field: Reserved in reg: Channel 3 control register */
#define FMC516_CH3_CTL_RESERVED_MASK          WBGEN2_GEN_MASK(18, 14)
#define FMC516_CH3_CTL_RESERVED_SHIFT         18
#define FMC516_CH3_CTL_RESERVED_W(value)      WBGEN2_GEN_WRITE(value, 18, 14)
#define FMC516_CH3_CTL_RESERVED_R(reg)        WBGEN2_GEN_READ(reg, 18, 14)

PACKED struct FMC516_WB {
  /* [0x0]: REG Status register */
  uint32_t FMC_STA;
  /* [0x4]: REG Control register */
  uint32_t FMC_CTL;
  /* [0x8]: REG Trigger configuration */
  uint32_t TRIG_CFG;
  /* [0xc]: REG Global ADC Status register */
  uint32_t ADC_STA;
  /* [0x10]: REG Global ADC Control register */
  uint32_t ADC_CTL;
  /* [0x14]: REG Channel 0 status register */
  uint32_t CH0_STA;
  /* [0x18]: REG Channel 0 control register */
  uint32_t CH0_CTL;
  /* [0x1c]: REG Channel 1 status register */
  uint32_t CH1_STA;
  /* [0x20]: REG Channel 1 control register */
  uint32_t CH1_CTL;
  /* [0x24]: REG Channel 2 status register */
  uint32_t CH2_STA;
  /* [0x28]: REG Channel 2 control register */
  uint32_t CH2_CTL;
  /* [0x2c]: REG Channel 3 status register */
  uint32_t CH3_STA;
  /* [0x30]: REG Channel 3 control register */
  uint32_t CH3_CTL;
};

#endif
