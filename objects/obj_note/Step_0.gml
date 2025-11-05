if image_index >= 0 and image_index <= 3 {
	sprite_index = global.note_sprite;
}
x = obj_chart.x+xstart;
if x < -64 {
	instance_destroy();
}
image_yscale += (1 - image_yscale) * 0.2;