module screens.ScreenManager;

import nuclear.Graphics;
import nuclear.IGameObject;
import geom.Vector2f;
import coreinit.debugout;

public static class ScreenManager
{
    private string[0x200] screenNameStore;
    private IGameObject[0x200] screenScreenStore;
    private int screenStoreCount = 0;
    public IGameObject currentScreen = null;
    public string currentScreenId;

    public this(){}

	public void Update(int delta)
	{
		if (currentScreen is null)
		{
			return;
		}
		currentScreen.Update(delta);
	}

	public void Draw(Graphics g)
	{

		if (currentScreen is null)
		{
			return;
		}
		currentScreen.Draw(g);
	}

	public void AddScreen(string stateId, IGameObject screen)
	{
	    OSReport("Adding screen %s!", stateId.ptr);
	    this.screenNameStore[screenStoreCount] = stateId;
	    this.screenScreenStore[screenStoreCount++] = screen;
	}

	public void ChangeState(string stateId)
	{
	    OSReport("Changing state to %s!", stateId.ptr);
	    foreach(int i, string s ; screenNameStore)
	    {
	        if(stateId == s)
	        {
	            currentScreen = screenScreenStore[i];
	            currentScreenId = stateId;
	        }
	    }
	}

	public bool Exists(string stateId)
	{
		foreach(int i, string s ; screenNameStore)
	    {
	        if(stateId == s)
	            return true;
	    }
		return false;
	}

	public IGameObject[] getScreens()
	{
		return screenScreenStore;
	}
}
