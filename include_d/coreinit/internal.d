/* Converted to D from include/coreinit/internal.h by htod */
module coreinit.internal;
//C     #pragma once
//C     #include <wut.h>
import std.c.wut;

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     int
//C     __os_snprintf(char *buf, size_t n, const char *format, ... );
extern (C):
int  __os_snprintf(char *buf, size_t n, char *format,...);

//C     #ifdef __cplusplus
//C     }
//C     #endif
