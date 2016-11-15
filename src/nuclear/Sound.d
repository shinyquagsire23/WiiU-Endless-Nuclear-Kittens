module nuclear.Sound;

import coreinit.debugout;

public class Sound
{
    public this(string path)
    {
        OSReport("New sound %s\n", path.ptr);
    }
    
    public void play(float pitch, float volume)
    {
        
    }
}
