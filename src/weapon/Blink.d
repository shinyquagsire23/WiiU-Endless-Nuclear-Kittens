module weapon.Blink;

import nuclear.Game;
import nuclear.Util;
import weapon.Weapon;
import weapon.AbstractWeapon;
import entity.Entity;
import entity.CollidingEntity;
import entity.Explosion;
import entity.Mattis;
import entity.graphic.BlinkExit;
import entity.graphic.BlinkParticle;
import entity.graphic.BlinkPortal;
import entity.projectile.Projectile;
import geom.Line;
import geom.Rectangle;
import geom.Vector2f;

import core.stdc.math;
import core.stdc.stdlib;

public class Blink : AbstractWeapon {
    private static const int RANGE = 250;
    private static const int MAX_POWER = 5;
    private Rectangle collider;

    public this(Mattis[] mattis, int power) {
        super(mattis, power, "box_teleport.png");
    }

    private Rectangle getCollider() {
        if (collider !is null) return collider;

        Rectangle bounds = gameInstance.world.getBounds();

        float radius = mattis[0].getCollider().getRadius();
        float minX = bounds.getMinX() + radius;
        float minY = bounds.getMinY() + radius;

        collider = new Rectangle(minX, minY, bounds.getWidth() - 2 * radius, bounds.getHeight() - 2 * radius);

        return collider;
    }

    public int getFireDelay() {
        return 6000 - power * 1000;
    }

    public bool hasAmmo() {
        return true;
    }

    public Projectile[] shoot(int player) {
        gameInstance.playSound(Game.SOUND_TELEPORT);
        // Project Mattis forward and explode
        float x = mattis[player].getX();
        float y = mattis[player].getY();
        
        __gshared Projectile[1] result;

        float rotation = mattis[player].getRotation();
        float dx = RANGE * cast(float) cos(Util.PI + Util.toRadians(rotation));
        float dy = RANGE * cast(float) sin(Util.PI + Util.toRadians(rotation));

        float targetX;
        float targetY;
        if (!getCollider().contains(x + dx, y + dy)) {
            Line line = new Line(x, y, dx, dy, true);

            Vector2f intersection = getIntersection(line);
            targetX = intersection.x;
            targetY = intersection.y;
            delete intersection;
        } else {
            targetX = x + dx;
            targetY = y + dy;
        }

        mattis[player].setX(targetX);
        mattis[player].setY(targetY);

        spawnBlinkParticles(x, y, targetX, targetY);
        gameInstance.world.addEntity(new BlinkPortal(x, y, targetX, targetY));
        gameInstance.world.addEntity(new BlinkExit(targetX, targetY));
        
        result[0] = cast(Projectile)new Explosion(targetX, targetY, 150, 8, 0, 0);

        return result;
    }

    private void spawnBlinkParticles(float x, float y, float targetX, float targetY) {
        float deltaX = (targetX - x) / 100f;
        float deltaY = (targetY - y) / 100f;

        int delta = 40;
        for (int i = 0; i < 4; i++) {
            int dx = (rand() % delta) - 20;
            int dy = (rand() % delta) - 20;
            int start = 10 + (rand() % 30);
            int end = 10 + (rand() % 30);
            gameInstance.world.addEntity(new BlinkParticle(x + dx + deltaX * start, y + dy + deltaY * start, targetX + dx - deltaX * end, targetY + dy - deltaY * end, (100f - start - end) / 100f));
        }
    }

    private Vector2f getIntersection(Line line) {
        float minX = collider.getMinX();
        float minY = collider.getMinY();
        float maxX = collider.getMaxX();
        float maxY = collider.getMaxY();

        // Top
        Line topLine = new Line(minX, minY, maxX, minY);
        Vector2f top = line.intersect(topLine, true);
        if (top !is null) return top;
        delete topLine;
        
        // Bottom
        Line bottomLine = new Line(minX, maxY, maxX, maxY);
        Vector2f bottom = line.intersect(bottomLine, true);
        if (top != bottom) return bottom;
        delete bottom;
        delete bottomLine;
        
        // Left
        Line leftLine = new Line(minX, minY, minX, maxY);
        Vector2f left = line.intersect(leftLine, true);
        if (top != left) return left;
        delete left;
        delete leftLine;
        
        // Right
        Line rightLine = new Line(maxX, minY, maxX, maxY);
        Vector2f right = line.intersect(rightLine, true);
        if (top != right) return right;
        delete right;
        delete rightLine;
        
        Vector2f result = top.copy();
        delete top;
        
        return result; //TODO: free this?
    }

    public void setPower(int power) {
        this.power = Util.min(MAX_POWER, power);
    }

    public WeaponSlot getSlot() {
        return WeaponSlot.SECONDARY;
    }

    public Weapon copy() {
        return new Blink(mattis, power);
    }

    public string toString() {
        return getName();// + " " +power;
    }

    public string getName() {
        return "Translocator";
    }

    public double getWeight() {
        return 3f;
    }
}
