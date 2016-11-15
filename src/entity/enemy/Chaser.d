module entity.enemy.Chaser;

import nuclear.Game;
import nuclear.Util;
import nuclear.MultiControls;
import animator.Direction;
import animator.DirectionalAnimator;
import animator.DirectionalType;
import entity.Mattis;
import entity.enemy.AbstractEnemy;
import entity.graphic.KittenPoof;

import nuclear.Graphics;
import geom.Rectangle;
import geom.Vector2f;

import core.stdc.stdlib;
import core.stdc.math;

public class Chaser : AbstractEnemy {
    private static const float SPEED = 1 / 6f;
    private DirectionalAnimator animator;
    private Mattis mattis;
    private Mattis[] mattisi;
    private double seekAngle;
    private double angle;
    private double turnspeed;

    public this(Vector2f startPos, Mattis[] mattis2) {
        super(startPos, 48 / 4, 100);
        int target = rand() % MultiControls.getNumPlayers();
        while(mattis2[target].isDead())
        	target = rand() % MultiControls.getNumPlayers();

        this.mattis = mattis2[target];
        this.mattisi = mattis2;

        animator = new DirectionalAnimator(DirectionalType.FOUR_ROT, true);
        animator.load("kitten_01.png", 48, 48);

        animator.setAnimation(Direction.SOUTH_EAST, 0, 0, 8, 40);
        animator.setAnimation(Direction.NORTH_EAST, 8, 0, 8, 40);
        animator.autoFill();
    }

    public AbstractEnemy copy() {
        return new Chaser(getPosition(), mattisi);
    }

    public void init() {
        seekAngle = angle = (rand() % 4) * Util.PI / 2f + Util.PI / 4f;
        dx = cast(float) cos(angle) * SPEED;
        dy = cast(float) sin(angle) * SPEED;
        turnspeed = 0.001 + 0.003 * (cast(float)(rand() % 100) / 100.0);
    }

    public void drawEnemy(Graphics g, bool flash) {
        animator.draw(g, x, y, flash);
    }

    public void update(int delta) {
        super.update(delta);
        seekAngle = atan2(mattis.getY() - y, mattis.getX() - x);
        for (int i = 0; i < delta; i++) {
            angle = Util.toRadians(Util.lerpDegrees(Util.toDegrees(angle), Util.toDegrees(seekAngle), 0.001 + turnspeed));
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
        int spawnInterval = 2 * 60 * 1000;
        return (time % spawnInterval) / cast(float) spawnInterval * time / (10 * 60 * 1000.0f); //Peak spawn rate every 2 minutes, increasing up to 10 minutes
    }

    public int getExplosionDelay() {
        return KittenPoof.EXPLOSION_DELAY;
    }

    public void onDeath() {
    	gameInstance.world.addFrag();
        gameInstance.world.addEntity(new KittenPoof(x, y, dx, dy));
    }
}
