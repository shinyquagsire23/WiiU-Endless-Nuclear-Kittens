module entity.enemy.RandomBouncer;

import nuclear.Game;
import animator.Direction;
import animator.DirectionalAnimator;
import animator.DirectionalType;
import entity.enemy.AbstractEnemy;
import entity.graphic.KittenPoof;
import nuclear.Graphics;
import nuclear.Util;
import geom.Rectangle;
import geom.Vector2f;

import core.stdc.math;
import core.stdc.stdlib;

public class RandomBouncer : AbstractEnemy {
    private static const float SPEED = 10f;

    private DirectionalAnimator animator;

    public this(Vector2f startPos) {
        super(startPos, 48 / 4, 200);

        animator = new DirectionalAnimator(DirectionalType.FOUR_ROT, true);
        animator.load("kitten_fat.png", 48, 48);

        animator.setAnimation(Direction.SOUTH_EAST, 0, 0, 9, 40);
        animator.setAnimation(Direction.NORTH_EAST, 9, 0, 9, 40);
        animator.autoFill();
    }

    public AbstractEnemy copy() {
        return new RandomBouncer(getPosition());
    }

    public void init() {
        randomizeSpeed();
    }

    public void update(int delta) {
        super.update(delta);

        animator.setRotationFromMovementDeltas(dx, dy);
        animator.update(delta);
    }

    public void drawEnemy(Graphics g, bool flash) {
        animator.draw(g, x, y, flash);
    }

    public void collisionX(Rectangle bounds, float x, float newX) {
        randomizeSpeed();
        this.x = x;
    }

    public void collisionY(Rectangle bounds, float y, float newY) {
        randomizeSpeed();
        this.y = y;
    }

    private void randomizeSpeed() {
        double angle = (cast(float)(rand() % 100) / 100.0) * Util.PI * 2;
        dx = cast(float) cos(angle) / SPEED;
        dy = cast(float) sin(angle) / SPEED;
    }

    public float getSpawnChance(int time) {
        int spawnInterval = 1 * 60 * 1000;
        return (time % spawnInterval) / cast(float) spawnInterval * time / (5 * 60 * 1000.0f); //Peak spawn rate every minute, increasing up to 5 minutes
    }

    public int getExplosionDelay() {
        return KittenPoof.EXPLOSION_DELAY;
    }

    public void onDeath() {
    	gameInstance.world.addFrag();
        gameInstance.world.addEntity(new KittenPoof(x, y, dx, dy));
    }
}
