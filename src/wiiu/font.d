module wiiu.font;

import nuclear.Color;

extern (C):

void font_set_color(Color color);
void font_load_data();
void font_init_texture();
void font_draw_string_height(float x, float y, int height, char* str);
void font_draw_string(float x, float y, float scale, char *str);
int font_measure_string_width_height(int height, char *str);
int font_measure_string_width(float scale, char *str);
int font_get_height(float scale);
