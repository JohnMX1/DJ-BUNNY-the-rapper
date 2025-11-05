image_yscale += 5;
if image_yscale >= 80 {
	instance_create_depth(1366/2, 768, depth, obj_load);
	room_goto(rm);
	audio_stop_all();
}
sus++;