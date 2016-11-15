/* Converted to D from include/gx2/surface.h by htod */
module gx2.surface;
//C     #pragma once
//C     #include <wut.h>
import wut;
//C     #include "enum.h"
import gx2.constants;

extern (C):

struct GX2Surface
{
    GX2SurfaceDim dim;
    uint width;
    uint height;
    uint depth;
    uint mipLevels;
    GX2SurfaceFormat format;
    GX2AAMode aa;
    GX2SurfaceUse use;
    uint imageSize;
    void *image;
    uint mipmapSize;
    void *mipmaps;
    GX2TileMode tileMode;
    uint swizzle;
    uint alignment;
    uint pitch;
    uint [13]mipLevelOffset;
}

struct GX2DepthBuffer
{
   GX2Surface surface;

   uint viewMip;
   uint viewFirstSlice;
   uint viewNumSlices;
   void *hiZPtr;
   uint hiZSize;
   float depthClear;
   uint stencilClear;

   uint regs[7];
}

struct GX2ColorBuffer
{
   GX2Surface surface;

   uint viewMip;
   uint viewFirstSlice;
   uint viewNumSlices;
   void *aaBuffer;
   uint aaSize;

   uint regs[5];
}

void
GX2CalcSurfaceSizeAndAlignment(GX2Surface *surface);

void
GX2CalcDepthBufferHiZInfo(GX2DepthBuffer *depthBuffer,
                          uint *outSize,
                          uint *outAlignment);

void
GX2CalcColorBufferAuxInfo(GX2ColorBuffer *surface,
                          uint *outSize,
                          uint *outAlignment);

void
GX2SetColorBuffer(GX2ColorBuffer *colorBuffer,
                  GX2RenderTarget target);

void
GX2SetDepthBuffer(GX2DepthBuffer *depthBuffer);

void
GX2InitColorBufferRegs(GX2ColorBuffer *colorBuffer);

void
GX2InitDepthBufferRegs(GX2DepthBuffer *depthBuffer);

void
GX2InitDepthBufferHiZEnable(GX2DepthBuffer *depthBuffer,
                            bool enable);

uint
GX2GetSurfaceSwizzle(GX2Surface *surface);

void
GX2SetSurfaceSwizzle(GX2Surface *surface,
                     uint swizzle);

void
GX2CopySurface(GX2Surface *src,
               uint srcLevel,
               uint srcDepth,
               GX2Surface *dst,
               uint dstLevel,
               uint dstDepth);
