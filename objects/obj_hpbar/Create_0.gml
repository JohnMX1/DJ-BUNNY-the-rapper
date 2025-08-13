base_x = 1280;
base_y = 288;
base_xscale = 1;
base_yscale = 4;
image_xscale = 0;
image_alphaa = 0;
image_yscale = 0;
sprite_index = sprite_add("mainfiles/spr_songbox.png", 1, false, false, 64, 64);
var _nineslice = sprite_nineslice_create();

_nineslice.enabled = true;
_nineslice.left = 32;
_nineslice.right = 32;
_nineslice.top = 32;
_nineslice.bottom = 32;

_nineslice.tilemode[nineslice_center] = nineslice_mirror;

sprite_set_nineslice(sprite_index, _nineslice);

global.opphp = 50;
global.mainhp = 50;