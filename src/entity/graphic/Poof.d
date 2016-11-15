module entity.graphic.Poof;

import nuclear.Color;
import nuclear.Graphics;
import entity.graphic.Graphic;
import geom.Circle;

public class Poof : Graphic {
    private static const int MAX_AGE = 450;
    private int age = 0;

    private Circle circle;

    public this(float x, float y) {
        super(x, y);
        circle = new Circle(x, y, 5);
    }

    public void draw(Graphics g) {
        //g.setColor(new Color(1, 1, 1, .5f * (1 - age / (float) MAX_AGE)));
        //g.fill(circle);
    }

    public void update(int delta) {
        circle.setRadius(circle.getRadius() + delta / 150f);
        age += delta;
    }

    public bool isFinished() {
        return age > MAX_AGE;
    }
}
