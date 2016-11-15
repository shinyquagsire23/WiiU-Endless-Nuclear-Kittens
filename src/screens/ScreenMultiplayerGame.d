module screens.ScreenMultiplayerGame;

import nuclear.Graphics;
import nuclear.IGameObject;
import nuclear.MultiControls;
import screens.ScreenManager;

import nuclear.Game;
import nuclear.Spawner;

private __gshared Spawner spawner;

public class ScreenMultiplayerGame : IGameObject
{
	public void Update(int delta)
	{
	    //TODO?
		/*if(Game.numPlayers == 1 || spawner == null)
		{
			Game.numPlayers = MultiControls.numPlayers();
			Game.reset();
			reset();
		}*/
		
		if(gameInstance.world.update(delta))
			gameInstance.screenManager.ChangeState("end");
		
        spawner.update(delta);
        for(int i = 0; i < MultiControls.getNumPlayers(); i++)
        	gameInstance.mattis[i].handleInput(gameInstance.input, gameInstance.world);
        
        /*if(Game.input.isKeyPressed(Keyboard.KEY_ESCAPE) || MultiControls.isButtonDown(XBOXButtons.BTN_Y))
        {
        		ScreenTitle.active = !ScreenTitle.active;
        		ScreenManager.ChangeState("pause");
        }*/
	}

	public void Draw(Graphics g)
	{
		g.scale(2, 2);
		gameInstance.drawWorld(g);
		g.scale(1/2f, 1/2f);
		g.setFont(FONT_MENU);
        //g.drawString("SCORE: " + Game.getScore(), 10, 10);
	}

	public void init() {}

	public void reset()
	{
	    //if(spawner !is null) delete spawner;
        spawner = new Spawner(gameInstance.world, gameInstance.mattis);
	}
}
