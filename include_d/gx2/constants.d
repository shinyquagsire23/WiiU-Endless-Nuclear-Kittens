/* Converted to D from include/gx2/enum.h by htod */
module gx2.constants;
//C     #pragma once
//C     #include <wut.h>
import wut;

extern (C):

/**
 * \defgroup gx2_enum Enums
 * \ingroup gx2
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef enum GX2AAMode
//C     {
//C        GX2_AA_MODE1X                          = 0,
//C        GX2_AA_MODE2X                          = 1,
//C        GX2_AA_MODE4X                          = 2
//C     } GX2AAMode;
enum GX2AAMode
{
    GX2_AA_MODE1X,
    GX2_AA_MODE2X,
    GX2_AA_MODE4X,
}
extern (C):

//C     typedef enum GX2AlphaToMaskMode
//C     {
//C        GX2_ALPHA_TO_MASK_MODE_NON_DITHERED    = 0,
//C        GX2_ALPHA_TO_MASK_MODE_DITHER_0        = 1,
//C        GX2_ALPHA_TO_MASK_MODE_DITHER_90       = 2,
//C        GX2_ALPHA_TO_MASK_MODE_DITHER_180      = 3,
//C        GX2_ALPHA_TO_MASK_MODE_DITHER_270      = 4,
//C     } GX2AlphaToMaskMode;
enum GX2AlphaToMaskMode
{
    GX2_ALPHA_TO_MASK_MODE_NON_DITHERED,
    GX2_ALPHA_TO_MASK_MODE_DITHER_0,
    GX2_ALPHA_TO_MASK_MODE_DITHER_90,
    GX2_ALPHA_TO_MASK_MODE_DITHER_180,
    GX2_ALPHA_TO_MASK_MODE_DITHER_270,
}

//C     typedef enum GX2AttribFormat
//C     {
//C        GX2_ATTRIB_FORMAT_UNORM_8              = 0x0,
//C        GX2_ATTRIB_FORMAT_UNORM_8_8            = 0x04,
//C        GX2_ATTRIB_FORMAT_UNORM_8_8_8_8        = 0x0A,

//C        GX2_ATTRIB_FORMAT_UINT_8               = 0x100,
//C        GX2_ATTRIB_FORMAT_UINT_8_8             = 0x104,
//C        GX2_ATTRIB_FORMAT_UINT_8_8_8_8         = 0x10A,

//C        GX2_ATTRIB_FORMAT_SNORM_8              = 0x200,
//C        GX2_ATTRIB_FORMAT_SNORM_8_8            = 0x204,
//C        GX2_ATTRIB_FORMAT_SNORM_8_8_8_8        = 0x20A,

//C        GX2_ATTRIB_FORMAT_SINT_8               = 0x300,
//C        GX2_ATTRIB_FORMAT_SINT_8_8             = 0x304,
//C        GX2_ATTRIB_FORMAT_SINT_8_8_8_8         = 0x30A,

//C        GX2_ATTRIB_FORMAT_FLOAT_32             = 0x806,
//C        GX2_ATTRIB_FORMAT_FLOAT_32_32          = 0x80d,
//C        GX2_ATTRIB_FORMAT_FLOAT_32_32_32       = 0x811,
//C        GX2_ATTRIB_FORMAT_FLOAT_32_32_32_32    = 0x813,
//C     } GX2AttribFormat;
enum GX2AttribFormat
{
    GX2_ATTRIB_FORMAT_UNORM_8,
    GX2_ATTRIB_FORMAT_UNORM_8_8 = 4,
    GX2_ATTRIB_FORMAT_UNORM_8_8_8_8 = 10,
    GX2_ATTRIB_FORMAT_UINT_8 = 256,
    GX2_ATTRIB_FORMAT_UINT_8_8 = 260,
    GX2_ATTRIB_FORMAT_UINT_8_8_8_8 = 266,
    GX2_ATTRIB_FORMAT_SNORM_8 = 512,
    GX2_ATTRIB_FORMAT_SNORM_8_8 = 516,
    GX2_ATTRIB_FORMAT_SNORM_8_8_8_8 = 522,
    GX2_ATTRIB_FORMAT_SINT_8 = 768,
    GX2_ATTRIB_FORMAT_SINT_8_8 = 772,
    GX2_ATTRIB_FORMAT_SINT_8_8_8_8 = 778,
    GX2_ATTRIB_FORMAT_FLOAT_32 = 2054,
    GX2_ATTRIB_FORMAT_FLOAT_32_32 = 2061,
    GX2_ATTRIB_FORMAT_FLOAT_32_32_32 = 2065,
    GX2_ATTRIB_FORMAT_FLOAT_32_32_32_32 = 2067,
}

//C     typedef enum GX2AttribIndexType
//C     {
//C        GX2_ATTRIB_INDEX_PER_VERTEX            = 0,
//C        GX2_ATTRIB_INDEX_PER_INSTANCE          = 1,
//C     } GX2AttribIndexType;
enum GX2AttribIndexType
{
    GX2_ATTRIB_INDEX_PER_VERTEX,
    GX2_ATTRIB_INDEX_PER_INSTANCE,
}

//C     typedef enum GX2BlendMode
//C     {
//C        GX2_BLEND_MODE_ZERO                    = 0,
//C        GX2_BLEND_MODE_ONE                     = 1,
//C        GX2_BLEND_MODE_SRC_COLOR               = 2,
//C        GX2_BLEND_MODE_INV_SRC_COLOR           = 3,
//C        GX2_BLEND_MODE_SRC_ALPHA               = 4,
//C        GX2_BLEND_MODE_INV_SRC_ALPHA           = 5,
//C        GX2_BLEND_MODE_DST_ALPHA               = 6,
//C        GX2_BLEND_MODE_INV_DST_ALPHA           = 7,
//C        GX2_BLEND_MODE_DST_COLOR               = 8,
//C        GX2_BLEND_MODE_INV_DST_COLOR           = 9,
//C        GX2_BLEND_MODE_SRC_ALPHA_SAT           = 10,
//C        GX2_BLEND_MODE_BOTH_SRC_ALPHA          = 11,
//C        GX2_BLEND_MODE_BOTH_INV_SRC_ALPHA      = 12,
//C        GX2_BLEND_MODE_BLEND_FACTOR            = 13,
//C        GX2_BLEND_MODE_INV_BLEND_FACTOR        = 14,
//C        GX2_BLEND_MODE_SRC1_COLOR              = 15,
//C        GX2_BLEND_MODE_INV_SRC1_COLOR          = 16,
//C        GX2_BLEND_MODE_SRC1_ALPHA              = 17,
//C        GX2_BLEND_MODE_INV_SRC1_ALPHA          = 18,
//C     } GX2BlendMode;
enum GX2BlendMode
{
    GX2_BLEND_MODE_ZERO,
    GX2_BLEND_MODE_ONE,
    GX2_BLEND_MODE_SRC_COLOR,
    GX2_BLEND_MODE_INV_SRC_COLOR,
    GX2_BLEND_MODE_SRC_ALPHA,
    GX2_BLEND_MODE_INV_SRC_ALPHA,
    GX2_BLEND_MODE_DST_ALPHA,
    GX2_BLEND_MODE_INV_DST_ALPHA,
    GX2_BLEND_MODE_DST_COLOR,
    GX2_BLEND_MODE_INV_DST_COLOR,
    GX2_BLEND_MODE_SRC_ALPHA_SAT,
    GX2_BLEND_MODE_BOTH_SRC_ALPHA,
    GX2_BLEND_MODE_BOTH_INV_SRC_ALPHA,
    GX2_BLEND_MODE_BLEND_FACTOR,
    GX2_BLEND_MODE_INV_BLEND_FACTOR,
    GX2_BLEND_MODE_SRC1_COLOR,
    GX2_BLEND_MODE_INV_SRC1_COLOR,
    GX2_BLEND_MODE_SRC1_ALPHA,
    GX2_BLEND_MODE_INV_SRC1_ALPHA,
}

//C     typedef enum GX2BlendCombineMode
//C     {
//C        GX2_BLEND_COMBINE_MODE_ADD             = 0,
//C        GX2_BLEND_COMBINE_MODE_SUB             = 1,
//C        GX2_BLEND_COMBINE_MODE_MIN             = 2,
//C        GX2_BLEND_COMBINE_MODE_MAX             = 3,
//C        GX2_BLEND_COMBINE_MODE_REV_SUB         = 4,
//C     } GX2BlendCombineMode;
enum GX2BlendCombineMode
{
    GX2_BLEND_COMBINE_MODE_ADD,
    GX2_BLEND_COMBINE_MODE_SUB,
    GX2_BLEND_COMBINE_MODE_MIN,
    GX2_BLEND_COMBINE_MODE_MAX,
    GX2_BLEND_COMBINE_MODE_REV_SUB,
}

//C     typedef enum GX2BufferingMode
//C     {
//C        GX2_BUFFERING_MODE_SINGLE              = 1,
//C        GX2_BUFFERING_MODE_DOUBLE              = 2,
//C        GX2_BUFFERING_MODE_TRIPLE              = 3,
//C     } GX2BufferingMode;
enum GX2BufferingMode
{
    GX2_BUFFERING_MODE_SINGLE = 1,
    GX2_BUFFERING_MODE_DOUBLE,
    GX2_BUFFERING_MODE_TRIPLE,
}

//C     typedef enum GX2ChannelMask
//C     {
//C        GX2_CHANNEL_MASK_R                     = 1,
//C        GX2_CHANNEL_MASK_G                     = 2,
//C        GX2_CHANNEL_MASK_RG                    = 3,
//C        GX2_CHANNEL_MASK_B                     = 4,
//C        GX2_CHANNEL_MASK_RB                    = 5,
//C        GX2_CHANNEL_MASK_GB                    = 6,
//C        GX2_CHANNEL_MASK_RGB                   = 7,
//C        GX2_CHANNEL_MASK_A                     = 8,
//C        GX2_CHANNEL_MASK_RA                    = 9,
//C        GX2_CHANNEL_MASK_GA                    = 10,
//C        GX2_CHANNEL_MASK_RGA                   = 11,
//C        GX2_CHANNEL_MASK_BA                    = 12,
//C        GX2_CHANNEL_MASK_RBA                   = 13,
//C        GX2_CHANNEL_MASK_GBA                   = 14,
//C        GX2_CHANNEL_MASK_RGBA                  = 15,
//C     } GX2ChannelMask;
enum GX2ChannelMask
{
    GX2_CHANNEL_MASK_R = 1,
    GX2_CHANNEL_MASK_G,
    GX2_CHANNEL_MASK_RG,
    GX2_CHANNEL_MASK_B,
    GX2_CHANNEL_MASK_RB,
    GX2_CHANNEL_MASK_GB,
    GX2_CHANNEL_MASK_RGB,
    GX2_CHANNEL_MASK_A,
    GX2_CHANNEL_MASK_RA,
    GX2_CHANNEL_MASK_GA,
    GX2_CHANNEL_MASK_RGA,
    GX2_CHANNEL_MASK_BA,
    GX2_CHANNEL_MASK_RBA,
    GX2_CHANNEL_MASK_GBA,
    GX2_CHANNEL_MASK_RGBA,
}

//C     typedef enum GX2ClearFlags
//C     {
//C        GX2_CLEAR_FLAGS_DEPTH                  = 1,
//C        GX2_CLEAR_FLAGS_STENCIL                = 2,
//C        GX2_CLEAR_FLAGS_BOTH                   = (GX2_CLEAR_FLAGS_DEPTH | GX2_CLEAR_FLAGS_STENCIL),
//C     } GX2ClearFlags;
enum GX2ClearFlags
{
    GX2_CLEAR_FLAGS_DEPTH = 1,
    GX2_CLEAR_FLAGS_STENCIL,
    GX2_CLEAR_FLAGS_BOTH,
}

//C     typedef enum GX2CompareFunction
//C     {
//C        GX2_COMPARE_FUNC_NEVER                 = 0,
//C        GX2_COMPARE_FUNC_LESS                  = 1,
//C        GX2_COMPARE_FUNC_EQUAL                 = 2,
//C        GX2_COMPARE_FUNC_LEQUAL                = 3,
//C        GX2_COMPARE_FUNC_GREATER               = 4,
//C        GX2_COMPARE_FUNC_NOT_EQUAL             = 5,
//C        GX2_COMPARE_FUNC_GEQUAL                = 6,
//C        GX2_COMPARE_FUNC_ALWAYS                = 7,
//C     } GX2CompareFunction;
enum GX2CompareFunction
{
    GX2_COMPARE_FUNC_NEVER,
    GX2_COMPARE_FUNC_LESS,
    GX2_COMPARE_FUNC_EQUAL,
    GX2_COMPARE_FUNC_LEQUAL,
    GX2_COMPARE_FUNC_GREATER,
    GX2_COMPARE_FUNC_NOT_EQUAL,
    GX2_COMPARE_FUNC_GEQUAL,
    GX2_COMPARE_FUNC_ALWAYS,
}

//C     typedef enum GX2DrcRenderMode
//C     {
//C        GX2_DRC_RENDER_MODE_DISABLED           = 0,
//C        GX2_DRC_RENDER_MODE_SINGLE             = 1,
//C     } GX2DrcRenderMode;
enum GX2DrcRenderMode
{
    GX2_DRC_RENDER_MODE_DISABLED,
    GX2_DRC_RENDER_MODE_SINGLE,
}

//C     typedef enum GX2EventType
//C     {
//C        GX2_EVENT_TYPE_VSYNC                   = 2,
//C        GX2_EVENT_TYPE_FLIP                    = 3,
//C        GX2_EVENT_TYPE_DISPLAY_LIST_OVERRUN    = 4,
//C     } GX2EventType;
enum GX2EventType
{
    GX2_EVENT_TYPE_VSYNC = 2,
    GX2_EVENT_TYPE_FLIP,
    GX2_EVENT_TYPE_DISPLAY_LIST_OVERRUN,
}

//C     typedef enum GX2EndianSwapMode
//C     {
//C        GX2_ENDIAN_SWAP_NONE                   = 0,
//C        GX2_ENDIAN_SWAP_8_IN_16                = 1,
//C        GX2_ENDIAN_SWAP_8_IN_32                = 2,
//C        GX2_ENDIAN_SWAP_DEFAULT                = 3,
//C     } GX2EndianSwapMode;
enum GX2EndianSwapMode
{
    GX2_ENDIAN_SWAP_NONE,
    GX2_ENDIAN_SWAP_8_IN_16,
    GX2_ENDIAN_SWAP_8_IN_32,
    GX2_ENDIAN_SWAP_DEFAULT,
}

//C     typedef enum GX2FetchShaderType
//C     {
//C        GX2_FETCH_SHADER_TESSELLATION_NONE     = 0,
//C        GX2_FETCH_SHADER_TESSELLATION_LINE     = 1,
//C        GX2_FETCH_SHADER_TESSELLATION_TRIANGLE = 2,
//C        GX2_FETCH_SHADER_TESSELLATION_QUAD     = 3,
//C     } GX2FetchShaderType;
enum GX2FetchShaderType
{
    GX2_FETCH_SHADER_TESSELLATION_NONE,
    GX2_FETCH_SHADER_TESSELLATION_LINE,
    GX2_FETCH_SHADER_TESSELLATION_TRIANGLE,
    GX2_FETCH_SHADER_TESSELLATION_QUAD,
}

//C     typedef enum GX2FrontFace
//C     {
//C       GX2_FRONT_FACE_CCW                      = 0,
//C       GX2_FRONT_FACE_CW                       = 1,
//C     } GX2FrontFace;
enum GX2FrontFace
{
    GX2_FRONT_FACE_CCW,
    GX2_FRONT_FACE_CW,
}

//C     typedef enum GX2IndexType
//C     {
//C        GX2_INDEX_TYPE_U16_LE                  = 0,
//C        GX2_INDEX_TYPE_U32_LE                  = 1,
//C        GX2_INDEX_TYPE_U16                     = 4,
//C        GX2_INDEX_TYPE_U32                     = 9,
//C     } GX2IndexType;
enum GX2IndexType
{
    GX2_INDEX_TYPE_U16_LE,
    GX2_INDEX_TYPE_U32_LE,
    GX2_INDEX_TYPE_U16 = 4,
    GX2_INDEX_TYPE_U32 = 9,
}

//C     typedef enum GX2InvalidateMode
//C     {
//C        GX2_INVALIDATE_MODE_ATTRIBUTE_BUFFER    = 1 << 0,
//C        GX2_INVALIDATE_MODE_TEXTURE             = 1 << 1,
//C        GX2_INVALIDATE_MODE_UNIFORM_BLOCK       = 1 << 2,
//C        GX2_INVALIDATE_MODE_SHADER              = 1 << 3,
//C        GX2_INVALIDATE_MODE_COLOR_BUFFER        = 1 << 4,
//C        GX2_INVALIDATE_MODE_DEPTH_BUFFER        = 1 << 5,
//C        GX2_INVALIDATE_MODE_CPU                 = 1 << 6,
//C        GX2_INVALIDATE_MODE_STREAM_OUT_BUFFER   = 1 << 7,
//C        GX2_INVALIDATE_MODE_EXPORT_BUFFER       = 1 << 8,
//C        GX2_INVALIDATE_MODE_CPU_ATTRIBUTE_BUFFER= GX2_INVALIDATE_MODE_CPU | GX2_INVALIDATE_MODE_ATTRIBUTE_BUFFER,
//C        GX2_INVALIDATE_MODE_CPU_TEXTURE         = GX2_INVALIDATE_MODE_CPU | GX2_INVALIDATE_MODE_TEXTURE,
//C        GX2_INVALIDATE_MODE_CPU_SHADER          = GX2_INVALIDATE_MODE_CPU | GX2_INVALIDATE_MODE_SHADER,
//C     } GX2InvalidateMode;
enum GX2InvalidateMode
{
    GX2_INVALIDATE_MODE_ATTRIBUTE_BUFFER = 1,
    GX2_INVALIDATE_MODE_TEXTURE,
    GX2_INVALIDATE_MODE_UNIFORM_BLOCK = 4,
    GX2_INVALIDATE_MODE_SHADER = 8,
    GX2_INVALIDATE_MODE_COLOR_BUFFER = 16,
    GX2_INVALIDATE_MODE_DEPTH_BUFFER = 32,
    GX2_INVALIDATE_MODE_CPU = 64,
    GX2_INVALIDATE_MODE_STREAM_OUT_BUFFER = 128,
    GX2_INVALIDATE_MODE_EXPORT_BUFFER = 256,
    GX2_INVALIDATE_MODE_CPU_ATTRIBUTE_BUFFER = 65,
    GX2_INVALIDATE_MODE_CPU_TEXTURE,
    GX2_INVALIDATE_MODE_CPU_SHADER = 72,
}

//C     typedef enum GX2InitAttributes
//C     {
//C        GX2_INIT_END                           = 0,
//C        GX2_INIT_CMD_BUF_BASE                  = 1,
//C        GX2_INIT_CMD_BUF_POOL_SIZE             = 2,
//C        GX2_INIT_ARGC                          = 7,
//C        GX2_INIT_ARGV                          = 8,
//C     } GX2InitAttributes;
enum GX2InitAttributes
{
    GX2_INIT_END,
    GX2_INIT_CMD_BUF_BASE,
    GX2_INIT_CMD_BUF_POOL_SIZE,
    GX2_INIT_ARGC = 7,
    GX2_INIT_ARGV,
}

//C     typedef enum GX2LogicOp
//C     {
//C        GX2_LOGIC_OP_CLEAR                     = 0x00,
//C        GX2_LOGIC_OP_NOR                       = 0x11,
//C        GX2_LOGIC_OP_INV_AND                   = 0x22,
//C        GX2_LOGIC_OP_INV_COPY                  = 0x33,
//C        GX2_LOGIC_OP_REV_AND                   = 0x44,
//C        GX2_LOGIC_OP_INV                       = 0x55,
//C        GX2_LOGIC_OP_XOR                       = 0x66,
//C        GX2_LOGIC_OP_NOT_AND                   = 0x77,
//C        GX2_LOGIC_OP_AND                       = 0x88,
//C        GX2_LOGIC_OP_EQUIV                     = 0x99,
//C        GX2_LOGIC_OP_NOP                       = 0xAA,
//C        GX2_LOGIC_OP_INV_OR                    = 0xBB,
//C        GX2_LOGIC_OP_COPY                      = 0xCC,
//C        GX2_LOGIC_OP_REV_OR                    = 0xDD,
//C        GX2_LOGIC_OP_OR                        = 0xEE,
//C        GX2_LOGIC_OP_SET                       = 0xFF,
//C     } GX2LogicOp;
enum GX2LogicOp
{
    GX2_LOGIC_OP_CLEAR,
    GX2_LOGIC_OP_NOR = 17,
    GX2_LOGIC_OP_INV_AND = 34,
    GX2_LOGIC_OP_INV_COPY = 51,
    GX2_LOGIC_OP_REV_AND = 68,
    GX2_LOGIC_OP_INV = 85,
    GX2_LOGIC_OP_XOR = 102,
    GX2_LOGIC_OP_NOT_AND = 119,
    GX2_LOGIC_OP_AND = 136,
    GX2_LOGIC_OP_EQUIV = 153,
    GX2_LOGIC_OP_NOP = 170,
    GX2_LOGIC_OP_INV_OR = 187,
    GX2_LOGIC_OP_COPY = 204,
    GX2_LOGIC_OP_REV_OR = 221,
    GX2_LOGIC_OP_OR = 238,
    GX2_LOGIC_OP_SET = 255,
}

//C     typedef enum GX2PrimitiveMode
//C     {
//C        GX2_PRIMITIVE_MODE_LINES               = 2,
//C        GX2_PRIMITIVE_MODE_LINE_STRIP          = 3,
//C        GX2_PRIMITIVE_MODE_TRIANGLES           = 4,
//C        GX2_PRIMITIVE_MODE_TRIANGLE_FAN        = 5,
//C        GX2_PRIMITIVE_MODE_TRIANGLE_STRIP      = 6,
//C        GX2_PRIMITIVE_MODE_QUADS               = 19,
//C        GX2_PRIMITIVE_MODE_QUAD_STRIP          = 20,
//C     } GX2PrimitiveMode;
enum GX2PrimitiveMode
{
    GX2_PRIMITIVE_MODE_LINES = 2,
    GX2_PRIMITIVE_MODE_LINE_STRIP,
    GX2_PRIMITIVE_MODE_TRIANGLES,
    GX2_PRIMITIVE_MODE_TRIANGLE_FAN,
    GX2_PRIMITIVE_MODE_TRIANGLE_STRIP,
    GX2_PRIMITIVE_MODE_QUADS = 19,
    GX2_PRIMITIVE_MODE_QUAD_STRIP,
}

//C     typedef enum GX2PolygonMode
//C     {
//C        GX2_POLYGON_MODE_POINT                 = 0,
//C        GX2_POLYGON_MODE_LINE                  = 1,
//C        GX2_POLYGON_MODE_TRIANGLE              = 2,
//C     } GX2PolygonMode;
enum GX2PolygonMode
{
    GX2_POLYGON_MODE_POINT,
    GX2_POLYGON_MODE_LINE,
    GX2_POLYGON_MODE_TRIANGLE,
}

//C     typedef enum GX2RenderTarget
//C     {
//C        GX2_RENDER_TARGET_0                    = 0,
//C        GX2_RENDER_TARGET_1                    = 1,
//C        GX2_RENDER_TARGET_2                    = 2,
//C        GX2_RENDER_TARGET_3                    = 3,
//C        GX2_RENDER_TARGET_4                    = 4,
//C        GX2_RENDER_TARGET_5                    = 5,
//C        GX2_RENDER_TARGET_6                    = 6,
//C     } GX2RenderTarget;
enum GX2RenderTarget
{
    GX2_RENDER_TARGET_0,
    GX2_RENDER_TARGET_1,
    GX2_RENDER_TARGET_2,
    GX2_RENDER_TARGET_3,
    GX2_RENDER_TARGET_4,
    GX2_RENDER_TARGET_5,
    GX2_RENDER_TARGET_6,
}

//C     typedef enum GX2RoundingMode
//C     {
//C        GX2_ROUNDING_MODE_ROUND_TO_EVEN        = 0,
//C        GX2_ROUNDING_MODE_TRUNCATE             = 1,
//C     } GX2RoundingMode;
enum GX2RoundingMode
{
    GX2_ROUNDING_MODE_ROUND_TO_EVEN,
    GX2_ROUNDING_MODE_TRUNCATE,
}

//C     typedef enum GX2SamplerVarType
//C     {
//C        GX2_SAMPLER_VAR_TYPE_SAMPLER_1D        = 0,
//C        GX2_SAMPLER_VAR_TYPE_SAMPLER_2D        = 1,
//C        GX2_SAMPLER_VAR_TYPE_SAMPLER_3D        = 3,
//C        GX2_SAMPLER_VAR_TYPE_SAMPLER_CUBE      = 4,
//C     } GX2SamplerVarType;
enum GX2SamplerVarType
{
    GX2_SAMPLER_VAR_TYPE_SAMPLER_1D,
    GX2_SAMPLER_VAR_TYPE_SAMPLER_2D,
    GX2_SAMPLER_VAR_TYPE_SAMPLER_3D = 3,
    GX2_SAMPLER_VAR_TYPE_SAMPLER_CUBE,
}

//C     typedef enum GX2ScanTarget
//C     {
//C        GX2_SCAN_TARGET_TV                     = 1,
//C        GX2_SCAN_TARGET_DRC                    = 4,
//C     } GX2ScanTarget;
enum GX2ScanTarget
{
    GX2_SCAN_TARGET_TV = 1,
    GX2_SCAN_TARGET_DRC = 4,
}

//C     typedef enum GX2ShaderMode
//C     {
//C        GX2_SHADER_MODE_UNIFORM_REGISTER       = 0,
//C        GX2_SHADER_MODE_UNIFORM_BLOCK          = 1,
//C        GX2_SHADER_MODE_GEOMETRY_SHADER        = 2,
//C        GX2_SHADER_MODE_COMPUTE_SHADER         = 3,
//C     } GX2ShaderMode;
enum GX2ShaderMode
{
    GX2_SHADER_MODE_UNIFORM_REGISTER,
    GX2_SHADER_MODE_UNIFORM_BLOCK,
    GX2_SHADER_MODE_GEOMETRY_SHADER,
    GX2_SHADER_MODE_COMPUTE_SHADER,
}

//C     typedef enum GX2ShaderVarType
//C     {
//C        GX2_SHADER_VAR_TYPE_INT                = 2,
//C        GX2_SHADER_VAR_TYPE_FLOAT              = 4,
//C        GX2_SHADER_VAR_TYPE_FLOAT2             = 9,
//C        GX2_SHADER_VAR_TYPE_FLOAT3             = 10,
//C        GX2_SHADER_VAR_TYPE_FLOAT4             = 11,
//C        GX2_SHADER_VAR_TYPE_INT2               = 15,
//C        GX2_SHADER_VAR_TYPE_INT3               = 16,
//C        GX2_SHADER_VAR_TYPE_INT4               = 17,
//C        GX2_SHADER_VAR_TYPE_MATRIX4X4          = 29,
//C     } GX2ShaderVarType;
enum GX2ShaderVarType
{
    GX2_SHADER_VAR_TYPE_INT = 2,
    GX2_SHADER_VAR_TYPE_FLOAT = 4,
    GX2_SHADER_VAR_TYPE_FLOAT2 = 9,
    GX2_SHADER_VAR_TYPE_FLOAT3,
    GX2_SHADER_VAR_TYPE_FLOAT4,
    GX2_SHADER_VAR_TYPE_INT2 = 15,
    GX2_SHADER_VAR_TYPE_INT3,
    GX2_SHADER_VAR_TYPE_INT4,
    GX2_SHADER_VAR_TYPE_MATRIX4X4 = 29,
}

//C     typedef enum GX2StencilFunction
//C     {
//C        GX2_STENCIL_FUNCTION_KEEP              = 0,
//C        GX2_STENCIL_FUNCTION_ZERO              = 1,
//C        GX2_STENCIL_FUNCTION_REPLACE           = 2,
//C        GX2_STENCIL_FUNCTION_INCR_CLAMP        = 3,
//C        GX2_STENCIL_FUNCTION_DECR_CLAMP        = 4,
//C        GX2_STENCIL_FUNCTION_INV               = 5,
//C        GX2_STENCIL_FUNCTION_INCR_WRAP         = 6,
//C        GX2_STENCIL_FUNCTION_DECR_WRAP         = 7,
//C     } GX2StencilFunction;
enum GX2StencilFunction
{
    GX2_STENCIL_FUNCTION_KEEP,
    GX2_STENCIL_FUNCTION_ZERO,
    GX2_STENCIL_FUNCTION_REPLACE,
    GX2_STENCIL_FUNCTION_INCR_CLAMP,
    GX2_STENCIL_FUNCTION_DECR_CLAMP,
    GX2_STENCIL_FUNCTION_INV,
    GX2_STENCIL_FUNCTION_INCR_WRAP,
    GX2_STENCIL_FUNCTION_DECR_WRAP,
}

//C     typedef enum
//C     {
//C        GX2_SURFACE_DIM_TEXTURE_1D             = 0,
//C        GX2_SURFACE_DIM_TEXTURE_2D             = 1,
//C        GX2_SURFACE_DIM_TEXTURE_3D             = 2,
//C        GX2_SURFACE_DIM_TEXTURE_CUBE           = 3,
//C        GX2_SURFACE_DIM_TEXTURE_1D_ARRAY       = 4,
//C        GX2_SURFACE_DIM_TEXTURE_2D_ARRAY       = 5,
//C        GX2_SURFACE_DIM_TEXTURE_2D_MSAA        = 6,
//C        GX2_SURFACE_DIM_TEXTURE_2D_MSAA_ARRAY  = 7,
//C     } GX2SurfaceDim;
enum
{
    GX2_SURFACE_DIM_TEXTURE_1D,
    GX2_SURFACE_DIM_TEXTURE_2D,
    GX2_SURFACE_DIM_TEXTURE_3D,
    GX2_SURFACE_DIM_TEXTURE_CUBE,
    GX2_SURFACE_DIM_TEXTURE_1D_ARRAY,
    GX2_SURFACE_DIM_TEXTURE_2D_ARRAY,
    GX2_SURFACE_DIM_TEXTURE_2D_MSAA,
    GX2_SURFACE_DIM_TEXTURE_2D_MSAA_ARRAY,
}
alias int GX2SurfaceDim;

//C     typedef enum
//C     {
//C        GX2_SURFACE_FORMAT_INVALID                   = 0x00,
//C        GX2_SURFACE_FORMAT_UNORM_R4_G4               = 0x02,
//C        GX2_SURFACE_FORMAT_UNORM_R4_G4_B4_A4         = 0x0b,
//C        GX2_SURFACE_FORMAT_UNORM_R8                  = 0x01,
//C        GX2_SURFACE_FORMAT_UNORM_R8_G8               = 0x07,
//C        GX2_SURFACE_FORMAT_UNORM_R8_G8_B8_A8         = 0x01a,
//C        GX2_SURFACE_FORMAT_UNORM_R16                 = 0x05,
//C        GX2_SURFACE_FORMAT_UNORM_R16_G16             = 0x0f,
//C        GX2_SURFACE_FORMAT_UNORM_R16_G16_B16_A16     = 0x01f,
//C        GX2_SURFACE_FORMAT_UNORM_R5_G6_B5            = 0x08,
//C        GX2_SURFACE_FORMAT_UNORM_R5_G5_B5_A1         = 0x0a,
//C        GX2_SURFACE_FORMAT_UNORM_A1_B5_G5_R5         = 0x0c,
//C        GX2_SURFACE_FORMAT_UNORM_R24_X8              = 0x011,
//C        GX2_SURFACE_FORMAT_UNORM_A2_B10_G10_R10      = 0x01b,
//C        GX2_SURFACE_FORMAT_UNORM_R10_G10_B10_A2      = 0x019,
//C        GX2_SURFACE_FORMAT_UNORM_BC1                 = 0x031,
//C        GX2_SURFACE_FORMAT_UNORM_BC2                 = 0x032,
//C        GX2_SURFACE_FORMAT_UNORM_BC3                 = 0x033,
//C        GX2_SURFACE_FORMAT_UNORM_BC4                 = 0x034,
//C        GX2_SURFACE_FORMAT_UNORM_BC5                 = 0x035,
//C        GX2_SURFACE_FORMAT_UNORM_NV12                = 0x081,

//C        GX2_SURFACE_FORMAT_UINT_R8                   = 0x101,
//C        GX2_SURFACE_FORMAT_UINT_R8_G8                = 0x107,
//C        GX2_SURFACE_FORMAT_UINT_R8_G8_B8_A8          = 0x11a,
//C        GX2_SURFACE_FORMAT_UINT_R16                  = 0x105,
//C        GX2_SURFACE_FORMAT_UINT_R16_G16              = 0x10f,
//C        GX2_SURFACE_FORMAT_UINT_R16_G16_B16_A16      = 0x11f,
//C        GX2_SURFACE_FORMAT_UINT_R32                  = 0x10d,
//C        GX2_SURFACE_FORMAT_UINT_R32_G32              = 0x11d,
//C        GX2_SURFACE_FORMAT_UINT_R32_G32_B32_A32      = 0x122,
//C        GX2_SURFACE_FORMAT_UINT_A2_B10_G10_R10       = 0x11b,
//C        GX2_SURFACE_FORMAT_UINT_R10_G10_B10_A2       = 0x119,
//C        GX2_SURFACE_FORMAT_UINT_X24_G8               = 0x111,
//C        GX2_SURFACE_FORMAT_UINT_G8_X24               = 0x11c,

//C        GX2_SURFACE_FORMAT_SNORM_R8                  = 0x201,
//C        GX2_SURFACE_FORMAT_SNORM_R8_G8               = 0x207,
//C        GX2_SURFACE_FORMAT_SNORM_R8_G8_B8_A8         = 0x21a,
//C        GX2_SURFACE_FORMAT_SNORM_R16                 = 0x205,
//C        GX2_SURFACE_FORMAT_SNORM_R16_G16             = 0x20f,
//C        GX2_SURFACE_FORMAT_SNORM_R16_G16_B16_A16     = 0x21f,
//C        GX2_SURFACE_FORMAT_SNORM_R10_G10_B10_A2      = 0x219,
//C        GX2_SURFACE_FORMAT_SNORM_BC4                 = 0x234,
//C        GX2_SURFACE_FORMAT_SNORM_BC5                 = 0x235,

//C        GX2_SURFACE_FORMAT_SINT_R8                   = 0x301,
//C        GX2_SURFACE_FORMAT_SINT_R8_G8                = 0x307,
//C        GX2_SURFACE_FORMAT_SINT_R8_G8_B8_A8          = 0x31a,
//C        GX2_SURFACE_FORMAT_SINT_R16                  = 0x305,
//C        GX2_SURFACE_FORMAT_SINT_R16_G16              = 0x30f,
//C        GX2_SURFACE_FORMAT_SINT_R16_G16_B16_A16      = 0x31f,
//C        GX2_SURFACE_FORMAT_SINT_R32                  = 0x30d,
//C        GX2_SURFACE_FORMAT_SINT_R32_G32              = 0x31d,
//C        GX2_SURFACE_FORMAT_SINT_R32_G32_B32_A32      = 0x322,
//C        GX2_SURFACE_FORMAT_SINT_R10_G10_B10_A2       = 0x319,

//C        GX2_SURFACE_FORMAT_SRGB_R8_G8_B8_A8          = 0x41a,
//C        GX2_SURFACE_FORMAT_SRGB_BC1                  = 0x431,
//C        GX2_SURFACE_FORMAT_SRGB_BC2                  = 0x432,
//C        GX2_SURFACE_FORMAT_SRGB_BC3                  = 0x433,

//C        GX2_SURFACE_FORMAT_FLOAT_R32                 = 0x80e,
//C        GX2_SURFACE_FORMAT_FLOAT_R32_G32             = 0x81e,
//C        GX2_SURFACE_FORMAT_FLOAT_R32_G32_B32_A32     = 0x823,
//C        GX2_SURFACE_FORMAT_FLOAT_R16                 = 0x806,
//C        GX2_SURFACE_FORMAT_FLOAT_R16_G16             = 0x810,
//C        GX2_SURFACE_FORMAT_FLOAT_R16_G16_B16_A16     = 0x820,
//C        GX2_SURFACE_FORMAT_FLOAT_R11_G11_B10         = 0x816,
//C        GX2_SURFACE_FORMAT_FLOAT_D24_S8              = 0x811,
//C        GX2_SURFACE_FORMAT_FLOAT_X8_X24              = 0x81c,
//C     } GX2SurfaceFormat;
enum
{
    GX2_SURFACE_FORMAT_INVALID,
    GX2_SURFACE_FORMAT_UNORM_R4_G4 = 2,
    GX2_SURFACE_FORMAT_UNORM_R4_G4_B4_A4 = 11,
    GX2_SURFACE_FORMAT_UNORM_R8 = 1,
    GX2_SURFACE_FORMAT_UNORM_R8_G8 = 7,
    GX2_SURFACE_FORMAT_UNORM_R8_G8_B8_A8 = 26,
    GX2_SURFACE_FORMAT_UNORM_R16 = 5,
    GX2_SURFACE_FORMAT_UNORM_R16_G16 = 15,
    GX2_SURFACE_FORMAT_UNORM_R16_G16_B16_A16 = 31,
    GX2_SURFACE_FORMAT_UNORM_R5_G6_B5 = 8,
    GX2_SURFACE_FORMAT_UNORM_R5_G5_B5_A1 = 10,
    GX2_SURFACE_FORMAT_UNORM_A1_B5_G5_R5 = 12,
    GX2_SURFACE_FORMAT_UNORM_R24_X8 = 17,
    GX2_SURFACE_FORMAT_UNORM_A2_B10_G10_R10 = 27,
    GX2_SURFACE_FORMAT_UNORM_R10_G10_B10_A2 = 25,
    GX2_SURFACE_FORMAT_UNORM_BC1 = 49,
    GX2_SURFACE_FORMAT_UNORM_BC2,
    GX2_SURFACE_FORMAT_UNORM_BC3,
    GX2_SURFACE_FORMAT_UNORM_BC4,
    GX2_SURFACE_FORMAT_UNORM_BC5,
    GX2_SURFACE_FORMAT_UNORM_NV12 = 129,
    GX2_SURFACE_FORMAT_UINT_R8 = 257,
    GX2_SURFACE_FORMAT_UINT_R8_G8 = 263,
    GX2_SURFACE_FORMAT_UINT_R8_G8_B8_A8 = 282,
    GX2_SURFACE_FORMAT_UINT_R16 = 261,
    GX2_SURFACE_FORMAT_UINT_R16_G16 = 271,
    GX2_SURFACE_FORMAT_UINT_R16_G16_B16_A16 = 287,
    GX2_SURFACE_FORMAT_UINT_R32 = 269,
    GX2_SURFACE_FORMAT_UINT_R32_G32 = 285,
    GX2_SURFACE_FORMAT_UINT_R32_G32_B32_A32 = 290,
    GX2_SURFACE_FORMAT_UINT_A2_B10_G10_R10 = 283,
    GX2_SURFACE_FORMAT_UINT_R10_G10_B10_A2 = 281,
    GX2_SURFACE_FORMAT_UINT_X24_G8 = 273,
    GX2_SURFACE_FORMAT_UINT_G8_X24 = 284,
    GX2_SURFACE_FORMAT_SNORM_R8 = 513,
    GX2_SURFACE_FORMAT_SNORM_R8_G8 = 519,
    GX2_SURFACE_FORMAT_SNORM_R8_G8_B8_A8 = 538,
    GX2_SURFACE_FORMAT_SNORM_R16 = 517,
    GX2_SURFACE_FORMAT_SNORM_R16_G16 = 527,
    GX2_SURFACE_FORMAT_SNORM_R16_G16_B16_A16 = 543,
    GX2_SURFACE_FORMAT_SNORM_R10_G10_B10_A2 = 537,
    GX2_SURFACE_FORMAT_SNORM_BC4 = 564,
    GX2_SURFACE_FORMAT_SNORM_BC5,
    GX2_SURFACE_FORMAT_SINT_R8 = 769,
    GX2_SURFACE_FORMAT_SINT_R8_G8 = 775,
    GX2_SURFACE_FORMAT_SINT_R8_G8_B8_A8 = 794,
    GX2_SURFACE_FORMAT_SINT_R16 = 773,
    GX2_SURFACE_FORMAT_SINT_R16_G16 = 783,
    GX2_SURFACE_FORMAT_SINT_R16_G16_B16_A16 = 799,
    GX2_SURFACE_FORMAT_SINT_R32 = 781,
    GX2_SURFACE_FORMAT_SINT_R32_G32 = 797,
    GX2_SURFACE_FORMAT_SINT_R32_G32_B32_A32 = 802,
    GX2_SURFACE_FORMAT_SINT_R10_G10_B10_A2 = 793,
    GX2_SURFACE_FORMAT_SRGB_R8_G8_B8_A8 = 1050,
    GX2_SURFACE_FORMAT_SRGB_BC1 = 1073,
    GX2_SURFACE_FORMAT_SRGB_BC2,
    GX2_SURFACE_FORMAT_SRGB_BC3,
    GX2_SURFACE_FORMAT_FLOAT_R32 = 2062,
    GX2_SURFACE_FORMAT_FLOAT_R32_G32 = 2078,
    GX2_SURFACE_FORMAT_FLOAT_R32_G32_B32_A32 = 2083,
    GX2_SURFACE_FORMAT_FLOAT_R16 = 2054,
    GX2_SURFACE_FORMAT_FLOAT_R16_G16 = 2064,
    GX2_SURFACE_FORMAT_FLOAT_R16_G16_B16_A16 = 2080,
    GX2_SURFACE_FORMAT_FLOAT_R11_G11_B10 = 2070,
    GX2_SURFACE_FORMAT_FLOAT_D24_S8 = 2065,
    GX2_SURFACE_FORMAT_FLOAT_X8_X24 = 2076,
}
alias int GX2SurfaceFormat;

//C     typedef enum GX2SurfaceUse
//C     {
//C        GX2_SURFACE_USE_TEXTURE                      = 1 << 0,
//C        GX2_SURFACE_USE_COLOR_BUFFER                 = 1 << 1,
//C        GX2_SURFACE_USE_DEPTH_BUFFER                 = 1 << 2,
//C        GX2_SURFACE_USE_SCAN_BUFFER                  = 1 << 3,
//C        GX2_SURFACE_USE_TV                           = 1 << 31,
//C        GX2_SURFACE_USE_TEXTURE_COLOR_BUFFER_TV      = (GX2_SURFACE_USE_TEXTURE | GX2_SURFACE_USE_COLOR_BUFFER | GX2_SURFACE_USE_TV)
//C     } GX2SurfaceUse;
enum GX2SurfaceUse
{
    GX2_SURFACE_USE_TEXTURE = 1,
    GX2_SURFACE_USE_COLOR_BUFFER,
    GX2_SURFACE_USE_DEPTH_BUFFER = 4,
    GX2_SURFACE_USE_SCAN_BUFFER = 8,
    GX2_SURFACE_USE_TV = -2147483648,
    GX2_SURFACE_USE_TEXTURE_COLOR_BUFFER_TV = -2147483645,
}

//C     typedef enum GX2TessellationMode
//C     {
//C        GX2_TESSELLATION_MODE_DISCRETE         = 0,
//C        GX2_TESSELLATION_MODE_CONTINUOUS       = 1,
//C        GX2_TESSELLATION_MODE_ADAPTIVE         = 2,
//C     } GX2TessellationMode;
enum GX2TessellationMode
{
    GX2_TESSELLATION_MODE_DISCRETE,
    GX2_TESSELLATION_MODE_CONTINUOUS,
    GX2_TESSELLATION_MODE_ADAPTIVE,
}

//C     typedef enum GX2TexBorderType
//C     {
//C        GX2_TEX_BORDER_TYPE_TRANSPARENT_BLACK  = 0,
//C        GX2_TEX_BORDER_TYPE_BLACK              = 1,
//C        GX2_TEX_BORDER_TYPE_WHITE              = 2,
//C        GX2_TEX_BORDER_TYPE_VARIABLE           = 3,
//C     } GX2TexBorderType;
enum GX2TexBorderType
{
    GX2_TEX_BORDER_TYPE_TRANSPARENT_BLACK,
    GX2_TEX_BORDER_TYPE_BLACK,
    GX2_TEX_BORDER_TYPE_WHITE,
    GX2_TEX_BORDER_TYPE_VARIABLE,
}

//C     typedef enum GX2TexClampMode
//C     {
//C        GX2_TEX_CLAMP_MODE_WRAP                = 0,
//C        GX2_TEX_CLAMP_MODE_MIRROR              = 1,
//C        GX2_TEX_CLAMP_MODE_CLAMP               = 2,
//C        GX2_TEX_CLAMP_MODE_MIRROR_ONCE         = 3,
//C        GX2_TEX_CLAMP_MODE_CLAMP_BORDER        = 6,
//C     } GX2TexClampMode;
enum GX2TexClampMode
{
    GX2_TEX_CLAMP_MODE_WRAP,
    GX2_TEX_CLAMP_MODE_MIRROR,
    GX2_TEX_CLAMP_MODE_CLAMP,
    GX2_TEX_CLAMP_MODE_MIRROR_ONCE,
    GX2_TEX_CLAMP_MODE_CLAMP_BORDER = 6,
}

//C     typedef enum GX2TexMipFilterMode
//C     {
//C        GX2_TEX_MIP_FILTER_MODE_NONE           = 0,
//C        GX2_TEX_MIP_FILTER_MODE_POINT          = 1,
//C        GX2_TEX_MIP_FILTER_MODE_LINEAR         = 2,
//C     } GX2TexMipFilterMode;
enum GX2TexMipFilterMode
{
    GX2_TEX_MIP_FILTER_MODE_NONE,
    GX2_TEX_MIP_FILTER_MODE_POINT,
    GX2_TEX_MIP_FILTER_MODE_LINEAR,
}

//C     typedef enum GX2TexMipPerfMode
//C     {
//C        GX2_TEX_MIP_PERF_MODE_DISABLE          = 0,
//C     } GX2TexMipPerfMode;
enum GX2TexMipPerfMode
{
    GX2_TEX_MIP_PERF_MODE_DISABLE,
}

//C     typedef enum GX2TexXYFilterMode
//C     {
//C        GX2_TEX_XY_FILTER_MODE_POINT          = 0,
//C        GX2_TEX_XY_FILTER_MODE_LINEAR         = 1,
//C     } GX2TexXYFilterMode;
enum GX2TexXYFilterMode
{
    GX2_TEX_XY_FILTER_MODE_POINT,
    GX2_TEX_XY_FILTER_MODE_LINEAR,
}

//C     typedef enum GX2TexAnisoRatio
//C     {
//C        GX2_TEX_ANISO_RATIO_NONE               = 0,
//C     } GX2TexAnisoRatio;
enum GX2TexAnisoRatio
{
    GX2_TEX_ANISO_RATIO_NONE,
}

//C     typedef enum GX2TexZFilterMode
//C     {
//C        GX2_TEX_Z_FILTER_MODE_NONE             = 0,
//C        GX2_TEX_Z_FILTER_MODE_POINT            = 1,
//C        GX2_TEX_Z_FILTER_MODE_LINEAR           = 2,
//C     } GX2TexZFilterMode;
enum GX2TexZFilterMode
{
    GX2_TEX_Z_FILTER_MODE_NONE,
    GX2_TEX_Z_FILTER_MODE_POINT,
    GX2_TEX_Z_FILTER_MODE_LINEAR,
}

//C     typedef enum GX2TexZPerfMode
//C     {
//C        GX2_TEX_Z_PERF_MODE_DISABLED           = 0,
//C     } GX2TexZPerfMode;
enum GX2TexZPerfMode
{
    GX2_TEX_Z_PERF_MODE_DISABLED,
}

//C     typedef enum GX2TileMode
//C     {
//C        GX2_TILE_MODE_DEFAULT                  = 0,
//C        GX2_TILE_MODE_LINEAR_ALIGNED           = 1,
//C        GX2_TILE_MODE_TILED_1D_THIN1           = 2,
//C        GX2_TILE_MODE_TILED_1D_THICK           = 3,
//C        GX2_TILE_MODE_TILED_2D_THIN1           = 4,
//C        GX2_TILE_MODE_TILED_2D_THIN2           = 5,
//C        GX2_TILE_MODE_TILED_2D_THIN4           = 6,
//C        GX2_TILE_MODE_TILED_2D_THICK           = 7,
//C        GX2_TILE_MODE_TILED_2B_THIN1           = 8,
//C        GX2_TILE_MODE_TILED_2B_THIN2           = 9,
//C        GX2_TILE_MODE_TILED_2B_THIN4           = 10,
//C        GX2_TILE_MODE_TILED_2B_THICK           = 11,
//C        GX2_TILE_MODE_TILED_3D_THIN1           = 12,
//C        GX2_TILE_MODE_TILED_3D_THICK           = 13,
//C        GX2_TILE_MODE_TILED_3B_THIN1           = 14,
//C        GX2_TILE_MODE_TILED_3B_THICK           = 15,
//C        GX2_TILE_MODE_LINEAR_SPECIAL           = 16,
//C     } GX2TileMode;
enum GX2TileMode
{
    GX2_TILE_MODE_DEFAULT,
    GX2_TILE_MODE_LINEAR_ALIGNED,
    GX2_TILE_MODE_TILED_1D_THIN1,
    GX2_TILE_MODE_TILED_1D_THICK,
    GX2_TILE_MODE_TILED_2D_THIN1,
    GX2_TILE_MODE_TILED_2D_THIN2,
    GX2_TILE_MODE_TILED_2D_THIN4,
    GX2_TILE_MODE_TILED_2D_THICK,
    GX2_TILE_MODE_TILED_2B_THIN1,
    GX2_TILE_MODE_TILED_2B_THIN2,
    GX2_TILE_MODE_TILED_2B_THIN4,
    GX2_TILE_MODE_TILED_2B_THICK,
    GX2_TILE_MODE_TILED_3D_THIN1,
    GX2_TILE_MODE_TILED_3D_THICK,
    GX2_TILE_MODE_TILED_3B_THIN1,
    GX2_TILE_MODE_TILED_3B_THICK,
    GX2_TILE_MODE_LINEAR_SPECIAL,
}

//C     typedef enum GX2TVRenderMode
//C     {
//C        GX2_TV_RENDER_MODE_STANDARD_480P       = 1,
//C        GX2_TV_RENDER_MODE_WIDE_480P           = 2,
//C        GX2_TV_RENDER_MODE_WIDE_720P           = 3,
//C        GX2_TV_RENDER_MODE_WIDE_1080P          = 5,
//C     } GX2TVRenderMode;
enum GX2TVRenderMode
{
    GX2_TV_RENDER_MODE_STANDARD_480P = 1,
    GX2_TV_RENDER_MODE_WIDE_480P,
    GX2_TV_RENDER_MODE_WIDE_720P,
    GX2_TV_RENDER_MODE_WIDE_1080P = 5,
}

//C     typedef enum GX2TVScanMode
//C     {
//C        GX2_TV_SCAN_MODE_NONE                  = 0,
//C        GX2_TV_SCAN_MODE_480I                  = 1,
//C        GX2_TV_SCAN_MODE_480P                  = 2,
//C        GX2_TV_SCAN_MODE_720P                  = 3,
//C        GX2_TV_SCAN_MODE_1080I                 = 5,
//C        GX2_TV_SCAN_MODE_1080P                 = 6,
//C     } GX2TVScanMode;
enum GX2TVScanMode
{
    GX2_TV_SCAN_MODE_NONE,
    GX2_TV_SCAN_MODE_480I,
    GX2_TV_SCAN_MODE_480P,
    GX2_TV_SCAN_MODE_720P,
    GX2_TV_SCAN_MODE_1080I = 5,
    GX2_TV_SCAN_MODE_1080P,
}

//C     #ifdef __cplusplus
//C     }
//C     #endif

/** @} */
