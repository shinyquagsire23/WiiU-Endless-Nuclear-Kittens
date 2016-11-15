/* Converted to D from include/gx2/sampler.h by htod */
module gx2.sampler;
//C     #pragma once
//C     #include <wut.h>
import wut;
//C     #include "enum.h"
import gx2.constants;

/**
 * \defgroup gx2_sampler Sampler
 * \ingroup gx2
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef struct GX2Sampler GX2Sampler;
extern (C):

//C     struct GX2Sampler
//C     {
//C        uint32_t regs[3];
//C     };
struct GX2Sampler
{
    uint [3]regs;
}
void
GX2InitSampler(GX2Sampler *sampler,
               GX2TexClampMode clampMode,
               GX2TexXYFilterMode minMagFilterMode);

void
GX2InitSamplerBorderType(GX2Sampler *sampler,
                         GX2TexBorderType borderType);

void
GX2InitSamplerClamping(GX2Sampler *sampler,
                       GX2TexClampMode clampX,
                       GX2TexClampMode clampY,
                       GX2TexClampMode clampZ);

void
GX2InitSamplerDepthCompare(GX2Sampler *sampler,
                           GX2CompareFunction depthCompare);

void
GX2InitSamplerFilterAdjust(GX2Sampler *sampler,
                           bool highPrecision,
                           GX2TexMipPerfMode perfMip,
                           GX2TexZPerfMode perfZ);

void
GX2InitSamplerLOD(GX2Sampler *sampler,
                  float lodMin,
                  float lodMax,
                  float lodBias);

void
GX2InitSamplerLODAdjust(GX2Sampler *sampler,
                        float unk1,
                        bool unk2);

void
GX2InitSamplerRoundingMode(GX2Sampler *sampler,
                           GX2RoundingMode roundingMode);

void
GX2InitSamplerXYFilter(GX2Sampler *sampler,
                       GX2TexXYFilterMode filterMag,
                       GX2TexXYFilterMode filterMin,
                       GX2TexAnisoRatio maxAniso);

void
GX2InitSamplerZMFilter(GX2Sampler *sampler,
                       GX2TexZFilterMode filterZ,
                       GX2TexMipFilterMode filterMip);
