sus = 0;
if room_last = rm_menu {
	mxepart = false;
	mxesus = -1;
	textpart = false;
	intropart = true;
}
else {
	mxesus = 0;
	mxepart = true;
	textpart = false;
	intropart = false;
}
text_amount = 0;
image_alpha = 1;
text[1] = "This Game Was Presented to you by JohnMX and Cueio77";
text[2] = "The ONE and ONLY";
text[3] = "......";
//global.song = "Tough Guy Alert";
global.menu = audio_create_stream("mainfiles/MainMenu.ogg");

audio_play_sound(MxStart6, 0, 0);