/* Converted to D from include/sndcore2/drcvs.h by htod */
module sndcore2.drcvs;
//C     #pragma once
//C     #include <wut.h>
import std.c.wut;
//C     #include "result.h"
import result;

/**
 * \defgroup sndcore2_drcvs DRC VS
 * \ingroup sndcore2
 *
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//! A value from enum AX_DRC_VS_MODE.
//C     typedef uint32_t AXDRCVSMode;
extern (C):
alias uint32_t AXDRCVSMode;

//! A value from enum AX_DRC_VS_OUTPUT.
//C     typedef uint32_t AXDRCVSOutput;
alias uint32_t AXDRCVSOutput;

//! A value from enum AX_DRC_VS_LC.
//C     typedef uint32_t AXDRCVSLC;
alias uint32_t AXDRCVSLC;

//! A value from enum AX_DRC_VS_SPEAKER_POS.
//C     typedef uint32_t AXDRCVSSpeakerPosition;
alias uint32_t AXDRCVSSpeakerPosition;

//! A value from enum AX_DRC_VS_SURROUND_GAIN.
//C     typedef uint32_t AXDRCVSSurroundLevelGain;
alias uint32_t AXDRCVSSurroundLevelGain;

//C     enum AX_DRC_VS_MODE
//C     {
   // Unknown
//C        AX_DRC_VS_MODE_UNKNOWN
//C     };
enum AX_DRC_VS_MODE
{
    AX_DRC_VS_MODE_UNKNOWN,
}

//C     enum AX_DRC_VS_OUTPUT
//C     {
   // Unknown
//C        AX_DRC_VS_OUTPUT_UNKNOWN
//C     };
enum AX_DRC_VS_OUTPUT
{
    AX_DRC_VS_OUTPUT_UNKNOWN,
}

//C     enum AX_DRC_VS_LC
//C     {
   // Unknown
//C        AX_DRC_VS_LC_UNKNOWN
//C     };
enum AX_DRC_VS_LC
{
    AX_DRC_VS_LC_UNKNOWN,
}

//C     enum AX_DRC_VS_SPEAKER_POS
//C     {
   // Unknown
//C        AX_DRC_VS_SPEAKER_POS_UNKNOWN
//C     };
enum AX_DRC_VS_SPEAKER_POS
{
    AX_DRC_VS_SPEAKER_POS_UNKNOWN,
}

//C     enum AX_DRC_VS_SURROUND_GAIN
//C     {
   // Unknown
//C        AX_DRC_VS_SURROUND_GAIN_UNKNOWN
//C     };
enum AX_DRC_VS_SURROUND_GAIN
{
    AX_DRC_VS_SURROUND_GAIN_UNKNOWN,
}

//C     AXResult
//C     AXGetDRCVSMode(AXDRCVSMode *mode);
AXResult  AXGetDRCVSMode(AXDRCVSMode *mode);

//C     AXResult
//C     AXSetDRCVSMode(AXDRCVSMode mode);
AXResult  AXSetDRCVSMode(AXDRCVSMode mode);

//C     AXResult
//C     AXSetDRCVSDownmixBalance(AXDRCVSOutput output,
//C                              float balance);
AXResult  AXSetDRCVSDownmixBalance(AXDRCVSOutput output, float balance);

//C     AXResult
//C     AXSetDRCVSLC(AXDRCVSLC lc);
AXResult  AXSetDRCVSLC(AXDRCVSLC lc);

//C     AXResult
//C     AXSetDRCVSLimiter(BOOL limit);
AXResult  AXSetDRCVSLimiter(BOOL limit);

//C     AXResult
//C     AXSetDRCVSLimiterThreshold(float threshold);
AXResult  AXSetDRCVSLimiterThreshold(float threshold);

//C     AXResult
//C     AXSetDRCVSOutputGain(AXDRCVSOutput output,
//C                          float gain);
AXResult  AXSetDRCVSOutputGain(AXDRCVSOutput output, float gain);

//C     AXResult
//C     AXSetDRCVSSpeakerPosition(AXDRCVSOutput output,
//C                               AXDRCVSSpeakerPosition pos);
AXResult  AXSetDRCVSSpeakerPosition(AXDRCVSOutput output, AXDRCVSSpeakerPosition pos);

//C     AXResult
//C     AXSetDRCVSSurroundDepth(AXDRCVSOutput output,
//C                             float depth);
AXResult  AXSetDRCVSSurroundDepth(AXDRCVSOutput output, float depth);

//C     AXResult
//C     AXSetDRCVSSurroundLevelGain(AXDRCVSSurroundLevelGain gain);
AXResult  AXSetDRCVSSurroundLevelGain(AXDRCVSSurroundLevelGain gain);

//C     #ifdef __cplusplus
//C     }
//C     #endif

/** @} */
