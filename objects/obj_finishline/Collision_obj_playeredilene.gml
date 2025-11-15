if global.can = true {
	global.lap ++;
	global.can = false;
	if global.lap = 3 {
		obj_playeredilene.finish = true;
	}
}