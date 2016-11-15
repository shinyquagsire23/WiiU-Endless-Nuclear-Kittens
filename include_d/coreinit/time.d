/* Converted to D from include/coreinit/time.h by htod */
module coreinit.time;
//C     #pragma once
//C     #include <wut.h>
import wut;

/**
 * \defgroup coreinit_time Time
 * \ingroup coreinit
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef struct OSCalendarTime OSCalendarTime;
extern (C):

//C     typedef int OSTick;
alias int OSTick;
//C     typedef long OSTime;
alias long OSTime;

//C     struct OSCalendarTime
//C     {
//C        int tm_sec;
//C        int tm_min;
//C        int tm_hour;
//C        int tm_mday;
//C        int tm_mon;
//C        int tm_year;
//C     };
struct OSCalendarTime
{
    int tm_sec;
    int tm_min;
    int tm_hour;
    int tm_mday;
    int tm_mon;
    int tm_year;
}

OSTime
OSGetTime();

OSTime
OSGetSystemTime();

OSTick
OSGetTick();

OSTick
OSGetSystemTick();

OSTime
OSCalendarTimeToTicks(OSCalendarTime *calendarTime);

void
OSTicksToCalendarTime(OSTime time,
                      OSCalendarTime *calendarTime);
