//----------------------------------------------------------------
// Statically-allocated memory manager
//
// by Eli Bendersky (eliben@gmail.com)
//
// This code is in the public domain.
//----------------------------------------------------------------
#include "memmgr.h"  // memmgr functions definitions
//#include "mprintf.h"
#include "pp-printf.h"  // pp_printf()

typedef uint32_t Align;

union mem_header_union
{
	struct
	{
		// Pointer to the next block in the free list
		//
		union mem_header_union* next;

		// Size of the block (in quantas of sizeof(mem_header_t))
		//
		uint32_t size;
	} s;

	// Used to align headers in memory to a boundary
	//
	Align align_dummy;
};

typedef union mem_header_union mem_header_t;

// Initial empty list
//
static mem_header_t base;

// Start of free list
//
static mem_header_t* freep = 0;

// Static pool for new allocations
//
static uint8_t pool[POOL_SIZE] = {0};
static uint32_t pool_free_pos = 0;

void memmgr_init()
{
	base.s.next = 0;
	base.s.size = 0;
	freep = 0;
	pool_free_pos = 0;
}

void memmgr_print_stats()
{
#ifdef DEBUG_MEMMGR_SUPPORT_STATS
	mem_header_t* p;

	pp_printf("-------------------------------------------\n");
	pp_printf("|            Memory manager stats         |\n");
	pp_printf("-------------------------------------------\n\n");

	pp_printf("pool: free_pos = %u (%u bytes left)\n\n",
			pool_free_pos, POOL_SIZE - pool_free_pos);

	p = (mem_header_t*) pool;

	while (p < (mem_header_t*) (pool + pool_free_pos)){
		pp_printf(        "   * addr: 0x%8u; size: %8u\n",
				p, p->s.size);

		p += p->s.size;
	}

	pp_printf("\nfree list:\n\n");

	if (freep){
		p = freep;

		while (1){
			pp_printf(        "   * addr: 0x%8u; size: %8u; next: 0x%8u\n",
					p, p->s.size, p->s.next);

			p = p->s.next;

			if (p == freep)
				break;
		}
	}
	else{
		pp_printf("empty\n");
	}

#endif // DEBUG_MEMMGR_SUPPORT_STATS
}

static mem_header_t* get_mem_from_pool(uint32_t nquantas)
{
	uint32_t total_req_size;

	mem_header_t* h;

	if (nquantas < MIN_POOL_ALLOC_QUANTAS)
		nquantas = MIN_POOL_ALLOC_QUANTAS;

	total_req_size = nquantas * sizeof(mem_header_t);

	if (pool_free_pos + total_req_size <= POOL_SIZE){
		h = (mem_header_t*) (pool + pool_free_pos);
		h->s.size = nquantas;
		memmgr_free((void*) (h + 1));
		pool_free_pos += total_req_size;
	}
	else{
		return 0;
	}

	return freep;
}

// Allocations are done in 'quantas' of header size.
// The search for a free block of adequate size begins at the point 'freep'
// where the last block was found.
// If a too-big block is found, it is split and the tail is returned (this
// way the header of the original needs only to have its size adjusted).
// The pointer returned to the user points to the free space within the block,
// which begins one quanta after the header.
//
void* memmgr_alloc(uint32_t nbytes)
{
	mem_header_t* p;
	mem_header_t* prevp;

	// Calculate how many quantas are required: we need enough to house all
	// the requested bytes, plus the header. The -1 and +1 are there to make sure
	// that if nbytes is a multiple of nquantas, we don't allocate too much
	//
	uint32_t nquantas = (nbytes + sizeof(mem_header_t) - 1) / sizeof(mem_header_t) + 1;

	// First alloc call, and no free list yet ? Use 'base' for an initial
	// denegerate block of size 0, which points to itself
	//
	if ((prevp = freep) == 0){
		base.s.next = freep = prevp = &base;
		base.s.size = 0;
	}

	for (p = prevp->s.next; ; prevp = p, p = p->s.next){
		// big enough ?
		if (p->s.size >= nquantas) {
			// exactly ?
			if (p->s.size == nquantas){
				// just eliminate this block from the free list by pointing
				// its prev's next to its next
				//
				prevp->s.next = p->s.next;
			}
			// too big
			else{
				p->s.size -= nquantas;
				p += p->s.size;
				p->s.size = nquantas;
			}

			freep = prevp;
			return (void*) (p + 1);
		}
		// Reached end of free list ?
		// Try to allocate the block from the pool. If that succeeds,
		// get_mem_from_pool adds the new block to the free list and
		// it will be found in the following iterations. If the call
		// to get_mem_from_pool doesn't succeed, we've run out of
		// memory
		//
		else if (p == freep){
			if ((p = get_mem_from_pool(nquantas)) == 0){
#ifdef DEBUG_MEMMGR_FATAL
				pp_printf("!! Memory allocation failed !!\n");
#endif
				return 0;
			}
		}
	}
}

// Scans the free list, starting at freep, looking the the place to insert the
// free block. This is either between two existing blocks or at the end of the
// list. In any case, if the block being freed is adjacent to either neighbor,
// the adjacent blocks are combined.
//
void memmgr_free(void* ap)
{
	mem_header_t* block;
	mem_header_t* p;

	// acquire pointer to block header
	block = ((mem_header_t*) ap) - 1;

	// Find the correct place to place the block in (the free list is sorted by
	// address, increasing order)
	//
	for (p = freep; !(block > p && block < p->s.next); p = p->s.next){
		// Since the free list is circular, there is one link where a
		// higher-addressed block points to a lower-addressed block.
		// This condition checks if the block should be actually
		// inserted between them
		//
		if (p >= p->s.next && (block > p || block < p->s.next))
			break;
	}

	// Try to combine with the higher neighbor
	//
	if (block + block->s.size == p->s.next){
		block->s.size += p->s.next->s.size;
		block->s.next = p->s.next->s.next;
	}
	else{
		block->s.next = p->s.next;
	}

	// Try to combine with the lower neighbor
	//
	if (p + p->s.size == block){
		p->s.size += block->s.size;
		p->s.next = block->s.next;
	}
	else{
		p->s.next = block;
	}

	freep = p;
}
