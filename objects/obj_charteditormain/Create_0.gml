global.loaded_mod = "mainfiles";
global.song = "MegaX";
sprite_index = sprite_add(string(global.loaded_mod)+"/spr_songbox.png", 1, false, false, 0, 64);
var scl = sprite_nineslice_create();

scl.enabled = true;
scl.left = 32;
scl.right = 32;
scl.top = 32;
scl.bottom = 32;
scl.tilemode[nineslice_left] = nineslice_mirror;
scl.tilemode[nineslice_right] = nineslice_mirror;
scl.tilemode[nineslice_top] = nineslice_mirror;
scl.tilemode[nineslice_bottom] = nineslice_mirror;
scl.tilemode[nineslice_center] = nineslice_mirror;

sprite_set_nineslice(sprite_index, scl);
image_xscale = 1000;
image_yscale = 2;

background = layer_get_id("Background");

bgbackground = layer_background_get_id(background);

bg = sprite_add(string(global.loaded_mod)+"/spr_bg.png", 1, false, false, 0, 0);
layer_background_sprite(bgbackground, bg);
layer_background_htiled(bgbackground, true);
layer_background_stretch(bgbackground, true);
Before_Song();
Start_Song();
Section_Notes(1);
GetPaused();
saved_x = xstart;

start_time = current_time;
scroll_speed = 1.2;