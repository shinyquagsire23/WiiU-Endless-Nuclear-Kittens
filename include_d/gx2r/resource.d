/* Converted to D from include/gx2r/resource.h by htod */
module gx2r.resource;
//C     #pragma once
//C     #include <wut.h>
import std.c.wut;

/**
 * \defgroup gx2r_resource Resource
 * \ingroup gx2r
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef enum GX2RResourceFlags
//C     {
   //! This resource is to be used as a texture
//C        GX2R_RESOURCE_BIND_TEXTURE             = 1 << 0,

   //! This resource is to be used as a colour buffer
//C        GX2R_RESOURCE_BIND_COLOR_BUFFER        = 1 << 1,

   //! This resource is to be used as a depth buffer
//C        GX2R_RESOURCE_BIND_DEPTH_BUFFER        = 1 << 2,

   //! This resource is to be used as a scan buffer
//C        GX2R_RESOURCE_BIND_SCAN_BUFFER         = 1 << 3,

   //! This resource is to be used as a vertex buffer
//C        GX2R_RESOURCE_BIND_VERTEX_BUFFER       = 1 << 4,

   //! This resource is to be used as a index buffer
//C        GX2R_RESOURCE_BIND_INDEX_BUFFER        = 1 << 5,

   //! This resource is to be used as a uniform block
//C        GX2R_RESOURCE_BIND_UNIFORM_BLOCK       = 1 << 6,

   //! This resource is to be used as a shader program
//C        GX2R_RESOURCE_BIND_SHADER_PROGRAM      = 1 << 7,

   //! This resource is to be used as a stream output
//C        GX2R_RESOURCE_BIND_STREAM_OUTPUT       = 1 << 8,

   //! This resource is to be used as a display list
//C        GX2R_RESOURCE_BIND_DISPLAY_LIST        = 1 << 9,

   //! This resource is to be used as a geometry shader ring buffer
//C        GX2R_RESOURCE_BIND_GS_RING_BUFFER      = 1 << 10,

   //! Invalidate resource for a CPU read
//C        GX2R_RESOURCE_USAGE_CPU_READ           = 1 << 11,

   //! Invalidate resource for a CPU write
//C        GX2R_RESOURCE_USAGE_CPU_WRITE          = 1 << 12,

   //! Invalidate resource for a GPU read
//C        GX2R_RESOURCE_USAGE_GPU_READ           = 1 << 13,

   //! Invalidate resource for a GPU write
//C        GX2R_RESOURCE_USAGE_GPU_WRITE          = 1 << 14,

   //! Invalidate resource for a DMA read
//C        GX2R_RESOURCE_USAGE_DMA_READ           = 1 << 15,

   //! Invalidate resource for a DMA write
//C        GX2R_RESOURCE_USAGE_DMA_WRITE          = 1 << 16,

   //! Force resource allocation to be in MEM1
//C        GX2R_RESOURCE_USAGE_FORCE_MEM1         = 1 << 17,

   //! Force resource allocation to be in MEM2
//C        GX2R_RESOURCE_USAGE_FORCE_MEM2         = 1 << 18,

   //! Disable CPU invalidation
//C        GX2R_RESOURCE_DISABLE_CPU_INVALIDATE   = 1 << 20,

   //! Disable GPU invalidation
//C        GX2R_RESOURCE_DISABLE_GPU_INVALIDATE   = 1 << 21,

   //! Resource is locked for read-only access
//C        GX2R_RESOURCE_LOCKED_READ_ONLY         = 1 << 22,

   //! Resource is to be allocated in user memory
//C        GX2R_RESOURCE_USER_MEMORY              = 1 << 29,

   //! Resource is locked for all access
//C        GX2R_RESOURCE_LOCKED                   = 1 << 30,
//C     } GX2RResourceFlags;
enum GX2RResourceFlags
{
    GX2R_RESOURCE_BIND_TEXTURE = 1,
    GX2R_RESOURCE_BIND_COLOR_BUFFER,
    GX2R_RESOURCE_BIND_DEPTH_BUFFER = 4,
    GX2R_RESOURCE_BIND_SCAN_BUFFER = 8,
    GX2R_RESOURCE_BIND_VERTEX_BUFFER = 16,
    GX2R_RESOURCE_BIND_INDEX_BUFFER = 32,
    GX2R_RESOURCE_BIND_UNIFORM_BLOCK = 64,
    GX2R_RESOURCE_BIND_SHADER_PROGRAM = 128,
    GX2R_RESOURCE_BIND_STREAM_OUTPUT = 256,
    GX2R_RESOURCE_BIND_DISPLAY_LIST = 512,
    GX2R_RESOURCE_BIND_GS_RING_BUFFER = 1024,
    GX2R_RESOURCE_USAGE_CPU_READ = 2048,
    GX2R_RESOURCE_USAGE_CPU_WRITE = 4096,
    GX2R_RESOURCE_USAGE_GPU_READ = 8192,
    GX2R_RESOURCE_USAGE_GPU_WRITE = 16384,
    GX2R_RESOURCE_USAGE_DMA_READ = 32768,
    GX2R_RESOURCE_USAGE_DMA_WRITE = 65536,
    GX2R_RESOURCE_USAGE_FORCE_MEM1 = 131072,
    GX2R_RESOURCE_USAGE_FORCE_MEM2 = 262144,
    GX2R_RESOURCE_DISABLE_CPU_INVALIDATE = 1048576,
    GX2R_RESOURCE_DISABLE_GPU_INVALIDATE = 2097152,
    GX2R_RESOURCE_LOCKED_READ_ONLY = 4194304,
    GX2R_RESOURCE_USER_MEMORY = 536870912,
    GX2R_RESOURCE_LOCKED = 1073741824,
}
extern (C):


//C     #ifdef __cplusplus
//C     }
//C     #endif

/** @} */
