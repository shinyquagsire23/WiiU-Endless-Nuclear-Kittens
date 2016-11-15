module nuclear.SpriteSheet;

import nuclear.Color;
import nuclear.Image;
import gx2.texture;

extern(C) int TextureManager_GetTextureId(char *path, uint path_len);
extern (C) GX2Texture *TextureManager_GetTexture(int id);


public class SpriteSheet
{
    public int textureId;
    private int width;
    private int height;
    private string path;
    
    public this(Image i, int width, int height)
    {
        this.textureId = i.textureId;
        this.width = width;
        this.height = height;
    }

    public this(string path, int width, int height)
    {
        this.textureId = TextureManager_GetTextureId(path.dup.ptr, path.length);
        this.width = width;
        this.height = height;
    }
    
    public Image getSprite(int x, int y)
    {
        return new Image(textureId, Color.white, x*width, y*height, width, height);
    }
    
    public int getWidth()
    {
        return width;
    }
    
    public int getHeight()
    {
        return height;
    }
    
    public int getImageWidth()
    {
        Image tmp = new Image(textureId);
        int imgwidth = tmp.getWidth();
        delete tmp;
        
        return imgwidth;
    }
    
    public int getImageHeight()
    {
        Image tmp = new Image(textureId);
        int imgheight = tmp.getHeight();
        delete tmp;
        
        return imgheight;
    }
}
