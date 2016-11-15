/* Converted to D from include/coreinit/exception.h by htod */
module coreinit.exception;
//C     #pragma once
//C     #include <wut.h>
import std.c.wut;

/**
 * \defgroup coreinit_exception Exception Handling
 * \ingroup coreinit
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef BOOL (*OSExceptionCallbackFn)(OSContext *context);
extern (C):
alias BOOL  function(...)OSExceptionCallbackFn;

//C     typedef enum OSExceptionType
//C     {
//C        OS_EXCEPTION_TYPE_SYSTEM_RESET         = 0,
//C        OS_EXCEPTION_TYPE_MACHINE_CHECK        = 1,
//C        OS_EXCEPTION_TYPE_DSI                  = 2,
//C        OS_EXCEPTION_TYPE_ISI                  = 3,
//C        OS_EXCEPTION_TYPE_EXTERNAL_INTERRUPT   = 4,
//C        OS_EXCEPTION_TYPE_ALIGNMENT            = 5,
//C        OS_EXCEPTION_TYPE_PROGRAM              = 6,
//C        OS_EXCEPTION_TYPE_FLOATING_POINT       = 7,
//C        OS_EXCEPTION_TYPE_DECREMENTER          = 8,
//C        OS_EXCEPTION_TYPE_SYSTEM_CALL          = 9,
//C        OS_EXCEPTION_TYPE_TRACE                = 10,
//C        OS_EXCEPTION_TYPE_PERFORMANCE_MONITOR  = 11,
//C        OS_EXCEPTION_TYPE_BREAKPOINT           = 12,
//C        OS_EXCEPTION_TYPE_SYSTEM_INTERRUPT     = 13,
//C        OS_EXCEPTION_TYPE_ICI                  = 14,
//C     } OSExceptionType;
enum OSExceptionType
{
    OS_EXCEPTION_TYPE_SYSTEM_RESET,
    OS_EXCEPTION_TYPE_MACHINE_CHECK,
    OS_EXCEPTION_TYPE_DSI,
    OS_EXCEPTION_TYPE_ISI,
    OS_EXCEPTION_TYPE_EXTERNAL_INTERRUPT,
    OS_EXCEPTION_TYPE_ALIGNMENT,
    OS_EXCEPTION_TYPE_PROGRAM,
    OS_EXCEPTION_TYPE_FLOATING_POINT,
    OS_EXCEPTION_TYPE_DECREMENTER,
    OS_EXCEPTION_TYPE_SYSTEM_CALL,
    OS_EXCEPTION_TYPE_TRACE,
    OS_EXCEPTION_TYPE_PERFORMANCE_MONITOR,
    OS_EXCEPTION_TYPE_BREAKPOINT,
    OS_EXCEPTION_TYPE_SYSTEM_INTERRUPT,
    OS_EXCEPTION_TYPE_ICI,
}

//C     OSExceptionCallbackFn
//C     OSSetExceptionCallback(OSExceptionType exceptionType,
//C                            OSExceptionCallbackFn callback);
OSExceptionCallbackFn  OSSetExceptionCallback(OSExceptionType exceptionType, OSExceptionCallbackFn callback);

//C     OSExceptionCallbackFn
//C     OSSetExceptionCallbackEx(UNKNOWN_ARG,
//C                              OSExceptionType exceptionType,
//C                              OSExceptionCallbackFn callback);
OSExceptionCallbackFn  OSSetExceptionCallbackEx(uint32_t , OSExceptionType exceptionType, OSExceptionCallbackFn callback);

//C     #ifdef __cplusplus
//C     }
//C     #endif

/** @} */
