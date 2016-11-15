module entity.Hurtable;

import nuclear.Graphics;
import entity.CollidingEntity;
import entity.Entity;

public interface Hurtable : CollidingEntity {
    bool hurt(Entity source, int damage, float dx, float dy);

    int getHealth();

    int getDamageOnCollision();

    int getExplosionDelay();

    void onDeath();

    void drawShadow(Graphics g);
}
