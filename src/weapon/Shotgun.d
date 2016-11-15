module weapon.Shotgun;

import nuclear.Game;
import nuclear.Util;
import weapon.Weapon;
import entity.CollidingEntity;
import entity.Mattis;
import entity.projectile.Projectile;
import entity.projectile.ShotgunPellet;

import weapon.AbstractWeapon;

public class Shotgun : AbstractWeapon {
    private static const int MAX_LEVEL = 4;
    private static const int SPREAD_PER_POWER = 5;
    private static const int SPREAD_DECREASE_PER_OVERPOWER = 3;

    public this(Mattis[] mattis, int power) {
        super(mattis, power, "box_shotgun.png");
    }

    public int getFireDelay() {
        return 1000;
    }

    public bool hasAmmo() {
        return true;
    }

    public Projectile[] shoot(int player) {
        gameInstance.playSound(Game.SOUND_SHOTGUN);
        mattis[player].knockback(16);
        __gshared Projectile[24] result;
        for(int i = 0; i < 24; i++)
            result[i] = null;

        int bullets = 12 + 3 * Util.min(MAX_LEVEL, power);
        int cone = 55;

        float spread = cast(float) cone / bullets;

        for (int i = 0; i < bullets; i++) {
            ShotgunPellet bullet = new ShotgunPellet(mattis[player].getGunX(), mattis[player].getGunY(),mattis[player]);
            bullet.setSpeed(mattis[player].getRotation() + spread * i - cast(float) cone / 2, 0.8f);
            result[i] = bullet;
        }
        return result;
    }

    public WeaponSlot getSlot() {
        return WeaponSlot.SECONDARY;
    }

    public void setPower(int power) {
        this.power = Util.min(MAX_LEVEL, power);
    }

    public Weapon copy() {
        return new Shotgun(mattis, power);
    }

    public string toString() {
        return "Shotgun ";// + power;
    }

    public double getWeight() {
        return 4f;
    }
}
