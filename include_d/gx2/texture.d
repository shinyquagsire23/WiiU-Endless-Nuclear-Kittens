/* Converted to D from include/gx2/texture.h by htod */
module gx2.texture;
//C     #pragma once
//C     #include <wut.h>
import wut;
//C     #include "surface.h"
import gx2.surface;

extern (C):

struct GX2Texture
{
   GX2Surface surface;
   uint viewFirstMip;
   uint viewNumMips;
   uint viewFirstSlice;
   uint viewNumSlices;
   uint compMap;

   uint regs[5];
}

void
GX2InitTextureRegs(GX2Texture *texture);

void
GX2SetPixelTexture(GX2Texture *texture,
                   uint unit);

void
GX2SetVertexTexture(GX2Texture *texture,
                    uint unit);

void
GX2SetGeometryTexture(GX2Texture *texture,
                      uint unit);
