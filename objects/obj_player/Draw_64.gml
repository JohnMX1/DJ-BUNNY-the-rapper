if count = 1 {
	draw_sprite_ext(spr_number, 3, 320, 240, ((wii-60)/5), ((wii-60)/5), 0, c_blue, apla);
}
else if count = 2 {
	draw_sprite_ext(spr_number, 2, 320, 240, ((wii-120)/5), ((wii-120)/5), 0, c_purple, apla);
}
else if count = 3 {
	draw_sprite_ext(spr_number, 1, 320, 240, ((wii-180)/5), ((wii-180)/5), 0, c_red, apla);
}
else if count = 4 {
	draw_sprite_ext(spr_go, 0, 320, 240, ((wii-240)/5), ((wii-240)/5), 0, c_green, apla);
}