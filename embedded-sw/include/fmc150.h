#ifndef _FMC150_H_
#define _FMC150_H_

#include "hw/wb_fmc150.h"

/* Type definitions */
typedef volatile struct FMC150_WB fmc150_t;

/* FMC150 user interface */
void fmc150_init(void);
/* DMA user interface */
/*int read_is_addr(dma_t dma);
void write_is_addr(dma_t dma, int addr);
int read_strd(dma_t dma);
void write_strd(dma_t dma, int strd);
int read_tr_count(dma_t dma);*/
      
#endif
        
