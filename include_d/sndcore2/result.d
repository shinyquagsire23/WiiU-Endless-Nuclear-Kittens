/* Converted to D from include/sndcore2/result.h by htod */
module sndcore2.result;
//C     #pragma once
//C     #include <wut.h>
import std.c.wut;

/**
 * \defgroup sndcore2_result Result
 * \ingroup sndcore2
 *
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//! A value from enum AX_RESULT.
//C     typedef int32_t AXResult;
extern (C):
alias int32_t AXResult;

//C     enum AX_RESULT
//C     {
//C        AX_RESULT_SUCCESS                = 0,
//C        AX_RESULT_INVALID_DEVICE_TYPE    = -1,
//C        AX_RESULT_INVALID_DRC_VS_MODE    = -13,
//C        AX_RESULT_VOICE_IS_RUNNING       = -18,
//C        AX_RESULT_DELAY_TOO_BIG          = -19,
//C     };
enum AX_RESULT
{
    AX_RESULT_SUCCESS,
    AX_RESULT_INVALID_DEVICE_TYPE = -1,
    AX_RESULT_INVALID_DRC_VS_MODE = -13,
    AX_RESULT_VOICE_IS_RUNNING = -18,
    AX_RESULT_DELAY_TOO_BIG = -19,
}

//C     #ifdef __cplusplus
//C     }
//C     #endif

/** @} */
