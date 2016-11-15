/* Converted to D from include/coreinit/coroutine.h by htod */
module coreinit.coroutine;
//C     #pragma once
//C     #include <wut.h>
import std.c.wut;

/**
 * \defgroup coreinit_coroutine Coroutines
 * \ingroup coreinit
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef struct OSCoroutine OSCoroutine;
extern (C):

//C     struct OSCoroutine
//C     {
//C        uint32_t nia;
//C        uint32_t cr;
//C        uint32_t ugqr1;
//C        uint32_t stack;
//C        uint32_t sda2Base;
//C        uint32_t sdaBase;
//C        uint32_t gpr[18];
//C        double fpr[18];
//C        double psr[18];
//C     };
struct OSCoroutine
{
    uint32_t nia;
    uint32_t cr;
    uint32_t ugqr1;
    uint32_t stack;
    uint32_t sda2Base;
    uint32_t sdaBase;
    uint32_t [18]gpr;
    double [18]fpr;
    double [18]psr;
}
//C     CHECK_OFFSET(OSCoroutine, 0x00, nia);
//C     CHECK_OFFSET(OSCoroutine, 0x04, cr);
symbol static_assert
//C     CHECK_OFFSET(OSCoroutine, 0x08, ugqr1);
symbol static_assert
//C     CHECK_OFFSET(OSCoroutine, 0x0C, stack);
symbol static_assert
//C     CHECK_OFFSET(OSCoroutine, 0x10, sda2Base);
