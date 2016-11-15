module weapon.AbstractWeapon;

import nuclear.Util;
import entity.Mattis;
import weapon.Weapon;
import nuclear.Color;
import nuclear.SpriteSheet;

public abstract class AbstractWeapon : Weapon {
    protected Mattis[] mattis;
    protected int power;
    SpriteSheet pickupSheet;

    public this(Mattis[] mattis, int power, string pickupSheetPath) {
        this.mattis = mattis;
        setPower(power);
        pickupSheet = new SpriteSheet(pickupSheetPath, 38, 59);
    }

    public int getPower() {
        return power;
    }

    public void setPower(int power) {
        this.power = power;
    }

    public SpriteSheet getPickupSheet() {
        return pickupSheet;
    }

    public string getName() {
        return this.toString();
    }
}
