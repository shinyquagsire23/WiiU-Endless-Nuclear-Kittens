/* Converted to D from include/coreinit/memlist.h by htod */
module coreinit.memlist;
//C     #pragma once
//C     #include <wut.h>
import std.c.wut;

/**
 * \defgroup coreinit_memlist Memory List
 * \ingroup coreinit
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef struct MEMMemoryLink MEMMemoryLink;
extern (C):
//C     typedef struct MEMMemoryList MEMMemoryList;

//C     struct MEMMemoryLink
//C     {
//C        void *prev;
//C        void *next;
//C     };
struct MEMMemoryLink
{
    void *prev;
    void *next;
}
//C     CHECK_OFFSET(MEMMemoryLink, 0x0, prev);
//C     CHECK_OFFSET(MEMMemoryLink, 0x4, next);
symbol static_assert
//C     CHECK_SIZE(MEMMemoryLink, 0x8);
symbol static_assert

//C     struct MEMMemoryList
//C     {
//C        void *head;
//C        void *tail;
//C        uint16_t count;
//C        uint16_t offsetToMemoryLink;
//C     };
struct MEMMemoryList
{
    void *head;
    void *tail;
    uint16_t count;
    uint16_t offsetToMemoryLink;
}
//C     CHECK_OFFSET(MEMMemoryList, 0x0, head);
symbol static_assert
//C     CHECK_OFFSET(MEMMemoryList, 0x4, tail);
