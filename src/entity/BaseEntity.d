module entity.BaseEntity;

import nuclear.Game;
import nuclear.Util;
import entity.CollidingEntity;
import nuclear.World;
import geom.Circle;
import geom.Rectangle;
import geom.Vector2f;

import coreinit.debugout;

public abstract class BaseEntity : CollidingEntity {
    protected float x;
    protected float y;
    protected float dx;
    protected float dy;

    protected Circle collider;

    public this(float x, float y, Circle collider) {
        this.x = x;
        this.y = y;
        this.dx = 0;
        this.dy = 0;
        this.collider = collider;
    }

    public void update(int delta) {
        float oldX = x;
        float oldY = y;
        float newX = x + dx * delta;
        float newY = y + dy * delta;
        x = newX;
        y = newY;
        //TODO idk what to do w/ this
        Rectangle bounds = gameInstance.world.getBounds();
        Circle collider = getCollider();
        if (!Util.contains(bounds, new Circle(newX, oldY, collider.radius))) {
            collisionX(bounds, oldX, newX);
        }
        if (!Util.contains(bounds, new Circle(oldX, newY, collider.radius))) {
            collisionY(bounds, oldY, newY);
        }
        collider.setCenterX(x);
        collider.setCenterY(y);
    }

    public Circle getCollider() {
        return collider;
    }

    public void collisionX(Rectangle bounds, float x, float newX) {
    }

    public void collisionY(Rectangle bounds, float y, float newY) {
    }

    public bool tryMove(World world, float x, float y) {
        if (world.inBounds(new Circle(x, y, collider.radius))) {
            this.x = x;
            this.y = y;
            return true;
        }

        return false;
    }

    public float getX() {
        return x;
    }

    public float getY() {
        return y;
    }

    public float getDx() {
        return dx;
    }

    public float getDy() {
        return dy;
    }

    public bool isFinished() {
        return false;
    }

    public Vector2f getPosition() {
        return new Vector2f(x, y);
    }

    public BaseEntity setPosition(Vector2f pos) {
        x = pos.x;
        y = pos.y;
        return this;
    }
}
