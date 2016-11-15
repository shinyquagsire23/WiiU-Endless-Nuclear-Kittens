module geom.Rectangle;

public class Rectangle
{
    private double x;
    private double y;
    private double width;
    private double height;
    
    public this(float x, float y, float width, float height)
    {
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
    }
    
    public double getX()
    {
        return x;
    }
    
    public double getY()
    {
        return y;
    }
    
    public double getMinX()
    {
        return x;
    }
    
    public double getMinY()
    {
        return y;
    }
    
    public double getMaxX()
    {
        return x+width;
    }
    
    public double getMaxY()
    {
        return y+height;
    }
    
    public double getWidth()
    {
        return width;
    }
    
    public double getHeight()
    {
        return height;
    }
    
    public double getCenterX()
    {
        return width/2;
    }
    
    public double getCenterY()
    {
        return height/2;
    }
    
    bool contains(float x, float y)
    {
        return(x >= this.x && y >= this.y && x <= this.x+this.width && y <= this.y+this.height);
    }
}
