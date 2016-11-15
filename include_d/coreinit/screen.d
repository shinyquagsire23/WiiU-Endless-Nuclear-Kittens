/* Converted to D from include/coreinit/screen.h by htod */
module coreinit.screen;
//C     #pragma once
//C     #include <wut.h>
import std.c.wut;

/**
 * \defgroup coreinit_screen Screen
 * \ingroup coreinit
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef enum OSScreenID
//C     {
//C        SCREEN_TV      = 0,
//C        SCREEN_DRC     = 1,
//C     } OSScreenID;
enum OSScreenID
{
    SCREEN_TV,
    SCREEN_DRC,
}
extern (C):

//C     void
//C     OSScreenInit();
void  OSScreenInit(...);

//C     uint32_t
//C     OSScreenGetBufferSizeEx(OSScreenID screen);
uint32_t  OSScreenGetBufferSizeEx(OSScreenID screen);

//C     void
//C     OSScreenSetBufferEx(OSScreenID screen,
//C                         void *addr);
void  OSScreenSetBufferEx(OSScreenID screen, void *addr);

//C     void
//C     OSScreenClearBufferEx(OSScreenID screen,
//C                           uint32_t colour);
void  OSScreenClearBufferEx(OSScreenID screen, uint32_t colour);

//C     void
//C     OSScreenFlipBuffersEx(OSScreenID screen);
void  OSScreenFlipBuffersEx(OSScreenID screen);

//C     void
//C     OSScreenPutFontEx(OSScreenID screen,
//C                       uint32_t row,
//C                       uint32_t column,
//C                       const char *buffer);
void  OSScreenPutFontEx(OSScreenID screen, uint32_t row, uint32_t column, char *buffer);

//C     void
//C     OSScreenPutPixelEx(OSScreenID screen,
//C                        uint32_t x,
//C                        uint32_t y,
//C                        uint32_t colour);
void  OSScreenPutPixelEx(OSScreenID screen, uint32_t x, uint32_t y, uint32_t colour);

//C     void
//C     OSScreenEnableEx(OSScreenID screen,
//C                      BOOL enable);
void  OSScreenEnableEx(OSScreenID screen, BOOL enable);

//C     #ifdef __cplusplus
//C     }
//C     #endif

/** @} */
