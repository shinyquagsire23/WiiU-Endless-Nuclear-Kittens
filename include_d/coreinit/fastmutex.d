/* Converted to D from include/coreinit/fastmutex.h by htod */
module coreinit.fastmutex;
//C     #pragma once
//C     #include <wut.h>
import wut;
//C     #include "threadqueue.h"
import coreinit.threadqueue;

extern (C):

struct OSFastMutexLink
{
   OSFastMutex *next;
   OSFastMutex *prev;
}

enum
{
    OS_FAST_MUTEX_TAG = 0x664D7458u,
}

struct OSFastMutex
{
   uint tag;
   const char *name;
   ubyte unk1[4];
   //UNKNOWN(4);
   OSThreadSimpleQueue queue;
   OSFastMutexLink link;
   ubyte unk2[0x10];
   //UNKNOWN(16);
}

void
OSFastMutex_Init(OSFastMutex *mutex,
                 const char *name);

void
OSFastMutex_Lock(OSFastMutex *mutex);

void
OSFastMutex_Unlock(OSFastMutex *mutex);

bool
OSFastMutex_TryLock(OSFastMutex *mutex);
