/* Converted to D from include/vpad/input.h by htod */
module vpad.input;
//C     #pragma once
//C     #include <wut.h>
import wut;

/**
 * \defgroup vpad_input VPAD Input
 * \ingroup vpad
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef struct VPADVec2D VPADVec2D;
extern (C):

enum VPADButtons
{
   VPAD_BUTTON_A        = 0x8000,
   VPAD_BUTTON_B        = 0x4000,
   VPAD_BUTTON_X        = 0x2000,
   VPAD_BUTTON_Y        = 0x1000,
   VPAD_BUTTON_LEFT     = 0x0800,
   VPAD_BUTTON_RIGHT    = 0x0400,
   VPAD_BUTTON_UP       = 0x0200,
   VPAD_BUTTON_DOWN     = 0x0100,
   VPAD_BUTTON_ZL       = 0x0080,
   VPAD_BUTTON_ZR       = 0x0040,
   VPAD_BUTTON_L        = 0x0020,
   VPAD_BUTTON_R        = 0x0010,
   VPAD_BUTTON_PLUS     = 0x0008,
   VPAD_BUTTON_MINUS    = 0x0004,
   VPAD_BUTTON_HOME     = 0x0002,
   VPAD_BUTTON_SYNC     = 0x0001,
   VPAD_BUTTON_STICK_R  = 0x00020000,
   VPAD_BUTTON_STICK_L  = 0x00040000,
   VPAD_BUTTON_TV       = 0x00010000,
}

enum VPADTouchPadValidity
{
   //! Both X and Y touchpad positions are accurate
   VPAD_VALID           = 0x0,

   //! X position is inaccurate
   VPAD_INVALID_X       = 0x1,

   //! Y position is inaccurate
   VPAD_INVALID_Y       = 0x2,
}


enum VPADReadError
{
   VPAD_READ_SUCCESS             = 0,
   VPAD_READ_NO_SAMPLES          = -1,
   VPAD_READ_INVALID_CONTROLLER  = -2,
}

struct VPADVec2D
{
   float x;
   float y;
}

struct VPADVec3D
{
   float x;
   float y;
   float z;
}

struct VPADTouchData
{
   ushort x;
   ushort y;

   //! 0 if screen is not currently being touched
   ushort touched;

   //! Bitfield of VPADTouchPadValidity to indicate how touch sample accuracy
   ushort validity;
}

struct VPADAccStatus
{
   float unk1;
   float unk2;
   float unk3;
   float unk4;
   float unk5;
   VPADVec2D vertical;
}

struct VPADGyroStatus
{
   float unk1;
   float unk2;
   float unk3;
   float unk4;
   float unk5;
   float unk6;
}

struct VPADStatus
{
   //! Indicates what VPADButtons are held down
   uint hold;

   //! Indicates what VPADButtons have been pressed since last sample
   uint trigger;

   //! Indicates what VPADButtons have been released since last sample
   uint release;

   //! Position of left analog stick
   VPADVec2D leftStick;

   //! Position of right analog stick
   VPADVec2D rightStick;

   //! Status of DRC accelorometer
   VPADAccStatus accelorometer;

   //! Status of DRC gyro
   VPADGyroStatus gyro;

   ubyte[2] unk1;

   //! Current touch position on DRC
   VPADTouchData tpNormal;

   //! Filtered touch position, first level of smoothing
   VPADTouchData tpFiltered1;

   //! Filtered touch position, second level of smoothing
   VPADTouchData tpFiltered2;

   ubyte[0x28] unk2;

   //! Status of DRC magnetometer
   VPADVec3D mag;

   //! Current volume set by the slide control
   ubyte slideVolume;

   //! Battery level of controller
   ubyte battery;

   //! Status of DRC microphone
   ubyte micStatus;

   //! Unknown volume related value
   ubyte slideVolumeEx;

   ubyte[7] unk3;
}

//! Deprecated
void
VPADInit();

int
VPADRead(uint chan,
         VPADStatus *buffers,
         uint count,
         VPADReadError *error);

void
VPADGetTPCalibratedPoint(uint chan,
                         VPADTouchData *calibratedData,
                         VPADTouchData *uncalibratedData);
