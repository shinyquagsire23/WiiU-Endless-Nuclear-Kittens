module entity.graphic.MissileTrail;

import animator.Direction;
import animator.DirectionalAnimator;
import animator.DirectionalType;
import nuclear.Graphics;
import entity.graphic.Graphic;

public class MissileTrail : Graphic {
    private DirectionalAnimator animator;

    private int startDelay = 50;
    private int age = 0;

    public this(float x, float y) {
        super(x, y);

        animator = new DirectionalAnimator(DirectionalType.TWO, false);
        animator.load("rocketsmoketrail.png", 32, 32);

        animator.setAnimation(Direction.EAST, 0, 0, 13, 40);
        animator.autoFill();

        animator.randomRotation();
    }

    public void draw(Graphics g) {
        if (age > startDelay) {
            animator.draw(g, x, y);
        }
    }

    public void update(int delta) {
        age += delta;
        if (age > startDelay) {
            animator.update(delta);
        }
    }

    public bool isFinished() {
        return animator.isStopped();
    }
}
