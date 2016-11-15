/* Converted to D from include/coreinit/messagequeue.h by htod */
module coreinit.messagequeue;
//C     #pragma once
//C     #include <wut.h>
import std.c.wut;

/**
 * \defgroup coreinit_msgq Message Queue
 * \ingroup coreinit
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef struct OSMessage OSMessage;
extern (C):
//C     typedef struct OSMessageQueue OSMessageQueue;

//C     typedef enum OSMessageFlags
//C     {
//C        OS_MESSAGE_QUEUE_BLOCKING        = 1 << 0,
//C        OS_MESSAGE_QUEUE_HIGH_PRIORITY   = 1 << 1,
//C     } OSMessageFlags;
enum OSMessageFlags
{
    OS_MESSAGE_QUEUE_BLOCKING = 1,
    OS_MESSAGE_QUEUE_HIGH_PRIORITY,
}

//C     struct OSMessage
//C     {
//C        void *message;
//C        uint32_t args[3];
//C     };
struct OSMessage
{
    void *message;
    uint32_t [3]args;
}
//C     CHECK_OFFSET(OSMessage, 0x00, message);
//C     CHECK_OFFSET(OSMessage, 0x04, args);
symbol static_assert
//C     CHECK_SIZE(OSMessage, 0x10);
symbol static_assert

//C     #define OS_MESSAGE_QUEUE_TAG 0x6D536751u

const OS_MESSAGE_QUEUE_TAG = 0x6D536751U;
//C     struct OSMessageQueue
//C     {
//C        uint32_t tag;
//C        const char *name;
//C        UNKNOWN(4);
//C        OSThreadQueue sendQueue;
//C        OSThreadQueue recvQueue;
