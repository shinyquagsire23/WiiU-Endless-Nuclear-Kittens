module weapon.FlameThrower;

import nuclear.Game;
import weapon.Weapon;
import weapon.AbstractWeapon;
import entity.CollidingEntity;
import entity.Mattis;
import entity.projectile.Projectile;
import entity.projectile.Flame;

import coreinit.debugout;

public class FlameThrower : AbstractWeapon {

    public this(Mattis[] mattis, int power) {
        super(mattis, power, "box_flamethrower.png");
    }

    public int getFireDelay() {
        return 20;
    }

    public bool hasAmmo() {
        return power > 0;
    }

    public Projectile[] shoot(int player) {
        __gshared Projectile[1] result;
        //Game.playSound(Game.SOUND_FLAMETHROWER, 1.0f, 0.03f);
        power--;
        Flame flame = new Flame(mattis[player].getGunX(), mattis[player].getGunY(), mattis[player].getRotation(), mattis[player]);

        result[0] = flame;
        return result;
    }

    public WeaponSlot getSlot() {
        return WeaponSlot.SECONDARY;
    }

    public Weapon copy() {
        return new FlameThrower(mattis, power);
    }

    public string toString() {
        return getName();// + " [" + power + "]";
    }

    public string getName() {
        return "Flamer";
    }

    public double getWeight() {
        return 1f;
    }
}
