draw_self();
draw_sprite_ext(spr_bgintro2, 0, x, y, image_xscale, image_yscale, image_angle/5000, c_white, 1);
draw_sprite_ext(spr_bgintro3, 0, x, y, image_xscale, image_yscale, -image_angle/10000, c_white, 1);
image_angle = current_time - start_time;