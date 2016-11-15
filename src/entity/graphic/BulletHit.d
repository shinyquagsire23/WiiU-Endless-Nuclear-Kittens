module entity.graphic.BulletHit;

import nuclear.Util;
import nuclear.Animation;
import nuclear.Graphics;
import nuclear.SpriteSheet;

import entity.graphic.Graphic;

import core.stdc.stdlib;

public class BulletHit : Graphic {
    private SpriteSheet SHEET;

    private Animation animation;
    private int direction;

    public this(float x, float y) {
        super(x, y);
        SHEET = new SpriteSheet("bullethit.png", 32, 32);

        animation = new Animation(SHEET, 40);
        animation.setDuration(0, 20);
        animation.setDuration(1, 20);
        animation.setLooping(false);

        direction = rand() % 4;
    }

    public void draw(Graphics g) {
        g.rotate(x, y, 90 * direction);
        animation.draw(g, x - 16, y - 16);
        g.rotate(x, y, -90 * direction);
    }

    public void update(int delta) {
        animation.update(delta);
    }

    public bool isFinished() {
        return animation.isStopped();
    }
}
