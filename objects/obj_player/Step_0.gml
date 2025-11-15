get_player_variables(global.player);
/*
look_dir -= (window_mouse_get_x() - window_get_width() /2) / 10;


window_mouse_set(window_get_width() / 2, window_get_height()/2);
*/
if !place_meeting(x, y, obj_map) {
	if z = -2 {
		mx_spd = global.max_spd/2;
	}
}
else {
	mx_spd = global.max_spd;
}


var hinput = keyboard_check(vk_right) - keyboard_check(vk_left);
var vinput = keyboard_check(ord("W")) - keyboard_check(ord("S"));

if keyboard_check_direct(vk_tab) {
	game_end();
}
if keyboard_check_direct(vk_shift) {
	game_restart();
}

if keyboard_check_pressed(vk_alt) and boost = false {
	boost = true;
}

if apla > 0 {
	apla -= 0.025;
}
if start = true {
	if look_dir > 0 {
		look_dir -= 2;
	}
	else {
		look_dir = 0;
	}
	if look_dist > 1000 and sdist = -1 {
		look_dist -= 55;
	}
	else {
		if sdist = -1 {
			sdist = 0;
		}
		look_dist = 1000+sdist;
	}
	if sdistcount = 1 {
		if sdist < 250 {
			sdist += 50;
		}
	}
	else if sdistcount = 2 {
		if sdist < 500 {
			sdist += 50;
		}
	}
	else if sdistcount = 3 {
		if sdist < 1000 {
			sdist += 50;
		}
	}
	else if sdistcount = 4 {
		if sdist > 0 {
			sdist -= 100;
		}
	}
	if look_pitch = -35 and look_dir = 0 and sdist >= 0 {
		wii += 1;
		if wii = 60 {
			count = 1;
			apla = 1;
			sdistcount = 1;
			instance_create_depth(320, 240, -9999, obj_mxe);
			audio_play_sound(snd_31, 0, 0);
			audio_play_sound(snd_31, 0, 0);
			audio_play_sound(snd_31, 0, 0);
			audio_play_sound(snd_31, 0, 0);
		}
		else if wii = 120 {
			count = 2;
			apla = 1;
			sdistcount = 2;
			audio_play_sound(snd_21, 0, 0);
			audio_play_sound(snd_21, 0, 0);
			audio_play_sound(snd_21, 0, 0);
			audio_play_sound(snd_21, 0, 0);
		}
		else if wii = 180 {
			count = 3;
			apla = 1;
			sdistcount = 3;
			audio_play_sound(snd_11, 0, 0);
			audio_play_sound(snd_11, 0, 0);
			audio_play_sound(snd_11, 0, 0);
			audio_play_sound(snd_11, 0, 0);
		}
		else if wii = 240 {
			start = false;
			if room = rm_intro {
				boost = true;
			}
			count = 4;
			apla = 1;
			sdistcount = 4;
			audio_play_sound(snd_go1, 0, 0);
			audio_play_sound(snd_go1, 0, 0);
			audio_play_sound(snd_go1, 0, 0);
			audio_play_sound(snd_go1, 0, 0);
		}
	}
	
	if player_direction > 90 {
		player_direction -= 1/35;
	}
	action = 1;
	fake_x = x;
	fake_y = y;
}
else {
	//if room = rm_course1 {
		wii += 1;
		if finish = false {
			fake_x = x;
			fake_y = y;
			if keyboard_check(vk_left) {
				if drift = false {
					if spdi < spd {
						spdi += 0.5;
					}
					else {
						spdi -= 0.5;
					}
					if !keyboard_check(ord("X")){
						look_dir += spd/25;
					}
					else {
						look_dir += 10/25;
					}
					if player_direction < 3 {
						player_direction += 1/5;
					}
					else {
						player_direction = 3;
					}
					if action = 0 {
						player_direction = 0;
					}
					action = 1;
				}
			}
			else{
				if !keyboard_check(vk_right) and drift = false {
					if player_direction > 0 {
						player_direction += 1/5;
					}
					if spdi > 0 {
						spdi -= 5;
					}
					else {
						spdi = 0;
					}
				}	
			}
			if keyboard_check(vk_right) {
				if drift = false {
					if spdi < spd {
						spdi += 2;
					}
					else {
						spdi -= 2;
					}
					if !keyboard_check(ord("X")){
						look_dir -= spd/25;
					}
					else {
						look_dir -= 10/25;
					}
					if player_direction < 3 {
						player_direction += 1/5;
					}
					else {
						player_direction = 3;
					}
					if action = 1 {
						player_direction = 0;
					}
					action = 0;
				}
			}
			else{
				if !keyboard_check(vk_left) and drift = false {
					if player_direction > 0 {
						player_direction -= 1/5;
					}
					if spdi > 0 {
						spdi -= 5;
					}
					else {
						spdi = 0;
					}
				}
			}
			if spd > global.max_spd {
				spd -= (spd - global.max_spd) * 0.2;
			}

			if keyboard_check(ord("X")) and drift = false and !keyboard_check(ord("Z")){
				x -= dcos(look_dir)*global.max_spd/2;
				y += dsin(look_dir)*global.max_spd/2;
				if keyboard_check(vk_left) {
					action = 2;
				}
				if keyboard_check(vk_right) {
					action = 3;
				}
			}
			else {
				if action = 2 or action = 3 {
					action = 0;
				}
			}
			if keyboard_check(ord("Z")) and drift = false and !keyboard_check(ord("X")) {
				if spd >= 1 {
					x += dcos(look_dir)*spd;
					y -= dsin(look_dir)*spd;
				}
				if spd < mx_spd {
					spd += global.acceleration;
				}
				else if spd > mx_spd {
					spd -= global.acceleration;
				}
				else {
					spd = mx_spd;
				}
			}
			else{
				if spd > 0.00 and drift = false {
					spd -= global.acceleration;
					x += dcos(look_dir)*spd;
					y -= dsin(look_dir)*spd;
				}
				else {
					spd = 0;
				}
				if player_direction > 1 and drift = false and !keyboard_check(ord("X")){
					player_direction = 1;
				}
			}


			//smoke
			if keyboard_check(ord("Z")) {
			}


			if keyboard_check_pressed(ord("C")) and spd > 5 {
				//hinputi = keyboard_check(vk_right) - keyboard_check(vk_left);
				if jump = false {
					//if hinputi != 0 {
						jump = true;
						op = 10;
					//}
				}
			}
			image_xscale = 2;
			image_yscale = 2;


			if drift = true and !keyboard_check(ord("C")) {
				drift = false;
				if !place_meeting(x, y, obj_map) {
					if z = -2 {
						spd = global.drift/2;
					}
					else {
						spd = global.drift;
					}
				}
				else {
					spd = global.drift;
				}
				hinputi = 0;
			}

			if jump = true {
				hinputi = keyboard_check(vk_right) - keyboard_check(vk_left);
				if au = 0 {
					if eu > 0 {
						z -= eu;
						eu -= 2*global.weight;
					}
					else {
						au = 1;
					}
				}
				else {
					eu += 2*global.weight;
					z += eu;
					if z >= -2 {
						jump = false;
						eu = 25;
						au = 0;
						z = -2;
						drift = true;
					}
				}
			}
			else {
			}

			if drift = true {
				if !place_meeting(x, y, obj_map) {
					if z = -2 {
						x += dcos(look_dir)*(global.drift/du);
						y -= dsin(look_dir)*(global.drift/du);
					}
					else {
						x += dcos(look_dir)*(global.drift);
						y -= dsin(look_dir)*(global.drift);
					}
					if du < 2 {
						du += 0.01;
					}
				}
				else {
					x += dcos(look_dir)*(global.drift/du);
					y -= dsin(look_dir)*(global.drift/du);
					if du > 1 {
						du -= 0.02;
					}
					else {
						du = 1;
					}
				}
				if op > 0 {
					op -= 0.5;
				}
				if hinputi = -1 {
					look_dir += global.drift/50;
					if player_direction < 6 {
						player_direction += 0.2;
					}
					else {
						player_direction = 6;
					}
					action = 1;
				}
				else if hinputi = 1 {
					look_dir -= global.drift/50;
					if player_direction < 6 {
						player_direction += 0.2;
					}
					else {
						player_direction = 6;
					}
					action = 0;
				}
				else {
					drift = false;
				}
				look_dist += (1200 - look_dist) * 0.025;
				look_pitch -= (look_pitch - (-40)) * 0.025;
			}
			else {
				if boost = false {
					look_dist -= (look_dist - 1000) * 0.025;
					look_pitch += ((-30) - look_pitch) * 0.025;
				}
				if !keyboard_check(vk_right) and !keyboard_check(vk_left) {
					if player_direction > 0 {
						player_direction -= 1/8;
					}
				}
			}

			if look_dir > 360 {
				look_dir = 0;
			}
			if look_dir < 0 {
				look_dir = 360;
			}
		
			if boost = true {
				cnt++;
				if cnt = global.boosttime {
					cnt = 0;
					boost = false;
					spd = global.max_spd;
				}
				x += dcos(look_dir)*(global.max_spd);
				y -= dsin(look_dir)*(global.max_spd);
				look_dist += (2000 - look_dist) * 0.025;
				look_pitch -= (look_pitch - (-40)) * 0.025;
			}
			else {
				if drift = false {
					look_dist -= (look_dist - 1000) * 0.025;
					look_pitch += ((-30) - look_pitch) * 0.025;
				}
			}
		
		}
		else {
			x += dcos(look_dir)*global.max_spd;
			y -= dsin(look_dir)*global.max_spd;
		}
	}
	if place_meeting(x, y, obj_bumper) {
		if drift = true {
			x -= dcos(look_dir)*global.drift/du;
			y += dsin(look_dir)*global.drift/du;
		}
		else if boost = true {
			x -= dcos(look_dir)*global.max_spd;
			y += dsin(look_dir)*global.max_spd;
		}
		else {
			x -= dcos(look_dir)*spd;
			y += dsin(look_dir)*spd;
		}
	//}
}

if keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(ord("X")){
	player_direction = 0;
}