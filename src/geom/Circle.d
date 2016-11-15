module geom.Circle;

class Circle
{
    public double radius;
    private double centerX;
    private double centerY;
    
    public this(double centerX, double centerY, double radius)
    {
        this.centerX = centerX;
        this.centerY = centerY;
        this.radius = radius;
    }
    
    public double getCenterX()
    {
        return centerX;
    }
    
    public double getCenterY()
    {
        return centerY;
    }
    
    public void setCenterX(double x)
    {
        centerX = x;
    }
    
    public void setCenterY(double y)
    {
        centerY = y;
    }
    
    public double getRadius()
    {
        return radius;
    }
    
    public void setRadius(double r)
    {
        radius = r;
    }
    
    public bool intersects(Circle circle)
    {
        float distanceX = centerX - circle.getCenterX();
        float distanceY = centerY - circle.getCenterY();
        float radiusSum = circle.getRadius() + getRadius();
        return distanceX * distanceX + distanceY * distanceY <= radiusSum * radiusSum;
    }
}
