module geom.Vector2f;

import core.stdc.math;

public class Vector2f
{
    public float x;
    public float y;
    
    public this(float x, float y)
    {
        this.x = x;
        this.y = y;
    }
    
    public float getX()
    {
        return x;
    }
    
    public float getY()
    {
        return y;
    }
    
    public Vector2f add(Vector2f a)
    {
        this.x += a.x;
        this.y += a.y;
        
        return this;
    }
    
    public Vector2f copy()
    {
        return new Vector2f(this.x, this.y);
    }
    
    public Vector2f normalise()
    {
        float w = sqrt(x*x+y*y);
        return new Vector2f(x / w, y / w); 
    }
    
    public float distanceSquared(Vector2f other) {
		float dx = other.getX() - getX();
		float dy = other.getY() - getY();
		
		return cast(float) (dx*dx)+(dy*dy);
	}
}
