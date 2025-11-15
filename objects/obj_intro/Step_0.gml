if keyboard_check_pressed(vk_enter) {
	//ui = true;
	if blackscr = false {
		if !instance_exists(obj_xmb) instance_create_depth(room_width/2, room_height/2, -9999, obj_xmb);
	}
	else {
		blackscr = false;
	}
}
if ui = true {
	ang += 3;
	camera_set_view_size(view_camera[0], camera_get_view_width(view_camera[0])-32, camera_get_view_height(view_camera[0])-32);
	if camera_get_view_height(view_camera[0]) < 480 {
		var uip = instance_create_depth(1366/2, 768, depth, obj_loading);
		uip.rm = rm_song;
	}
}
if current_time > (saved_time + 1000) {
	blackscr = false;
}
camera_set_view_angle(view_camera[0], ang);
camera_set_view_pos(view_camera[0], room_width/2-camera_get_view_width(view_camera[0])/2, room_height/2-camera_get_view_height(view_camera[0])/2);

if sos < 7000 {
	sos += 5;
}

if !audio_is_playing(global.sng) audio_play_sound(global.sng, 0, 1);