/* Converted to D from include/gx2/registers.h by htod */
module gx2.registers;
//C     #pragma once
//C     #include <wut.h>
import wut;
//C     #include "enum.h"
import gx2.constants;
//C     #include "surface.h"
import gx2.surface;

extern (C):

struct GX2AAMaskReg
{
   uint pa_sc_aa_mask;
}

struct GX2AlphaTestReg
{
   uint sx_alpha_test_control;
   uint sx_alpha_ref;
}

struct GX2AlphaToMaskReg
{
   uint db_alpha_to_mask;
}

struct GX2BlendControlReg
{
   GX2RenderTarget target;
   uint cb_blend_control;
}

struct GX2BlendConstantColorReg
{
   float red;
   float green;
   float blue;
   float alpha;
}

struct GX2ColorControlReg
{
   uint cb_color_control;
}

struct GX2DepthStencilControlReg
{
   uint db_depth_control;
}

struct GX2StencilMaskReg
{
   uint db_stencilrefmask;
   uint db_stencilrefmask_bf;
}

struct GX2LineWidthReg
{
   uint pa_su_line_cntl;
}

struct GX2PointSizeReg
{
   uint pa_su_point_size;
}

struct GX2PointLimitsReg
{
   uint pa_su_point_minmax;
}

struct GX2PolygonControlReg
{
   uint pa_su_sc_mode_cntl;
}

struct GX2PolygonOffsetReg
{
   uint pa_su_poly_offset_front_scale;
   uint pa_su_poly_offset_front_offset;
   uint pa_su_poly_offset_back_scale;
   uint pa_su_poly_offset_back_offset;
   uint pa_su_poly_offset_clamp;
}

struct GX2ScissorReg
{
   uint pa_sc_generic_scissor_tl;
   uint pa_sc_generic_scissor_br;
}

struct GX2TargetChannelMaskReg
{
   uint cb_target_mask;
}

struct GX2ViewportReg
{
   uint pa_cl_vport_xscale;
   uint pa_cl_vport_xoffset;
   uint pa_cl_vport_yscale;
   uint pa_cl_vport_yoffset;
   uint pa_cl_vport_zscale;
   uint pa_cl_vport_zoffset;
   uint pa_cl_gb_vert_clip_adj;
   uint pa_cl_gb_vert_disc_adj;
   uint pa_cl_gb_horz_clip_adj;
   uint pa_cl_gb_horz_disc_adj;
   uint pa_sc_vport_zmin;
   uint pa_sc_vport_zmax;
}

void
GX2SetAAMask(ubyte upperLeft,
             ubyte upperRight,
             ubyte lowerLeft,
             ubyte lowerRight);

void
GX2InitAAMaskReg(GX2AAMaskReg *reg,
                 ubyte upperLeft,
                 ubyte upperRight,
                 ubyte lowerLeft,
                 ubyte lowerRight);

void
GX2GetAAMaskReg(GX2AAMaskReg *reg,
                ubyte *upperLeft,
                ubyte *upperRight,
                ubyte *lowerLeft,
                ubyte *lowerRight);

void
GX2SetAAMaskReg(GX2AAMaskReg *reg);

void
GX2SetAlphaTest(bool alphaTest,
                GX2CompareFunction func,
                float ref_);

void
GX2InitAlphaTestReg(GX2AlphaTestReg *reg,
                    bool alphaTest,
                    GX2CompareFunction func,
                    float ref_);

void
GX2GetAlphaTestReg(const GX2AlphaTestReg *reg,
                   bool *alphaTest,
                   GX2CompareFunction *func,
                   float *ref_);

void
GX2SetAlphaTestReg(GX2AlphaTestReg *reg);

void
GX2SetAlphaToMask(bool alphaToMask,
                  GX2AlphaToMaskMode mode);

void
GX2InitAlphaToMaskReg(GX2AlphaToMaskReg *reg,
                      bool alphaToMask,
                      GX2AlphaToMaskMode mode);

void
GX2GetAlphaToMaskReg(const GX2AlphaToMaskReg *reg,
                     bool *alphaToMask,
                     GX2AlphaToMaskMode *mode);

void
GX2SetAlphaToMaskReg(GX2AlphaToMaskReg *reg);

void
GX2SetBlendConstantColor(float red,
                         float green,
                         float blue,
                         float alpha);

void
GX2InitBlendConstantColorReg(GX2BlendConstantColorReg *reg,
                             float red,
                             float green,
                             float blue,
                             float alpha);

void
GX2GetBlendConstantColorReg(GX2BlendConstantColorReg *reg,
                            float *red,
                            float *green,
                            float *blue,
                            float *alpha);

void
GX2SetBlendConstantColorReg(GX2BlendConstantColorReg *reg);

void
GX2SetBlendControl(GX2RenderTarget target,
                   GX2BlendMode colorSrcBlend,
                   GX2BlendMode colorDstBlend,
                   GX2BlendCombineMode colorCombine,
                   bool useAlphaBlend,
                   GX2BlendMode alphaSrcBlend,
                   GX2BlendMode alphaDstBlend,
                   GX2BlendCombineMode alphaCombine);

