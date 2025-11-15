sprite_index = sprite_add("mainfiles/spr_newlogo.png", 1, false, false, 384, 384);

sus = 0;
surf = surface_create(1366, 768);
image_alpha = 0;
saved_time = current_time;
application_surface_draw_enable(false);
depth = -9998;
ang = 0;
ui = false;
blackscr = true;

global.Font = font_add_sprite_ext(spr_alphabet, "ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÄÉÊÍÎÓÔÕÖÚÛÜßÇabcdefghijklmnopqrstuvwxyzàáâãäéêíîóôõöúûüç~.:,;-1234567890 ", true, 2);
global.Font_Glow = font_add_sprite_ext(spr_alphabet_glow, "ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÄÉÊÍÎÓÔÕÖÚÛÜßÇabcdefghijklmnopqrstuvwxyzàáâãäéêíîóôõöúûüç~.:,;-1234567890 ", true, 2);