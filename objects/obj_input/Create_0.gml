sus = 0;
sec = 0.45;
sac=0;
image_alpha = 0;
image_xscale = 0;
image_speed = 0;
sprite_index = sprite_add("mainfiles/spr_inputs.png", 6, false, false, 64, 64);

if place_meeting(x, y, obj_note) {
	image_index = 1;
	global.opphp -= 1;
	global.mainhp += 1;
}
else {
	image_index = 2;
	global.opphp += 1;
	global.mainhp -= 1;
}

//input[0] = vk_left;
//input[1] = vk_down;
//input[2] = vk_up;
//input[3] = vk_right;
// (72+(40*line_spaces[0]+40)*lineyscale[0]) + (40*(inputboxline[1]-1))*lineyscale[1]