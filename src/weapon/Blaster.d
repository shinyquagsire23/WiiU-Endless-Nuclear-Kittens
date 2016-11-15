module weapon.Blaster;

import nuclear.Game;
import weapon.Weapon;
import weapon.AbstractWeapon;
import entity.CollidingEntity;
import entity.Mattis;
import entity.projectile.Bullet;
import entity.projectile.Projectile;

import nuclear.Util;

public class Blaster : AbstractWeapon {
    private const float SPACING = 11f;

    public this(Mattis[] mattis, int power) {
        super(mattis, power, "box_blaster.png");
    }

    public int getFireDelay() {
        return 100;
    }

    public bool hasAmmo() {
        return true;
    }

    public Projectile[] shoot(int player) {
        gameInstance.playSound(Game.SOUND_BLASTER, 1.0f, 0.1f);
        __gshared Projectile[3] result;
        for(int i = 0; i < 3; i++)
            result[i] = null;
        int bullets = power;

        float middle = cast(float) (bullets - 1) / 2f * SPACING;

        for (int i = 0; i < bullets; i++) {
            float offset = SPACING * i - middle;
            Projectile bullet = new Bullet(mattis[player].getGunX(offset), mattis[player].getGunY(offset),mattis[player]).setSpeed(mattis[player].getRotation(), 0.8f);
            result[i] = bullet;
        }

        return result;
    }

    public WeaponSlot getSlot() {
        return WeaponSlot.PRIMARY;
    }

    public string toString() {
        return getName();// + " " + power;
    }

    public string getName() {
        return "Blaster";
    }

    public void setPower(int power) {
        this.power = Util.min(4, power);
    }

    public Weapon copy() {
        return new Blaster(mattis, power);
    }

    public double getWeight() {
        return 1f;
    }
}
