/* Converted to D from include/gx2r/mem.h by htod */
module gx2r.mem;
//C     #pragma once
//C     #include <wut.h>
import std.c.wut;
//C     #include "resource.h"
import resource;

/**
 * \defgroup gx2r_mem Memory
 * \ingroup gx2r
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef void * (*GX2RAllocFunction)(GX2RResourceFlags, uint32_t, uint32_t);
extern (C):
alias void * function(GX2RResourceFlags , uint32_t , uint32_t )GX2RAllocFunction;
//C     typedef void (*GX2RFreeFunction)(GX2RResourceFlags, void *);
alias void  function(GX2RResourceFlags , void *)GX2RFreeFunction;

//C     void
//C     GX2RInvalidateMemory(GX2RResourceFlags flags,
//C                          void *buffer,
//C                          uint32_t size);
void  GX2RInvalidateMemory(GX2RResourceFlags flags, void *buffer, uint32_t size);

//C     BOOL
//C     GX2RIsUserMemory(GX2RResourceFlags flags);
BOOL  GX2RIsUserMemory(GX2RResourceFlags flags);

//C     void
//C     GX2RSetAllocator(GX2RAllocFunction allocFn,
//C                      GX2RFreeFunction freeFn);
void  GX2RSetAllocator(GX2RAllocFunction allocFn, GX2RFreeFunction freeFn);

//C     #ifdef __cplusplus
//C     }
//C     #endif

/** @} */
