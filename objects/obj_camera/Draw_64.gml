//draw_sprite_ext(obj_player.spr, obj_player.sus, 320, 410, 5, 5, 0, c_white, 1);

if global.lap = 0 {
	redd = 0;
	greend = 0;
	blued = 255;
}
else if global.lap = 1 {
	redd += (255 - redd) * 0.2;
}
else if global.lap = 2 {
	blued -= (blued - 1) * 0.2;
}
draw_set_font(fnt_normal);
draw_sprite_ext(spr_flag, 0, 0-stgtext, 470, 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_lap, global.lap, 64-stgtext, 470, 1, 1, 0, make_color_rgb(redd, greend, blued), 1);
if obj_player.start = true {
	draw_text_ext_transformed((-400)+stgtext, 32, global.stage.name, 25, 500, 1, 1, 0);
}
else {
	if !audio_is_playing(global.stage.song) and obj_player.finish = false {
		audio_play_sound(global.stage.song, 0, 0);
	}
}
draw_text(32-stgtext, 32, obj_player.spd);
draw_text(32-stgtext, 64, obj_player.mx_spd);
draw_text(32-stgtext, 96, obj_player.du);