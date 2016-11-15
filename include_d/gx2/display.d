/* Converted to D from include/gx2/display.h by htod */
module gx2.display;
//C     #pragma once
//C     #include <wut.h>
import wut;
//C     #include "enum.h"
import gx2.constants;
//C     #include "surface.h"
import gx2.surface;

extern (C):

void
GX2SetTVEnable(bool enable);

void
GX2SetDRCEnable(bool enable);

void
GX2CalcTVSize(GX2TVRenderMode tvRenderMode,
              GX2SurfaceFormat surfaceFormat,
              GX2BufferingMode bufferingMode,
              uint *size,
              uint *unkOut);

void
GX2CalcDRCSize(GX2DrcRenderMode drcRenderMode,
               GX2SurfaceFormat surfaceFormat,
               GX2BufferingMode bufferingMode,
               uint *size,
               uint *unkOut);

void
GX2SetTVBuffer(void *buffer,
               uint size,
               GX2TVRenderMode tvRenderMode,
               GX2SurfaceFormat surfaceFormat,
               GX2BufferingMode bufferingMode);

void
GX2SetDRCBuffer(void *buffer,
                uint size,
                GX2DrcRenderMode drcRenderMode,
                GX2SurfaceFormat surfaceFormat,
                GX2BufferingMode bufferingMode);

void
GX2SetTVScale(uint x,
              uint y);

void
GX2SetDRCScale(uint x,
               uint y);

GX2TVScanMode
GX2GetSystemTVScanMode();

GX2TVScanMode
GX2GetSystemDRCScanMode();

GX2DrcRenderMode
GX2GetSystemDRCMode();
