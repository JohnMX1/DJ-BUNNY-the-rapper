if image_index >= 0 and image_index <= 3 {
	sprite_index = global.note_sprite;
}
x = obj_chart.x+xstart;
if x < -64 {
	instance_destroy();
}
image_yscale += (1 - image_yscale) * 0.2;

if keyboard_check_pressed(vk_left) pressed_key = true; key = 0;
if keyboard_check_pressed(vk_down) pressed_key = true; key = 1;
if keyboard_check_pressed(vk_up) pressed_key = true; key = 2;
if keyboard_check_pressed(vk_right) pressed_key = true; key = 3;
if keyboard_check_released(vk_left) pressed_key = false;
if keyboard_check_released(vk_down) pressed_key = false;
if keyboard_check_released(vk_up) pressed_key = false;
if keyboard_check_released(vk_right) pressed_key = false;

if place_meeting(x, y, obj_hit) and pressed_key = true {
	finded = true;
	pressed_key = false;
	if x >= obj_hit {
		if key = image_index {
			if distance_to_point(obj_hit.x, y) < 16 {
				global.excellent++;
				global.score += 10;
				instance_destroy();
			}
			else if distance_to_point(obj_hit.x, y) > 15 and distance_to_point(obj_hit.x, y) < 32 {
				global.good++;
				global.score += 5;
				instance_destroy();
			}
			else if distance_to_point(obj_hit.x, y) > 31 {
				global.bad++;
				global.score += 1;
				instance_destroy();
			}
		}
	}
	else {
		if key = image_index {
			if distance_to_point(obj_hit.x, y) < 16 {
				global.excellent++;
				global.score += 8;
				instance_destroy();
			}
			else if distance_to_point(obj_hit.x, y) > 15 and distance_to_point(obj_hit.x, y) < 32 {
				global.good++;
				global.score += 3;
				instance_destroy();
			}
			else if distance_to_point(obj_hit.x, y) > 31 {
				global.bad++;
				global.score -= 5;
				instance_destroy();
			}
		}
	}
}
else {
	if finded = true {
		global.miss++;
		global.score -= 10;
		finded = false;
	}
}