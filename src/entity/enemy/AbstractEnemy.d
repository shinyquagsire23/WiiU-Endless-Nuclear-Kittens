module entity.enemy.AbstractEnemy;

import nuclear.Game;
import entity.BaseEntity;
import entity.Entity;
import entity.Explosion;
import entity.Hurtable;
import nuclear.Color;
import nuclear.Graphics;
import geom.Circle;
import geom.Vector2f;

import core.stdc.stdlib;

public abstract class AbstractEnemy : BaseEntity, Hurtable {
    protected int health = 100;
    private bool flashNext;
    private int flashDuration;
    //private List<Entity> ignoreList = new ArrayList<Entity>();

    public this(Vector2f startPos, int colliderSize, int health) {
        super(startPos.getX(), startPos.getY(), new Circle(startPos.getX(), startPos.getY(), colliderSize));
        this.health = health;
        init();
    }

    public void init() {
    }

    public void update(int delta) {
        super.update(delta);
        if (flashNext) {
            flashDuration += delta;
            if (flashDuration > getFlashDuration()) {
                flashNext = false;
                flashDuration = 0;
            }
        }
    }

    protected int getFlashDuration() {
        return 75;
    }

    public int getExplosionDelay() {
        return 0;
    }

    public bool isFinished() {
        return false;
    }

    public void onDeath() {
    }

    public void draw(Graphics g) {
        // Boundingbox!~
        //g.setColor(new Color(0.6f, 0, 0));
        //g.draw(collider);
        drawEnemy(g, flashNext);
    }

    public void drawShadow(Graphics g) {
        g.setColor(cast(Color)0x0000004D);
        float radius = collider.getRadius() * 1.5f;
        //g.fillOval(x - radius / 2f, y + radius / 2f, radius, radius / 2f);
    }

    public abstract void drawEnemy(Graphics g, bool flash);

    public bool hurt(Entity source, int damage, float dx, float dy) {
        //TODO
        /*if (cast(Explosion)source) {
            if (ignoreList.contains(source)) {
                return false;
            } else {
                ignoreList.add(source);
            }
        }*/
        Vector2f normalized = new Vector2f(dx, dy).normalise();
        tryMove(gameInstance.world, normalized.x * damage / 6f, normalized.y * damage / 6f);
        health -= damage;
        flashNext = true;
        flashDuration = 0;
        
        delete normalized;
        return health <= 0;
    }

    public int getHealth() {
        return health;
    }

    public int getDamageOnCollision() {
        return 10 + cast(int) (rand() % 11);
    }

    public abstract float getSpawnChance(int time);

    public abstract AbstractEnemy copy();
    
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
}
