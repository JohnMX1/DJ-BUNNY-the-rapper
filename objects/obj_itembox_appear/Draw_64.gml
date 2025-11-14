draw_sprite_ext(spr_itembox_draw, 0, 320, 64+yoffset, 2, 2, 0, c_white, 1);
if ended = true {
	image = -1;
}
else {
	switch (global.item) {
		case 0:
			if global.item_ver = 0 {
				image = 0;
			}
			else if global.item_ver = 1 {
				image = 1;
			}
			else if global.item_ver = 2 {
				image = 2;
			}
			break;
		case 1:
			if global.item_ver = 0 {
				image = 3;
			}
			else if global.item_ver = 1 {
				image = 4;
			}
			else if global.item_ver = 2 {
				image = 5;
			}
			break;
		case 2:
			if global.item_ver = 0 {
				image = 6;
			}
			else if global.item_ver = 1 {
				image = 7;
			}
			else if global.item_ver = 2 {
				image = 8;
			}
			break;
		case 3:
			if global.item_ver = 0 {
				image = 9;
			}
			else if global.item_ver = 1 {
				image = 10;
			}
			else if global.item_ver = 2 {
				image = 11;
			}
			break;
		case 4:
			image = 12;
			break;
		case 5:
			image = 13;
			break;
		case 6:
			image = 14;
			break;
		case 7:
			image = 15;
			break;
	}
}
draw_sprite_ext(spr_itembox_draw_bg, image, 320, 64+yoffset, 2, 2, 0, c_white, 1);