image_alpha = 0.5;
if place_meeting(mouse_x, mouse_y, obj_charteditormain) {
	//x = point_distance(obj_charteditormain.x, obj_charteditormain.y, mouse_x, mouse_y);
	x = obj_charteditormain.x + device_mouse_x_to_gui(0)+(-obj_charteditormain.x);
	if mouse_y <= obj_charteditormain.y {
		y = 160-48;
	}
	else {
		y = 160+48;
	}
	if mouse_check_button_pressed(mb_left) {
		//note = instance_create_depth(point_distance(obj_charteditormain.x, y, mouse_x, y), y, -1000, obj_notechart);
		if y = 160-48 {
			tu = 0;
		}
		else {
			tu = 1;
		}
		ini_open("mainfiles/sections/songs/"+string(global.song)+"/easy.djbc");
		chart_notes_existing[0] = ini_read_real(string(1)+"sectionopp", "noteamount", 0);
		chart_notes_existing[1] = ini_read_real(string(1)+"sectionmain", "noteamount", 0);
		ini_close();
		Section_Add_Notes(1, tu, chart_notes_existing[tu]+1, point_distance(obj_charteditormain.x, y, mouse_x, y), image_index, 1, 0);
		Section_Notes(1);
	}
}
else {
	x = obj_charteditormain.x;
}

if keyboard_check_pressed(ord("W")) {
	image_index = 2;
}
if keyboard_check_pressed(ord("A")) {
	image_index = 0;
}
if keyboard_check_pressed(ord("S")) {
	image_index = 1;
}
if keyboard_check_pressed(ord("D")) {
	image_index = 3;
}