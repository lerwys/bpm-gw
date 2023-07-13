`define ADDR_BPM_SWAP_CTRL             3'h0
`define BPM_SWAP_CTRL_RST_OFFSET 0
`define BPM_SWAP_CTRL_RST 32'h00000001
`define BPM_SWAP_CTRL_MODE_OFFSET 1
`define BPM_SWAP_CTRL_MODE 32'h00000006
`define BPM_SWAP_CTRL_RESERVED_OFFSET 3
`define BPM_SWAP_CTRL_RESERVED 32'h00000018
`define BPM_SWAP_CTRL_SWAP_DIV_F_CNT_EN_OFFSET 5
`define BPM_SWAP_CTRL_SWAP_DIV_F_CNT_EN 32'h00000020
`define BPM_SWAP_CTRL_SWAP_DIV_F_OFFSET 8
`define BPM_SWAP_CTRL_SWAP_DIV_F 32'h00ffff00
`define ADDR_BPM_SWAP_DLY              3'h4
`define BPM_SWAP_DLY_DESWAP_OFFSET 0
`define BPM_SWAP_DLY_DESWAP 32'h0000ffff
`define BPM_SWAP_DLY_RESERVED_OFFSET 16
`define BPM_SWAP_DLY_RESERVED 32'hffff0000
