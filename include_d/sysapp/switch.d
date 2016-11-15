/* Converted to D from include/sysapp/switch.h by htod */
module sysapp.switch;
//C     #pragma once
//C     #include <wut.h>
import wut;

/**
 * \defgroup sysapp_switch SYSAPP Switch
 * \ingroup sysapp
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//TODO
//C     typedef void sysapp_input_struct;
extern (C):
alias void sysapp_input_struct;

//C     void
//C     SYSSwitchToSyncControllerOnHBM();
void  SYSSwitchToSyncControllerOnHBM(...);

//C     void
//C     SYSSwitchToEManual();
void  SYSSwitchToEManual(...);

//C     void
//C     SYSSwitchToEShop();
void  SYSSwitchToEShop(...);

//C     void
//C     _SYSSwitchToMainApp();
void  _SYSSwitchToMainApp(...);

//C     void
//C     SYSSwitchToBrowserForViewer(sysapp_input_struct*);
void  SYSSwitchToBrowserForViewer(sysapp_input_struct *);

//C     #ifdef __cplusplus
//C     }
//C     #endif

/** @} */
