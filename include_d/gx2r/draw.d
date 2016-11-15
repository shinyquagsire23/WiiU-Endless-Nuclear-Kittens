/* Converted to D from include/gx2r/draw.h by htod */
module gx2r.draw;
//C     #pragma once
//C     #include <wut.h>
import std.c.wut;
//C     #include <gx2/enum.h>
import std.c.enum;
//C     #include "resource.h"
import resource;

/**
 * \defgroup gx2r_draw Draw
 * \ingroup gx2r
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef struct GX2RBuffer GX2RBuffer;
extern (C):

//C     void
//C     GX2RSetAttributeBuffer(GX2RBuffer *buffer,
//C                            uint32_t index,
//C                            uint32_t stride,
//C                            uint32_t offset);
void  GX2RSetAttributeBuffer(GX2RBuffer *buffer, uint32_t index, uint32_t stride, uint32_t offset);

//C     void
//C     GX2RDrawIndexed(GX2PrimitiveMode mode,
//C                     GX2RBuffer *buffer,
//C                     GX2IndexType indexType,
//C                     uint32_t count,
//C                     uint32_t indexOffset,
//C                     uint32_t vertexOffset,
//C                     uint32_t numInstances);
void  GX2RDrawIndexed(GX2PrimitiveMode mode, GX2RBuffer *buffer, GX2IndexType indexType, uint32_t count, uint32_t indexOffset, uint32_t vertexOffset, uint32_t numInstances);

//C     #ifdef __cplusplus
//C     }
//C     #endif

/** @} */
