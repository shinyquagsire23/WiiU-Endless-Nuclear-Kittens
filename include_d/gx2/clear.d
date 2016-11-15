/* Converted to D from include/gx2/clear.h by htod */
module gx2.clear;
//C     #pragma once
//C     #include <wut.h>
import wut;
//C     #include "enum.h"
import gx2.constants;
import gx2.surface;

/**
 * \defgroup gx2_clear Clear
 * \ingroup gx2
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef struct GX2ColorBuffer GX2ColorBuffer;
extern (C):
//C     typedef struct GX2DepthBuffer GX2DepthBuffer;

//C     void
//C     GX2ClearColor(GX2ColorBuffer *colorBuffer,
//C                   float red,
//C                   float green,
//C                   float blue,
//C                   float alpha);
void  GX2ClearColor(GX2ColorBuffer *colorBuffer, float red, float green, float blue, float alpha);

//C     void
//C     GX2ClearDepthStencilEx(GX2DepthBuffer *depthBuffer,
//C                            float depth,
//C                            ubyte stencil,
//C                            GX2ClearFlags clearMode);
void  GX2ClearDepthStencilEx(GX2DepthBuffer *depthBuffer, float depth, ubyte stencil, GX2ClearFlags clearMode);

//C     void
//C     GX2ClearBuffersEx(GX2ColorBuffer *colorBuffer,
//C                       GX2DepthBuffer *depthBuffer,
//C                       float red,
//C                       float green,
//C                       float blue,
//C                       float alpha,
//C                       float depth,
//C                       ubyte stencil,
//C                       GX2ClearFlags clearMode);
void  GX2ClearBuffersEx(GX2ColorBuffer *colorBuffer, GX2DepthBuffer *depthBuffer, float red, float green, float blue, float alpha, float depth, ubyte stencil, GX2ClearFlags clearMode);

//C     void
//C     GX2SetClearDepth(GX2DepthBuffer *depthBuffer,
//C                      float depth);
void  GX2SetClearDepth(GX2DepthBuffer *depthBuffer, float depth);

//C     void
//C     GX2SetClearStencil(GX2DepthBuffer *depthBuffer,
//C                        ubyte stencil);
void  GX2SetClearStencil(GX2DepthBuffer *depthBuffer, ubyte stencil);

//C     void
//C     GX2SetClearDepthStencil(GX2DepthBuffer *depthBuffer,
//C                             float depth,
//C                             ubyte stencil);
void  GX2SetClearDepthStencil(GX2DepthBuffer *depthBuffer, float depth, ubyte stencil);

//C     #ifdef __cplusplus
//C     }
//C     #endif

/** @} */
