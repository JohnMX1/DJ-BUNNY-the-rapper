if alpha < 0.5 {
	alpha += 0.1;
}
if xx > 0 {
	xx -= (xx - 1) * 0.2;
}
if obj_playeredilene.count >= 2 {
	if yy > 0 {
		yy -= (yy - 1) * 0.2;
	}
}
if obj_playeredilene.boost = true {
	if !instance_exists(obj_mxe_transition) {
		instance_create_depth(0,0,-9999,obj_mxe_transition);
		/*global.surf_break = surface_create(display_get_width(), display_get_height());
		surface_set_target(global.surf_break);
		draw_surface(application_surface, 0, 0);
		surface_reset_target();*/
		global.part1 = sprite_create_from_surface(application_surface, 0, 0, 1366/2, 768, false, false, 0, 0);
		global.part2 = sprite_create_from_surface(application_surface, 1366/2, 0, 1366, 768, false, false, 0, 0);
	}
}

if xx >= 20 {
	index = 0;
}
else {
	if index < 13 {
		index++;
	}
}