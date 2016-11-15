module weapon.HealthBox;

import weapon.Weapon;
import weapon.AbstractWeapon;
import entity.projectile.Projectile;
import entity.Mattis;

public class HealthBox : AbstractWeapon {
    public this(Mattis[] mattis, int power) {
        super(mattis, power, "box_health.png");
    }

    public int getFireDelay() {
        return 0;
    }

    public bool hasAmmo() {
        return true;
    }

    public Projectile[] shoot(int player) {
        return null;
    }

    public WeaponSlot getSlot() {
        return WeaponSlot.NONE;
    }

    public Weapon copy() {
        return new HealthBox(mattis, power);
    }

    public double getWeight() {
        return 1f;
    }

    public string getName() {
        return "Hugs box";
    }
}
