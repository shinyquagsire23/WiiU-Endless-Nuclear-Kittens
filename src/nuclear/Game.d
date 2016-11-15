module nuclear.Game;

import geom.Vector2f;
import nuclear.World;
import nuclear.Input;
import nuclear.Color;
import nuclear.Image;
import nuclear.Graphics;
import nuclear.Sound;
import nuclear.IGameObject;
import nuclear.MultiControls;
import entity.Mattis;
import screens.ScreenManager;
import screens.ScreenTitle;
import screens.ScreenGame;
import screens.ScreenEnd;
import screens.ScreenMultiplayerGame;

import wiiu.font;
import wiiu.input;
import vpad.input;

import geom.Rectangle;
import core.stdc.math;
import coreinit.debugout;

public __gshared Vector2f[12] cursorPos;
public __gshared Game gameInstance;

public class Game
{
    public const int SCREEN_WIDTH = 1920;
    public const int SCREEN_HEIGHT = 1080;
    public ScreenManager screenManager;

    public bool fullscreen = true;
    public bool wideFullHybrid = true;
    public bool roundedCorners = true; //Do we want to round off the corners in hybrid mode?
    public Vector2f SCREENSIZE;
    public Vector2f REALSCREENSIZE;

    public const int SOUND_BLASTER = 0;
    public const int SOUND_EXPLOSION = 1;
    public const int SOUND_FLAMETHROWER = 2;
    public const int SOUND_ROCKETLAUNCH = 3;
    public const int SOUND_SHOTGUN = 4;
    public const int SOUND_TELEPORT = 5;
    public const int SOUND_CHAIN_EXPLOSION = 6;
    public const int SOUND_BULLET_HIT = 7;
    public const int SOUND_PICKUP = 8;
    public const int BUTTON_HOVER = 9;
    private Sound[10] sounds;
    
    private Image starfield;
    private Image[3] stars;
    
    private Image screen;

    public Mattis[12] mattis;
    public World world;
    
    public Color[] playerColors =  [Color.white,Color.red,Color.blue,Color.green,Color.yellow,Color.orange,Color.cyan,Color.lightGray,Color.magenta,Color.pink,Color.darkGray,Color.black];

    public Input input;
    public Image cursor;

    public bool hasStarted = false;
    public bool gameRunning = false;
    
    public int rumbleTimer = 0;
    
    public this()
    {
        gameInstance = this;
        screenManager = new ScreenManager();
        SCREENSIZE = new Vector2f(1024, 768);
        REALSCREENSIZE = new Vector2f(1024, 768);
    
        
    
        fullscreen = true;
        
        screenManager.AddScreen("title", new ScreenTitle());
        screenManager.AddScreen("game", new ScreenGame(this));
        screenManager.AddScreen("multiplayergame", new ScreenMultiplayerGame());
        /*screenManager.AddScreen("pause", new ScreenPaused());*/
        screenManager.AddScreen("end", new ScreenEnd());
        //screenManager.AddScreen("options", new ScreenOptions());
        screenManager.ChangeState("title");
        
    
        /*input = gc.getInput();
        input.initControllers();*/
        reset();

        
        for(int i = 0; i < MultiControls.getNumPlayers(); i++)
        {
            cursorPos[i] = new Vector2f(0,0);
        }
        
        cursor = new Image("crosshair.png", Color.white);

        starfield = new Image("stars_01.png");
        stars[0] = new Image("stars_02.png", Color.white);
        stars[1] = new Image("stars_03.png", Color.white);
        stars[2] = new Image("stars_04.png", Color.white);
        
        screen = new Image("screen.png");

        sounds[SOUND_BLASTER] = new Sound("blaster.wav");
        sounds[SOUND_EXPLOSION] = new Sound("explosion.wav");
        sounds[SOUND_FLAMETHROWER] = new Sound("flamethrower.wav");
        sounds[SOUND_ROCKETLAUNCH] = new Sound("rocketlaunch.wav");
        sounds[SOUND_SHOTGUN] = new Sound("shotgun.wav");
        sounds[SOUND_TELEPORT] = new Sound("teleport.wav");
        sounds[SOUND_CHAIN_EXPLOSION] = new Sound("chain_explosion.wav");
        sounds[SOUND_BULLET_HIT] = new Sound("bullet_hit.wav");
        sounds[SOUND_PICKUP] = new Sound("item_pickup.wav");
        sounds[BUTTON_HOVER] = new Sound("button_hover.wav");
        
        foreach(int i, IGameObject g ; screenManager.getScreens())
        {
            if(g is null) break;
            
        	g.init();
        }
    }
    
