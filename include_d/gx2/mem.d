/* Converted to D from include/gx2/mem.h by htod */
module gx2.mem;
//C     #pragma once
//C     #include <wut.h>
import wut;
//C     #include "enum.h"
import gx2.constants;

/**
 * \defgroup gx2_mem Memory
 * \ingroup gx2
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     void
//C     GX2Invalidate(GX2InvalidateMode mode,
//C                   void *buffer,
//C                   uint size);
extern (C):
void  GX2Invalidate(GX2InvalidateMode mode, void *buffer, uint size);

//C     #ifdef __cplusplus
//C     }
//C     #endif

/** @} */
