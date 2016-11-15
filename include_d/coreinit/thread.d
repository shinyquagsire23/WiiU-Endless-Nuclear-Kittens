/* Converted to D from include/coreinit/thread.h by htod */
module coreinit.thread;
//C     #pragma once
//C     #include <wut.h>
import wut;
//C     #include "time.h"
import coreinit.time;
import coreinit.mutex;
import coreinit.fastmutex;
import coreinit.threadqueue;

extern (C):

//! A value from enum OS_THREAD_STATE.
alias OSThreadState = ubyte;

//! A value from enum OS_THREAD_REQUEST.
alias OSThreadRequest = uint;

//! A bitfield of enum OS_THREAD_ATTRIB.
alias OSThreadAttributes = ubyte;

enum OS_THREAD_STATE
{
   OS_THREAD_STATE_NONE             = 0,

   //! Thread is ready to run
   OS_THREAD_STATE_READY            = 1 << 0,

   //! Thread is running
   OS_THREAD_STATE_RUNNING          = 1 << 1,

   //! Thread is waiting, i.e. on a mutex
   OS_THREAD_STATE_WAITING          = 1 << 2,

   //! Thread is about to terminate
   OS_THREAD_STATE_MORIBUND         = 1 << 3,
}

enum OS_THREAD_REQUEST
{
   OS_THREAD_REQUEST_NONE           = 0,
   OS_THREAD_REQUEST_SUSPEND        = 1,
   OS_THREAD_REQUEST_CANCEL         = 2,
}

enum OS_THREAD_ATTRIB
{
   //! Allow the thread to run on CPU0.
   OS_THREAD_ATTRIB_AFFINITY_CPU0   = 1 << 0,

   //! Allow the thread to run on CPU1.
   OS_THREAD_ATTRIB_AFFINITY_CPU1   = 1 << 1,

   //! Allow the thread to run on CPU2.
   OS_THREAD_ATTRIB_AFFINITY_CPU2   = 1 << 2,

   //! Allow the thread to run any CPU.
   OS_THREAD_ATTRIB_AFFINITY_ANY    = ((1 << 0) | (1 << 1) | (1 << 2)),

   //! Start the thread detached.
   OS_THREAD_ATTRIB_DETACHED        = 1 << 3,

   //! Enables tracking of stack usage.
   OS_THREAD_ATTRIB_STACK_USAGE     = 1 << 5
}

enum
{
    OS_CONTEXT_TAG = 0x4F53436F6E747874L,
}

struct OSContext
{
   //! Should always be set to the value OS_CONTEXT_TAG.
   ulong tag;

   uint gpr[32];
   uint cr;
   uint lr;
   uint ctr;
   uint xer;
   uint srr0;
   uint srr1;
   ubyte unk1[0x14];
   //UNKNOWN(0x14);
   uint fpscr;
   double fpr[32];
   ushort spinLockCount;
   ushort state;
   uint gqr[8];
   ubyte unk2[4];
   //UNKNOWN(4);
   double psf[32];
   ulong coretime[3];
   ulong starttime;
   uint error;
   ubyte unk3[4];
   //UNKNOWN(4);
   uint pmc1;
   uint pmc2;
   uint pmc3;
   uint pmc4;
   uint mmcr0;
   uint mmcr1;
}

struct OSMutexQueue
{
   OSMutex *head;
   OSMutex *tail;
   void *parent;
   ubyte unk1[4];
   //UNKNOWN(4);
}

struct OSFastMutexQueue
{
   OSFastMutex *head;
   OSFastMutex *tail;
}

enum
{
    OS_THREAD_TAG = 0x74487244,
}

struct OSThread
{
   OSContext context;

   //! Should always be set to the value OS_THREAD_TAG.
   uint tag;

   //! Bitfield of OS_THREAD_STATE
   OSThreadState state;

   //! Bitfield of OS_THREAD_ATTRIB
   OSThreadAttributes attr;

   //! Unique thread ID
   ushort id;

   //! Suspend count (increased by OSSuspendThread).
   int suspendCounter;

   //! Actual priority of thread.
   int priority;

   //! Base priority of thread, 0 is highest priority, 31 is lowest priority.
   int basePriority;

