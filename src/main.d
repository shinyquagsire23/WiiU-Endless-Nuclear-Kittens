module main;

import coreinit.core;
import coreinit.time;
import coreinit.debugout;
import coreinit.thread;
import coreinit.foreground;
import coreinit.systeminfo;
import proc_ui.procui;
import sysapp.launch;

import gx2.mem;
import gx2.draw;
import gx2.constants;
import gx2.swap;
import gx2.clear;
import gx2.event;
import gx2.state;
import gx2.surface;
import gx2.texture;
import gx2.display;
import gx2.context;
import gx2.shaders;
import gx2.registers;

import vpad.input;

import nuclear.Game;
import nuclear.Graphics;
import wiiu.draw;
import wiiu.font;

extern(C) __gshared void* _Dmodule_ref;
extern(C) bool app_running();

//Wii U C imports
extern(C)
{
    int platform_init();
    void prepare_render_drc();
    void prepare_render_tv();
    void post_render_drc();
    void post_render_tv();
    void vpad_read();
    
    extern __gshared bool initialized;
}

extern(C) int main() {
    platform_init();
    return _Dmain();
}

void render(Graphics g, Game game, bool screen)
{
    draw_set_use_globals(false);
    //render_texture(&textureBackdrop, 0.0f, 0.0f, (float)TARGET_WIDTH, (float)TARGET_HEIGHT);
    draw_set_use_globals(true);
    
    //We have to mess with depth for the particles so they don't draw over things
    GX2SetDepthOnlyControl(true, true, GX2CompareFunction.GX2_COMPARE_FUNC_LESS);
    //Particles?
    GX2SetDepthOnlyControl(false, false, GX2CompareFunction.GX2_COMPARE_FUNC_NEVER);
    
    //Render screen
    game.render(g);
}

int _Dmain()
{
    Game game = new Game();
    Graphics g = new Graphics(game);

    OSTime last_time = OSGetSystemTime();
    while(app_running())
    {
        if(!initialized) continue;
    
        OSTime time = OSGetSystemTime();
        int delta = cast(int)((cast(double)(time - last_time) * 1000.0f) / (OSGetSystemInfo().clockSpeed / 4));
        last_time = time;

        game.update(delta);
        
        vpad_read();
        
        //Clean up from last render
        clean_tex_allocs();

        

        //Render TV
        prepare_render_tv();
        g.resetTransform();
        render(g, game, true);
        post_render_tv();
        
        //Render DRC
        //prepare_render_drc();
        g.resetTransform();
        //render(g, game, false);
        post_render_drc(); //This just copies the TV color buffer over
        
        GX2SwapScanBuffers();
        GX2Flush();
        GX2DrawDone();
        
        GX2SetTVEnable(true);
        GX2SetDRCEnable(true);

        GX2WaitForVsync();
    }
    
    OSReport("Exiting application...");
    return 0;
}
