module entity.Explosion;

import entity.BaseEntity;

import nuclear.Game;
import nuclear.Util;
//import org.newdawn.slick.Animation;
import nuclear.Color;
import nuclear.Graphics;
import nuclear.Animation;
import nuclear.SpriteSheet;
import geom.Circle;

import core.stdc.math;
import coreinit.debugout;

extern (C) int snprintf ( char * s, size_t n, const char * format, ... );

public class Explosion : BaseEntity {

    private const int SIZE = 128;
    private SpriteSheet SPRITE_SHEET;

    private float size;
    private float speed;
    private int timePassed;
    private int score; //Apparently not lazy!
    protected Animation explosion;

    private int delay;
    private bool hadDelay = false;

    private int chain;

    public this(float x, float y, float size, int score, int delay, int chain) {
        super(x, y, new Circle(x, y, 5 + size / 10));
        
        SPRITE_SHEET = new SpriteSheet("kittensplosion.png", SIZE, SIZE);
        this.delay = delay;

        if (this.delay > 0) {
            collider.setRadius(0);
            hadDelay = true;
        }

        this.chain = chain;
        this.size = size;
        this.score = score;
        speed = 1.0f + size / 50f;
        explosion = new Animation(SPRITE_SHEET, 30);
        //explosion.setAutoUpdate(false);
        explosion.setLooping(false);

        if (chain == 0) {
            gameInstance.playSound(Game.SOUND_EXPLOSION, 1.0f, 0.3f);
        } else {
            gameInstance.playSound(Game.SOUND_CHAIN_EXPLOSION, Util.fmin(2.5f, 1.0f + chain * 0.25f), 0.3f);
        }
    }

    public float getDecreasedSize() {
        return Util.fmax(size, 40) * 0.85f;
    }

    public int getScore() {
        return score;
    }

    public int getChain() {
        return chain;
    }

    public void update(int delta) {
        timePassed += delta;

        if (timePassed < delay) {
            return;
        }

        if (hadDelay) {
            hadDelay = false;
            collider.setRadius(5 + size / 10);
        }

        if (speed > size / 80f) {
            speed -= delta / 25f;
        } else {
            speed = size / 80f;
        }
        if (collider.getRadius() < size) {
            collider.setRadius(collider.radius + delta / 12f * speed);
        }
        collider.setCenterX(x);
        collider.setCenterY(y);
        explosion.update(delta);
    }

    public bool isFinished() {
        return timePassed - delay > 800;
    }

    public void draw(Graphics g) {
        if (timePassed < delay) return;

        //g.setLineWidth(3);
        float intensity = 1 - ((timePassed - delay) / 800f);
        //g.setDrawMode(Graphics.MODE_NORMAL);
         g.setColor(cast(Color)(0xFFFFFF00 | cast(ubyte)((0xFF*intensity)*0.3)));
        //g.draw(collider);
        explosion.draw(g, x - explosion.getWidth() / 2, y - explosion.getHeight() / 2);
        int sqrt_ = cast(int) sqrt(score);
        int scoreLevel = Util.min(sqrt_, FONT_SCORES.length - 1);
        g.setFont(FONT_SCORES[scoreLevel]*2);
        g.setColor(cast(Color)(0xFFFFFF00 | cast(ubyte)(0xFF - 0xFF*intensity)));

        char temp[0x200];
        snprintf(temp.ptr, 0x200, "%i", score);
        
        g.scale(1 / 2f, 1 / 2f);
        g.drawString(cast(string)temp, cast(int) (x - scoreLevel / 4) * 2, cast(int) (y - scoreLevel / 2 - (1 - intensity * 0.4f) * 48) * 2);
        g.setColor(cast(Color)(0xFFFFFF00 | cast(ubyte)(0xFF - 0xFF*intensity)));
        //g.drawString(cast(string)temp, cast(int) (x - scoreLevel / 4 + 1) * 2, cast(int) (y - scoreLevel / 2 + 1 - (1 - intensity * 0.4f) * 48) * 2);
        g.scale(2f, 2f);
        g.setFont(FONT);
    }
}
