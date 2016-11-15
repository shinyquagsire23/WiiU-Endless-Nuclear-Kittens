module weapon.Iliad;

import nuclear.Game;
import nuclear.Util;
import weapon.Weapon;
import weapon.AbstractWeapon;
import entity.CollidingEntity;
import entity.Entity;
import entity.Mattis;
import entity.projectile.OdysseyRocket;
import entity.projectile.Projectile;

public class Iliad : AbstractWeapon {
    private static const int MAX_LEVEL = 16;
    private static const int SPREAD_PER_POWER = 10;

    public this(Mattis[] mattis, int power) {
        super(mattis, power, "box_homing.png");
    }

    public int getFireDelay() {
        return Util.max(1000, 3000 - power * 350);
    }

    public bool hasAmmo() {
        return true;
    }

    public Projectile[] shoot(int player) {
        gameInstance.playSound(Game.SOUND_ROCKETLAUNCH);
        __gshared Projectile[18] result;
        for(int i = 0; i < 18; i++)
            result[i] = null;

        int bullets = 2 + Util.min(MAX_LEVEL, power);
        int cone = 20 + Util.min(MAX_LEVEL, power) * SPREAD_PER_POWER;

        float spread = cast(float) cone / bullets;

        for (int i = 0; i < bullets; i++) {
            OdysseyRocket bullet = new OdysseyRocket(mattis[player].getGunX(), mattis[player].getGunY(),mattis[player]).setSpeed(mattis[player].getRotation() + spread * i - cast(float) cone / 2, 0.5f);
            result[i] = bullet;
        }
        return result;
    }

    public WeaponSlot getSlot() {
        return WeaponSlot.SECONDARY;
    }

    public Weapon copy() {
        return new Iliad(mattis, power);
    }

    public void setPower(int power) {
        this.power = Util.min(power, MAX_LEVEL);
    }

    public string toString() {
        return getName();// + " " + power;
    }

    public string getName() {
        return "Homeros";
    }

    public double getWeight() {
        return 3f;
    }
}