    public void playSound(int sound) {
        playSound(sound, 1.0f, 0.5f);
    }

    public void playSound(int sound, float pitch, float volume) {
        sounds[sound].play(pitch, volume);
    }

    public void update(int delta) 
    {
    	screenManager.Update(delta);
        
		rumbleTimer -= delta;
		if(rumbleTimer <= 0)
		{
			//MultiControls.unrumble();
		}

        /*if (input.isKeyPressed(Input.KEY_END)) {
            System.exit(0);
        }*/
        
        if(screenManager.currentScreenId == "game" || screenManager.currentScreenId == "multiplayergame")
        {
        	for(int i = 0; i < MultiControls.getNumPlayers(); i++)
            {
        		if(tpTouched && i == 0)
                {
                    cursorPos[0].x = tpXPos - (REALSCREENSIZE.x - SCREENSIZE.x) / 2;
                    cursorPos[0].y = REALSCREENSIZE.y - tpYPos;
                    continue;
                }
            	
        		if(MultiControls.getRightXAxisValue(i) != 0.0)
        			cursorPos[i].x = mattis[i].getX() * 2 - world.getCameraPositionX() + MultiControls.getRightXAxisValue(i) * REALSCREENSIZE.x / 4;
        		//else
        			//cursorPos[i].x = mattis[i].getX() * 2 - world.getCameraPosition().x * 2;
        		

        		if(MultiControls.getRightYAxisValue(i) != 0.0)
        			cursorPos[i].y = mattis[i].getY() * 2 - world.getCameraPositionY() * 2 + MultiControls.getRightYAxisValue(i) * SCREENSIZE.x / 4;
        		//else
        			//cursorPos[i].y = mattis[i].getY() * 2 - world.getCameraPosition().y * 2;
            }
        }
        else
        {
        	for(int i = 0; i < MultiControls.getNumPlayers(); i++)
        	{
        		if(tpTouched && i == 0)
                {
                    cursorPos[0].x = tpXPos - (REALSCREENSIZE.x - SCREENSIZE.x) / 2;
                    cursorPos[0].y = REALSCREENSIZE.y - tpYPos;
                    continue;
                }
        		cursorPos[i].x += MultiControls.getLeftXAxisValue(i) * 20;
        		cursorPos[i].y += MultiControls.getLeftYAxisValue(i) * 20;
        		cursorPos[i].x += MultiControls.getRightXAxisValue(i) * 20;
        		cursorPos[i].y += MultiControls.getRightYAxisValue(i) * 20;

        		if(cursorPos[i].x > SCREENSIZE.x)
        			cursorPos[i].x = SCREENSIZE.x;

        		if(cursorPos[i].y > SCREENSIZE.y)
        			cursorPos[i].y = SCREENSIZE.y;

        		if(cursorPos[i].x < 0)
        			cursorPos[i].x = 0;

        		if(cursorPos[i].y < 0)
        			cursorPos[i].y = 0;
        	}
        }
    }

    public void reset()
    {
        if(fullscreen && wideFullHybrid) //Use fullscreen mode, but have game emulate a fullscreen monitor on a widescreen resolution
        {
        	SCREENSIZE = new Vector2f((1024 * SCREEN_HEIGHT / 768) + 64, SCREEN_HEIGHT);
        	REALSCREENSIZE = new Vector2f(SCREEN_WIDTH, SCREEN_HEIGHT);
        }
        else if(fullscreen) //True fullscreen, edge to edge up and down
        {
        	SCREENSIZE = new Vector2f(SCREEN_WIDTH, SCREEN_HEIGHT);
        	REALSCREENSIZE = new Vector2f(SCREEN_WIDTH, SCREEN_HEIGHT);
        }
        
    	for(int i = 0; i < MultiControls.getNumPlayers(); i++)
    	{
    		mattis[i] = new Mattis(this, 300, 250, SCREENSIZE,i);
    	}
        world = new World(SCREENSIZE, mattis);
    	foreach(int i, IGameObject g ; screenManager.getScreens())
        {
            if(g is null) break;
            
        	g.reset();
        }
    }

