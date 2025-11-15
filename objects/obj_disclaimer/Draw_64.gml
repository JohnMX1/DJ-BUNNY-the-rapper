//window_set_position(global.window_originalx+(640/2), global.window_originaly+(480/2));
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(global.Font_Glow);
draw_text_ext_transformed(1366/2, 768/2, "This game has such effects that can affect people with epilepsy and similar problems,\nIn case of having these problems, proceed with caution.\n\nPress ENTER to continue", 18, 1200/2, 2.1, 2.1, 0);
draw_set_font(global.Font);
draw_set_color(c_white);
draw_text_ext_transformed(1366/2, 768/2, "This game has such effects that can affect people with epilepsy and similar problems,\nIn case of having these problems, proceed with caution.\n\nPress ENTER to continue", 18, 1200/2, 2, 2, 0);
draw_sprite_ext(spr_black, 0, 0, 0, 25, 25, 0, c_white, sus);
if keyboard_check_pressed(vk_enter) {
	sus += 0.01;
}
if sus >= 1 {
	room_goto(rm_intro);
}
else if sus >= 0.01 {
	sus += 0.01;
}