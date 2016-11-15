/* Converted to D from include/coreinit/rendezvous.h by htod */
module coreinit.rendezvous;
//C     #pragma once
//C     #include <wut.h>
import std.c.wut;

/**
 * \defgroup coreinit_rendezvous Rendezvous
 * \ingroup coreinit
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef struct OSRendezvous OSRendezvous;
extern (C):

//C     struct OSRendezvous
//C     {
//C        uint32_t core[3];
//C        UNKNOWN(4);
//C     };
struct OSRendezvous
{
    uint32_t [3]core;
    char [4]__unk__COUNTER__;
}
//C     CHECK_OFFSET(OSRendezvous, 0x00, core);
//C     CHECK_SIZE(OSRendezvous, 0x10);
symbol static_assert

//C     void
//C     OSInitRendezvous(OSRendezvous *rendezvous);

//C     BOOL
//C     OSWaitRendezvous(OSRendezvous *rendezvous,
//C                      uint32_t coreMask);

//C     BOOL
//C     OSWaitRendezvousWithTimeout(OSRendezvous *rendezvous,
//C                                 uint32_t coreMask,
//C                                 OSTime timeout);
