/* Converted to D from include/gx2r/surface.h by htod */
module gx2r.surface;
//C     #pragma once
//C     #include <wut.h>
import std.c.wut;
//C     #include "resource.h"
import resource;

/**
 * \defgroup gx2r_surface Surface
 * \ingroup gx2r
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef struct GX2Surface GX2Surface;
extern (C):

//C     bool
//C     GX2RCreateSurface(GX2Surface *surface,
//C                       GX2RResourceFlags flags);
bool  GX2RCreateSurface(GX2Surface *surface, GX2RResourceFlags flags);

//C     bool
//C     GX2RCreateSurfaceUserMemory(GX2Surface *surface,
//C                                 uint8_t *image,
//C                                 uint8_t *mipmap,
//C                                 GX2RResourceFlags flags);
bool  GX2RCreateSurfaceUserMemory(GX2Surface *surface, uint8_t *image, uint8_t *mipmap, GX2RResourceFlags flags);

//C     void
//C     GX2RDestroySurfaceEx(GX2Surface *surface,
//C                          GX2RResourceFlags flags);
void  GX2RDestroySurfaceEx(GX2Surface *surface, GX2RResourceFlags flags);

//C     void
//C     GX2RInvalidateSurface(GX2Surface *surface,
//C                           int32_t level,
//C                           GX2RResourceFlags flags);
void  GX2RInvalidateSurface(GX2Surface *surface, int32_t level, GX2RResourceFlags flags);

//C     void *
//C     GX2RLockSurfaceEx(GX2Surface *surface,
//C                       int32_t level,
//C                       GX2RResourceFlags flags);
void * GX2RLockSurfaceEx(GX2Surface *surface, int32_t level, GX2RResourceFlags flags);

//C     void
//C     GX2RUnlockSurfaceEx(GX2Surface *surface,
//C                         int32_t level,
//C                         GX2RResourceFlags flags);
void  GX2RUnlockSurfaceEx(GX2Surface *surface, int32_t level, GX2RResourceFlags flags);

//C     #ifdef __cplusplus
//C     }
//C     #endif

/** @} */
