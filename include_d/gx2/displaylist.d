/* Converted to D from include/gx2/displaylist.h by htod */
module gx2.displaylist;
//C     #pragma once
//C     #include <wut.h>
import wut;

/**
 * \defgroup gx2_displaylist Display List
 * \ingroup gx2
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     void
//C     GX2BeginDisplayListEx(void *displayList,
//C                           uint32_t bytes,
//C                           BOOL unk1);
extern (C):
void  GX2BeginDisplayListEx(void *displayList, uint32_t bytes, BOOL unk1);

//C     uint32_t
//C     GX2EndDisplayList(void *displayList);
uint32_t  GX2EndDisplayList(void *displayList);

//C     void
//C     GX2DirectCallDisplayList(void *displayList,
//C                              uint32_t bytes);
void  GX2DirectCallDisplayList(void *displayList, uint32_t bytes);

//C     void
//C     GX2CallDisplayList(void *displayList,
//C                        uint32_t bytes);
void  GX2CallDisplayList(void *displayList, uint32_t bytes);

//C     BOOL
//C     GX2GetDisplayListWriteStatus();
BOOL  GX2GetDisplayListWriteStatus(...);

//C     BOOL
//C     GX2GetCurrentDisplayList(void **outDisplayList,
//C                              uint32_t *outSize);
BOOL  GX2GetCurrentDisplayList(void **outDisplayList, uint32_t *outSize);

//C     void
//C     GX2CopyDisplayList(void *displayList,
//C                        uint32_t bytes);
void  GX2CopyDisplayList(void *displayList, uint32_t bytes);

//C     #ifdef __cplusplus
//C     }
//C     #endif

/** @} */
