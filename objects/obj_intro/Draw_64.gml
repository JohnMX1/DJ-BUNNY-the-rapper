draw_sprite_ext(spr_crt_effect, 0, 0, 0, 1.1, 1.1, 0, c_white, 1);
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
if blackscr = true {
	draw_sprite_ext(spr_black, 0, 0, 0, 25, 20, 0, c_white, 1);
	draw_set_font(global.Font);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(1366/2, 768/2, "From the guy that uses the same menu song for 5 years");
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}