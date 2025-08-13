global.delta = (delta_time/1000000)/(1/60);

ini_open("mainfiles/sections/songs/"+string(global.song)+"/easy.djbc");

ini_close();

if start_animation = true {
	stop = true;
	if anim_cur = 0 {
		alphaanim[0] += 0.01;
		animx1 += 0.05;
		animy1 += 0.05;
		anim_sec += 1;
		if anim_sec >= 40 {
			anim_cur = 1;
			anim_sec = 0;
			audio_play_sound(snd_2, 0, 0);
		}
	}
	else if anim_cur = 1 {
		alphaanim[0] -= 0.01;
		alphaanim[1] += 0.01;
		animx2 += 0.05;
		animy2 += 0.05;
		anim_sec += 1;
		if anim_sec >= 40 {
			anim_cur = 2;
			anim_sec = 0;
			audio_play_sound(snd_1, 0, 0);
		}
	}
	else if anim_cur = 2 {
		alphaanim[1] -= 0.01;
		alphaanim[2] += 0.01;
		animx3 += 0.05;
		animy3 += 0.05;
		anim_sec += 1;
		if anim_sec >= 40 {
			anim_cur = 3;
			anim_sec = 0;
			audio_play_sound(snd_go, 0, 0);
		}
	}
	else if anim_cur = 3 {
		alphaanim[2] -= 0.01;
		alphaanim[3] += 0.01;
		alphaanim[4] += 0.01;
		animx4 += 0.05;
		animx5 += 0.05;
		anim_sec += 1;
		if anim_sec >= 40 {
			start_animation = false;
			stop = false;
			Start_Song();
			Section_Start();
			spr_opp_icon = sprite_add("mainfiles/characters/"+string(global.character_name[global.char_opp])+"/spr_icons.png", 3, false, false, 32, 32);
			spr_main_icon = sprite_add("mainfiles/characters/"+string(global.character_name[global.char_main])+"/spr_icons.png", 3, false, false, 32, 32);
		}
	}
}
if stop = false {
	if space[0] > 42 or space[1] > 42 {
		show_error("Number of lines higher than the engine supports", true);
	}
	linexscale[0] = lerp(linexscale[0], tlinexscale[0] - momentx[0], 0.3);
	lineyscale[0] = lerp(lineyscale[0], tlineyscale[0] - momenty[0], 0.3);
	linexscale[1] = lerp(linexscale[1], tlinexscale[1] - momentx[1], 0.3);
	lineyscale[1] = lerp(lineyscale[1], tlineyscale[1] - momenty[1], 0.3);
	if animation = true {
		image_alphaa = lerp(image_alphaa, 1, 0.1);
		image_xscale = lerp(image_xscale, base_xscale, 0.1);
		image_yscale = lerp(image_yscale, base_yscale, 0.1);
		anim_sus += 1;
		if anim_sus >= 120 {
			anim_sus = 0;
			animation = false;
		}
	}
	if global.turn[0] = 1 and global.turn[1] = 0 {
		tlineyscale[0] = 1;
		tlineyscale[1] = 0.5;
		inputboxx[0] += ((time_bpm_to_seconds(global.bpm)*10)*(global.sngspeed*2))*global.delta;
		if inputboxx[0] > (64 * spaces[inputboxline[0]-1])+64 {
			inputboxx[0] = 0;
			if line_spaces[0] > 1 {
				if inputboxline[0] < line_spaces[0] {
					inputboxline[0]++;
				}
				else {
					if global.turn[0] = 1 {
						global.turn[0] = 0;
						global.turn[1] = 1;
					}
					inputboxline[0] = 1;
				}
			}
			else {
				if global.turn[0] = 1 {
					global.turn[0] = 0;
					global.turn[1] = 1;
				}
				inputboxline[0] = 1;
			}
		}
	}
	else if global.turn[0] = 0 and global.turn[1] = 1 {
		tlineyscale[0] = 0.5;
		tlineyscale[1] = 1;
		inputboxx[1] += ((time_bpm_to_seconds(global.bpm)*10)*(global.sngspeed*2))*global.delta;
		if inputboxx[1] > (64 * spaces[inputboxline[1]+2])+64 {
			inputboxx[1] = 0;
			if line_spaces[1] > 1 {
				if line_spaces[1] = 2 and inputboxline[1] < 2 {
					inputboxline[1]++;
				}
				else if line_spaces[1] = 3 and inputboxline[1] < 3 {
					inputboxline[1]++;
				}
				else {
					if section < sections_amount {
						section++;
						Section_Update(section);
					}
					inputboxline[1] = 1;
				}
			}
			else {
				if section < sections_amount {
					section++;
					Section_Update(section);
				}
				inputboxline[1] = 1;
			}
		}
		if keyboard_check_pressed(input[0]) {
			notes_existing[1] += 1;
			player_note[notes_existing[1]] = instance_create_depth(236 + inputboxx[1], (72+(40*line_spaces[0]+40)*lineyscale[0]) + (40*(inputboxline[1]-1))*lineyscale[1], -9999, obj_input);
			player_note[notes_existing[1]].turn = 1;
			player_note[notes_existing[1]].input = 0;
			player_note[notes_existing[1]].line = inputboxline[1];
		}
		if keyboard_check_pressed(input[1]) {
			notes_existing[1]++;
			player_note[notes_existing[1]] = instance_create_depth(236 + inputboxx[1], (72+(40*line_spaces[0]+40)*lineyscale[0]) + (40*(inputboxline[1]-1))*lineyscale[1], -9999, obj_input);
			player_note[notes_existing[1]].turn = 1;
			player_note[notes_existing[1]].input = 1;
			player_note[notes_existing[1]].line = inputboxline[1];
		}
		if keyboard_check_pressed(input[2]) {
			notes_existing[1]++;
			player_note[notes_existing[1]] = instance_create_depth(236 + inputboxx[1], (72+(40*line_spaces[0]+40)*lineyscale[0]) + (40*(inputboxline[1]-1))*lineyscale[1], -9999, obj_input);
			player_note[notes_existing[1]].turn = 1;
			player_note[notes_existing[1]].input = 2;
			player_note[notes_existing[1]].line = inputboxline[1];
		}
		if keyboard_check_pressed(input[3]) {
			notes_existing[1]++;
			player_note[notes_existing[1]] = instance_create_depth(236 + inputboxx[1], (72+(40*line_spaces[0]+40)*lineyscale[0]) + (40*(inputboxline[1]-1))*lineyscale[1], -9999, obj_input);
			player_note[notes_existing[1]].turn = 1;
			player_note[notes_existing[1]].input = 3;
			player_note[notes_existing[1]].line = inputboxline[1];
		}
		
	}
	else {
		tlineyscale[0] = 0.75;
		tlineyscale[1] = 0.75;
		inputboxx[0] += ((time_bpm_to_seconds(global.bpm)*10)*(global.sngspeed*2))*global.delta;
		inputboxx[1] += ((time_bpm_to_seconds(global.bpm)*10)*(global.sngspeed*2))*global.delta;
		if inputboxx[0] > (64 * spaces[inputboxline[0]-1])+64 {
			inputboxx[0] = 0;
			if line_spaces[0] > 1 {
				if line_spaces[0] = 2 and inputboxline[0] < 2 {
					inputboxline[0]++;
				}
				else if line_spaces[0] = 3 and inputboxline[0] < 3 {
					inputboxline[0]++;
				}
				else {
					if global.turn[0] = 1 {
						global.turn[0] = 0;
						global.turn[1] = 1;
					}
					inputboxline[0] = 1;
				}
			}
			else {
				if global.turn[0] = 1 {
					global.turn[0] = 0;
					global.turn[1] = 1;
				}
				inputboxline[0] = 1;
			}
		}
		if inputboxx[1] > (64 * spaces[inputboxline[1]+2])+64 {
			inputboxx[1] = 0;
			if line_spaces[1] > 1 {
				if line_spaces[1] = 2 and inputboxline[1] < 2 {
					inputboxline[1]++;
				}
				else if line_spaces[1] = 3 and inputboxline[1] < 3 {
					inputboxline[1]++;
				}
				else {
					inputboxline[1] = 0;
					canpass[1] = false;
				}
			}
			else {
				canpass[1] = false;
				inputboxline[1] = 1;
			}
		}
		if keyboard_check_pressed(input[0]) {
			notes_existing[1]++;
			player_note[notes_existing[1]] = instance_create_depth(236 + inputboxx[1], (72+(40*line_spaces[0]+40)*lineyscale[0]) + (40*(inputboxline[1]-1))*lineyscale[1], -9999, obj_input);
			player_note[notes_existing[1]].turn = 1;
			player_note[notes_existing[1]].input = 0;
			player_note[notes_existing[1]].line = inputboxline[1];
		}
		else if keyboard_check_pressed(input[1]) {
			notes_existing[1]++;
			player_note[notes_existing[1]] = instance_create_depth(236 + inputboxx[1], (72+(40*line_spaces[0]+40)*lineyscale[0]) + (40*(inputboxline[1]-1))*lineyscale[1], -9999, obj_input);
			player_note[notes_existing[1]].turn = 1;
			player_note[notes_existing[1]].input = 1;
			player_note[notes_existing[1]].line = inputboxline[1];
		}
		else if keyboard_check_pressed(input[2]) {
			notes_existing[1]++;
			player_note[notes_existing[1]] = instance_create_depth(236 + inputboxx[1], (72+(40*line_spaces[0]+40)*lineyscale[0]) + (40*(inputboxline[1]-1))*lineyscale[1], -9999, obj_input);
			player_note[notes_existing[1]].turn = 1;
			player_note[notes_existing[1]].input = 2;
			player_note[notes_existing[1]].line = inputboxline[1];
		}
		else if keyboard_check_pressed(input[3]) {
			notes_existing[1]++;
			player_note[notes_existing[1]] = instance_create_depth(236 + inputboxx[1], (72+(40*line_spaces[0]+40)*lineyscale[0]) + (40*(inputboxline[1]-1))*lineyscale[1], -9999, obj_input);
			player_note[notes_existing[1]].turn = 1;
			player_note[notes_existing[1]].input = 3;
			player_note[notes_existing[1]].line = inputboxline[1];
		}
	}
	if keyboard_check_pressed(vk_space) {
		stop = true;
		/*inputboxline[0] = 1;
		inputboxline[1] = 1;
		inputboxx[0] = 0;
		inputboxx[1] = 0;
		audio_stop_sound(song_inst);
		song_instd = audio_destroy_stream(song_inst);
		if song_has_vocals {
			audio_stop_sound(song_vocals);
			audio_destroy_stream(song_vocals);
		}*/
		audio_pause_all();
	}
}
else {
	if keyboard_check_pressed(vk_space) {
		stop = false;
		audio_resume_all();
	}
	if keyboard_check_pressed(vk_enter) {
		room_restart();
		audio_stop_all();
	}
}