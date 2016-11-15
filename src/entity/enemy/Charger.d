module entity.enemy.Charger;

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

public class Charger : AbstractEnemy {
    private DirectionalAnimator nuclearAnimator;
    private DirectionalAnimator animator;
    private DirectionalAnimator current;

    private Mattis mattis;
    private Mattis[] mattisi;
    private double angle;
    private bool charged = false;
    private int time = 0;
    private float speed = 0.1f;
    private bool seenMattis;

    private static const int CHARGING_TIME = 2000;
    private static const int KAMIKAZE_TIME = 1000;

    public this(Vector2f startPos, Mattis[] mattis2) {
        super(startPos, 48 / 4, 40);
        int target = rand() % MultiControls.getNumPlayers();
        while(mattis2[target].isDead())
        	target = rand() % MultiControls.getNumPlayers();
        this.mattis = mattis2[target];
        this.mattisi = mattis2;

        animator = new DirectionalAnimator(DirectionalType.FOUR_ROT, true);
        animator.load("kitten_05.png", 48, 48);

        animator.setAnimation(Direction.SOUTH_EAST, 0, 0, 8, 40);
        animator.setAnimation(Direction.NORTH_EAST, 8, 0, 8, 40);
        animator.autoFill();

        nuclearAnimator = new DirectionalAnimator(DirectionalType.FOUR_ROT, true);
        nuclearAnimator.load("kitten_nuclear.png", 48, 48);
        nuclearAnimator.setAnimation(Direction.SOUTH_EAST, 0, 0, 8, 40);
        nuclearAnimator.setAnimation(Direction.NORTH_EAST, 8, 0, 8, 40);
        nuclearAnimator.autoFill();

        current = animator;
    }

    public AbstractEnemy copy() {
        return new Charger(getPosition(), mattisi);
    }

    public void init() {
        reset();
    }

    public void drawEnemy(Graphics g, bool flash) {
        float x = this.x;
        float y = this.y;
        if (time > 0 && time < CHARGING_TIME) {
            //flash = true;

            float i = 48 / 4f;
            float scale = i * cast(float) (time) / cast(float) CHARGING_TIME;

            float offsetX = cast(float) (i / 2f - (cast(float)(rand() % 100) / 100.0) * scale);
            float offsetY = cast(float) (i / 5f - (cast(float)(rand() % 100) / 100.0) * scale);

            x = x - offsetX;
            y = y - offsetY;
        }

        current.draw(g, x, y, flash);
    }

    public void update(int delta) {
        super.update(delta);

        // OMG A MATTIS! MURDER!
        if (!seenMattis && mattis.getPosition().distanceSquared(getPosition()) < 200 * 200) {
            seenMattis = true;
            dx = 0;
            dy = 0;
            current = nuclearAnimator;
        }

        // As soon as we see mattis, start charging
        if (seenMattis) {
            time += delta;
        }

        // Reset everything (including time) to 0 if we've done our attack
        if (time > CHARGING_TIME + KAMIKAZE_TIME) {
            reset();
        } else if (time > CHARGING_TIME) {
            // Mark ourselves charged and hone in onto mattis
            if (!charged) {
                charged = true;
                // lock angle to wherever mattis is
                angle = atan2(mattis.getY() - y, mattis.getX() - x);
            }
            speed = Util.fmin(speed + delta / 300.0f, 0.6f);
            dx = cast(float) cos(angle) * speed;
            dy = cast(float) sin(angle) * speed;
        } else {
            // If we're not charging -- always point at mattis
            angle = atan2(mattis.getY() - y, mattis.getX() - x);
        }

        // Inverse the angle for the proper rotation from the pov of the kitten
        current.setRotation(180 + Util.toDegrees(angle));

        // Walk towards mattis.
        if (!seenMattis) {
            dx = cast(float) cos(angle) * speed / 3f;
            dy = cast(float) sin(angle) * speed / 3f;
        }

        current.update(delta);
    }

    private void reset() {
        charged = false;
        speed = 0.1f;
        dx = 0;
        dy = 0;
        time = 0;
        seenMattis = false;
        current = animator;
    }

    public void collisionX(Rectangle bounds, float x, float newX) {
        reset();
        this.x = x;
    }

    public void collisionY(Rectangle bounds, float y, float newY) {
        reset();
        this.y = y;
    }

    public float getSpawnChance(int time) {
        return time / (10 * 60 * 1000.0f); //Linear increase up till full spawn rate at 10 minutes
    }

    public int getExplosionDelay() {
        return KittenPoof.EXPLOSION_DELAY;
    }

    public void onDeath() {
    	gameInstance.world.addFrag();
        gameInstance.world.addEntity(new KittenPoof(x, y, cast(float) cos(angle), cast(float) sin(angle)));
    }
}
