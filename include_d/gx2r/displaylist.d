/* Converted to D from include/gx2r/displaylist.h by htod */
module gx2r.displaylist;
//C     #pragma once
//C     #include <wut.h>
import std.c.wut;
//C     #include "resource.h"
import resource;

/**
 * \defgroup gx2r_displaylist Display List
 * \ingroup gx2r
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef struct GX2RBuffer GX2RBuffer;
extern (C):

//C     void
//C     GX2RBeginDisplayListEx(GX2RBuffer *displayList,
//C                            uint32_t unknown,
//C                            GX2RResourceFlags flags);
void  GX2RBeginDisplayListEx(GX2RBuffer *displayList, uint32_t unknown, GX2RResourceFlags flags);

//C     uint32_t
//C     GX2REndDisplayList(GX2RBuffer *displayList);
uint32_t  GX2REndDisplayList(GX2RBuffer *displayList);

//C     void
//C     GX2RCallDisplayList(GX2RBuffer *displayList,
//C                         uint32_t size);
void  GX2RCallDisplayList(GX2RBuffer *displayList, uint32_t size);

//C     void
//C     GX2RDirectCallDisplayList(GX2RBuffer *displayList,
//C                               uint32_t size);
void  GX2RDirectCallDisplayList(GX2RBuffer *displayList, uint32_t size);

//C     #ifdef __cplusplus
//C     }
//C     #endif

/** @} */
