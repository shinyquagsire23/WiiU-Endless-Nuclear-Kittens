module entity.enemy.Boss;

import nuclear.Game;
import nuclear.Util;
import nuclear.MultiControls;
import animator.Direction;
import animator.DirectionalAnimator;
import animator.DirectionalType;
import entity.enemy.AbstractEnemy;
import entity.Mattis;

import nuclear.Graphics;
import geom.Rectangle;
import geom.Vector2f;

import core.stdc.math;
import core.stdc.stdlib;

public class Boss : AbstractEnemy {
    private DirectionalAnimator animator;

    private float speed = 1 / 16f;
    private Mattis mattis;
    private Mattis[] mattisi;
    private double seekAngle;
    private double angle;
    private double turnspeed;

    public this(Vector2f startPos, Mattis[] mattis2) {
        super(startPos, 32, 2500);
        int target = rand() % MultiControls.getNumPlayers();
        while(mattis2[target].isDead())
        	target = rand() % MultiControls.getNumPlayers();
        	
        this.mattis = mattis2[target];
        this.mattisi = mattis2;

        animator = new DirectionalAnimator(DirectionalType.FOUR_ROT, true);
        animator.load("kitten_bot.png", 78, 80);

        animator.setAnimation(Direction.SOUTH_EAST, 0, 0, 8, 40);
        animator.setAnimation(Direction.NORTH_EAST, 0, 1, 2, 40);
        animator.autoFill();

        speed += cast(float) ((cast(float)(rand() % 100) / 100.0) * 1 / 10f);
    }

    public AbstractEnemy copy() {
        return new Boss(getPosition(), mattisi);
    }

    public void init() {
        seekAngle = angle = (rand() % 4) * Util.PI / 2f + Util.PI / 4f;
        dx = cast(float) cos(angle) * speed;
        dy = cast(float) sin(angle) * speed;
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
        dx = cast(float) cos(angle) * speed;
        dy = cast(float) sin(angle) * speed;

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
        return 0;
    }

    protected int getFlashDuration() {
        return 50;
    }

    public int getDamageOnCollision() {
        return 40 + cast(int) ((cast(float)(rand() % 100) / 100.0) * 21);
    }

    public void onDeath()
    {
    	gameInstance.world.addBossFrag();
    }
}
