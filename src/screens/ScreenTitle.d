module screens.ScreenTitle;

import coreinit.debugout;
import nuclear.Game;
import nuclear.Image;
import nuclear.Graphics;
import nuclear.IGameObject;
import nuclear.Color;
import screens.Button;
import screens.ButtonAction;

import wiiu.input;
import vpad.input;

import screens.ScreenManager;
import core.stdc.stdlib;

extern (C) int snprintf ( char * s, size_t n, const char * format, ... );

public class ScreenTitle : IGameObject
{
    private class ButtonActionSingleplayer : ButtonAction
    {
        public this() {}
        
        public void hover()
        {
            gameInstance.playSound(gameInstance.BUTTON_HOVER);
            //MultiControls.rumble(0,50.0f);
            gameInstance.rumbleTimer = 100;
        }
            
        public void click()
        {
            if(shoveOff)
                return;
                
            gameInstance.playSound(gameInstance.SOUND_PICKUP);
            shoveOff = true;
            nextMenu = "game";
        }
            
        public void unhover(){}
    }
    
    private class ButtonActionMultiplayer : ButtonAction
    {
        public this() {}
        
        public void hover()
        {
            gameInstance.playSound(gameInstance.BUTTON_HOVER);
            //MultiControls.rumble(0,50.0f);
            gameInstance.rumbleTimer = 100;
        }
            
        public void click()
        {
            if(shoveOff)
                return;
                
            gameInstance.playSound(gameInstance.SOUND_PICKUP);
            shoveOff = true;
            nextMenu = "multiplayergame";
        }
            
        public void unhover(){}
    }
    
    private class ButtonActionOptions : ButtonAction
    {
        public this() {}
        
        public void hover()
        {
            gameInstance.playSound(gameInstance.BUTTON_HOVER);
            //MultiControls.rumble(0,50.0f);
            gameInstance.rumbleTimer = 100;
        }
            
        public void click()
        {
            if(shoveOff)
                return;
                
            gameInstance.playSound(gameInstance.SOUND_PICKUP);
            shoveOff = true;
            nextMenu = "options";
        }
            
        public void unhover(){}
    }
    
    private class ButtonActionExit : ButtonAction
    {
        public this() {} 
        
        public void hover()
        {
            gameInstance.playSound(gameInstance.BUTTON_HOVER);
            //MultiControls.rumble(0,50.0f);
            gameInstance.rumbleTimer = 100;
        }
            
        public void click()
        {
            /*if(shoveOff)
                return;
                
            gameInstance.playSound(gameInstance.SOUND_PICKUP);
            shoveOff = true;
            nextMenu = "game";*/
        }
            
        public void unhover(){}
    }

    public Image title;

    private int year;
    private string randomWord;
    public bool active = true;
    private float tX;
    private float x;
    private float mx;
    
    private int titleMin = -512;
    private int wordsMin = -256;
    private int scrollSpeed = 16;
    private bool begin = false;
    private bool widescreen = false;
    private bool showMenu = false;
    private bool shoveOff = false;
    private string nextMenu = "game";
    
    __gshared Button[4] buttons;
    //private List<Button> buttons = new ArrayList<Button>();

    public this() {}

    public void init()
    {
        title = new Image("title_endlessnuclearkittens.png");
        tX = gameInstance.SCREENSIZE.x / 4 - title.getWidth() / 2;
        x = gameInstance.SCREENSIZE.x / 2;
        mx =  x + gameInstance.SCREENSIZE.x - gameInstance.SCREENSIZE.x / 4;
        
        if(gameInstance.REALSCREENSIZE.x >= 1920)
        {
            titleMin = -32;
            wordsMin = 512 - 64;
            scrollSpeed = 8;
            widescreen = true;
        }
        int y = 110;
        int jump = 128;
        buttons[0] = new Button((widescreen ? mx : x + gameInstance.SCREENSIZE.x - gameInstance.SCREENSIZE.x / 4),y,"Singleplayer", new ButtonActionSingleplayer());
        y += jump;
        buttons[1] = new Button((widescreen ? mx : x + gameInstance.SCREENSIZE.x - gameInstance.SCREENSIZE.x / 4),y,"Multiplayer", new ButtonActionMultiplayer()).setDisabled(true);
        y += jump;
        buttons[2] = new Button((widescreen ? mx : x + gameInstance.SCREENSIZE.x - gameInstance.SCREENSIZE.x / 4),y,"Options", new ButtonActionOptions()).setDisabled(true);
        y += jump;
        buttons[3] = new Button((widescreen ? mx : x + gameInstance.SCREENSIZE.x - gameInstance.SCREENSIZE.x / 4),y,"Exit", new ButtonActionExit());
    }

