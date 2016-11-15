module entity.graphic.PickupGraphic;

import nuclear.Game;
import nuclear.Color;
import nuclear.Graphics;
import entity.graphic.Graphic;
import geom.Vector2f;

public class PickupGraphic : Graphic {
    private static const int MAX_AGE = 1500;
    private int totalTime = 0;
    private int age = 0;
    private int delay;

    private string pickupName;
    private Vector2f screensize;

    public this(Vector2f screensize, string pickupName, int delay) {
        super(0, 0);
        this.pickupName = pickupName;
        this.screensize = screensize;
        this.delay = delay;
    }

    public void draw(Graphics g) {
    }

    public void drawGUI(Graphics g) {
        if (totalTime <= delay) {
            return;
        }
        float factor = (age < MAX_AGE / 2 ? 1 : 1 - (age - MAX_AGE / 2) / (MAX_AGE / 2f));
        g.setColor(cast(Color)(0xFFFFFF00 | cast(ubyte)(255.0 * factor)));
        g.setFont(FONT_MENU);
        g.scale(1 / 2f, 1 / 2f);
        gameInstance.drawStringCentered(g, pickupName, (pickupName == "Translocator" ? 70 : 10) + screensize.x / 2, screensize.y - 48 - cast(int) ((1 - factor) * 48));
        g.scale(2f, 2f);
        g.setFont(FONT);
    }

    public void update(int delta) {
        totalTime += delta;
        if (totalTime > delay) {
            age += delta;
        }
    }

    public bool isFinished() {
        return age > MAX_AGE;
    }
}
