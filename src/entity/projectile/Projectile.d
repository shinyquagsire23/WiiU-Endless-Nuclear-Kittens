module entity.projectile.Projectile;

import entity.CollidingEntity;
import entity.graphic.Graphic;

public interface Projectile : CollidingEntity {
    int getDamage();
    int getOwnerNum();
    Graphic onPoof();
}
