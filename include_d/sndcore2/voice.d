/* Converted to D from include/sndcore2/voice.h by htod */
module sndcore2.voice;
//C     #pragma once
//C     #include <wut.h>
import std.c.wut;
//C     #include "device.h"
import device;
//C     #include "result.h"

/**
 * \defgroup sndcore2_voice Voice
 * \ingroup sndcore2
 *
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef struct AXVoice AXVoice;
extern (C):
//C     typedef struct AXVoiceAdpcmLoopData AXVoiceAdpcmLoopData;
//C     typedef struct AXVoiceAdpcm AXVoiceAdpcm;
//C     typedef struct AXVoiceDeviceBusMixData AXVoiceDeviceBusMixData;
//C     typedef struct AXVoiceDeviceMixData AXVoiceDeviceMixData;
//C     typedef struct AXVoiceLink AXVoiceLink;
//C     typedef struct AXVoiceOffsets AXVoiceOffsets;
//C     typedef struct AXVoiceSrc AXVoiceSrc;
//C     typedef struct AXVoiceVeData AXVoiceVeData;

//! A value from enum AX_VOICE_FORMAT.
//C     typedef uint16_t AXVoiceFormat;
alias uint16_t AXVoiceFormat;

//! A value from enum AX_VOICE_LOOP.
//C     typedef uint16_t AXVoiceLoop;
alias uint16_t AXVoiceLoop;

//! A value from enum AX_VOICE_SRC_TYPE.
//C     typedef uint32_t AXVoiceSrcType;
alias uint32_t AXVoiceSrcType;

//! A value from enum AX_VOICE_STATE.
//C     typedef uint32_t AXVoiceState;
alias uint32_t AXVoiceState;

//! A value from enum AX_VOICE_RENDERER.
//C     typedef uint32_t AXVoiceRenderer;
alias uint32_t AXVoiceRenderer;

//! A value from enum AX_VOICE_RATIO_RESULT.
//C     typedef int32_t AXVoiceSrcRatioResult;
alias int32_t AXVoiceSrcRatioResult;

//! A value from enum AX_VOICE_TYPE.
//C     typedef uint32_t AXVoiceType;
alias uint32_t AXVoiceType;

//C     typedef void(*AXVoiceCallbackFn)(void *);
alias void  function(void *)AXVoiceCallbackFn;
//C     typedef void(*AXVoiceCallbackExFn)(void *, uint32_t, uint32_t);
alias void  function(void *, uint32_t , uint32_t )AXVoiceCallbackExFn;

//C     enum AX_VOICE_FORMAT
//C     {
//C        AX_VOICE_FORMAT_ADPCM   = 0,
//C        AX_VOICE_FORMAT_LPCM16  = 10,
//C        AX_VOICE_FORMAT_LPCM8   = 25,
//C     };
enum AX_VOICE_FORMAT
{
    AX_VOICE_FORMAT_ADPCM,
    AX_VOICE_FORMAT_LPCM16 = 10,
    AX_VOICE_FORMAT_LPCM8 = 25,
}

//C     enum AX_VOICE_LOOP
//C     {
//C        AX_VOICE_LOOP_DISABLED  = 0,
//C        AX_VOICE_LOOP_ENABLED   = 1,
//C     };
enum AX_VOICE_LOOP
{
    AX_VOICE_LOOP_DISABLED,
    AX_VOICE_LOOP_ENABLED,
}

//C     enum AX_VOICE_RENDERER
//C     {
//C        AX_VOICE_RENDERER_DSP   = 0,
//C        AX_VOICE_RENDERER_CPU   = 1,
//C        AX_VOICE_RENDERER_AUTO  = 2,
//C     };
enum AX_VOICE_RENDERER
{
    AX_VOICE_RENDERER_DSP,
    AX_VOICE_RENDERER_CPU,
    AX_VOICE_RENDERER_AUTO,
}

//C     enum AX_VOICE_RATIO_RESULT
//C     {
//C        AX_VOICE_RATIO_RESULT_SUCCESS                   = 0,
//C        AX_VOICE_RATIO_RESULT_LESS_THAN_ZERO            = -1,
//C        AX_VOICE_RATIO_RESULT_GREATER_THAN_SOMETHING    = -2,
//C     };
enum AX_VOICE_RATIO_RESULT
{
    AX_VOICE_RATIO_RESULT_SUCCESS,
    AX_VOICE_RATIO_RESULT_LESS_THAN_ZERO = -1,
    AX_VOICE_RATIO_RESULT_GREATER_THAN_SOMETHING = -2,
}

//C     enum AX_VOICE_SRC_TYPE
//C     {
//C        AX_VOICE_SRC_TYPE_NONE     = 0,
//C        AX_VOICE_SRC_TYPE_LINEAR   = 1,
//C        AX_VOICE_SRC_TYPE_UNK0     = 2,
//C        AX_VOICE_SRC_TYPE_UNK1     = 3,
//C        AX_VOICE_SRC_TYPE_UNK2     = 4,
//C     };
enum AX_VOICE_SRC_TYPE
{
    AX_VOICE_SRC_TYPE_NONE,
    AX_VOICE_SRC_TYPE_LINEAR,
    AX_VOICE_SRC_TYPE_UNK0,
    AX_VOICE_SRC_TYPE_UNK1,
    AX_VOICE_SRC_TYPE_UNK2,
}

//C     enum AX_VOICE_STATE
//C     {
//C        AX_VOICE_STATE_STOPPED  = 0,
//C        AX_VOICE_STATE_PLAYING  = 1,
//C     };
enum AX_VOICE_STATE
{
    AX_VOICE_STATE_STOPPED,
    AX_VOICE_STATE_PLAYING,
}

//C     enum AX_VOICE_TYPE
//C     {
   // Unknown
//C        AX_VOICE_TYPE_UNKNOWN
//C     };
enum AX_VOICE_TYPE
{
    AX_VOICE_TYPE_UNKNOWN,
}

//C     struct AXVoiceLink
//C     {
//C        AXVoice *next;
//C        AXVoice *prev;
//C     };
struct AXVoiceLink
{
    AXVoice *next;
    AXVoice *prev;
}
//C     CHECK_OFFSET(AXVoiceLink, 0x0, next);
//C     CHECK_OFFSET(AXVoiceLink, 0x4, prev);
symbol static_assert
//C     CHECK_SIZE(AXVoiceLink, 0x8);
symbol static_assert

//C     struct AXVoiceOffsets
//C     {
//C        AXVoiceFormat dataType;
//C        AXVoiceLoop loopingEnabled;
//C        uint32_t loopOffset;
//C        uint32_t endOffset;
//C        uint32_t currentOffset;
//C        const void *data;
//C     };
struct AXVoiceOffsets
{
    AXVoiceFormat dataType;
    AXVoiceLoop loopingEnabled;
    uint32_t loopOffset;
    uint32_t endOffset;
    uint32_t currentOffset;
    void *data;
}
//C     CHECK_OFFSET(AXVoiceOffsets, 0x0, dataType);
symbol static_assert
//C     CHECK_OFFSET(AXVoiceOffsets, 0x2, loopingEnabled);
