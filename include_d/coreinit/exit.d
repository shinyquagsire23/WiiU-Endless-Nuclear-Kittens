/* Converted to D from include/coreinit/exit.h by htod */
module coreinit.exit;
//C     #pragma once
//C     #include <wut.h>
import std.c.wut;

/**
 * \defgroup coreinit_exit Exit
 * \ingroup coreinit
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     void
//C     exit(int code);
extern (C):
void  exit(int code);

//C     void
//C     _Exit();
void  _Exit(...);

//C     #ifdef __cplusplus
//C     }
//C     #endif

/** @} */
