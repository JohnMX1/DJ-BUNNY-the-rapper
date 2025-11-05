function Before_Song() {
	ini_open("mainfiles/sections/songs/"+string(global.song)+"/easy.djbc");
	global.sngspeed = ini_read_real("song", "speed", 0.5);
	global.bpm = ini_read_real("song", "bpm", 5);
	sections_amount = ini_read_real("song", "sections", 1);
	global.char_opp = ini_read_real("song", "opp", 0);
	global.char_main = ini_read_real("song", "main", 1);
	global.has_talk_before = ini_read_real("song", "preptalk", 0);
	talk_amount = ini_read_real("song", "prepamount", 0);
	talk_place = ini_read_string("song", "preplocal1", "");
	global.has_start_tune = ini_read_real("song", "start_tune", 0);
	ini_close();
}
function Start_Song() {
	global.song_inst = audio_create_stream("mainfiles/sections/songs/"+string(global.song)+"/Inst.ogg");
	audio_play_sound(global.song_inst, 0, 0);
	if file_exists("mainfiles/sections/songs/"+string(global.song)+"/Voices.ogg") {
		global.song_has_vocals = true;
	}
	else {
		global.song_has_vocals = false;
	}
	if global.song_has_vocals = true {
		global.song_vocals = audio_create_stream("mainfiles/sections/songs/"+string(global.song)+"/Voices.ogg");
		audio_play_sound(global.song_vocals, 0, 0);
	}
}
function Create_Section(song) {
	
}

function GetPaused() {
	pause = true;
	audio_pause_sound(global.song_inst);
	if global.song_has_vocals = true {
		audio_pause_sound(global.song_vocals);
	}
}
function Unpause() {
	pause = false;
	audio_resume_sound(global.song_inst);
	if global.song_has_vocals = true {
		audio_resume_sound(global.song_vocals);
	}
}

function Section_Notes(section) {
	notes_existing[0] = 0;
	notes_existing[1] = 0;
	ini_open("mainfiles/sections/songs/"+string(global.song)+"/easy.djbc");
	chart_notes_existing[0] = ini_read_real(string(section)+"sectionopp", "noteamount", 0);
	chart_notes_existing[1] = ini_read_real(string(section)+"sectionmain", "noteamount", 0);
	ini_close();
	instance_destroy(obj_note);
	for (var o = 0; o < 1; ++o) {
		for (var i = 0; i < chart_notes_existing[o]; ++i) {
			ini_open("mainfiles/sections/songs/"+string(global.song)+"/easy.djbc");
			notesx1[i] = ini_read_real(string(section)+"sectionopp", string(i)+"notex", 1);
			notesx2[i] = ini_read_real(string(section)+"sectionmain", string(i)+"notex", 1);
			notestype1[i] = ini_read_real(string(section)+"sectionopp", string(i)+"notetype", 1);
			notestype2[i] = ini_read_real(string(section)+"sectionmain", string(i)+"notetype", 1);
			notesline1[i] = ini_read_real(string(section)+"sectionopp", string(i)+"noteline", 1);
			notesline2[i] = ini_read_real(string(section)+"sectionmain", string(i)+"noteline", 1);
			notessecret1[i] = ini_read_real(string(section)+"sectionopp", string(i)+"notesecret", 0);
			notessecret2[i] = ini_read_real(string(section)+"sectionmain", string(i)+"notesecret", 0);
			ini_close();
			notes1[i] = instance_create_depth(point_distance(obj_chart.x, y, notesx1[i], y), 160-48, depth-1, obj_note);
			notes2[i] = instance_create_depth(point_distance(obj_chart.x, y, notesx2[i], y), 160+48, depth-1, obj_note);
			notes1[i].input = notestype1[i];
			notes2[i].input = notestype2[i];
			notes1[i].image_index = notestype1[i];
			notes2[i].image_index = notestype2[i];
			notes1[i].line = notesline1[i];
			notes2[i].line = notesline2[i];
			notes1[i].secret = notessecret1[i];
			notes2[i].secret = notessecret2[i];
			notes1[i].turn = 0;
			notes2[i].turn = 1;
			//player_note[notes_existing[1]] = instance_create_depth(236 + inputboxx[1], (72+(40*line_spaces[0]+40)*lineyscale[0]) + (40*(inputboxline[1]-1))*lineyscale[1], -9999, obj_input);
			//player_note[notes_existing[1]].turn = 1;
			//player_note[notes_existing[1]].input = 3;
			//player_note[notes_existing[1]].line = inputboxline[1];
		}
	}
}
function Section_Add_Notes(section, turn, number, pos, type, line, secret) {
	ini_open("mainfiles/sections/songs/"+string(global.song)+"/easy.djbc");
	if turn = 0 {
		ini_write_real(string(section)+"sectionopp", "noteamount", number);
		ini_write_real(string(section)+"sectionopp", string(number)+"notex", pos);
		ini_write_real(string(section)+"sectionopp", string(number)+"notetype", type);
		ini_write_real(string(section)+"sectionopp", string(number)+"noteline", line);
		ini_write_real(string(section)+"sectionopp", string(number)+"notesecret", secret);
	}
	else {
		ini_write_real(string(section)+"sectionmain", "noteamount", number);
		ini_write_real(string(section)+"sectionmain", string(number)+"notex", pos);
		ini_write_real(string(section)+"sectionmain", string(number)+"notetype", type);
		ini_write_real(string(section)+"sectionmain", string(number)+"noteline", line);
		ini_write_real(string(section)+"sectionmain", string(number)+"notesecret", secret);
	}
	ini_close();
}
function Section_Delete_Notes(section) {
	ini_open("mainfiles/sections/songs/"+string(global.song)+"/easy.djbc");
	if turn = 0 {
		ini_write_real(string(section)+"sectionopp", "noteamount", chart_notes_existing[0]-1);
	}
	else {
		ini_write_real(string(section)+"sectionmain", "noteamount", chart_notes_existing[1]+1);
	}
	ini_close();
}

function Characters_List() {
	ini_open("mainfiles/characters/characters.djbf");
	characters_amount = ini_read_real("CHARACTERS", "amount", 0);
	
	for (var i = 0; i < characters_amount; ++i) {
		global.character_name[i] = ini_read_string("CHARACTERS", string(i)+"name", "base");
	}
	ini_close();
}
