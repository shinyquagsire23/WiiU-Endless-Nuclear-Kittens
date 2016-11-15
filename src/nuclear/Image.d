module nuclear.Image;

import nuclear.Color;
import gx2.texture;

extern(C) int TextureManager_GetTextureId(char *path, uint path_len);
extern (C) GX2Texture *TextureManager_GetTexture(int id);

public class Image
{
    private Color color;
    public int textureId;
    
    public int x_sub;
    public int y_sub;
    public int width_sub;
    public int height_sub;
    public bool x_flip = false;
    public bool y_flip = false;
    
    public this(string path, Color c = Color.white, int x_sub = 0, int y_sub = 0, int width_sub = -1, int height_sub = -1)
    {
        this(TextureManager_GetTextureId(path.dup.ptr, path.length), c, x_sub, y_sub, width_sub, height_sub);
    }
    
    public this(int textureId, Color c = Color.white, int x_sub = 0, int y_sub = 0, int width_sub = -1, int height_sub = -1)
    {
        this.color = c;
        this.textureId = textureId;
        GX2Texture *tex = TextureManager_GetTexture(textureId);
        
        this.x_sub = x_sub;
        this.y_sub = y_sub;
        if(width_sub < 0)
            this.width_sub = tex.surface.width;
        else
            this.width_sub = width_sub;
        
        if(height_sub < 0)
            this.height_sub = tex.surface.height;
        else
            this.height_sub = height_sub;
    }
    
    public Image copy()
    {
        return new Image(textureId, color, x_sub, y_sub, width_sub, height_sub).setFlipped(x_flip, y_flip);
    }
    
    public int getWidth()
    {
        GX2Texture *tex = TextureManager_GetTexture(textureId);
        return tex.surface.width;
    }
    
    public int getHeight()
    {
        GX2Texture *tex = TextureManager_GetTexture(textureId);
        return tex.surface.height;
    }
    
    public Image setFlipped(bool x, bool y)
    {
        this.x_flip = x;
        this.y_flip = y;
        
        return this;
    }
    
    public Image setScale(float scale)
    {
        return this;
    }
}
