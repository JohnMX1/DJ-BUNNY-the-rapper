draw_sprite_ext(spr_black, 0, 0, 0, 25, 25, 0, c_white, image_alphaa);
draw_sprite_ext(spr_cd_logo, 0, 1366, 384, 1, 1, current_time/10, c_white, icon_alpha);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_sprite_ext(spr_icon_user, 0, iconx[0], icony[0], 5, 5, 0, c_white, icon_alpha);
draw_sprite_ext(spr_icon_settings, 0, iconx[1], icony[1], 5, 5, 0, c_white, icon_alpha);
draw_sprite_ext(spr_icon_game, 0, iconx[2], icony[2], 5, 5, 0, c_white, icon_alpha);
draw_sprite_ext(spr_icon_extras, 0, iconx[3], icony[3], 5, 5, 0, c_white, icon_alpha);

draw_set_font(global.Font_Glow);
draw_set_alpha(alpa[0]);
draw_text_transformed(iconx[0], icony[0]+32*5, xbar_icons[0], 3, 3, 0);
draw_set_font(global.Font);
draw_text_transformed(iconx[0], icony[0]+32*5, xbar_icons[0], 3, 3, 0);

draw_set_font(global.Font_Glow);
draw_set_alpha(alpa[1]);
draw_text_transformed(iconx[1], icony[1]+32*5, xbar_icons[1], 3, 3, 0);
draw_set_font(global.Font);
draw_text_transformed(iconx[1], icony[1]+32*5, xbar_icons[1], 3, 3, 0);

draw_set_font(global.Font_Glow);
draw_set_alpha(alpa[2]);
draw_text_transformed(iconx[2], icony[2]+32*5, xbar_icons[2], 3, 3, 0);
draw_set_font(global.Font);
draw_text_transformed(iconx[2], icony[2]+32*5, xbar_icons[2], 3, 3, 0);

draw_set_font(global.Font_Glow);
draw_set_alpha(alpa[3]);
draw_text_transformed(iconx[3], icony[3]+32*5, xbar_icons[3], 3, 3, 0);
draw_set_font(global.Font);
draw_text_transformed(iconx[3], icony[3]+32*5, xbar_icons[3], 3, 3, 0);
draw_set_alpha(1);
draw_set_font(fnt_normal);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(0, 0, xbar);
draw_text(0, 32, icony[0]);