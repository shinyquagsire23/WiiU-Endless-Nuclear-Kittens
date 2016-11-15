module entity.graphic.BlinkParticle;

import nuclear.Util;
import nuclear.Animation;
import nuclear.Graphics;
import nuclear.SpriteSheet;

import entity.graphic.Graphic;

public class BlinkParticle : Graphic {
    private static __gshared SpriteSheet SHEET;

    private Animation animation; //TODO: Does this leak on delete?

    private static const int MAX_TIME = 1000;


    public this(float x, float y, float targetX, float targetY, float percent) {
        super(x, y);
        if(SHEET is null)
            SHEET = new SpriteSheet("whiteparticle.png", 16, 16);

        int totalTime = cast(int) (cast(float) MAX_TIME * percent);

        animation = new Animation(SHEET, 50);
        animation.setLooping(false);

        int frameCount = animation.getFrameCount();
        for (int i = 0; i < frameCount; i++) {
            animation.setDuration(i, totalTime / frameCount);
        }

        dx = (targetX - x) / totalTime;
        dy = (targetY - y) / totalTime;
    }

    public void draw(Graphics g) {
        animation.draw(g, x - 8, y - 8);
    }

    public void update(int delta) {
        x += dx * delta;
        y += dy * delta;

        animation.update(delta);
    }

    public bool isFinished() {
        return animation.isStopped();
    }
}
