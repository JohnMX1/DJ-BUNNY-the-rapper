if mxepart = true {
	mxesus += 0.5;
	if mxesus >= 14 {
		mxesus = 14;
	}
	if !audio_is_playing(MxStart6) {
		mxepart = false;
	}
	if keyboard_check_pressed(vk_enter) {
		mxepart = false;
		textpart = true;
		instance_create_depth(0, 0, -9999, obj_flash);
		if room_last != rm_menu {
			audio_play_sound(global.menu, 0, 1);
		}
	}
}
else {
	if mxesus > 0 {
		mxesus -= 0.5;
	}
	else if mxesus = 0 {
		mxesus = -1;
		textpart = true;
		instance_create_depth(0, 0, -9999, obj_flash);
		if room_last != rm_menu {
			audio_play_sound(global.menu, 0, 1);
		}
	}
}
if textpart = true {
	sus++;
	if sus >= 240 {
		sus = 0;
		if text_amount < 2 {
			text_amount += 1;
		}
		else {
			textpart = false;
			intropart = true;
			instance_create_depth(352, -640, -9999, obj_logo);
			instance_create_depth(0, 0, -9999, obj_flash);
		}
	}
	if keyboard_check_pressed(vk_enter) {
		textpart = false;
		intropart = true;
		instance_create_depth(352, -640, -9999, obj_logo);
		instance_create_depth(0, 0, -9999, obj_flash);
	}
}
if intropart = true {
	image_alpha = 0;
}