   //! Exit value
   int exitValue;

   //UNKNOWN(0x35C - 0x338);

   //! Queue the thread is currently waiting on
   OSThreadQueue *queue;

   //! Link used for thread queue
   OSThreadLink link;

   //! Queue of threads waiting to join this thread
   OSThreadQueue joinQueue;

   //! Mutex this thread is waiting to lock
   OSMutex *mutex;

   //! Queue of mutexes this thread owns
   OSMutexQueue mutexQueue;

   //! Link for global active thread queue
   OSThreadLink activeLink;

   //! Stack start (top, highest address)
   void *stackStart;

   //! Stack end (bottom, lowest address)
   void *stackEnd;

   //! Thread entry point
   void *entryPoint;

   //UNKNOWN(0x57c - 0x3a0);

   //! Thread specific values, accessed with OSSetThreadSpecific and OSGetThreadSpecific.
   uint specific[0x10];

   //UNKNOWN(0x5c0 - 0x5bc);

   //! Thread name, accessed with OSSetThreadName and OSGetThreadName.
   const char *name;

   //UNKNOWN(0x4);

   //! The stack pointer passed in OSCreateThread.
   void *userStackPointer;

   //! Called just before thread is terminated, set with OSSetThreadCleanupCallback
   void *cleanupCallback;

   //! Called just after a thread is terminated, set with OSSetThreadDeallocator
   void *deallocator;

   //! If TRUE then a thread can be cancelled or suspended, set with OSSetThreadCancelState
   bool cancelState;

   //! Current thread request, used for cancelleing and suspending the thread.
   OSThreadRequest requestFlag;

   //! Pending suspend request count
   int needSuspend;

   //! Result of thread suspend
   int suspendResult;

   //! Queue of threads waiting for a thread to be suspended.
   OSThreadQueue suspendQueue;

   //UNKNOWN(0x69c - 0x5f4);
}

/**
 * Cancels a thread.
 *
 * This sets the threads requestFlag to OS_THREAD_REQUEST_CANCEL, the thread will
 * be terminated next time OSTestThreadCancel is called.
 */
void
OSCancelThread(OSThread *thread);


/**
 * Returns the count of active threads.
 */
int
OSCheckActiveThreads();


/**
 * Get the maximum amount of stack the thread has used.
 */
int
OSCheckThreadStackUsage(OSThread *thread);


/**
 * Disable tracking of thread stack usage
 */
void
OSClearThreadStackUsage(OSThread *thread);


/**
 * Clears a thread's suspend counter and resumes it.
 */
void
OSContinueThread(OSThread *thread);


/**
 * Create a new thread.
 *
 * \param thread Thread to initialise.
 * \param entry Thread entry point.
 * \param argc argc argument passed to entry point.
 * \param argv argv argument passed to entry point.
 * \param stack Top of stack (highest address).
 * \param stackSize Size of stack.
 * \param priority Thread priority, 0 is highest priorty, 31 is lowest.
 * \param attributes Thread attributes, see OSThreadAttributes.
 */
bool
OSCreateThread(OSThread *thread,
               void *entry,
               int argc,
               char *argv,
               void *stack,
               uint stackSize,
               int priority,
               OSThreadAttributes attributes);


/**
 * Detach thread.
 */
void
OSDetachThread(OSThread *thread);


/**
 * Exit the current thread with a exit code.
 *
 * This function is implicitly called when the thread entry point returns.
 */
void
OSExitThread(int result);


/**
 * Get the next and previous thread in the thread's active queue.
 */
void
OSGetActiveThreadLink(OSThread *thread,
                      OSThreadLink *link);


/**
 * Return pointer to OSThread object for the current thread.
 */
OSThread *
OSGetCurrentThread();


/**
 * Returns the default thread for a specific core.
 *
 * Each core has 1 default thread created before the game boots. The default
 * thread for core 1 calls the RPX entry point, the default threads for core 0
 * and 2 are suspended and can be used with OSRunThread.
 */
OSThread *
OSGetDefaultThread(uint coreID);


/**
 * Return current stack pointer, value of r1 register.
 */
uint
OSGetStackPointer();


/**
 * Get a thread's affinity.
 */
