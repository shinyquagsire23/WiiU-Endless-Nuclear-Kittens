module entity.projectile.OdysseyRocket;

import nuclear.Game;
import nuclear.Util;
import animator.Direction;
import animator.DirectionalAnimator;
import animator.DirectionalType;
import entity.Entity;
import entity.Mattis;
import entity.graphic.Graphic;
import entity.graphic.MissileTrail;
import entity.graphic.Poof;
import entity.projectile.BaseProjectile;

import nuclear.Graphics;
import geom.Circle;
import geom.Vector2f;

import core.stdc.stdlib;
import core.stdc.math;

public class OdysseyRocket : BaseProjectile {
    private static const int SIZE = 6;
    private int damage;
    private DirectionalAnimator animator;

    private double seekDegrees;
    private double angleDegrees;
    private double turnspeed;
    private float speed;

    private int target;

    private int time;

    Vector2f lastTargetPos;

    private int expirationTime = 1200;

    private int trailDelay = 10;
    private int timeUntilTrail = 10;
    private Mattis owner;

    public this(float x, float y, Mattis owner) {
        super(x, y, new Circle(x, y, SIZE / 2));
        this.owner = owner;
        turnspeed = (cast(float)(rand() % 100) / 100.0) * 0.02f;
        lastTargetPos = new Vector2f(-1, -1);
        damage = 34;
        turnspeed = 0;

        animator = new DirectionalAnimator(DirectionalType.EIGHT, true);
        animator.load("missile.png", 42, 42);

        animator.setAnimation(Direction.SOUTH, 0, 0, 2, 20);
        animator.setAnimation(Direction.SOUTH_EAST, 2, 0, 2, 20);
        animator.setAnimation(Direction.EAST, 4, 0, 2, 20);
        animator.setAnimation(Direction.NORTH_EAST, 6, 0, 2, 20);
        animator.setAnimation(Direction.NORTH, 8, 0, 2, 20);
        animator.autoFill();

        expirationTime += cast(int) ((cast(float)(rand() % 100) / 100.0) * 1000);
    }

    public void update(int delta) {
        super.update(delta);

        if (time > 100 && time < 200) {
            target = gameInstance.world.getClosestEnemy(this, 300);
        }

        if (gameInstance.world.getEnemy(target) !is null) {
            seekDegrees = Util.toDegrees(atan2(y - gameInstance.world.getEnemy(target).getY(), x - gameInstance.world.getEnemy(target).getX()));
            for (int i = 0; i < delta; i++) {
                angleDegrees = Util.lerpDegrees(angleDegrees, seekDegrees, turnspeed);
            }
            dx = -cast(float) cos(Util.toRadians(angleDegrees)) * speed;
            dy = -cast(float) sin(Util.toRadians(angleDegrees)) * speed;
            Vector2f targetPos = new Vector2f(gameInstance.world.getEnemy(target).getX(), gameInstance.world.getEnemy(target).getY());
            if (targetPos.x == lastTargetPos.x && targetPos.y == lastTargetPos.y) {
                expirationTime -= delta;
            }
            lastTargetPos = targetPos;
        }
        else
        {
            target = gameInstance.world.getClosestEnemy(this, 300);
        }
        turnspeed = Util.fmin(0.9f, turnspeed + delta / 80000.0f);
        speed = Util.fmin(speed + delta / 5000.0f, 1.5f);
        time += delta;

        timeUntilTrail -= delta;
        if (timeUntilTrail < 0) {
            gameInstance.world.addEntity(new MissileTrail(x, y));
            timeUntilTrail = trailDelay;
        }

        animator.setRotation(angleDegrees);
        animator.update(delta);
    }

    public void draw(Graphics g) {
        animator.draw(g, x, y);
    }

    public OdysseyRocket setSpeed(float angleDegrees, float speed) {
        this.speed = speed * 0.3f + cast(float) (cast(float)(rand() % 100) / 100.0) * 0.5f;
        this.angleDegrees = seekDegrees = angleDegrees;
        dx = -cast(float) cos(Util.toRadians(angleDegrees)) * speed;
        dy = -cast(float) sin(Util.toRadians(angleDegrees)) * speed;

        return this;
    }

    public int getDamage() {
        return damage;
    }

    public bool isFinished() {
        return time >= expirationTime;
    }

    public Graphic onPoof() {
        return new Poof(x, y);
    }

	public int getOwnerNum()
	{
		return owner.getPlayerNum();
	}
}
