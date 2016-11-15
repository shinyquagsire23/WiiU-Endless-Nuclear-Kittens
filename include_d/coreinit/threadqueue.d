/* Converted to D from include/coreinit/threadqueue.h by htod */
module coreinit.threadqueue;
//C     #pragma once
//C     #include <wut.h>
import wut;
import coreinit.thread;

/**
 * \defgroup coreinit_threadq Thread Queue
 * \ingroup coreinit
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef struct OSThread OSThread;
extern (C):

//C     typedef struct OSThreadLink OSThreadLink;
//C     typedef struct OSThreadQueue OSThreadQueue;
//C     typedef struct OSThreadSimpleQueue OSThreadSimpleQueue;

//C     struct OSThreadLink
//C     {
//C        OSThread *prev;
//C        OSThread *next;
//C     };
struct OSThreadLink
{
    OSThread *prev;
    OSThread *next;
}

struct OSThreadQueue
{
    OSThread *head;
    OSThread *tail;
    void *parent;
    char [4]__unk__COUNTER__;
}

struct OSThreadSimpleQueue
{
   OSThread *head;
   OSThread *tail;
}

void
OSInitThreadQueue(OSThreadQueue *queue);

void
OSInitThreadQueueEx(OSThreadQueue *queue,
                    void *parent);
