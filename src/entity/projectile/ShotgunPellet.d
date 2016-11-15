module entity.projectile.ShotgunPellet;

import nuclear.Util;
import entity.Mattis;
import entity.graphic.Graphic;
import entity.graphic.Poof;
import entity.projectile.BaseProjectile;

import nuclear.Animation;
import nuclear.Graphics;
import nuclear.SpriteSheet;
import geom.Circle;

import core.stdc.stdlib;
import core.stdc.math;

public class ShotgunPellet : BaseProjectile {
    private SpriteSheet SHEET;
    private static const int SIZE = 6;
    private int damage;
    private int direction;
    private Animation animation;
    private Animation animation2;
    private int age = 0;
    private Mattis owner;

    public this(float x, float y, Mattis owner) {
        super(x, y, new Circle(x, y, SIZE / 2));
        SHEET = new SpriteSheet("shotgun_bullet.png", 32, 32); //TODO memory leaks
        this.owner = owner;
        damage = 15;

        // Sparkly bit
        animation = new Animation();
        animation.addFrame(SHEET.getSprite(0, 0), 10);
        animation.addFrame(SHEET.getSprite(1, 0), 10);
        int sheetSize = /*SHEET.getHorizontalCount()*/12;
        for (int i = 2; i < sheetSize - 2; i++) {
            animation.addFrame(SHEET.getSprite(i, 0), 10 + (rand() % 10));
        }
        animation.setLooping(false);
        //animation.setAutoUpdate(false);

        // Remaining flight
        animation2 = new Animation();
        animation2.addFrame(SHEET.getSprite(sheetSize - 2, 0), 20);
        animation2.addFrame(SHEET.getSprite(sheetSize - 1, 0), 20);
        animation2.setLooping(true);
        //animation2.setAutoUpdate(false);

        direction = rand() % 4;
    }

    public void draw(Graphics g) {
        g.rotate(x, y, 90 * direction);
        animation.draw(g, x - 16, y - 16);
        g.rotate(x, y, -90 * direction);
    }

    public void update(int delta) {
        super.update(delta);
        age += delta;
        animation.update(delta);
        if (animation.isStopped()) animation = animation2;

        if (age > 200) {
            dx *= pow(0.95, delta / 2);
            dy *= pow(0.95, delta / 2);
        }
    }

    public ShotgunPellet setSpeed(float angle, float speed) {
        speed = .5f * speed + .5f * cast(float) (cast(float)(rand() % 100)) * speed;

        dx = -cast(float) cos(Util.toRadians(angle)) * speed;
        dy = -cast(float) sin(Util.toRadians(angle)) * speed;

        return this;
    }

    public int getDamage() {
        return damage;
    }

    public Graphic onPoof() {
        return new Poof(x, y);
    }

    public bool isFinished() {
        return age > 350;
    }


	public int getOwnerNum()
	{
		return owner.getPlayerNum();
	}
}
