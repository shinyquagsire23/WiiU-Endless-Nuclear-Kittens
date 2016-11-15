module nuclear.Animation;

import nuclear.Image;
import nuclear.Color;
import nuclear.Graphics;
import nuclear.SpriteSheet;

import coreinit.debugout;
import core.memory;

public class Animation
{
    private Image[0x200] frames;
    private int[0x200] frameDurations;
    private int numFrames = 0;
    private int frameNum = 0;
    private int durationLeft = 0;
    private bool looping = false;
    
    public this(SpriteSheet sheet, int duration)
    {
        for(int i = 0; i < sheet.getImageWidth()/sheet.getImageHeight(); i++)
        {
            addFrame(sheet.getSprite(i,0), duration);
        }
    }
    
    public this()
    {
        this(true);
    }
    
    public this(bool autoupdate)
    {
        
    }
    
    public void setLooping(bool looping)
    {
        this.looping = looping;
    }
    
    public bool isStopped()
    {
        return frameNum == numFrames-1;
    }
    
    public bool isLooping()
    {
        return looping;
    }
    
    public Image getFrame(int frame)
    {
        return frames[frame];
    }
    
    public void setDuration(int frame, int duration)
    {
        frameDurations[frame] = duration;
    }
    
    public int getDuration(int frame)
    {
        return frameDurations[frame];
    }
    
    public int getFrameCount()
    {
        return numFrames;
    }
    
    public void addFrame(Image i, int duration)
    {
        frames[numFrames] = i;
        frameDurations[numFrames] = duration;
        numFrames++;
    }
    
    public void update(int delta)
    {
        durationLeft -= delta;
        if(durationLeft <= 0)
        {
            frameNum++;
            if(frameNum >= numFrames && looping)
                frameNum = 0;
            else if(frameNum >= numFrames && !looping)
                frameNum--;
                
            durationLeft = frameDurations[frameNum];
        }
    }
    
    public void drawFlash(Graphics g, float x,float y,float width,float height, Color c = Color.white)
    {
        //TODO: Flashing?
        if(numFrames == 0) return;
        
        g.drawImage(frames[frameNum],x,y);
    }
    
    public void draw(Graphics g, float x, float y, Color c = Color.white)
    {
        if(numFrames == 0) return;
        Color lastColor = g.getColor();
        g.setColor(c);
        
        g.drawImage(frames[frameNum],x,y);
        g.setColor(lastColor);
    }
    
    public int getWidth()
    {
        if(numFrames == 0) return 0;
        return frames[0].width_sub;
    }
    
    public int getHeight()
    {
        if(numFrames == 0) return 0;
        return frames[0].height_sub;
    }
}
