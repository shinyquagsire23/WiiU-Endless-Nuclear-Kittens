module geom.Line;

import geom.Vector2f;

public class Line
{
    public float x1;
    public float x2;
    public float y1;
    public float y2;
    
    public this(float x1, float y1, float x2, float y2, bool distance = false)
    {
        this.x1 = x1;
        this.x2 = x2 + (distance ? x1 : 0.0);
        this.y1 = y1;
        this.y2 = y2 + (distance ? y1 : 0.0);
    }
    
    public Vector2f intersect(Line other, bool idk)
    {
        float out_x, out_y;
        float s1_x, s1_y, s2_x, s2_y; 
        s1_x = x2 - x1; 
        s1_y = x2 - y1; 
        s2_x = other.x2 - other.x1; 
        s2_y = other.y2 - other.y1; 
        float s, t; 
        s = (-s1_y * (x1 - other.x1) + s1_x * (y1 - other.y1)) / (-s2_x * s1_y + s1_x * s2_y); 
        t = ( s2_x * (y1 - other.y1) - s2_y * (x1 - other.x1)) / (-s2_x * s1_y + s1_x * s2_y); 
        if (s >= 0 && s <= 1 && t >= 0 && t <= 1) 
        { 
            // Collision detected 
            out_x = x1 + (t * s1_x);
            out_y = y1 + (t * s1_y);
            return new Vector2f(out_x, out_y); 
        } 
        return null; 
    }
}