    __gshared bool lastTpTouched;
    public void Update(int delta)
    {
        if ((!tpTouched && lastTpTouched) || (vpad_status.hold & (VPADButtons.VPAD_BUTTON_A|VPADButtons.VPAD_BUTTON_B|VPADButtons.VPAD_BUTTON_X|VPADButtons.VPAD_BUTTON_Y))) 
        {
            foreach(Button b ; buttons)
            {
                b.sendClick();
            }
        }
        
        if((!tpTouched && lastTpTouched) || vpad_status.hold) begin = true;
        
        if(begin)
        {
            if(tX > titleMin || shoveOff)
                tX -= scrollSpeed;
            if(x > wordsMin || shoveOff)
                x -= scrollSpeed * 2;
            if(tX <= 0 && x <= 512)
            {
                showMenu = true;
            }
            else
            {
                mx = gameInstance.SCREENSIZE.x + 512;
            }
            
            if((showMenu && mx >  gameInstance.SCREENSIZE.x + 64 - gameInstance.SCREENSIZE.x / 4) || shoveOff)
            {
                mx -= scrollSpeed * 4;
            }
        }
        
        if(shoveOff && x <= -800)
        {
            gameInstance.screenManager.ChangeState(nextMenu);
            gameInstance.reset();
        }
        
        foreach(Button b ; buttons)
        {
            b.setX((widescreen ? mx : x + gameInstance.SCREENSIZE.x - gameInstance.SCREENSIZE.x / 4));
            b.Update(delta);
        }
        
        lastTpTouched = tpTouched;
    }
    
    private void startGame()
    {
        gameInstance.screenManager.ChangeState("game");
    }

    public void reset() {
        year = 2300 + cast(int) (rand() % 300);
        int rnd = rand() % 10;
        if (rnd < 2) {
            randomWord = "the new earth overlords";
        } else if (rnd < 4) {
            randomWord = "still cute and cuddly";
        } else if (rnd < 6) {
            randomWord = "the spawn of the devil";
        } else if (rnd < 7) {
            randomWord = "an evil little bunch";
        } else if (rnd < 8) {
            randomWord = "the most beautiful things";
        } else if (rnd < 9) {
            randomWord = "collectors of souls";
        } else {
            randomWord = "made of love";
        }

        tX = gameInstance.SCREENSIZE.x / 4 - (512 / 2);
        x = gameInstance.SCREENSIZE.x / 2;
        mx =  x + gameInstance.SCREENSIZE.x - gameInstance.SCREENSIZE.x / 4;

        scrollSpeed = 16;
        showMenu = false;
        shoveOff = false;
    }

    public void Draw(Graphics g)
    {
        g.scale(2, 2);
        gameInstance.drawGrid(g);
        g.scale(1 / 2f, 1 / 2f);
        g.setFont(FONT_MENU);
        
        //g.drawString("SCORE: " + gameInstance.getScore(), 10, 10);
        if (!gameInstance.gameRunning || !active) 
        {
            //g.setColor(cast(Color)0x001A339A);
            //g.fillRect(0, 0, gameInstance.SCREENSIZE.x, gameInstance.REALSCREENSIZE.y);
            g.scale(2f, 2f);
            g.drawImage(title, tX, -10 + (gameInstance.hasStarted && active ? -20 : 0));
            g.scale(1 / 2f, 1 / 2f);
            g.setColor(Color.white);
            g.setFont(FONT_MENU);

            float y = 580;
            float jump = 30;
            if((x > -256 && !widescreen) || widescreen)
            {
                char[0x200] temp1;
                char[0x200] temp2;
                
                snprintf(temp1.ptr, 0x200, cast(char*)"In the year %u, kittens are", year);
                snprintf(temp2.ptr, 0x200, cast(char*)"%s.", randomWord.ptr);
                
                gameInstance.drawStringCentered(g, cast(string)temp1, x, y);
                y += jump;
                gameInstance.drawStringCentered(g, cast(string)temp2, x, y);
                y += jump * 1.8f;
                gameInstance.drawStringCentered(g, "Therefore, they must die.", x, y);
                y += jump;
                gameInstance.drawStringCentered(g, (showMenu ? "[select an option]" : "[press any button to begin]"), x, y);
                y += jump;
            }
            
            foreach(Button b ; buttons)
                b.Draw(g);
        }
    }
}
