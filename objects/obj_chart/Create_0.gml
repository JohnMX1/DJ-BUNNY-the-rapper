image_yscale = 0;
image_xscale = 0;
image_alpha = 0;
image_alphaa = 0;
section = 1;
stop = false;
tlinexscale[0] = 1;
tlineyscale[0] = 1;
tlinexscale[1] = 1;
tlineyscale[1] = 0.5;
linexscale[0] = 1;
lineyscale[0] = 1;
linexscale[1] = 1;
lineyscale[1] = 0.5;
momentx[0] = 0;
momenty[0] = 0;
momentx[1] = 0;
momenty[1] = 0;
start_animation = true;
animation = true;
Characters_List();
base_x = 704;
base_y = 160;
base_xscale = 7.75;
base_yscale = 2.25;
canpass[0] = true;
canpass[1] = true;
notes_existing[0] = 0;
notes_existing[1] = 0;

anim_cur = 0;
anim_sec = 0;
anim_sus = 0;
audio_play_sound(snd_3, 0, 0);
animx1 = 0;
animy1 = 0;
animx2 = 0;
animy2 = 0;
animx3 = 0;
animy3 = 0;
animx4 = 0;
animy4 = 0;
animx5 = 0;
animy5 = 0;
alphaanim[0] = 0;
alphaanim[1] = 0;
alphaanim[2] = 0;
alphaanim[3] = 0;
alphaanim[4] = 0;

sprite_index = sprite_add("mainfiles/spr_songbox.png", 1, false, false, 64, 64);
spr_setas = sprite_add("mainfiles/spr_notes_normal.png", 4, false, false, 32, 32);
spr_press = sprite_add("mainfiles/spr_inputs.png", 6, false, false, 32, 32);

#region Inputs
input[0] = vk_left;
input[1] = vk_down;
input[2] = vk_up;
input[3] = vk_right;

inputboxx[0] = 0;
inputboxx[1] = 0;
inputboxline[0] = 1;
inputboxline[1] = 1;
#endregion
