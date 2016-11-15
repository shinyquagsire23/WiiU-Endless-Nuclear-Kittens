module animator.DirectionalAnimator;

import nuclear.Util;
import nuclear.Animation;
import nuclear.Color;
import nuclear.Image;
import nuclear.Graphics;
import nuclear.SpriteSheet;

import animator.Direction;
import animator.DirectionalType;

import core.stdc.stdlib;
import core.stdc.math;
import coreinit.debugout;

public class DirectionalAnimator {
    private DirectionalType type;

    private bool[8] usedDirections;
    private Animation[8] animations;
    private uint current;
    private int[] indices;

    private SpriteSheet sheet;
    private float centerX;
    private float centerY;


    public this(DirectionalType type, bool looping) {
        this.type = type;

        // Setup internals
        Direction[] validDirections = type;
        this.indices = new int[validDirections.length];
        this.current = validDirections[0];

        int i = 0;
        foreach(Direction direction ; validDirections) {
            int index = direction;
            animations[index] = new Animation(false); // Never autoupdate!
            animations[index].setLooping(looping);
            indices[i++] = index;
        }
    }

    public bool isStopped() {
        return animations[current].isStopped();
    }


    public void load(string name, int width, int height) {
        load(name, width, height, 1.0f);
    }

    public void load(string name, int width, int height, float scale) {
        bool scaled = scale != 1.0f;
        Image image = new Image(name, Color.white);

        if (scaled) {
            height = cast(int) (height * scale);
            width = cast(int) (width * scale);
            image = image.setScale(scale);
        }

        sheet = new SpriteSheet(image, width, height);
        centerX = cast(float) width / 2f;
        centerY = cast(float) height / 2f;
    }

    public void setAnimation(Direction direction, int sheetX, int sheetY, int horizontalCount, int[] durations ...) {
        validateDirection(direction);
        validateSheet();

        usedDirections[direction] = true;

        Animation animation = animations[direction];
        for (int i = 0; i < horizontalCount; i++) {
            // Default to the 'last given' if we ran out of duration values
            int duration = durations[(i < durations.length ? i : durations.length - 1)];

            animation.addFrame(sheet.getSprite(sheetX + i, sheetY), duration);
        }
    }

    public void update(int delta) {
        if(animations[current] is null || current >= 8) return;
        
        animations[current].update(delta);
    }

    public void randomRotation() {
        current = indices[rand() % indices.length];
    }

    // Return a number 0-359.99...
    private double normalizeDegrees(double angleDegrees) {
        return ((cast(int)angleDegrees % 360) + 360) % 360;
    }

    public void setRotation(double angleDegrees) {
            if(type == DirectionalType.EIGHT) // 0-45-90-135-180-225-270-315 -> 0,2,3,4,5,6,7,8
            {
                double v1 = normalizeDegrees(angleDegrees + 22.5f);
                current = cast(int) (v1 / 45);
            }
            else if(type == DirectionalType.FOUR) // 45-135-225-315 -> 0,2,4,6
            {
                double v2 = normalizeDegrees(angleDegrees + 45);
                current = 2 * cast(int) (v2 / 90);
            }
            else if(type == DirectionalType.FOUR_ROT) // 0-90-180-270 -> 1,3,5,7
            {
                double v3 = normalizeDegrees(angleDegrees);
                current = 1 + 2 * cast(int) (v3 / 90);
            }
            else if(type == DirectionalType.TWO) // 0-180 -> 0, 4
            {
                double v = normalizeDegrees(angleDegrees);
                current = 4 * cast(int) (v / 180);
            }
    }

    public void setRotationFromMovementDeltas(float dx, float dy) {
        setRotation(Util.toDegrees(atan2(-dy, -dx)));
    }

    public void draw(Graphics g, float x, float y) {
        draw(g, x, y, false);
    }

    public void draw(Graphics g, float x, float y, bool flash) {
        draw(g, x, y, flash, Color.white);
    }

    public void draw(Graphics g, float x, float y, bool flash, Color color) {
        if(animations[current] is null || current >= 8)
        {
            OSReport("missing directoin %x\n", current);
            return;
        }
    
        if (flash) {
            animations[current].drawFlash(g, x - centerX, y - centerY, 2 * centerX, 2 * centerY, color);
        } else {
            animations[current].draw(g, x - centerX, y - centerY);
        }
    }

    public void appendGlobalFrame(int sheetX, int sheetY, int duration) {
        foreach(int index ; indices) {
            animations[index].addFrame(sheet.getSprite(sheetX, sheetY), duration);
        }
    }

    private void validateDirection(Direction direction) {
        /*if (!type.getValidDirections().contains(direction)) {
            throw new RuntimeException("Invalid direction: " + direction + " given for DirectionType: " + type);
        }*/
    }

    private void validateSheet() {
        /*if (sheet == null) {
            throw new RuntimeException("Invalid operation called, no sheet loaded, use: DirectionalAnimator.load(string, I, I)");
        }*/
    }

    public void autoFill() {
            foreach(int i, bool used ; usedDirections)
            {
                if(used) continue;
                
                //Fill in missing frames based on what we have.
                if(i == Direction.NORTH_WEST && usedDirections[Direction.NORTH_EAST])
                {
                    animations[i] = new Animation(false); // Never autoupdate!
                    animations[i].setLooping(animations[Direction.NORTH_EAST].isLooping());
                    
                    for(int j = 0; j < animations[Direction.NORTH_EAST].getFrameCount(); j++)
                    {
                        animations[i].addFrame(animations[Direction.NORTH_EAST].getFrame(j).copy().setFlipped(true,false), animations[Direction.NORTH_EAST].getDuration(j));
                    }
                }
                else if(i == Direction.WEST && usedDirections[Direction.EAST])
                {
                    animations[i] = new Animation(false); // Never autoupdate!
                    animations[i].setLooping(animations[Direction.EAST].isLooping());
                    
                    for(int j = 0; j < animations[Direction.EAST].getFrameCount(); j++)
                    {
                        animations[i].addFrame(animations[Direction.EAST].getFrame(j).copy().setFlipped(true,false), animations[Direction.EAST].getDuration(j));
                    }
                }
                else if(i == Direction.SOUTH_WEST && usedDirections[Direction.SOUTH_EAST])
                {
                    animations[i] = new Animation(false); // Never autoupdate!
                    animations[i].setLooping(animations[Direction.SOUTH_EAST].isLooping());
                    
                    for(int j = 0; j < animations[Direction.SOUTH_EAST].getFrameCount(); j++)
                    {
                        animations[i].addFrame(animations[Direction.SOUTH_EAST].getFrame(j).copy().setFlipped(true,false), animations[Direction.SOUTH_EAST].getDuration(j));
                    }
                }
            }
    }
}

