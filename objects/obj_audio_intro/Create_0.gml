if room = rm_intro {
	global.sng = audio_create_stream("mainfiles/MainMenu.ogg");
	AudioIDinMV = mv_load(@"mainfiles/MainMenu.ogg");
	AudioID = audio_play_sound(global.sng,0,1)
}