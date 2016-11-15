module entity.projectile.BaseProjectile;

import entity.projectile.Projectile;
import entity.BaseEntity;
import geom.Circle;

import nuclear.Util;
import core.stdc.math;

public abstract class BaseProjectile : BaseEntity, Projectile 
{
    public this(float x, float y, Circle collider) 
    {
        super(x, y, collider);
    }

    public BaseProjectile setSpeed(float angle, float speed) 
    {
        dx = -cast(float) cos(Util.toRadians(angle)) * speed;
        dy = -cast(float) sin(Util.toRadians(angle)) * speed;

        return this;
    }
    
    public void update(int delta) {
        return super.update(delta);
    }
    
    public Circle getCollider() {
        return super.getCollider();
    }

    public float getX() {
        return super.getX();
    }

    public float getY() {
        return super.getY();
    }

    public float getDx() {
        return super.getDx();
    }

    public float getDy() {
        return super.getDy();
    }

    public bool isFinished() {
        return super.isFinished();
    }
}
