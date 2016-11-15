/* Converted to D from include/proc_ui/procui.h by htod */
module proc_ui.procui;
//C     #pragma once
//C     #include <wut.h>
import wut;

/**
 * \defgroup proc_ui_procui ProcUI
 * \ingroup proc_ui
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef void (*ProcUISaveCallback)(void);
extern (C):
//alias void  function()ProcUISaveCallback;
//C     typedef uint(*ProcUISaveCallbackEx)(void*);
//alias uint function(void *)ProcUISaveCallbackEx;
//C     typedef uint(*ProcUICallback)(void*);
//alias uint function(void *)ProcUICallback;

//C     typedef enum ProcUIStatus
//C     {
//C        PROCUI_STATUS_IN_FOREGROUND,
//C        PROCUI_STATUS_IN_BACKGROUND,
//C        PROCUI_STATUS_RELEASE_FOREGROUND,
//C        PROCUI_STATUS_EXITING,
//C     } ProcUIStatus;
enum ProcUIStatus
{
    PROCUI_STATUS_IN_FOREGROUND,
    PROCUI_STATUS_IN_BACKGROUND,
    PROCUI_STATUS_RELEASE_FOREGROUND,
    PROCUI_STATUS_EXITING,
}

//C     uint32_t
//C     ProcUICalcMemorySize(uint unk);
uint ProcUICalcMemorySize(uint unk);

//C     void
//C     ProcUIClearCallbacks();
void  ProcUIClearCallbacks();

//C     void
//C     ProcUIDrawDoneRelease();
void  ProcUIDrawDoneRelease();

//C     bool
//C     ProcUIInForeground();
bool  ProcUIInForeground();

//C     bool
//C     ProcUIInShutdown();
bool  ProcUIInShutdown();

//C     void
//C     ProcUIInit(ProcUISaveCallback saveCallback);
void  ProcUIInit(void* saveCallback);

//C     void
//C     ProcUIInitEx(ProcUISaveCallbackEx saveCallback,
//C                  void *arg);
void  ProcUIInitEx(void* saveCallback, void *arg);

//C     bool
//C     ProcUIIsRunning();
bool  ProcUIIsRunning();

//C     ProcUIStatus
//C     ProcUIProcessMessages(bool block);
ProcUIStatus  ProcUIProcessMessages(bool block);

//C     void
//C     ProcUISetSaveCallback(ProcUISaveCallbackEx saveCallback,
//C                           void *arg);
void  ProcUISetSaveCallback(void* saveCallback, void *arg);

//C     void
//C     ProcUIShutdown();
void  ProcUIShutdown();

//C     ProcUIStatus
//C     ProcUISubProcessMessages(bool block);
ProcUIStatus  ProcUISubProcessMessages(bool block);

//C     #ifdef __cplusplus
//C     }
//C     #endif

/** @} */
