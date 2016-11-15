/* Converted to D from include/gx2/event.h by htod */
module gx2.event;
//C     #pragma once
//C     #include <wut.h>
import wut;
//C     #include <coreinit/time.h>
import coreinit.time;
import gx2.constants;

extern (C):

struct GX2DisplayListOverrunData
{
   //! Pointer to overrun display list
   void *oldList;

   //! Size of overrun display list
   uint oldSize;

   //! Pointer to new display list
   void *newList;

   //! Size of new display list
   uint newSize;

   ubyte[8] unk1;
}

bool
GX2DrawDone();

void
GX2WaitForVsync();

void
GX2WaitForFlip();

void
GX2SetEventCallback(GX2EventType type,
                    void *func,
                    void *userData);

void
GX2GetEventCallback(GX2EventType type,
                    void *funcOut,
                    void **userDataOut);

OSTime
GX2GetRetiredTimeStamp();

OSTime
GX2GetLastSubmittedTimeStamp();

bool
GX2WaitTimeStamp(OSTime time);

void
GX2GetSwapStatus(uint *swapCount,
                 uint *flipCount,
                 OSTime *lastFlip,
                 OSTime *lastVsync);
