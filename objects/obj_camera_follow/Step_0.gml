if global.song_started = true {
	sus = time_bpm_to_seconds(global.bpm);
	sas++;
	if sas>= sus*60 {
		//look_dist -= 50;
		sas = 0;
	}
}
if look_dist > 500 {
	look_dist -= 5;
}
else if look_dist < 500 {
	look_dist += 5;
}
if keyboard_check(ord("L")) x += 1;
if keyboard_check(ord("J")) x -= 1;
if keyboard_check(ord("I")) y -= 1;
if keyboard_check(ord("K")) y += 1;