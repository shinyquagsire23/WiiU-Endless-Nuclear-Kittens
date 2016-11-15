/* Converted to D from include/sndcore2/core.h by htod */
module sndcore2.core;
//C     #pragma once
//C     #include <wut.h>
import std.c.wut;
//C     #include "result.h"
import result;

/**
 * \defgroup sndcore2_core Core
 * \ingroup sndcore2
 *
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef struct AXProfile AXProfile;
extern (C):
//C     typedef struct AXInitParams AXInitParams;

//C     typedef void(*AXFrameCallback)(void);
alias void  function()AXFrameCallback;

//! A value from enum AX_INIT_RENDERER.
//C     typedef uint32_t AXInitRenderer;
alias uint32_t AXInitRenderer;

//! A value from enum AX_INIT_PIPELINE.
//C     typedef uint32_t AXInitPipeline;
alias uint32_t AXInitPipeline;

//C     enum AX_INIT_RENDERER
//C     {
//C       AX_INIT_RENDERER_32KHZ = 0,
//C       AX_INIT_RENDERER_48KHZ = 1,
//C     };
enum AX_INIT_RENDERER
{
    AX_INIT_RENDERER_32KHZ,
    AX_INIT_RENDERER_48KHZ,
}

//C     enum AX_INIT_PIPELINE
//C     {
//C       AX_INIT_PIPELINE_SINGLE = 0,
//C       AX_INIT_PIPELINE_FOUR_STAGE = 1,
//C     };
enum AX_INIT_PIPELINE
{
    AX_INIT_PIPELINE_SINGLE,
    AX_INIT_PIPELINE_FOUR_STAGE,
}

//C     struct AXProfile
//C     {
  // Unknown
//C     };
struct AXProfile
{
}

//C     struct AXInitParams
//C     {
//C        AXInitRenderer renderer;
//C        UNKNOWN(4);
//C        AXInitPipeline pipeline;
//C     };
struct AXInitParams
{
    AXInitRenderer renderer;
    char [4]__unk__COUNTER__;
    AXInitPipeline pipeline;
}
//C     CHECK_OFFSET(AXInitParams, 0x00, renderer);
//C     CHECK_OFFSET(AXInitParams, 0x08, pipeline);
symbol static_assert
//C     CHECK_SIZE(AXInitParams, 0x0C);
symbol static_assert

//C     void
//C     AXInit();

//C     void
//C     AXQuit();
