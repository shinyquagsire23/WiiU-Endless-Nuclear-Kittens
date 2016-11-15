module screens.ScreenEnd;

import nuclear.Color;
import nuclear.Image;
import nuclear.Graphics;
import nuclear.IGameObject;
import nuclear.MultiControls;
import screens.ScreenManager;
import screens.ScreenTitle;

import nuclear.Game;

extern (C) int snprintf ( char * s, size_t n, const char * format, ... );

public class ScreenEnd : IGameObject
{
    public Image title;
    public this()
    {
        title = new Image("title_endlessnuclearkittens.png");
    }

	public void Update(int delta)
	{
		if (MultiControls.isPrimaryButton(0)) 
		{
            gameInstance.gameRunning = false;
            gameInstance.hasStarted = false;
            gameInstance.world.clearEntities();
            gameInstance.screenManager.ChangeState("title");
        }
	}

	public void Draw(Graphics g)
	{
	    char[0x200] temp1;
	    char[0x200] temp2;
	    char[0x200] temp3;
	    snprintf(cast(char*)temp1.ptr, 0x200, "SCORE: %llu", gameInstance.getScore());
	    snprintf(cast(char*)temp2.ptr, 0x200, "You killed %llu kitten%s", gameInstance.getFrags(), cast(char*)(gameInstance.getFrags() == 1 ? " " : "s"));
	    snprintf(cast(char*)temp3.ptr, 0x200, "and %llu kitten bot%s", gameInstance.getBossFrags(), cast(char*)(gameInstance.getBossFrags() == 1 ? " " : "s"));
	    
		g.scale(2, 2);
		gameInstance.drawWorld(g);
		g.scale(1 / 2f, 1 / 2f);
		g.setFont(FONT_MENU);
		g.drawString(cast(string)temp1, 10, 10);
		
        //g.setColor(new Color(0.0f, 0.1f, 0.2f, 0.6f));
        //g.fillRect(0, 0, gameInstance.SCREENSIZE.x, Game.REALSCREENSIZE.y);
        g.scale(2f, 2f);
        g.drawImage(title, gameInstance.SCREENSIZE.x / 4 - title.getWidth() / 2, -10);
        g.scale(1 / 2f, 1 / 2f);
        g.setColor(Color.white);
        g.setFont(FONT_MENU);
        
		float y = 580;
        float jump = 30;
        gameInstance.drawStringCentered(g, "OH NO! TOO MANY KITTENS!", gameInstance.SCREENSIZE.x / 2, y);
        y += jump;
        gameInstance.drawStringCentered(g, cast(string)temp2, gameInstance.SCREENSIZE.x / 2, y);
        y += jump;
        gameInstance.drawStringCentered(g, cast(string)temp3, gameInstance.SCREENSIZE.x / 2, y);
        y += jump * 1.8f;
        gameInstance.drawStringCentered(g, cast(string)temp1, gameInstance.SCREENSIZE.x / 2, y);
        y += jump * 1.8f;
        gameInstance.drawStringCentered(g, "[fire to return to title]", gameInstance.SCREENSIZE.x / 2, y);
	}

	public void init(){}
	
	public void reset(){}

}
