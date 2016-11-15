/* Converted to D from include/coreinit/expandedheap.h by htod */
module coreinit.expandedheap;
//C     #pragma once
//C     #include <wut.h>
import std.c.wut;

/**
 * \defgroup coreinit_expheap Expanded Heap
 * \ingroup coreinit
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef struct MEMExpandedHeap MEMExpandedHeap;
extern (C):
//C     typedef struct MEMExpandedHeapBlock MEMExpandedHeapBlock;
//C     typedef struct MEMExpandedHeapBlockList MEMExpandedHeapBlockList;

//C     typedef enum MEMExpandedHeapMode
//C     {
//C        MEM_EXP_HEAP_MODE_FIRST_FREE     = 0,
//C        MEM_EXP_HEAP_MODE_NEAREST_SIZE   = 1,
//C     } MEMExpandedHeapMode;
enum MEMExpandedHeapMode
{
    MEM_EXP_HEAP_MODE_FIRST_FREE,
    MEM_EXP_HEAP_MODE_NEAREST_SIZE,
}

//C     typedef enum MEMExpandedHeapDirection
//C     {
//C        MEM_EXP_HEAP_DIR_FROM_TOP        = 0,
//C        MEM_EXP_HEAP_DIR_FROM_BOTTOM     = 1,
//C     } MEMExpandedHeapDirection;
enum MEMExpandedHeapDirection
{
    MEM_EXP_HEAP_DIR_FROM_TOP,
    MEM_EXP_HEAP_DIR_FROM_BOTTOM,
}

//C     struct MEMExpandedHeapBlock
//C     {
//C        uint32_t attribs;
//C        uint32_t blockSize;
//C        MEMExpandedHeapBlock *prev;
//C        MEMExpandedHeapBlock *next;
//C        uint16_t tag;
//C        UNKNOWN(0x02);
//C     };
struct MEMExpandedHeapBlock
{
    uint32_t attribs;
    uint32_t blockSize;
    MEMExpandedHeapBlock *prev;
    MEMExpandedHeapBlock *next;
    uint16_t tag;
    char [2]__unk__COUNTER__;
}
//C     CHECK_OFFSET(MEMExpandedHeapBlock, 0x00, attribs);
//C     CHECK_OFFSET(MEMExpandedHeapBlock, 0x04, blockSize);
symbol static_assert
//C     CHECK_OFFSET(MEMExpandedHeapBlock, 0x08, prev);
symbol static_assert
//C     CHECK_OFFSET(MEMExpandedHeapBlock, 0x0c, next);
symbol static_assert
//C     CHECK_OFFSET(MEMExpandedHeapBlock, 0x10, tag);
