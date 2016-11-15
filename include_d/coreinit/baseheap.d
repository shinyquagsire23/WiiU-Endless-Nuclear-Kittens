/* Converted to D from include/coreinit/baseheap.h by htod */
module coreinit.baseheap;
//C     #pragma once
//C     #include <wut.h>
import std.c.wut;

/**
 * \defgroup coreinit_baseheap Base Heap
 * \ingroup coreinit
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef void *MEMHeapHandle;
extern (C):
alias void *MEMHeapHandle;

//C     typedef enum MEMBaseHeapType
//C     {
//C        MEM_BASE_HEAP_MEM1   = 0,
//C        MEM_BASE_HEAP_MEM2   = 1,
//C        MEM_BASE_HEAP_FG     = 8,
//C     } MEMBaseHeapType;
enum MEMBaseHeapType
{
    MEM_BASE_HEAP_MEM1,
    MEM_BASE_HEAP_MEM2,
    MEM_BASE_HEAP_FG = 8,
}

/**
 * Get which memory area a heap belongs to.
 */
//C     MEMBaseHeapType
//C     MEMGetArena(MEMHeapHandle handle);
MEMBaseHeapType  MEMGetArena(MEMHeapHandle handle);

/**
 * Get base heap for memory area.
 */
//C     MEMHeapHandle
//C     MEMGetBaseHeapHandle(MEMBaseHeapType type);
MEMHeapHandle  MEMGetBaseHeapHandle(MEMBaseHeapType type);

/**
 * Set base heap for memory area.
 */
//C     MEMHeapHandle
//C     MEMSetBaseHeapHandle(MEMBaseHeapType type,
//C                          MEMHeapHandle handle);
MEMHeapHandle  MEMSetBaseHeapHandle(MEMBaseHeapType type, MEMHeapHandle handle);

//C     #ifdef __cplusplus
//C     }
//C     #endif

/** @} */
