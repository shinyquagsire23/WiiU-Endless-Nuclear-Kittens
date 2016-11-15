module nuclear.PickupSpawner;

import entity.Mattis;
import entity.Pickup;
import weapon.Weapon;
import weapon.Blaster;
import weapon.Shotgun;
import weapon.HealthBox;
import weapon.Iliad;
import weapon.FlameThrower;
import weapon.Blink;
import weapon.Nuke;

import core.stdc.stdlib;
import coreinit.debugout;

public class PickupSpawner {
    Weapon[7] weapons;

    public this(Mattis[] mattis) {
        weapons[0] = new Blaster(mattis, 1);
        weapons[1] = new Shotgun(mattis, 1);
        weapons[2] = new Nuke(mattis, 1);
        weapons[3] = new Blink(mattis, 1);
        weapons[4] = new Iliad(mattis, 1);
        weapons[5] = new FlameThrower(mattis, 150);
        weapons[6] = new HealthBox(mattis, 20);
    }

    public Pickup spawnPickup(float x, float y) {
        double totalWeight = 0.0;
        foreach(Weapon w ; weapons) {
            totalWeight += w.getWeight();
        }
        int randomIndex = -1;
        double random = (cast(float)(rand() % 100) / 100.0) * totalWeight;
        for (int i = 0; i < weapons.length; i++) {
            random -= weapons[i].getWeight();
            if (random <= 0.0) {
                randomIndex = i;
                break;
            }
        }
        Weapon weapon = weapons[randomIndex];
        return new Pickup(x, y, weapon);
    }
}
