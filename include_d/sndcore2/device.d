/* Converted to D from include/sndcore2/device.h by htod */
module sndcore2.device;
//C     #pragma once
//C     #include <wut.h>
import std.c.wut;
//C     #include "result.h"
import result;

/**
 * \defgroup sndcore2_device Device
 * \ingroup sndcore2
 *
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef void(*AXDeviceFinalMixCallback)(void*);
extern (C):
alias void  function(void *)AXDeviceFinalMixCallback;
//C     typedef void(*AXAuxCallback)(void*, void*);
alias void  function(void *, void *)AXAuxCallback;

//! A value from enum AX_DEVICE_MODE.
//C     typedef uint32_t AXDeviceMode;
alias uint32_t AXDeviceMode;

//! A value from enum AX_DEVICE_TYPE.
//C     typedef uint32_t AXDeviceType;
alias uint32_t AXDeviceType;

//C     enum AX_DEVICE_MODE
//C     {
   // Unknown
//C        AX_DEVICE_MODE_UNKNOWN
//C     };
enum AX_DEVICE_MODE
{
    AX_DEVICE_MODE_UNKNOWN,
}

//C     enum AX_DEVICE_TYPE
//C     {
//C        AX_DEVICE_TYPE_TV          = 0,
//C        AX_DEVICE_TYPE_DRC         = 1,
//C        AX_DEVICE_TYPE_CONTROLLER  = 2,
//C     };
enum AX_DEVICE_TYPE
{
    AX_DEVICE_TYPE_TV,
    AX_DEVICE_TYPE_DRC,
    AX_DEVICE_TYPE_CONTROLLER,
}

//C     AXResult
//C     AXGetDeviceMode(AXDeviceType type,
//C                     AXDeviceMode *mode);
AXResult  AXGetDeviceMode(AXDeviceType type, AXDeviceMode *mode);

//C     AXResult
//C     AXGetDeviceFinalMixCallback(AXDeviceType type,
//C                                 AXDeviceFinalMixCallback *func);
AXResult  AXGetDeviceFinalMixCallback(AXDeviceType type, AXDeviceFinalMixCallback *func);

//C     AXResult
//C     AXRegisterDeviceFinalMixCallback(AXDeviceType type,
//C                                      AXDeviceFinalMixCallback func);
AXResult  AXRegisterDeviceFinalMixCallback(AXDeviceType type, AXDeviceFinalMixCallback func);

//C     AXResult
//C     AXGetAuxCallback(AXDeviceType type,
//C                      uint32_t unk0,
//C                      uint32_t unk1,
//C                      AXAuxCallback *callback,
//C                      void **userData);
AXResult  AXGetAuxCallback(AXDeviceType type, uint32_t unk0, uint32_t unk1, AXAuxCallback *callback, void **userData);

//C     AXResult
//C     AXRegisterAuxCallback(AXDeviceType type,
//C                           uint32_t unk0,
//C                           uint32_t unk1,
//C                           AXAuxCallback callback,
//C                           void *userData);
AXResult  AXRegisterAuxCallback(AXDeviceType type, uint32_t unk0, uint32_t unk1, AXAuxCallback callback, void *userData);

//C     AXResult
//C     AXSetDeviceLinearUpsampler(AXDeviceType type,
//C                                uint32_t unk0,
//C                                uint32_t unk1);
AXResult  AXSetDeviceLinearUpsampler(AXDeviceType type, uint32_t unk0, uint32_t unk1);

//C     AXResult
//C     AXSetDeviceCompressor(AXDeviceType type,
//C                           uint32_t unk0);
AXResult  AXSetDeviceCompressor(AXDeviceType type, uint32_t unk0);

//C     AXResult
//C     AXSetDeviceUpsampleStage(AXDeviceType type,
//C                              BOOL postFinalMix);
AXResult  AXSetDeviceUpsampleStage(AXDeviceType type, BOOL postFinalMix);

//C     AXResult
//C     AXSetDeviceVolume(AXDeviceType type,
//C                       uint32_t id,
//C                       uint16_t volume);
AXResult  AXSetDeviceVolume(AXDeviceType type, uint32_t id, uint16_t volume);

//C     #ifdef __cplusplus
//C     }
//C     #endif

/** @} */