void
GX2InitBlendControlReg(GX2BlendControlReg *reg,
                       GX2RenderTarget target,
                       GX2BlendMode colorSrcBlend,
                       GX2BlendMode colorDstBlend,
                       GX2BlendCombineMode colorCombine,
                       bool useAlphaBlend,
                       GX2BlendMode alphaSrcBlend,
                       GX2BlendMode alphaDstBlend,
                       GX2BlendCombineMode alphaCombine);

void
GX2GetBlendControlReg(GX2BlendControlReg *reg,
                      GX2RenderTarget *target,
                      GX2BlendMode *colorSrcBlend,
                      GX2BlendMode *colorDstBlend,
                      GX2BlendCombineMode *colorCombine,
                      bool *useAlphaBlend,
                      GX2BlendMode *alphaSrcBlend,
                      GX2BlendMode *alphaDstBlend,
                      GX2BlendCombineMode *alphaCombine);

void
GX2SetBlendControlReg(GX2BlendControlReg *reg);

void
GX2SetColorControl(GX2LogicOp rop3,
                   ubyte targetBlendEnable,
                   bool multiWriteEnable,
                   bool colorWriteEnable);

void
GX2InitColorControlReg(GX2ColorControlReg *reg,
                       GX2LogicOp rop3,
                       ubyte targetBlendEnable,
                       bool multiWriteEnable,
                       bool colorWriteEnable);

void
GX2GetColorControlReg(GX2ColorControlReg *reg,
                      GX2LogicOp *rop3,
                      ubyte *targetBlendEnable,
                      bool *multiWriteEnable,
                      bool *colorWriteEnable);

void
GX2SetColorControlReg(GX2ColorControlReg *reg);

void
GX2SetDepthOnlyControl(bool depthTest,
                       bool depthWrite,
                       GX2CompareFunction depthCompare);

void
GX2SetDepthStencilControl(bool depthTest,
                          bool depthWrite,
                          GX2CompareFunction depthCompare,
                          bool stencilTest,
                          bool backfaceStencil,
                          GX2CompareFunction frontStencilFunc,
                          GX2StencilFunction frontStencilZPass,
                          GX2StencilFunction frontStencilZFail,
                          GX2StencilFunction frontStencilFail,
                          GX2CompareFunction backStencilFunc,
                          GX2StencilFunction backStencilZPass,
                          GX2StencilFunction backStencilZFail,
                          GX2StencilFunction backStencilFail);

void
GX2InitDepthStencilControlReg(GX2DepthStencilControlReg *reg,
                              bool depthTest,
                              bool depthWrite,
                              GX2CompareFunction depthCompare,
                              bool stencilTest,
                              bool backfaceStencil,
                              GX2CompareFunction frontStencilFunc,
                              GX2StencilFunction frontStencilZPass,
                              GX2StencilFunction frontStencilZFail,
                              GX2StencilFunction frontStencilFail,
                              GX2CompareFunction backStencilFunc,
                              GX2StencilFunction backStencilZPass,
                              GX2StencilFunction backStencilZFail,
                              GX2StencilFunction backStencilFail);

void
GX2GetDepthStencilControlReg(GX2DepthStencilControlReg *reg,
                             bool *depthTest,
                             bool *depthWrite,
                             GX2CompareFunction *depthCompare,
                             bool *stencilTest,
                             bool *backfaceStencil,
                             GX2CompareFunction *frontStencilFunc,
                             GX2StencilFunction *frontStencilZPass,
                             GX2StencilFunction *frontStencilZFail,
                             GX2StencilFunction *frontStencilFail,
                             GX2CompareFunction *backStencilFunc,
                             GX2StencilFunction *backStencilZPass,
                             GX2StencilFunction *backStencilZFail,
                             GX2StencilFunction *backStencilFail);

void
GX2SetDepthStencilControlReg(GX2DepthStencilControlReg *reg);

void
GX2SetStencilMask(ubyte frontMask,
                  ubyte frontWriteMask,
                  ubyte frontRef,
                  ubyte backMask,
                  ubyte backWriteMask,
                  ubyte backRef);

void
GX2InitStencilMaskReg(GX2StencilMaskReg *reg,
                      ubyte frontMask,
                      ubyte frontWriteMask,
                      ubyte frontRef,
                      ubyte backMask,
                      ubyte backWriteMask,
                      ubyte backRef);

void
GX2GetStencilMaskReg(GX2StencilMaskReg *reg,
                     ubyte *frontMask,
                     ubyte *frontWriteMask,
                     ubyte *frontRef,
                     ubyte *backMask,
                     ubyte *backWriteMask,
                     ubyte *backRef);

void
GX2SetStencilMaskReg(GX2StencilMaskReg *reg);

void
GX2SetLineWidth(float width);

void
GX2InitLineWidthReg(GX2LineWidthReg *reg,
                    float width);

void
GX2GetLineWidthReg(GX2LineWidthReg *reg,
                   float *width);

void
GX2SetLineWidthReg(GX2LineWidthReg *reg);