uint
OSGetThreadAffinity(OSThread *thread);


/**
 * Get a thread's name.
 */
char *
OSGetThreadName(OSThread *thread);


/**
 * Get a thread's base priority.
 */
int
OSGetThreadPriority(OSThread *thread);


/**
 * Get a thread's specific value set by OSSetThreadSpecific.
 */
uint
OSGetThreadSpecific(uint id);


/**
 * Returns TRUE if a thread is suspended.
 */
bool
OSIsThreadSuspended(OSThread *thread);


/**
 * Returns TRUE if a thread is terminated.
 */
bool
OSIsThreadTerminated(OSThread *thread);


/**
 * Wait until thread is terminated.
 *
 * If the target thread is detached, returns FALSE.
 *
 * \param thread Thread to wait for
 * \param threadResult Pointer to store thread exit value in.
 * \returns Returns TRUE if thread has terminated, FALSE if thread is detached.
 */
bool
OSJoinThread(OSThread *thread,
             int *threadResult);


/**
 * Resumes a thread.
 *
 * Decrements the thread's suspend counter, if the counter reaches 0 the thread
 * is resumed.
 *
 * \returns Returns the previous value of the suspend counter.
 */
int
OSResumeThread(OSThread *thread);


/**
 * Run a function on an already created thread.
 *
 * Can only be used on idle threads.
 */
bool
OSRunThread(OSThread *thread,
            void *entry,
            int argc,
            const char **argv);


/**
 * Set a thread's affinity.
 */
bool
OSSetThreadAffinity(OSThread *thread,
                    uint affinity);


/**
 * Set a thread's cancellation state.
 *
 * If the state is TRUE then the thread can be suspended or cancelled when
 * OSTestThreadCancel is called.
 */
bool
OSSetThreadCancelState(bool state);


/**
 * Set the callback to be called just before a thread is terminated.
 */
void*
OSSetThreadCleanupCallback(OSThread *thread,
                           void *callback);


/**
 * Set the callback to be called just after a thread is terminated.
 */
void*
OSSetThreadDeallocator(OSThread *thread,
                       void *deallocator);


/**
 * Set a thread's name.
 */
void
OSSetThreadName(OSThread *thread,
                const char *name);


/**
 * Set a thread's priority.
 */
bool
OSSetThreadPriority(OSThread *thread,
                    int priority);


/**
 * Set a thread's run quantum.
 *
 * This is the maximum amount of time the thread can run for before being forced
 * to yield.
 */
bool
OSSetThreadRunQuantum(OSThread *thread,
                      uint quantum);

/**
 * Set a thread specific value.
 *
 * Can be read with OSGetThreadSpecific.
 */
void
OSSetThreadSpecific(uint id,
                    uint value);


/**
 * Set thread stack usage tracking.
 */
bool
OSSetThreadStackUsage(OSThread *thread);


/**
 * Sleep the current thread and add it to a thread queue.
 *
 * Will sleep until the thread queue is woken with OSWakeupThread.
 */
void
OSSleepThread(OSThreadQueue *queue);


/**
 * Sleep the current thread for a period of time.
 */
void
OSSleepTicks(OSTime ticks);


/**
 * Suspend a thread.
 *
 * Increases a thread's suspend counter, if the counter is >0 then the thread is
 * suspended.
 *
 * \returns Returns the thread's previous suspend counter value
 */
uint
OSSuspendThread(OSThread *thread);


/**
 * Check to see if the current thread should be cancelled or suspended.
 *
 * This is implicitly called in:
 * - OSLockMutex
 * - OSTryLockMutex
 * - OSUnlockMutex
 * - OSAcquireSpinLock
 * - OSTryAcquireSpinLock
 * - OSTryAcquireSpinLockWithTimeout
 * - OSReleaseSpinLock
 * - OSCancelThread
 */
void
OSTestThreadCancel();


/**
 * Wake up all threads in queue.
 *
 * Clears the thread queue.
 */
void
OSWakeupThread(OSThreadQueue *queue);


/**
 * Yield execution to waiting threads with same priority.
 *
 * This will never switch to a thread with a lower priority than the current
 * thread.
 */
void
OSYieldThread();
