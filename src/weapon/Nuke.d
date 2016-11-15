module weapon.Nuke;

import nuclear.Util;
import weapon.Weapon;
import weapon.AbstractWeapon;
import entity.Entity;
import entity.CollidingEntity;
import entity.Mattis;
import entity.NukeExplosion;
import entity.projectile.Projectile;

public class Nuke : AbstractWeapon {

    private static const int LESS_THAN_NINE_THOUSAND = 1001;

    private static const int MAX_POWER = 5;
    public this(Mattis[] mattis, int power) {
        super(mattis, power, "box_nuke.png");
    }

    public int getFireDelay() {
        return 1000;
    }

    public bool hasAmmo() {
        return power > 0;
    }

    public Projectile[] shoot(int player) {
        power--;
        
        __gshared Entity[1] result;
        result[0] = new NukeExplosion(mattis[player].getX(), mattis[player].getY(), LESS_THAN_NINE_THOUSAND, 2);
        return cast(Projectile[])result; //This is bad... but it works.
    }

    public void setPower(int power) {
        this.power = Util.min(MAX_POWER, power);
    }

    public WeaponSlot getSlot() {
        return WeaponSlot.PANIC;
    }

    public Weapon copy() {
        return new Nuke(mattis, power);
    }

    public string toString() {
        return getName();// + " (" + power + ")";
    }

    public string getName() {
        return "Nuke";
    }

    public double getWeight() {
        return 1f;
    }
}
