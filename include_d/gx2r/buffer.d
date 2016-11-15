/* Converted to D from include/gx2r/buffer.h by htod */
module gx2r.buffer;
//C     #pragma once
//C     #include <wut.h>
import std.c.wut;
//C     #include "resource.h"
import resource;

/**
 * \defgroup gx2r_buffer Buffer
 * \ingroup gx2r
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef struct GX2RBuffer GX2RBuffer;
extern (C):

//C     struct GX2RBuffer
//C     {
//C        GX2RResourceFlags flags;
//C        uint32_t elemSize;
//C        uint32_t elemCount;
//C        void *buffer;
//C     };
struct GX2RBuffer
{
    GX2RResourceFlags flags;
    uint32_t elemSize;
    uint32_t elemCount;
    void *buffer;
}
//C     CHECK_SIZE(GX2RBuffer, 0x10);
//C     CHECK_OFFSET(GX2RBuffer, 0x00, flags);
symbol static_assert
//C     CHECK_OFFSET(GX2RBuffer, 0x04, elemSize);
symbol static_assert
//C     CHECK_OFFSET(GX2RBuffer, 0x08, elemCount);
symbol static_assert
//C     CHECK_OFFSET(GX2RBuffer, 0x0C, buffer);
