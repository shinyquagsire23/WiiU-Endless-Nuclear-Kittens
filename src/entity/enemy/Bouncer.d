module entity.enemy.Bouncer;

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

public class Bouncer : AbstractEnemy {
    private DirectionalAnimator animator;

    private static const float SPEED = 1 / 16f;

    public this(Vector2f startPos) {
        super(startPos, 48 / 4, 100);

        animator = new DirectionalAnimator(DirectionalType.FOUR_ROT, true);
        animator.load("kitten_02.png", 48, 48);

        animator.setAnimation(Direction.SOUTH_EAST, 0, 0, 8, 40);
        animator.setAnimation(Direction.NORTH_EAST, 8, 0, 8, 40);
        animator.autoFill();
    }

    public AbstractEnemy copy() {
        return new Bouncer(getPosition());
    }

    public void update(int delta) {
        super.update(delta);

        animator.setRotationFromMovementDeltas(dx, dy);
        animator.update(delta);
    }

    public void init() {
        double angle = (rand() % 4) * Util.PI / 2f + Util.PI / 4f;

        dx = cast(float) cos(angle) * SPEED;
        dy = cast(float) sin(angle) * SPEED;
    }

    public void drawEnemy(Graphics g, bool flash) {
        animator.draw(g, x, y, flash);
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
        return time / (5 * 60 * 1000.0f); //Linear increase up till full spawn rate at 5 minutes
    }

    public int getExplosionDelay() {
        return KittenPoof.EXPLOSION_DELAY;
    }

    public void onDeath() {
    	gameInstance.world.addFrag();
        gameInstance.world.addEntity(new KittenPoof(x, y, dx, dy));
    }
}
