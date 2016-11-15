module entity.graphic.Graphic;

import entity.Entity;
import nuclear.Graphics;

public abstract class Graphic : Entity {
    protected float x;
    protected float y;
    protected float dx = 0;
    protected float dy = 0;

    protected this(float x, float y) {
        this.x = x;
        this.y = y;
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

    public void drawGUI(Graphics g) {}
}
