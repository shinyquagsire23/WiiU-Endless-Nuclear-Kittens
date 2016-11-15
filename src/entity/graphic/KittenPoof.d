module entity.graphic.KittenPoof;

import animator.Direction;
import animator.DirectionalAnimator;
import animator.DirectionalType;
import entity.graphic.Graphic;
import nuclear.Graphics;

import core.stdc.stdlib;

public class KittenPoof : Graphic {
    public const int EXPLOSION_DELAY = 200;

    private string[] images = [
            "kittensplode_01.png",
            "kittensplode_02.png",
            "kittensplode_03.png",
            "kittensplode_04.png"
    ];
    private DirectionalAnimator animator;

    public this(float x, float y, float dx, float dy) {
        super(x, y);

        animator = new DirectionalAnimator(DirectionalType.TWO, false);
        animator.load(images[rand() % images.length], 64, 64);
        animator.setAnimation(Direction.EAST, 0, 0, 5, 40);
        animator.autoFill();

        animator.setRotationFromMovementDeltas(dx, dy);
    }

    public void draw(Graphics g) {
        animator.draw(g, x, y);
    }

    public void update(int delta) {
        animator.update(delta);
    }

    public bool isFinished() {
        return animator.isStopped();
    }
}
