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
	audio_play_sound(snd_3, 0, 0);
	sas = 4;
}

if global.countdown = true {
	if ccnt = 0 {
		ccntx += 0.25;
		cnt[0] -= 0.025;
		cnt1[0] += 0.025;
		image_xscale += (image_txscale - image_xscale) * 0.2;
		image_yscale += (image_tyscale - image_yscale) * 0.2;
		if cnt1[0] >= 1 {
			ccnt = 1;
			ccntx = 0;
			Section_Notes(1);
			audio_play_sound(snd_2, 0, 0);
		}
	}
	else if ccnt = 1 {
		ccntx += 0.25;
		cnt[1] -= 0.025;
		cnt1[1] += 0.025;
		if cnt1[1] >= 1 {
			ccnt = 2;
			ccntx = 0;
			instance_create_depth(32, 160, -9900, obj_hit);
			audio_play_sound(snd_1, 0, 0);
		}
	}
	else if ccnt = 2 {
		ccntx += 0.25;
		cnt[2] -= 0.025;
		cnt1[2] += 0.025;
		if cnt1[2] >= 1 {
			ccnt = 3;
			ccntx = 0;
			audio_play_sound(snd_go, 0, 0);
		}
	}
	else if ccnt = 3 {
		ccntx += 0.25;
		cnt[3] -= 0.025;
		cnt[4] -= 0.025;
		cnt1[3] += 0.025;
		cnt1[4] += 0.025;
		if cnt1[3] >= 1 {
			global.countdown = false;
			start_time = current_time;
			Start_Song();
			global.song_started = true;
		}
	}
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
if keyboard_check_pressed(vk_control) room_restart();