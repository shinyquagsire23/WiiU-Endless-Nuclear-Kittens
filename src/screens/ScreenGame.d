module screens.ScreenGame;

//import org.lwjgl.input.Keyboard;
import nuclear.Graphics;
import nuclear.IGameObject;
import nuclear.MultiControls;
import screens.ScreenManager;
//import org.zzl.minegaming.engine.XBOXButtons;

import nuclear.Game;
import nuclear.Spawner;

import coreinit.debugout;

private __gshared Spawner spawner;

public class ScreenGame : IGameObject
{
    private __gshared Game game;
    
    public this(Game game)
    {
        this.game = game;
    }

	public void Update(int delta)
	{
	    
		if(MultiControls.getNumPlayers() != 1)
		{
			MultiControls.setNumPlayers(1);
			game.reset();
			reset();
		}
		
		if(game.world.update(delta))
			game.screenManager.ChangeState("end");
			
			
        spawner.update(delta);
        game.mattis[0].handleInput(game.input, game.world);
        
        /*if(game.input.isKeyPressed(Keyboard.KEY_ESCAPE) || MultiControls.isButtonDown(XBOXButtons.BTN_Y))
        {
        		ScreenTitle.active = !ScreenTitle.active;
        		ScreenManager.ChangeState("pause");
        }*/
	}

	public void Draw(Graphics g)
	{
		g.scale(2, 2);
		game.drawWorld(g);
		g.scale(1/2f, 1/2f);
		g.setFont(FONT_MENU);
        //g.drawString("SCORE: " + Game.getScore(), 10, 10);
	}

	public void init()
	{
	}

	public void reset()
	{
        spawner = new Spawner(game.world, game.mattis);
	}
}
