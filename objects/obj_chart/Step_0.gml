if global.has_start_tune = 1 {
	if played = false {
		audio_play_sound(snd_start1, 0, 0);
		played = true;
		sas = 1;
	}
}
else {
	if global.has_talk_before = 1 {
		sus = 59;
		sas = 1;
	}
	else {
		sas = 3;
	}
}
if sas = 1 {
	sus += 1;
	if sus >= 60 {
		audio_play_sound(talk, 0, 0, 0.21);
		sas = 2;
	}
}

if sas = 2 {
	if !audio_is_playing(talk) {
		sas = 3;
	}
}

if sas = 3 {
	global.countdown = true;
	sas = 4;
}
if audio_is_playing(snd_31) {
	image_xscale += (image_txscale - image_xscale) * 0.2;
	image_yscale += (image_tyscale - image_yscale) * 0.2;
}

if global.countdown = true {
	wii += 1;
	if wii = 60 {
		count = 1;
		apla = 1;
		sdistcount = 1;
		audio_play_sound(snd_31, 0, 0);
	}
	else if wii = 120 {
		count = 2;
		apla = 1;
		sdistcount = 2;
		Section_Notes(1);
		audio_play_sound(snd_21, 0, 0);
	}
	else if wii = 180 {
		count = 3;
		apla = 1;
		sdistcount = 3;
		instance_create_depth(32, 160, -9900, obj_hit);
		audio_play_sound(snd_11, 0, 0);
	}
	else if wii = 240 {
		count = 4;
		apla = 1;
		sdistcount = 4;
		audio_play_sound(snd_go1, 0, 0);
		start_time = current_time;
		Start_Song();
		global.song_started = true;
	}
	else if wii > 240 and apla = 0 {
		global.countdown = false;
	}
}
if apla > 0 {
	apla -= 0.025;
}

if global.song_started = true {
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
}
if keyboard_check_pressed(vk_lcontrol) {
	room_restart(); 
	audio_stop_all();
}
else if keyboard_check_pressed(vk_rcontrol) {
	game_restart();
}