module entity.enemy.RandomWalker;

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

public class RandomWalker : AbstractEnemy {
    private const float SPEED = 1 / 5f;
    private DirectionalAnimator animator;
    private double seekAngle;
    private double angle;
    private double turnspeed;
    private int turnTime;
    private int age;

    public this(Vector2f startPos) {
        super(startPos, 48 / 4, 100);

        animator = new DirectionalAnimator(DirectionalType.FOUR_ROT, true);
        animator.load("kitten_04.png", 48, 48);

        animator.setAnimation(Direction.SOUTH_EAST, 0, 0, 8, 40);
        animator.setAnimation(Direction.NORTH_EAST, 8, 0, 8, 40);
        animator.autoFill();
    }

    public AbstractEnemy copy() {
        return new RandomWalker(getPosition());
    }

    public void init() {
        seekAngle = angle = (rand() % 4) * Util.PI / 2f + Util.PI / 4f;
        dx = cast(float) cos(angle) * SPEED;
        dy = cast(float) sin(angle) * SPEED;
    }

    public void drawEnemy(Graphics g, bool flash) {
        animator.draw(g, x, y, flash);
    }

    public void update(int delta) {
        super.update(delta);

        age += delta;

        if (age > turnTime) {
            age = 0;
            turnTime = 500 + cast(int) (rand() % 1000);
            angle = rand() % 360;
        }

        dx = cast(float) cos(angle) * SPEED;
        dy = cast(float) sin(angle) * SPEED;

        animator.setRotationFromMovementDeltas(dx, dy);
        animator.update(delta);
    }

    public void collisionX(Rectangle bounds, float x, float newX) {
        dx = -dx;
        this.x = x;
    }

    public void collisionY(Rectangle bounds, float y, float newY) {
        dy = -dy;
        this.y = y;
    }

    public float getSpawnChance(int time) {
        if (time < 1000 * 60) {
            return 0f;
        }

        time -= 1000 * 60;
        int spawnInterval = cast(int) (2.5f * 60 * 1000);
        return (time % spawnInterval) / cast(float) spawnInterval * time / (10 * 60 * 1000.0f); //Peak spawn rate every 2.5 minutes, increasing up to 10 minutes
    }

    public int getExplosionDelay() {
        return KittenPoof.EXPLOSION_DELAY;
    }

    public void onDeath() {
    	gameInstance.world.addFrag();
        gameInstance.world.addEntity(new KittenPoof(x, y, dx, dy));
    }
}
