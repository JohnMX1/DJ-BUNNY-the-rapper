if keyboard_check(vk_left) {
	x += 32;
	if pause = false {
		GetPaused();
	}
}
if keyboard_check(vk_right) {
	x -= 32;
	if pause = false {
		GetPaused();
	}
}
//if image_xscale > 10 {
	x = clamp(x, -128*(image_xscale-10), 32);
/*}
else {
	x = clamp(x, 32, 32);
}*/
layer_x(background, x/5);

if keyboard_check_pressed(vk_control) {
	room_restart();
	audio_stop_all();
}
if keyboard_check_pressed(vk_delete) {
	ini_open("mainfiles/sections/songs/"+string(global.song)+"/easy.djbc");
	ini_section_delete("1sectionopp");
	ini_section_delete("1sectionmain");
	ini_close();
}
if keyboard_check_pressed(vk_space) {
	if pause = true {
		Unpause();
	}
	else {
		GetPaused();
	}
}


if pause = false {
	var tempo_passado = current_time - start_time;
	var beat_duration = 60000 / global.bpm;
	var beats = tempo_passado / beat_duration;
	x = saved_x - ((beats * 50) * scroll_speed);
}
else {
	start_time = current_time;
	saved_x = x;
}

