module nuclear.Graphics;

import geom.Rectangle;
import nuclear.Image;
import nuclear.Color;
import nuclear.Game;
import nuclear.Util;
import gx2.texture;
import coreinit.debugout;

import wiiu.draw;
import wiiu.font;

extern (C) GX2Texture *TextureManager_GetTexture(int id);

public const int FONT = 16;
public const int FONT_MENU = 24;
public const int FONT_LARGE = 32;
public const int[5] FONT_SCORES = [8, 14, 20, 26, 32];

enum GraphicsMode
{
    MODE_ADD,
    MODE_NORMAL,
}

class Graphics
{
    int transform = 0;
    __gshared float[0x200] x;
    __gshared float[0x200] y;
    __gshared float[0x200] scaleX;
    __gshared float[0x200] scaleY;
    float rotation = 0.0f;
    __gshared int[0x200] fontSize;
    __gshared Color[0x200] color;
    private Image solid;
    
    float[0x200] r,g,b,a;
    
    Game game;
    
    public this(Game game)
    {
        this.game = game;
        solid = new Image("solid.png");
        
        for(int i = 0; i < 0x200; i++)
        {
            x[i] = 0;
            y[i] = 0;
            scaleX[i] = 1.0f;
            scaleY[i] = 1.0f;
            fontSize[i] = 16;
            color[i] = Color.white;
            
            r[i] = 1.0f;
            g[i] = 1.0f;
            b[i] = 1.0f;
            a[i] = 1.0f;
        }
        
        rotation = 0.0f;
        rotate(0.0f, 0.0f, 0.0f);
    }
    
    public void resetTransform()
    {
        for(int i = 0; i < 0x200; i++)
        {
            x[i] = 0;
            y[i] = 0;
            scaleX[i] = 1.0f;
            scaleY[i] = 1.0f;
            fontSize[i] = 16;
            color[i] = Color.white;
            
            r[i] = 1.0f;
            g[i] = 1.0f;
            b[i] = 1.0f;
            a[i] = 1.0f;
        }
        transform = 0;
        
        rotation = 0.0f;
        rotate(0.0f, 0.0f, 0.0f);
    }

    public void pushTransform()
    {
        transform++;
        x[transform] = x[transform-1];
        y[transform] = y[transform-1];
        scaleX[transform] = scaleX[transform-1];
        scaleY[transform] = scaleY[transform-1];
        fontSize[transform] = fontSize[transform-1];
        color[transform] = color[transform-1];
        
        r[transform] = r[transform-1];
        g[transform] = g[transform-1];
        b[transform] = b[transform-1];
        a[transform] = a[transform-1];
    }
    
    public void popTransform()
    {
        transform--;
        
        setColor(color[transform]);
        
        rotation = 0.0f;
        draw_set_global_rot(rotation);
    }
    
    public Color getColor()
    {
        return this.color[transform];
    }
    
    public void rotate(float x, float y, float deg)
    {
        rotation -= Util.toRadians(deg);
        draw_set_global_rot(rotation);
    }
    
    public void translate(float x, float y)
    {
        this.x[transform] += x;
        this.y[transform] += y;
    }
    
    public void scale(float x, float y)
    {
        this.scaleX[transform] *= x;
        this.scaleY[transform] *= y;
    }
    
    public void setColor(Color c)
    {
        this.color[transform] = c;
        r[transform] = cast(float)(cast(float)((this.color[transform] >> 24) & 0xFF)/ 0xFF);
        g[transform] = cast(float)(cast(float)((this.color[transform] >> 16) & 0xFF) / 0xFF);
        b[transform] = cast(float)(cast(float)((this.color[transform] >> 8) & 0xFF) / 0xFF);
        a[transform] = cast(float)(cast(float)(this.color[transform] & 0xFF) / 0xFF);
    }
    
    public void fillRect(float x, float y, float width, float height)
    {        
        this.texture(x,y,width,height, solid, true);
    }
    
    public void texture(Rectangle rect, Image i, bool fit)
    {
        GX2Texture *tex = TextureManager_GetTexture(i.textureId);
        render_texture_partial_color(tex, (rect.getX()*this.scaleX[transform]+this.x[transform]), game.REALSCREENSIZE.y-((rect.getY()*this.scaleY[transform]+this.y[transform]))-rect.getHeight()*this.scaleY[transform], rect.getWidth()*this.scaleX[transform], rect.getHeight()*this.scaleY[transform],i.x_sub+(i.x_flip?i.width_sub:0), i.y_sub+(i.y_flip?i.height_sub:0), i.width_sub*(i.x_flip?-1:1), i.height_sub*(i.y_flip?-1:1),r[transform],g[transform],b[transform],a[transform]);
    }
    
    public void texture(float x, float y, float width, float height, Image i, bool unk)
    {
        GX2Texture *tex = TextureManager_GetTexture(i.textureId);
        render_texture_partial_color(tex, (x*this.scaleX[transform]+this.x[transform]), game.REALSCREENSIZE.y-((y*this.scaleY[transform]+this.y[transform]))-height*this.scaleY[transform], width*this.scaleX[transform], height*this.scaleY[transform],i.x_sub+(i.x_flip?i.width_sub:0), i.y_sub+(i.y_flip?i.height_sub:0), i.width_sub*(i.x_flip?-1:1), i.height_sub*(i.y_flip?-1:1), r[transform],g[transform],b[transform],a[transform]);
    }
    
    public void drawImage(Image i, float x, float y, Color c = Color.white)
    {
        Color oldColor = this.color[transform];
        setColor(c);
    
        GX2Texture *tex = TextureManager_GetTexture(i.textureId);
        render_texture_partial_color(tex, (x*this.scaleX[transform]+this.x[transform]), game.REALSCREENSIZE.y-((y*this.scaleY[transform]+this.y[transform]))-i.height_sub*this.scaleY[transform], i.width_sub*this.scaleX[transform], i.height_sub*this.scaleY[transform],i.x_sub+(i.x_flip?i.width_sub:0), i.y_sub+(i.y_flip?i.height_sub:0), i.width_sub*(i.x_flip?-1:1), i.height_sub*(i.y_flip?-1:1), r[transform],g[transform],b[transform],a[transform]);
        
        setColor(oldColor);
    }
    public void drawImage(Image i, int x, int y)
    {
        GX2Texture *tex = TextureManager_GetTexture(i.textureId);
        render_texture_partial_color(tex, (x*this.scaleX[transform]+this.x[transform]), game.REALSCREENSIZE.y-((y*this.scaleY[transform]+this.y[transform]))-i.height_sub*this.scaleY[transform], i.width_sub*this.scaleX[transform], i.height_sub*this.scaleY[transform],i.x_sub+(i.x_flip?i.width_sub:0), i.y_sub+(i.y_flip?i.height_sub:0), i.width_sub*(i.x_flip?-1:1), i.height_sub*(i.y_flip?-1:1), r[transform],g[transform],b[transform],a[transform]);
    }
    
    public void drawString(string str, float x, float y)
    {
        font_set_color(this.color[transform]);
        
        font_draw_string_height((x*this.scaleX[transform]+this.x[transform]), (game.REALSCREENSIZE.y-this.fontSize[transform]*this.scaleY[transform]-y*this.scaleY[transform]-this.y[transform]), cast(int)(this.fontSize[transform]*this.scaleX[transform]), cast(char*)str.ptr);
    }
    
    public void setFont(int size)
    {
        this.fontSize[transform] = size;
    }
    
    public void setDrawMode(GraphicsMode mode){}
}
