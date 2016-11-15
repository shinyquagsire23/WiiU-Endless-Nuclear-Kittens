#include "TextureManager.h"

#include <string.h>
#include <coreinit/debug.h>
#include "texture.h"

int nextTextureID = 0;
u32 textureCRCs[0x200];
GX2Texture textures[0x200];

uint32_t crc32(u32 crc, const void *buf, size_t size);

int TextureManager_GetTextureId(char *path, u32 path_len)
{
    char temp[0x200];
    memset(temp, 0, 0x200);
    strncpy(temp, path, path_len);
    
    //Check CRC store for an already loaded texture
    u32 tex_crc = crc32(0, temp, path_len);
    for(int i = 0; i < nextTextureID; i++)
    {
        if(tex_crc == textureCRCs[i])
        {
            //OSReport("Texture %s already loaded under id %x, CRC %08x\n", temp, i, tex_crc);
            return i;
        }
    }
    
    OSReport("Loading texture %s into texture store under id %x, CRC %08x\n", temp, nextTextureID, tex_crc);
    
    textureCRCs[nextTextureID] = tex_crc;
    load_img_texture(&textures[nextTextureID], temp);
    
    OSReport("Loaded texture %s into texture store under id %x, CRC %08x\n", temp, nextTextureID, textureCRCs[nextTextureID]);
    return nextTextureID++;
}

GX2Texture *TextureManager_GetTexture(int id)
{
    return &textures[id];
}
