/* Converted to D from include/coreinit/cache.h by htod */
module coreinit.cache;
//C     #pragma once
//C     #include <wut.h>
import std.c.wut;

/**
 * \defgroup coreinit_cache Cache
 * \ingroup coreinit
 *
 * Cache synchronisation functions.
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif


/**
 * Equivalent to dcbi instruction.
 */
//C     void
//C     DCInvalidateRange(void *addr,
//C                       uint32_t size);
extern (C):
void  DCInvalidateRange(void *addr, uint32_t size);


/**
 * Equivalent to dcbf, sync, eieio.
 */
//C     void
//C     DCFlushRange(void *addr,
//C                  uint32_t size);
void  DCFlushRange(void *addr, uint32_t size);


/**
 * Equivalent to dcbst, sync, eieio.
 */
//C     void
//C     DCStoreRange(void *addr,
//C                  uint32_t size);
void  DCStoreRange(void *addr, uint32_t size);


/**
 * Equivalent to dcbf.
 *
 * Does not perform sync, eieio like DCFlushRange.
 */
//C     void
//C     DCFlushRangeNoSync(void *addr,
//C                        uint32_t size);
void  DCFlushRangeNoSync(void *addr, uint32_t size);


/**
 * Equivalent to dcbst.
 *
 * Does not perform sync, eieio like DCStoreRange.
 */
//C     void
//C     DCStoreRangeNoSync(void *addr,
//C                        uint32_t size);
void  DCStoreRangeNoSync(void *addr, uint32_t size);


/**
 * Equivalent to dcbz instruction.
 */
//C     void
//C     DCZeroRange(void *addr,
//C                 uint32_t size);
void  DCZeroRange(void *addr, uint32_t size);


/**
 * Equivalent to dcbt instruction.
 */
//C     void
//C     DCTouchRange(void *addr,
//C                  uint32_t size);
void  DCTouchRange(void *addr, uint32_t size);


/**
 * Equivalent to icbi instruction.
 */
//C     void
//C     ICInvalidateRange(void *addr,
//C                       uint32_t size);
void  ICInvalidateRange(void *addr, uint32_t size);

//C     #ifdef __cplusplus
//C     }
//C     #endif

/** @} */
