/*
   Register definitions for slave core: Virtual UART

 * File					 : wb_vuart.h
 * Author				 : auto-generated by wbgen2 from wb_virtual_uart.wb
 * Created				: Wed Apr	6 23:02:01 2011
 * Standard			 : ANSI C

 THIS FILE WAS GENERATED BY wbgen2 FROM SOURCE FILE wb_virtual_uart.wb
 DO NOT HAND-EDIT UNLESS IT'S ABSOLUTELY NECESSARY!

 */

#ifndef __WBGEN2_REGDEFS_WB_VIRTUAL_UART_WB
#define __WBGEN2_REGDEFS_WB_VIRTUAL_UART_WB

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

/* definitions for register: Status Register */

/* definitions for field: TX busy in reg: Status Register */
#define UART_SR_TX_BUSY											 WBGEN2_GEN_MASK(0, 1)

/* definitions for field: RX ready in reg: Status Register */
#define UART_SR_RX_RDY												WBGEN2_GEN_MASK(1, 1)

/* definitions for register: Baudrate control register */

/* definitions for register: Transmit data regsiter */

/* definitions for field: Transmit data in reg: Transmit data regsiter */
#define UART_TDR_TX_DATA_MASK								 WBGEN2_GEN_MASK(0, 8)
#define UART_TDR_TX_DATA_SHIFT								0
#define UART_TDR_TX_DATA_W(value)						 WBGEN2_GEN_WRITE(value, 0, 8)
#define UART_TDR_TX_DATA_R(reg)							 WBGEN2_GEN_READ(reg, 0, 8)

/* definitions for register: Receive data regsiter */

/* definitions for field: Received data in reg: Receive data regsiter */
#define UART_RDR_RX_DATA_MASK								 WBGEN2_GEN_MASK(0, 8)
#define UART_RDR_RX_DATA_SHIFT								0
#define UART_RDR_RX_DATA_W(value)						 WBGEN2_GEN_WRITE(value, 0, 8)
#define UART_RDR_RX_DATA_R(reg)							 WBGEN2_GEN_READ(reg, 0, 8)

/* definitions for register: FIFO 'UART TX FIFO' data output register 0 */

/* definitions for field: Char sent by UART to TX in reg: FIFO 'UART TX FIFO' data output register 0 */
#define UART_DEBUG_R0_TX_MASK								 WBGEN2_GEN_MASK(0, 8)
#define UART_DEBUG_R0_TX_SHIFT								0
#define UART_DEBUG_R0_TX_W(value)						 WBGEN2_GEN_WRITE(value, 0, 8)
#define UART_DEBUG_R0_TX_R(reg)							 WBGEN2_GEN_READ(reg, 0, 8)

/* definitions for register: FIFO 'UART TX FIFO' control/status register */

/* definitions for field: FIFO full flag in reg: FIFO 'UART TX FIFO' control/status register */
#define UART_DEBUG_CSR_FULL									 WBGEN2_GEN_MASK(16, 1)

/* definitions for field: FIFO empty flag in reg: FIFO 'UART TX FIFO' control/status register */
#define UART_DEBUG_CSR_EMPTY									WBGEN2_GEN_MASK(17, 1)

/* definitions for field: FIFO counter in reg: FIFO 'UART TX FIFO' control/status register */
#define UART_DEBUG_CSR_USEDW_MASK						 WBGEN2_GEN_MASK(0, 8)
#define UART_DEBUG_CSR_USEDW_SHIFT						0
#define UART_DEBUG_CSR_USEDW_W(value)				 WBGEN2_GEN_WRITE(value, 0, 8)
#define UART_DEBUG_CSR_USEDW_R(reg)					 WBGEN2_GEN_READ(reg, 0, 8)

PACKED struct UART_WB {
	/* [0x0]: REG Status Register */
	uint32_t SR;
	/* [0x4]: REG Baudrate control register */
	uint32_t BCR;
	/* [0x8]: REG Transmit data regsiter */
	uint32_t TDR;
	/* [0xc]: REG Receive data regsiter */
	uint32_t RDR;
	/* [0x10]: REG FIFO 'UART TX FIFO' data output register 0 */
	uint32_t DEBUG_R0;
	/* [0x14]: REG FIFO 'UART TX FIFO' control/status register */
	uint32_t DEBUG_CSR;
};

#endif
