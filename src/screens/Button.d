module screens.Button;

import nuclear.Color;
import nuclear.Graphics;
import nuclear.IGameObject;
import screens.ButtonAction;
import screens.ButtonActionNull;
//import org.newdawn.slick.Input;

import nuclear.Game;

public class Button : IGameObject
{
	private float x;
	private float y;
	private float width;
	private float height;
	private string text;
	private bool hover = false;
	private bool pressed = false;
	private ButtonAction action;
	private bool disabled = false;
	
	public this(float xpos, float ypos, float w, float h, string s, ButtonAction a)
	{
		x = xpos;
		y = ypos;
		width = w;
		height = h;
		text = s;
		action = a;
	}
	
	public this(float xpos, float ypos, string s, ButtonAction a)
	{
		this(xpos,ypos,256+128,64,s,a);
	}
	
	public this(float xpos, float ypos, float width, float height, string s)
	{
		this(xpos,ypos,width,height,s,new ButtonActionNull());
	}
	
	public this(float xpos, float ypos, string s)
	{
		this(xpos,ypos,s,new ButtonActionNull());
	}
	
	public Button setDisabled(bool disabled)
	{
	    this.disabled = disabled;
	    return this;
	}
	
	public bool getDisabled()
	{
	    return this.disabled;
	}
	
	public void setX(float f)
	{
		this.x = f;
	}
	
	public void setY(float y)
	{
		this.y = y;
	}
	
	public float getWidth()
	{
		return width;
	}
	
	public float getHeight()
	{
		return height;
	}
	
	public float getX()
	{
		return x;
	}
	
	public float getY()
	{
		return y;
	}
	
	public void Draw(Graphics g)
	{
		g.setColor(cast(Color)0xFFFFFF9A);
		g.fillRect(x - (width - width / 2), y, width, 64);
		if(this.disabled)
		    g.setColor(cast(Color)0x1A1A1A9A);
		else if(!hover)
			g.setColor(cast(Color)0x001A339A);
		else
			g.setColor(cast(Color)0x1A334DCD);
		g.fillRect(x - (width - width / 2 - 12), y + 10, width - 20, 44);
		g.setColor(Color.white);
		Game.drawStringCentered(g, text, x, y + 20);
	}

	public void Update(int delta)
	{
	    if(this.disabled) return;
	    
		if(cursorPos[0].x >= this.x - (width - width / 4) && cursorPos[0].x < this.x + width - 16)
		{
			if(cursorPos[0].y >= this.y - 8 && cursorPos[0].y < this.y + 64 + 8)
			{
				if(hover == false)
					action.hover();
				hover = true;
			}
			else
			{
				if(hover == true)
					action.unhover();
				hover = false;
			}
		}
		else
		{
			if(hover == true)
				action.unhover();
			hover = false;
		}			
	}
	
	public void sendClick()
	{
		if(hover && !this.disabled)
			action.click();
	}

	public void init(){}
	public void reset(){}
}
