module entity.graphic.BlinkExit;

import nuclear.Util;
import nuclear.Animation;
import nuclear.Graphics;
import nuclear.Image;

import entity.graphic.Graphic;

public class BlinkExit : Graphic {
    private static __gshared Image flash;

    private static __gshared Animation animation;

    public this(float x, float y) {
        super(x, y);
        if(flash is null)
        {
            flash = new Image("blinkflash.png");

            animation = new Animation(false);
            animation.setLooping(false);
            animation.addFrame(flash, 40);
        }
    }

    public void draw(Graphics g) {
        animation.draw(g, x - 47, y - 47);
    }

    public void update(int delta) {
        animation.update(delta);
    }

    public bool isFinished() {
        return animation.isStopped();
    }
}
