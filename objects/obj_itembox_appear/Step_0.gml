if open = true {
	sus++;
	if sus = 1 {
		audio_play_sound(itembox_sound, 0, 0);
	}
	else if sus < 300 {
		global.item = irandom_range(0, 7);
		global.item_ver = irandom_range(0, 2);
	}
	else {
		if keyboard_check_pressed(vk_space) {
			if global.item < 4 {
				if global.item_ver > 0 {
					global.item_ver--;
				}
				else {
					ended = true;
				}
			}
			else {
				ended = true;
				global.item_ver = 0;
				global.spin = true;
			}
		}
	}
	if ended = false {
		if yoffset < 0 {
			yoffset += 5;
		}
	}
	else {
		if yoffset > -200 {
			yoffset -= 5;
		}
		else {
			open = false;
		}
	}
}
else {
	sus = 0;
	ended = false;
}

if global.spin = true {
	spinsus++;
	if spinsus < 600 {
		if spinspin < 180 {
			spinspin += 2;
		}
	}
	else {
		if spinspin > 0 {
			spinspin -= 2;
		}
		else {
			global.spin = false;
		}
	}
	camera_set_view_angle(view_camera[0], spinspin);
}