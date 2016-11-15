/* Converted to D from include/coreinit/core.h by htod */
module coreinit.core;
//C     #pragma once
//C     #include <wut.h>
import wut;

/**
 * \defgroup coreinit_core Core Identification
 * \ingroup coreinit
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif


/**
 * Returns the number of cores, should always be 3.
 */
//C     uint32_t
//C     OSGetCoreCount();
extern (C):
uint  OSGetCoreCount();


/**
 * Returns the ID of the core currently executing this thread.
 */
//C     uint32_t
//C     OSGetCoreId();
uint  OSGetCoreId();


/**
 * Returns the ID of the main core.
 */
//C     uint32_t
//C     OSGetMainCoreId();
uint  OSGetMainCoreId();


/**
 * Returns true if the current core is the main core.
 */
//C     bool
//C     OSIsMainCore();
bool  OSIsMainCore();


//C     #ifdef __cplusplus
//C     }
//C     #endif

/** @} */
