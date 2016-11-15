module weapon.Weapon;

import entity.projectile.Projectile;
import nuclear.SpriteSheet;

static enum WeaponSlot {PRIMARY, SECONDARY, PANIC, NONE}

public interface Weapon {
    int getFireDelay();

    bool hasAmmo();

    Projectile[] shoot(int player);

    SpriteSheet getPickupSheet();

    WeaponSlot getSlot();

    void setPower(int units);

    int getPower();

    Weapon copy();

    double getWeight();

    string getName();
}
