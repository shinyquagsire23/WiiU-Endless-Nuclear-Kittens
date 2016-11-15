/* Converted to D from include/coreinit/memory.h by htod */
module coreinit.memory;
//C     #pragma once
//C     #include <wut.h>
import std.c.wut;

/**
 * \defgroup coreinit_memory Memory
 * \ingroup coreinit
 *
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     void *
//C     OSBlockMove(void *dst,
//C                 const void *src,
//C                 uint32_t size,
//C                 BOOL flush);
extern (C):
void * OSBlockMove(void *dst, void *src, uint32_t size, BOOL flush);

//C     void *
//C     OSBlockSet(void *dst,
//C                uint8_t val,
//C                uint32_t size);
void * OSBlockSet(void *dst, uint8_t val, uint32_t size);

//C     uint32_t
//C     OSEffectiveToPhysical(void *vaddr);
uint32_t  OSEffectiveToPhysical(void *vaddr);

//C     void*
//C     OSAllocFromSystem(uint32_t size,
//C                       int align);
void * OSAllocFromSystem(uint32_t size, int align);

//C     void
//C     OSFreeToSystem(void *ptr);
void  OSFreeToSystem(void *ptr);

//C     #ifdef __cplusplus
//C     }
//C     #endif

/** @} */
