module entity.projectile.Flame;

import nuclear.Util;
import entity.Mattis;
import entity.graphic.Graphic;
import entity.projectile.BaseProjectile;

import nuclear.Animation;
import nuclear.Graphics;
import nuclear.SpriteSheet;
import geom.Circle;

import core.stdc.stdlib;

public class Flame : BaseProjectile {
    private float rotation;
    private int age = 0;
    private Animation anim;
    private Mattis owner;

    public this(float x, float y, float angle, Mattis owner) {
        super(x, y, new Circle(x, y, 5));
        this.owner = owner;
        this.rotation = (cast(float)(rand() % 100) / 100.0) < 0.5 ? 90 : 0;
        anim = new Animation(new SpriteSheet("flamey.png", 50, 52), 25);
        //anim.setAutoUpdate(false);
        anim.setLooping(true);

        setSpeed(angle, 0.4f);
    }

    public void update(int delta) {
        age += delta;

        collider.setRadius(5f * cast(float) age / 35f);
        anim.update(delta);

        super.update(delta);
    }

    public bool isFinished() {
        return age > 300;
    }

    public int getDamage() {
        return 30;
    }

    public Graphic onPoof() {
        return null;
    }

    public void draw(Graphics g) {
        g.rotate(x, y, rotation);
        anim.draw(g, x - 26, y - 26);
        g.rotate(x, y, -rotation);
    }

	
	public int getOwnerNum()
	{
		return owner.getPlayerNum();
	}
}
