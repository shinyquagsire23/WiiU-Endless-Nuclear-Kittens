module entity.Entity;

import nuclear.Graphics;

public interface Entity {
    void draw(Graphics g);

    void update(int delta);

    float getX();

    float getY();

    float getDx();

    float getDy();

    bool isFinished();
}
