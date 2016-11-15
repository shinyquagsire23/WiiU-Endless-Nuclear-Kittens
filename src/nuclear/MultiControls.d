module nuclear.MultiControls;

import wiiu.input;
import vpad.input;

import nuclear.Game;

public class MultiControls
{
    private static __gshared int numPlayers = 1;
	private static __gshared int currentMode = 0;
	private static __gshared float currentRumble = 0;
	
	public static bool isPrimaryButton(int player)
	{
	    if(player > 0) return false; //TODO
	    return tpTouched || (vpad_status.hold & VPADButtons.VPAD_BUTTON_R) || (vpad_status.hold & VPADButtons.VPAD_BUTTON_ZR) || (vpad_status.hold & VPADButtons.VPAD_BUTTON_A);
	}
	
	public static bool isSecondaryButton(int player)
	{
	    if(player > 0) return false; //TODO
	    return (vpad_status.hold & VPADButtons.VPAD_BUTTON_L) || (vpad_status.hold & VPADButtons.VPAD_BUTTON_ZL) || (vpad_status.hold & VPADButtons.VPAD_BUTTON_B);
	}
	
	public static bool isPauseButton(int player)
	{
	    if(player > 0) return false; //TODO
	    return (vpad_status.hold & VPADButtons.VPAD_BUTTON_PLUS) != 0;
	}
	
	public static bool isNukeButton(int player)
	{
	    return false;
	}
	
	public static bool isButtonDown(int player, int button)
	{
		/*for(int i = 0; i < getNumPlayers(); i++)
		{
			if(Controllers.getController(i).isButtonPressed(button))
				return true;
		}*/
		return false;
	}

	public static int getNumPlayers()
	{
		return numPlayers;
	}
	
	public static void setNumPlayers(int num)
	{
	    numPlayers = num;
	}

	public static float getLeftXAxisValue(int player)
	{
	    if(player > 0) return 0; //TODO
	    if(vpad_status.hold & VPADButtons.VPAD_BUTTON_RIGHT) return 1.0f;
	    if(vpad_status.hold & VPADButtons.VPAD_BUTTON_LEFT) return -1.0f;
		return vpad_status.leftStick.x;
	}
	
	public static float getLeftYAxisValue(int player)
	{
	    if(player > 0) return 0; //TODO
		if(vpad_status.hold & VPADButtons.VPAD_BUTTON_DOWN) return 1.0f;
	    if(vpad_status.hold & VPADButtons.VPAD_BUTTON_UP) return -1.0f;
		return -vpad_status.leftStick.y;
	}
	
	public static float getRightXAxisValue(int player)
	{
	    if(player > 0) return 0; //TODO
		return vpad_status.rightStick.x;
	}
	
	public static float getRightYAxisValue(int player)
	{
	    if(player > 0) return 0; //TODO
		return -vpad_status.rightStick.y;
	}
	
	public static void rumble()
	{
		rumble(50.0f);
		//Game.rumbleTimer = 100;
	}
	
	public static void rumble(int i, float amt)
	{
		rumble(i,amt,100);
	}
	
	public static void rumble(float amt)
	{
			rumble(amt,100);
	}
	
	public static void rumble(float amt, int time)
	{
		//for(int i = 0; i < Controllers.getControllerCount(); i++)
		//	rumble(i,amt,time);
	}
	
	public static void rumble(int i, float amt, int time)
	{
		/*currentRumble += amt;
		if(i < (currentMode == P2X_CONTROLLER ? 1 : 0))
			return;
		if(getController(i).getRumblerCount() > 0)
		{
			getController(i).setRumblerStrength(0, currentRumble);
		}
		Game.rumbleTimer = time;*/
	}
	
	public static void unrumble()
	{
		/*currentRumble = 0;
		for(int i = 0; i < Controllers.getControllerCount(); i++)
			if(Controllers.getController(i).getRumblerCount() > 0)
				Controllers.getController(i).setRumblerStrength(0, 0.0f);*/
	}
	
	public static int getMode()
	{
		return currentMode;
	}
}
