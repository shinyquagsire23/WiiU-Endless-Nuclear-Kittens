module entity.graphic.BlinkPortal;

import animator.Direction;
import animator.DirectionalAnimator;
import animator.DirectionalType;
import nuclear.Graphics;

import entity.graphic.Graphic;

public class BlinkPortal : Graphic {
    // We can do this -- we're just having this used once
    private static __gshared DirectionalAnimator ANIMATOR;

    public this(float x, float y, float targetX, float targetY) {
        super(x, y);
        if(ANIMATOR is null)
        {
            ANIMATOR = new DirectionalAnimator(DirectionalType.EIGHT, false);
            ANIMATOR.load("blink_01.png", 78, 80);
            ANIMATOR.appendGlobalFrame(0, 0, 40);
            ANIMATOR.setAnimation(Direction.EAST, 1, 0, 1, 40);
            ANIMATOR.setAnimation(Direction.NORTH_EAST, 2, 0, 1, 40);
            ANIMATOR.autoFill();

            ANIMATOR.setRotationFromMovementDeltas(targetX - x, targetY - y);
        }
    }

    public void draw(Graphics g) {
        ANIMATOR.draw(g, x, y);
    }

    public void update(int delta) {
        ANIMATOR.update(delta);
    }

    public bool isFinished() {
        return ANIMATOR.isStopped();
    }
}
