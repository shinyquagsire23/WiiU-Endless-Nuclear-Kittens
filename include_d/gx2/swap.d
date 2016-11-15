/* Converted to D from include/gx2/swap.h by htod */
module gx2.swap;
//C     #pragma once
//C     #include <wut.h>
import wut;
//C     #include "enum.h"
import gx2.constants;
import gx2.surface;
import gx2.texture;

/**
 * \defgroup gx2_swap Swap
 * \ingroup gx2
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef struct GX2ColorBuffer GX2ColorBuffer;
extern (C):
//C     typedef struct GX2Texture GX2Texture;

//C     void
//C     GX2CopyColorBufferToScanBuffer(GX2ColorBuffer *buffer,
//C                                    GX2ScanTarget scanTarget);
void  GX2CopyColorBufferToScanBuffer(GX2ColorBuffer *buffer, GX2ScanTarget scanTarget);

//C     void
//C     GX2SwapScanBuffers();
void  GX2SwapScanBuffers();

//C     bool
//C     GX2GetLastFrame(GX2ScanTarget scanTarget,
//C                     GX2Texture *texture);
bool  GX2GetLastFrame(GX2ScanTarget scanTarget, GX2Texture *texture);

//C     bool
//C     GX2GetLastFrameGamma(GX2ScanTarget scanTarget,
//C                          float *gammaOut);
bool  GX2GetLastFrameGamma(GX2ScanTarget scanTarget, float *gammaOut);

//C     uint32_t
//C     GX2GetSwapInterval();
uint  GX2GetSwapInterval();

//C     void
//C     GX2SetSwapInterval(uint32_t interval);
void  GX2SetSwapInterval(uint interval);

//C     #ifdef __cplusplus
//C     }
//C     #endif

/** @} */
