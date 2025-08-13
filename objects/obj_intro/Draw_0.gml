draw_self();
draw_set_halign(fa_center);
draw_set_font(fnt_intro);
if mxesus != -1 {
	draw_sprite_ext(spr_mxe, mxesus, 683, 384, 5, 5, 0, c_white, 1);
}
if textpart = true {
	draw_text_ext_transformed(683, 384, text[text_amount], 24, 400, 2, 2, 0);
}
if keyboard_check_pressed(vk_space) game_restart();