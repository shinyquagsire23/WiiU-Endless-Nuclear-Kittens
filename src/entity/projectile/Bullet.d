module entity.projectile.Bullet;

import nuclear.Util;
import entity.Mattis;
import entity.graphic.BulletHit;
import entity.graphic.Graphic;

import nuclear.Color;
import nuclear.Graphics;
import nuclear.Image;
import geom.Circle;

import entity.projectile.BaseProjectile;
import core.stdc.math;

public class Bullet : BaseProjectile {
    private Image BULLET;

    private int damage;
    private Mattis owner;

    public this(float x, float y, Mattis owner) {
        super(x, y, new Circle(x, y, 5));
        
        BULLET = new Image("bullet_01_16.png", Color.white);
        damage = 12;
        this.owner = owner;
    }

    public void draw(Graphics g) {
        float angle = cast(float) Util.toDegrees(atan2(dy, dx) + Util.PI / 2);

        g.rotate(x, y, angle);
        g.drawImage(BULLET, x - 8, y - 8);
        g.rotate(x, y, -angle);
    }

    public int getOwnerNum()
    {
    	return owner.getPlayerNum();
    }

    public int getDamage() {
        return damage;
    }

    public bool isFinished() {
        return false;
    }

    public Graphic onPoof() {
        return new BulletHit(x, y);
    }
}
