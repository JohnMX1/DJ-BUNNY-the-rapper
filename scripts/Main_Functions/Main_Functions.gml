function Start_Song() {
	ini_open("mainfiles/sections/songs/"+string(global.song)+"/easy.djbc");
	global.sngspeed = ini_read_real("song", "speed", 0.5);
	global.bpm = ini_read_real("song", "bpm", 5);
	sections_amount = ini_read_real("song", "sections", 1);
	global.char_opp = ini_read_real("song", "opp", 0);
	global.char_main = ini_read_real("song", "main", 1);
	ini_close();
	song_inst = audio_create_stream("mainfiles/sections/songs/"+string(global.song)+"/Inst.ogg");
	audio_play_sound(song_inst, 0, 0);
	if file_exists("mainfiles/sections/songs/"+string(global.song)+"/Vocals.ogg") {
		song_has_vocals = true;
	}
	else {
		song_has_vocals = false;
	}
	if song_has_vocals = true {
		song_vocals = audio_create_stream("mainfiles/sections/songs/"+string(global.song)+"/Vocals.ogg");
		audio_play_sound(song_vocals, 0, 0);
	}
}
function Create_Section(song) {
	
}

function Section_Spaces(section) {
	ini_open("mainfiles/sections/songs/"+string(global.song)+"/easy.djbc");
	space[0] = ini_read_real(string(section)+"sectionopp", "spaces", 1);
	space[1] = ini_read_real(string(section)+"sectionmain", "spaces", 1);
	ini_close();
	#region wtf was I doing here
	if space[0] > 14 and space[0] < 29 {
		spaces[0] = 14;
		spaces[1] = space[0]-14;
		spaces[2] = 0;
	}
	else if space[0] > 28 {
		spaces[0] = 14;
		spaces[1] = 14;
		spaces[2] = space[0]-28;
	}
	else {
		spaces[0] = space[0];
		spaces[1] = 0;
		spaces[2] = 0;
	}
	if space[1] > 14 and space[1] < 29 {
		spaces[3] = 14;
		spaces[4] = space[1]-14;
		spaces[5] = 0;
	}
	else if space[1] > 28 {
		spaces[3] = 14;
		spaces[4] = 14;
		spaces[5] = space[1]-28;
	}
	else {
		spaces[3] = space[1];
		spaces[4] = 0;
		spaces[5] = 0;
	}
	if spaces[1] != 0 and spaces[2] = 0 {
		line_spaces[0] = 2;
	}
	else if spaces[1] != 0 and spaces[2] != 0 {
		line_spaces[0] = 3;
	}
	else {
		line_spaces[0] = 1;
	}
	if spaces[4] != 0 and spaces[5] = 0 {
		line_spaces[1] = 2;
	}
	else if spaces[4] != 0 and spaces[5] != 0 {
		line_spaces[1] = 3;
	}
	else {
		line_spaces[1] = 1;
	}
	#endregion
}
function Section_Turns(section) {
	ini_open("mainfiles/sections/songs/"+string(global.song)+"/easy.djbc");
	global.turn[0] = ini_read_real(string(section)+"sectionopp", "first", 1);
	global.turn[1] = ini_read_real(string(section)+"sectionmain", "first", 0);
	ini_close();
}
function Section_Notes(section) {
	notes_existing[0] = 0;
	notes_existing[1] = 0;
	instance_destroy(obj_input);
	instance_destroy(obj_note);
	ini_open("mainfiles/sections/songs/"+string(global.song)+"/easy.djbc");
	chart_notes_existing[0] = ini_read_real(string(section)+"sectionopp", "noteamount", 1);
	chart_notes_existing[1] = ini_read_real(string(section)+"sectionmain", "noteamount", 1);
	ini_close();
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
			notes1[i] = instance_create_depth(236 + notesx1[i], (72+(40*line_spaces[0]+40)*lineyscale[0]), -9999, obj_note);
			notes2[i] = instance_create_depth(236 + notesx1[i], (72+(40*line_spaces[0]+40)*lineyscale[0]) + (40*(inputboxline[1]-1))*lineyscale[1], -9999, obj_note);
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
function Section_Add_Notes(section, turn) {
	ini_open("mainfiles/sections/songs/"+string(global.song)+"/easy.djbc");
	if turn = 0 {
		ini_write_real(string(section)+"sectionopp", "noteamount", 1);
	}
	else {
		ini_write_real(string(section)+"sectionmain", "noteamount", 1);
	}
	ini_close();
}

function Section_Start() {
	Section_Spaces(1);
	Section_Turns(1);
	Section_Notes(1);
}
function Section_Update(sections) {
	Section_Spaces(sections);
	Section_Turns(sections);
	Section_Notes(sections);
}

function Characters_List() {
	ini_open("mainfiles/characters/characters.djbf");
	characters_amount = ini_read_real("CHARACTERS", "amount", 0);
	
	for (var i = 0; i < characters_amount; ++i) {
		global.character_name[i] = ini_read_string("CHARACTERS", string(i)+"name", "base");
	}
	ini_close();
}