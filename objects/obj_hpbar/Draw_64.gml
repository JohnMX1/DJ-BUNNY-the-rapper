draw_sprite_ext(sprite_index, 0, base_x, base_y, image_xscale, image_yscale, 0, c_blue, image_alphaa);
draw_set_alpha(image_alphaa);
draw_healthbar(1248, 96, 1248+(1280-1248), 512, global.opphp, c_black, c_white, c_white, 3, true, true);
draw_healthbar(1280, 96, 1280+(1318-1280), 512, global.mainhp, c_black, c_white, c_white, 3, true, true);
draw_set_alpha(1);