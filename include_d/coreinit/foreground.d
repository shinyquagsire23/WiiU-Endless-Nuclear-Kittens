/* Converted to D from include/coreinit/foreground.h by htod */
module coreinit.foreground;
//C     #pragma once
//C     #include <wut.h>
import wut;

/**
 * \defgroup coreinit_foreground Foreground Management
 * \ingroup coreinit
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     void
//C     OSEnableForegroundExit();
extern (C):
void  OSEnableForegroundExit();

//C     void
//C     OSReleaseForeground();
void  OSReleaseForeground();

//C     void
//C     OSSavesDone_ReadyToRelease();
void  OSSavesDone_ReadyToRelease();

//C     #ifdef __cplusplus
//C     }
//C     #endif

/** @} */
