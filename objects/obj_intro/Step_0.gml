if keyboard_check_pressed(vk_enter) {
	ui = true;
}
if ui = true {
	ang += 0.5;
	camera_set_view_size(view_camera[0], camera_get_view_width(view_camera[0])-8, camera_get_view_height(view_camera[0])-4);
	if camera_get_view_height(view_camera[0]) < 480 {
		var uip = instance_create_depth(1366/2, 768, depth, obj_loading);
		uip.rm = rm_song;
	}
}
camera_set_view_angle(view_camera[0], ang);
camera_set_view_pos(view_camera[0], room_width-camera_get_view_width(view_camera[0]), room_height-camera_get_view_height(view_camera[0]));