var k = mv_get_data(AudioIDinMV,audio_sound_get_track_position(AudioID),audio_sound_length(AudioID), 4096)
for(var i = 0; i < array_length(k);i+=10){
	var length = k[i]
	draw_set_color(c_black);
	draw_rectangle(i-2,room_height,i+7,(room_height - length*10)-2,0);
	draw_rectangle(room_width-i+2,0,room_width-i-7,(0 + length*10)+2,0);
	draw_set_color(c_blue);
	draw_rectangle(i,room_height,i+5,room_height - length*10,0);
	draw_set_color(c_orange);
	draw_rectangle(room_width-i,0,room_width-i-5,0 + length*10,0);
	draw_set_color(c_white);
}