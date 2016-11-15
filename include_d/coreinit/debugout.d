/* Converted to D from include/coreinit/debug.h by htod */
//module coreinit.debug;
//C     #pragma once
//C     #include <wut.h>
//import std.c.wut;

/**
 * \defgroup coreinit_debug Debug
 * \ingroup coreinit
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif


//C     void
//C     OSConsoleWrite(const char *msg,
//C                    uint32_t size);
extern (C):
void  OSConsoleWrite(char *msg, uint size);


//C     void
//C     OSReport(const char *fmt, ...);
void  OSReport(const char *fmt,...);


//C     void
//C     OSPanic(const char *file,
//C             uint32_t line,
//C             const char *fmt, ...);
void  OSPanic(char *file, uint line, char *fmt,...);


//C     void
//C     OSFatal(const char *msg);
void  OSFatal(char *msg);


//C     #ifdef __cplusplus
//C     }
//C     #endif

/** @} */