    public void render(Graphics g) 
    {
    	g.pushTransform();
        g.translate((REALSCREENSIZE.x - SCREENSIZE.x) / 2, 0);
        screenManager.Draw(g);
        g.scale(2, 2);
        g.setColor(Color.white);
        for(int i = 0; i < MultiControls.getNumPlayers(); i++)
        {
        	g.setColor(playerColors[i]);
        	g.drawImage(Game.cursor, cursorPos[i].x / 2.0f - Game.cursor.getWidth() / 2, cursorPos[i].y / 2.0f - Game.cursor.getHeight() / 2,playerColors[i]);
        	//if(screenManager.currentScreen instanceof ScreenGame)
        		//break;
        	g.scale(1 / 2f, 1 / 2f);
        	//drawStringCentered(g,i+1+"",cursorPos[i].x - 0f,cursorPos[i].y - 10f);
            g.scale(2, 2);
        }
        g.scale(1 / 2f, 1 / 2f);
        g.popTransform();
        
        //Cover everything with black bars to give it the fullscreen effect
        g.setColor(Color.black);
        g.fillRect(0.0, 0, (REALSCREENSIZE.x - SCREENSIZE.x) / 2, REALSCREENSIZE.y);
        g.fillRect(REALSCREENSIZE.x - (REALSCREENSIZE.x - SCREENSIZE.x) / 2, 0, (REALSCREENSIZE.x - SCREENSIZE.x) / 2, REALSCREENSIZE.y);
        g.texture((REALSCREENSIZE.x - SCREENSIZE.x) / 2,0,SCREENSIZE.x,REALSCREENSIZE.y, screen,true);
        //g.fillRect(0, 0, REALSCREENSIZE.x, 32);
        //g.fillRect(0, REALSCREENSIZE.y - 32, REALSCREENSIZE.x, 32);
        g.setColor(Color.white);
    }

    public void drawWorld(Graphics g)
    {
		//g.setFont(Game.FONT);
        for (int x = 0; x < 4; x++) {
            for (int y = 0; y < 3; y++) {
                g.drawImage(starfield, x * 256, y * 256);
            }
        }
        for (int x = -2; x < 8; x++) {
            for (int y = -2; y < 7; y++) {
                float offsetX = -world.getCameraPositionX() / 20.0f;
                float offsetY = -world.getCameraPositionY() / 20.0f;
                g.drawImage(stars[(11 * (19 * cast(int)fabs(x) + 17 * cast(int)fabs(y))) % 3], x * 256 + offsetX, y * 256 + offsetY);
            }
        }
        world.draw(g);
    }
    
    public void drawGrid(Graphics g)
    {
    	g.setFont(FONT);
        for (int x = 0; x < 4; x++) {
            for (int y = 0; y < 3; y++) {
                g.drawImage(starfield, x * 256, y * 256);
            }
        }
        for (int x = -2; x < 8; x++) {
            for (int y = -2; y < 7; y++) {
                float offsetX = -world.getCameraPositionX() / 20.0f;
                float offsetY = -world.getCameraPositionY() / 20.0f;
                g.drawImage(stars[(11 * (19 * cast(int)fabs(x) + 17 * cast(int)fabs(y))) % 3], x * 256 + offsetX, y * 256 + offsetY);
            }
        }
    	world.drawGrid(g, true);
    }
    
    public ulong getScore()
    {
    	return world.getScore();
    }
    
    public ulong getFrags()
    {
    	return world.getFrags();
    }
    
    public ulong getBossFrags()
    {
    	return world.getBossFrags();
    }
    
    public static void drawStringCentered(Graphics g, string str, float x, float y) {
        float width = font_measure_string_width_height(FONT_MENU, cast(char*)str.ptr);
        g.drawString(str, cast(int) (x - width / 2), y);
    }
}
