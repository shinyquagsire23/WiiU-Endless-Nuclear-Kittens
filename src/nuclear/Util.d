module nuclear.Util;

import core.stdc.math;
/*import org.newdawn.slick.Color;
import org.newdawn.slick.Image;
import org.newdawn.slick.SlickException;
import org.newdawn.slick.SpriteSheet;*/
import geom.Circle;
import geom.Rectangle;

public class Util
{
    public static const float PI = 3.141592;
    public static double toRadians(double degrees)
    {
        return degrees * (PI / 180);
    }
    
    public static double toDegrees(double radians)
    {
        return radians / (PI / 180);
    }
    
    public static int max(int x, int y)
    {
        return x > y ? x : y;
    }
    
    public static int min(int x, int y)
    {
        return x < y ? x : y;
    }
    
    public static float fmax(float x, float y)
    {
        return x > y ? x : y;
    }
    
    public static float fmin(float x, float y)
    {
        return x < y ? x : y;
    }

    /*public static SpriteSheet loadSpriteSheet(Image image, int width, int height) 
    {
        SpriteSheet sheet = new SpriteSheet(image, width, height);
        sheet.setFilter(Image.FILTER_NEAREST);
        return sheet;
    }

    public static SpriteSheet loadSpriteSheet(String name, int width, int height) 
    {
        
            SpriteSheet sheet = new SpriteSheet(name, width, height, Color.white);
            sheet.setFilter(Image.FILTER_NEAREST);
            return sheet;
    }*/

    public static double lerpDegrees(double start, double end, double amount) 
    {
        double difference = fabs(end - start);
        if (difference > 180) {
            if (end > start) {
                start += 360;
            } else {
                end += 360;
            }
        }
        double value = (start + ((end - start) * amount));
        double rangeZero = 360;
        if (value >= 0 && value <= 360) {
            return value;
        }
        return (value % rangeZero);
    }

    public static bool contains(Rectangle r, Circle c) {
        if (c.getCenterX() - r.getX() < c.radius || c.getCenterY() - r.getY() < c.radius || r.getMaxX() - c.getCenterX() < c.radius || r.getMaxY() - c.getCenterY() < c.radius) {
            return false;
        }
        return true;
    }

    /*public static Image rotate(Image image, int angle) {
        image.rotate(angle);
        return image;
    }*/

    public static int getDirectionForRotation(double rotation) {
        return cast(int) (((cast(int) rotation + 360) % 360 + 45 / 2f) / 45) % 8;
    }
}
