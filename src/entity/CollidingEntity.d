module entity.CollidingEntity;

import entity.Entity;
import geom.Circle;

public interface CollidingEntity : Entity {
    Circle getCollider();
}
