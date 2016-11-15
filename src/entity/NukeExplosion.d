module entity.NukeExplosion;

import nuclear.Util;
import nuclear.Animation;
import nuclear.Color;
import nuclear.Graphics;
import nuclear.SpriteSheet;

import entity.Explosion;

public class NukeExplosion : Explosion {

    public this(float x, float y, float size, int score) {
        super(x, y, size, score, 0, 0);
        SpriteSheet sheet = new SpriteSheet("kittensplosion.png"/*).getScaledCopy(4f)*/, 512, 512);
        explosion = new Animation(sheet, 30);
        sheet.destroy();
        //explosion.setAutoUpdate(false);
        explosion.setLooping(false);
    }

    public void draw(Graphics g) {
        super.draw(g);
    }

    public float getDecreasedSize() {
        return 100;
    }
}
