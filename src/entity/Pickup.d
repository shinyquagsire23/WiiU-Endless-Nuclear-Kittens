module entity.Pickup;

import nuclear.Game;
import weapon.Weapon;
import weapon.HealthBox;
import nuclear.Animation;
import nuclear.Color;
import nuclear.Graphics;
import nuclear.Util;
import geom.Circle;

import entity.BaseEntity;
import entity.Mattis;
import coreinit.debugout;

public class Pickup : BaseEntity {
    private Weapon weapon;

    private static const int DURATION = 5000;
    private static const int FADE_TIME = 250;

    private int time = 0;

    private Animation anim;

    public this(float x, float y, Weapon weapon) {
        super(x, y, new Circle(x, y, 16));
        
        this.weapon = weapon.copy();
        anim = new Animation(weapon.getPickupSheet(), 40);
        anim.setLooping(true);
        
        //anim.setAutoUpdate(false);
    }

    public void update(int delta) {
        time += delta;
        anim.update(delta);
    }

    public void draw(Graphics g) {
        float alpha = 1;
        if (time > DURATION - FADE_TIME) {
            alpha = 1 - (time - (DURATION - FADE_TIME)) / cast(float) FADE_TIME;
        }
        anim.draw(g, x - 38 / 2, y - 59 / 2, cast(Color)(0xFFFFFF00 | cast(ubyte)(alpha * 0xFF)));
    }

    public string getPickupString() {
        return weapon.getName();
    }

    public void onPickup(Mattis mattis) {
        //gameInstance.playSound(Game.SOUND_PICKUP, 1.0f, 0.5f);

        if (cast(HealthBox)weapon) {
            mattis.setHealth(Util.min(100, mattis.getHealth() + weapon.getPower()));
            return;
        }

        WeaponSlot slot = weapon.getSlot();
        if (!mattis.hasWeapon(slot)) {
            mattis.setWeapon(weapon.copy());
        } else {
            Weapon currentWeapon = mattis.getWeapon(slot);
            if (currentWeapon.getName() == weapon.getName()) {
                currentWeapon.setPower(weapon.getPower() + currentWeapon.getPower());
            } else {
                OSReport("new weapon!");
                mattis.setWeapon(weapon.copy());
            }
        }
    }

    public bool isFinished() {
        return time >= DURATION;
    }
}