void
GX2SetPointSize(float width,
                float height);

void
GX2InitPointSizeReg(GX2PointSizeReg *reg,
                    float width,
                    float height);

void
GX2GetPointSizeReg(GX2PointSizeReg *reg,
                   float *width,
                   float *height);

void
GX2SetPointSizeReg(GX2PointSizeReg *reg);

void
GX2SetPointLimits(float min,
                  float max);

void
GX2InitPointLimitsReg(GX2PointLimitsReg *reg,
                      float min,
                      float max);

void
GX2GetPointLimitsReg(GX2PointLimitsReg *reg,
                     float *min,
                     float *max);

void
GX2SetPointLimitsReg(GX2PointLimitsReg *reg);

void
GX2SetCullOnlyControl(GX2FrontFace frontFace,
                      bool cullFront,
                      bool cullBack);

void
GX2SetPolygonControl(GX2FrontFace frontFace,
                     bool cullFront,
                     bool cullBack,
                     bool polyMode,
                     GX2PolygonMode polyModeFront,
                     GX2PolygonMode polyModeBack,
                     bool polyOffsetFrontEnable,
                     bool polyOffsetBackEnable,
                     bool polyOffsetParaEnable);

void
GX2InitPolygonControlReg(GX2PolygonControlReg *reg,
                         GX2FrontFace frontFace,
                         bool cullFront,
                         bool cullBack,
                         bool polyMode,
                         GX2PolygonMode polyModeFront,
                         GX2PolygonMode polyModeBack,
                         bool polyOffsetFrontEnable,
                         bool polyOffsetBackEnable,
                         bool polyOffsetParaEnable);

void
GX2GetPolygonControlReg(GX2PolygonControlReg *reg,
                        GX2FrontFace *frontFace,
                        bool *cullFront,
                        bool *cullBack,
                        bool *polyMode,
                        GX2PolygonMode *polyModeFront,
                        GX2PolygonMode *polyModeBack,
                        bool *polyOffsetFrontEnable,
                        bool *polyOffsetBackEnable,
                        bool *polyOffsetParaEnable);

void
GX2SetPolygonControlReg(GX2PolygonControlReg *reg);

void
GX2SetPolygonOffset(float frontOffset,
                    float frontScale,
                    float backOffset,
                    float backScale,
                    float clamp);

void
GX2InitPolygonOffsetReg(GX2PolygonOffsetReg *reg,
                        float frontOffset,
                        float frontScale,
                        float backOffset,
                        float backScale,
                        float clamp);

void
GX2GetPolygonOffsetReg(GX2PolygonOffsetReg *reg,
                       float *frontOffset,
                       float *frontScale,
                       float *backOffset,
                       float *backScale,
                       float *clamp);

void
GX2SetPolygonOffsetReg(GX2PolygonOffsetReg *reg);

void
GX2SetScissor(uint x,
              uint y,
              uint width,
              uint height);

void
GX2InitScissorReg(GX2ScissorReg *reg,
                  uint x,
                  uint y,
                  uint width,
                  uint height);

void
GX2GetScissorReg(GX2ScissorReg *reg,
                 uint *x,
                 uint *y,
                 uint *width,
                 uint *height);

void
GX2SetScissorReg(GX2ScissorReg *reg);

void
GX2SetTargetChannelMasks(GX2ChannelMask mask0,
                         GX2ChannelMask mask1,
                         GX2ChannelMask mask2,
                         GX2ChannelMask mask3,
                         GX2ChannelMask mask4,
                         GX2ChannelMask mask5,
                         GX2ChannelMask mask6,
                         GX2ChannelMask mask7);

void
GX2InitTargetChannelMasksReg(GX2TargetChannelMaskReg *reg,
                             GX2ChannelMask mask0,
                             GX2ChannelMask mask1,
                             GX2ChannelMask mask2,
                             GX2ChannelMask mask3,
                             GX2ChannelMask mask4,
                             GX2ChannelMask mask5,
                             GX2ChannelMask mask6,
                             GX2ChannelMask mask7);

void
GX2GetTargetChannelMasksReg(GX2TargetChannelMaskReg *reg,
                            GX2ChannelMask *mask0,
                            GX2ChannelMask *mask1,
                            GX2ChannelMask *mask2,
                            GX2ChannelMask *mask3,
                            GX2ChannelMask *mask4,
                            GX2ChannelMask *mask5,
                            GX2ChannelMask *mask6,
                            GX2ChannelMask *mask7);

void
GX2SetTargetChannelMasksReg(GX2TargetChannelMaskReg *reg);

void
GX2SetViewport(float x,
               float y,
               float width,
               float height,
               float nearZ,
               float farZ);

void
GX2InitViewportReg(GX2ViewportReg *reg,
                   float x,
                   float y,
                   float width,
                   float height,
                   float nearZ,
                   float farZ);

void
GX2GetViewportReg(GX2ViewportReg *reg,
                  float *x,
                  float *y,
                  float *width,
                  float *height,
                  float *nearZ,
                  float *farZ);

void
GX2SetViewportReg(GX2ViewportReg *reg);
