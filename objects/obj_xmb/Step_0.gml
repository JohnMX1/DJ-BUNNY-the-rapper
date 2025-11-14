angle[1] = angle[0]+tangle[0];
angle[2] = angle[0]+tangle[1];
angle[3] = angle[0]+tangle[2];
angle[4] = angle[0]+tangle[3];

iconx[0] = target_x + lengthdir_x(radius, angle[1]);
icony[0] = target_y + lengthdir_y(radius, angle[1]);
iconx[1] = target_x + lengthdir_x(radius, angle[2]);
icony[1] = target_y + lengthdir_y(radius, angle[2]);
iconx[2] = target_x + lengthdir_x(radius, angle[3]);
icony[2] = target_y + lengthdir_y(radius, angle[3]);
iconx[3] = target_x + lengthdir_x(radius, angle[4]);
icony[3] = target_y + lengthdir_y(radius, angle[4]);

if keyboard_check_pressed(vk_down) {
	if xbar < 3 {
		xbar++;
	}
	else {
		xbar = 0;
	}
}
if keyboard_check_pressed(vk_up) {
	if xbar > 0 {
		xbar--;
	}
	else {
		xbar = 3;
	}
}

switch (xbar) {
	case 3:
		target_angle = 0;
		talpa[0] = 1;
		talpa[1] = 0;
		talpa[2] = 0;
		talpa[3] = 0;
		break;
	case 2:
		target_angle = 45;
		talpa[0] = 0;
		talpa[1] = 1;
		talpa[2] = 0;
		talpa[3] = 0;
		break;
	case 1:
		target_angle = 90;
		talpa[0] = 0;
		talpa[1] = 0;
		talpa[2] = 1;
		talpa[3] = 0;
		break;
	case 0:
		target_angle = 135;
		talpa[0] = 0;
		talpa[1] = 0;
		talpa[2] = 0;
		talpa[3] = 1;
		break;
}
if angle[0] < target_angle {
	angle[0] += (target_angle - angle[0]) * 0.2;
}
else {
	angle[0] -= (angle[0] - target_angle) * 0.2;
}
if image_alphaa < 0.5 {image_alphaa += 0.1; alpa[0] = 0; alpa[1] = 0; alpa[2] = 0; alpa[3] = 0;}
else {if icon_alpha < 1 icon_alpha += 0.1; if radius < 250 radius += lerp(250, radius, 0.2);}
if alpa[0] < talpa[0] {
	alpa[0] += (talpa[0] - alpa[0]) * 0.2;
}
else {
	alpa[0] -= (alpa[0] - talpa[0]) * 0.2;
}

if alpa[1] < talpa[1] {
	alpa[1] += (talpa[1] - alpa[1]) * 0.2;
}
else {
	alpa[1] -= (alpa[1] - talpa[1]) * 0.2;
}

if alpa[2] < talpa[2] {
	alpa[2] += (talpa[2] - alpa[2]) * 0.2;
}
else {
	alpa[2] -= (alpa[2] - talpa[2]) * 0.2;
}

if alpa[3] < talpa[3] {
	alpa[3] += (talpa[3] - alpa[3]) * 0.2;
}
else {
	alpa[3] -= (alpa[3] - talpa[3]) * 0.2;
}