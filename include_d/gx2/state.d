/* Converted to D from include/gx2/state.h by htod */
module gx2.state;
//C     #pragma once
//C     #include <wut.h>
import wut;
//C     #include "enum.h"
import gx2.constants;

/**
 * \defgroup gx2_state State
 * \ingroup gx2
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     void
//C     GX2Init(uint32_t *attributes);
extern (C):
void  GX2Init(uint *attributes);

//C     void
//C     GX2Shutdown();
void  GX2Shutdown();

//C     void
//C     GX2Flush();
void  GX2Flush();

//C     #ifdef __cplusplus
//C     }
//C     #endif

/** @} */
