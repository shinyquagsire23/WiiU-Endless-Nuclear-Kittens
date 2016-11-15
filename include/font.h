#ifndef FONT_H
#define FONT_H

#define FONT_COLOR_BLACK 0xFF4B4B4B
#define FONT_COLOR_WHITE 0xFFFFFFFF
#define FONT_COLOR_GRAY 0xFF808080

void font_set_color(int color);
void font_load_data();
void font_init_texture();
void font_draw_string_height(float x, float y, int height, char* string);
void font_draw_string(float x, float y, float scale, char* string);
int font_measure_string_width_height(int height, char *string);
int font_measure_string_width(float scale, char *string);
int font_get_height(float scale);

#endif
