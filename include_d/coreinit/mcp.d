/* Converted to D from include/coreinit/mcp.h by htod */
module coreinit.mcp;
//C     #pragma once
//C     #include <wut.h>
import std.c.wut;

/**
 * \defgroup coreinit_mcp MCP IOS Calls
 * \ingroup coreinit
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef struct MCPInstallProgress MCPInstallProgress;
extern (C):
//C     typedef struct MCPInstallInfo MCPInstallInfo;
//C     typedef struct MCPInstallTitleInfo MCPInstallTitleInfo;
//C     typedef struct MCPDevice MCPDevice;
//C     typedef struct MCPDeviceList MCPDeviceList;

//C     typedef enum MCPInstallTarget
//C     {
//C        MCP_INSTALL_TARGET_MLC  = 0,
//C        MCP_INSTALL_TARGET_USB  = 1,
//C     } MCPInstallTarget;
enum MCPInstallTarget
{
    MCP_INSTALL_TARGET_MLC,
    MCP_INSTALL_TARGET_USB,
}

//C     struct __attribute__((__packed__)) MCPInstallProgress
__attribute__ __packed__;
//C     {
//C        uint32_t inProgress;
//C        uint64_t tid;
uint64_t tid;
//C        uint64_t sizeTotal;
uint64_t sizeTotal;
//C        uint64_t sizeProgress;
uint64_t sizeProgress;
//C        uint32_t contentsTotal;
uint32_t contentsTotal;
//C        uint32_t contentsProgress;
uint32_t contentsProgress;
//C     };
//C     CHECK_OFFSET(MCPInstallProgress, 0x00, inProgress);
//C     CHECK_OFFSET(MCPInstallProgress, 0x04, tid);
symbol static_assert
//C     CHECK_OFFSET(MCPInstallProgress, 0x0C, sizeTotal);
