/* Converted to D from include/coreinit/atomic64.h by htod */
module coreinit.atomic64;
//C     #pragma once
//C     #include <wut.h>
import std.c.wut;

/**
 * \defgroup coreinit_atomic64 Atomic 64 bit
 * \ingroup coreinit
 *
 * These functions are used for atomically operating on 64 bit values in memory.
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     uint64_t
//C     OSGetAtomic64(uint64_t *ptr);
extern (C):
uint64_t  OSGetAtomic64(uint64_t *ptr);

//C     uint64_t
//C     OSSetAtomic64(uint64_t *ptr,
//C                   uint64_t value);
uint64_t  OSSetAtomic64(uint64_t *ptr, uint64_t value);

//C     BOOL
//C     OSCompareAndSwapAtomic64(uint64_t *ptr,
//C                              uint64_t compare,
//C                              uint64_t value);
BOOL  OSCompareAndSwapAtomic64(uint64_t *ptr, uint64_t compare, uint64_t value);

//C     BOOL
//C     OSCompareAndSwapAtomicEx64(uint64_t *ptr,
//C                                uint64_t compare,
//C                                uint64_t value,
//C                                uint64_t *old);
BOOL  OSCompareAndSwapAtomicEx64(uint64_t *ptr, uint64_t compare, uint64_t value, uint64_t *old);

//C     uint64_t
//C     OSSwapAtomic64(uint64_t *ptr,
//C                    uint64_t value);
uint64_t  OSSwapAtomic64(uint64_t *ptr, uint64_t value);

//C     int64_t
//C     OSAddAtomic64(int64_t *ptr,
//C                   int64_t value);
int64_t  OSAddAtomic64(int64_t *ptr, int64_t value);

//C     uint64_t
//C     OSAndAtomic64(uint64_t *ptr,
//C                   uint64_t value);
uint64_t  OSAndAtomic64(uint64_t *ptr, uint64_t value);

//C     uint64_t
//C     OSOrAtomic64(uint64_t *ptr,
//C                  uint64_t value);
uint64_t  OSOrAtomic64(uint64_t *ptr, uint64_t value);

//C     uint64_t
//C     OSXorAtomic64(uint64_t *ptr,
//C                   uint64_t value);
uint64_t  OSXorAtomic64(uint64_t *ptr, uint64_t value);

//C     BOOL
//C     OSTestAndClearAtomic64(uint64_t *ptr,
//C                            uint32_t bit);
BOOL  OSTestAndClearAtomic64(uint64_t *ptr, uint32_t bit);

//C     BOOL
//C     OSTestAndSetAtomic64(uint64_t *ptr,
//C                          uint32_t bit);
BOOL  OSTestAndSetAtomic64(uint64_t *ptr, uint32_t bit);

//C     #ifdef __cplusplus
//C     }
//C     #endif

/** @} */
