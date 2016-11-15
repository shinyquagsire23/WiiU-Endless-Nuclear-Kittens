/* Converted to D from include/gx2/draw.h by htod */
module gx2.draw;
//C     #pragma once
//C     #include <wut.h>
import wut;
//C     #include "enum.h"
import gx2.constants;

/**
 * \defgroup gx2_draw Draw
 * \ingroup gx2
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     void
//C     GX2SetAttribBuffer(uint index,
//C                        uint size,
//C                        uint stride,
//C                        void *buffer);
extern (C):
void  GX2SetAttribBuffer(uint index, uint size, uint stride, void *buffer);

//C     void
//C     GX2DrawEx(GX2PrimitiveMode mode,
//C               uint count,
//C               uint offset,
//C               uint numInstances);
void  GX2DrawEx(GX2PrimitiveMode mode, uint count, uint offset, uint numInstances);

//C     void
//C     GX2DrawEx2(GX2PrimitiveMode mode,
//C                uint count,
//C                uint offset,
//C                uint numInstances,
//C                uint baseInstance);
void  GX2DrawEx2(GX2PrimitiveMode mode, uint count, uint offset, uint numInstances, uint baseInstance);

//C     void
//C     GX2DrawIndexedEx(GX2PrimitiveMode mode,
//C                      uint count,
//C                      GX2IndexType indexType,
//C                      void *indices,
//C                      uint offset,
//C                      uint numInstances);
void  GX2DrawIndexedEx(GX2PrimitiveMode mode, uint count, GX2IndexType indexType, void *indices, uint offset, uint numInstances);

//C     void
//C     GX2DrawIndexedEx2(GX2PrimitiveMode mode,
//C                       uint count,
//C                       GX2IndexType indexType,
//C                       void *indices,
//C                       uint offset,
//C                       uint numInstances,
//C                       uint baseInstance);
void  GX2DrawIndexedEx2(GX2PrimitiveMode mode, uint count, GX2IndexType indexType, void *indices, uint offset, uint numInstances, uint baseInstance);

//C     void
//C     GX2DrawIndexedImmediateEx(GX2PrimitiveMode mode,
//C                               uint count,
//C                               GX2IndexType indexType,
//C                               void *indices,
//C                               uint offset,
//C                               uint numInstances);
void  GX2DrawIndexedImmediateEx(GX2PrimitiveMode mode, uint count, GX2IndexType indexType, void *indices, uint offset, uint numInstances);

//C     void
//C     GX2SetPrimitiveRestartIndex(uint index);
void  GX2SetPrimitiveRestartIndex(uint index);

//C     #ifdef __cplusplus
//C     }
//C     #endif

/** @} */
