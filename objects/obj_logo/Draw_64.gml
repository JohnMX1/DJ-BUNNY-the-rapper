draw_sprite_ext(mic, 0, (x+micx)+(susx/2), y+(susy/2), image_xscale, image_yscale, 0, c_black, 0.5);
draw_sprite_ext(sprite_index, 0, x+susx, y+susy, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(mic, 0, (x+micx)-susx/2, y-susy/2, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(mic_text, 0, (x+micx)-susx/2, y-susy/2, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(sprite_index, 0, x-susx, y-susy, image_xscale, image_yscale, image_angle, c_white, 1);
if image_xscale_text != 10 {
	draw_sprite_ext(sprite_index_text, 0, x-susx, y-susy, image_xscale_text, image_yscale_text, 0, c_white, image_alphaa);
}