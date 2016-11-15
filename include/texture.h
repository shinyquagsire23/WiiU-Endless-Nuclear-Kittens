#ifndef TEXTURE_H
#define TEXTURE_H

#include <wut_types.h>
#include <coreinit/debug.h>

#include <stdio.h>

#include <gx2/texture.h>
#include <gx2/mem.h>
#include <gx2/enum.h>
#include <gx2/shaders.h>
#include "gx2_ext.h"

#include "memory.h"

typedef struct tga_hdr tga_hdr;
struct __attribute__((__packed__)) tga_hdr
{
    u8 idlength;
    u8 colormaptype;
    u8 datatype;
    u16 colormaporigin;
    u16 colormaplength;
    u8 colormapdepth;
    u16 x_origin;
    u16 y_origin;
    u16 width;
    u16 height;
    u8 bpp;
    u8 imagedescriptor;
};

void load_tga(GX2Texture *texture, void* img_data);
bool load_img_texture(GX2Texture *texture, char *path);
bool load_img_texture_mask(GX2Texture *texture, char *path, char *mask);
void free_img_texture(GX2Texture *texture);

#endif
