/* Converted to D from include/coreinit/systeminfo.h by htod */
module coreinit.systeminfo;
//C     #pragma once
//C     #include <wut.h>
import wut;
//C     #include "time.h"
import coreinit.time;

extern (C):

struct OSSystemInfo
{
   uint clockSpeed;
   ubyte[4] unk1;
   OSTime baseTime;
   ubyte[0x10] unk2;
}

OSSystemInfo *
OSGetSystemInfo();

