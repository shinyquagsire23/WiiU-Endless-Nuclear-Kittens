module wiiu.draw;

import gx2.texture;

extern (C):
void clean_tex_allocs();
void draw_set_global_alpha(float a);

void draw_set_global_scale(float scale);

void draw_set_global_xshift(float shift);

void draw_set_global_yshift(float shift);

void draw_set_use_globals(bool state);

void draw_set_use_global_shifts(bool state);

void draw_set_global_rot(float rad);

//TODO: I think this has reached the point where a struct would be justified.
void render_texture_partial_color(GX2Texture *render_texture, float x_pos, float y_pos, float width, float height, int partial_x, int partial_y, int partial_width, int partial_height, float r, float g, float b, float a);

void render_texture_partial(GX2Texture *render_texture, float x_pos, float y_pos, float width, float height, int partial_x, int partial_y, int partial_width, int partial_height);

void render_texture_color(GX2Texture *render_texture, float x_pos, float y_pos, float width, float height, float r, float g, float b, float a);

void render_texture(GX2Texture *render_texture, float x_pos, float y_pos, float width, float height);

void render_texture_nostretch_color(GX2Texture *render_texture, float x_pos, float y_pos, float x_corner_size, float top_y_corner_size, float bottom_y_corner_size, float width, float height, float r, float g, float b, float a);

void render_texture_nostretch(GX2Texture *render_texture, float x_pos, float y_pos, float x_corner_size, float top_y_corner_size, float bottom_y_corner_size, float width, float height);
