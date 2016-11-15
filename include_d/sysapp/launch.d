/* Converted to D from include/sysapp/launch.h by htod */
module sysapp.launch;
//C     #pragma once
//C     #include <wut.h>
import wut;

/**
 * \defgroup sysapp_launch SYSAPP Launch
 * \ingroup sysapp
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     void
//C     SYSRelaunchTitle(uint32_t argc, 
//C                      char *pa_Argv[]);
extern (C):
void  SYSRelaunchTitle(uint argc, char **pa_Argv);

//C     void
//C     SYSLaunchMenu();
void  SYSLaunchMenu();

//C     void
//C     SYSLaunchTitle(uint64_t TitleId);
void  SYSLaunchTitle(ulong TitleId);

//C     void
//C     _SYSLaunchMiiStudio();
void  _SYSLaunchMiiStudio();

//C     void
//C     _SYSLaunchSettings();
void  _SYSLaunchSettings();

//C     void
//C     _SYSLaunchParental();
void  _SYSLaunchParental();

//C     void
//C     _SYSLaunchNotifications();
void  _SYSLaunchNotifications();

//C     #ifdef __cplusplus
//C     }
//C     #endif

/** @} */
