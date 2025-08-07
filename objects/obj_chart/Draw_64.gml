if start_animation = false {
	draw_sprite_ext(sprite_index, 0, base_x, base_y, image_xscale, image_yscale, 0, c_blue, image_alphaa);
	for (var o = 0; o < line_spaces[0]; o++) {
		for (var i = 0; i < spaces[o]; ++i) {
			//opponent side
			draw_sprite_ext(spr_vazio,0, 300 + 64 * i, 72 + (40*o)*lineyscale[0], linexscale[0], lineyscale[0], 0, c_white, image_alphaa);
			for (var u = 0; u < 14; u++) {
				draw_sprite_ext(spr_vazio,1, 300 + 64 * u, 72 + (40*line_spaces[0])*lineyscale[0], 1, 0.1, 0, c_white, image_alphaa);
			}
			for (var t = 0; t < line_spaces[1]; t++) {
				for (var p = 0; p < spaces[t+3]; ++p) {
					//player side
					draw_sprite_ext(spr_vazio,0, 300 + 64 * p, (72+(40*line_spaces[0]+40)*lineyscale[0]) + (40*t)*lineyscale[1], linexscale[1], lineyscale[1], 0, c_white, image_alphaa);
				}
			}
		}
	}
	if instance_exists(obj_note) {
		for (var i = 0; i < instance_number(obj_note); ++i) {
			var input = instance_find(obj_note, i);
			draw_sprite_ext(spr_setas, input.input, input.x, input.y, input.image_xscale, lineyscale[input.line], 0, c_white, image_alphaa+0.5);
		}
	}
	if instance_exists(obj_input) {
		for (var i = 0; i < instance_number(obj_input); ++i) {
			var input = instance_find(obj_input, i);
			draw_sprite_ext(spr_setas, input.input, input.x, input.y, input.image_xscale, lineyscale[input.turn], 0, c_white, image_alphaa+0.5);
			draw_sprite_ext(spr_press, input.image_index, input.x+24, input.y-24, input.image_xscale/2, lineyscale[input.turn]/2, 20, c_white, image_alphaa+0.5);
		}
	}
	
	draw_sprite_ext(spr_opp_icon, 1, 236 + inputboxx[0], 72 + (40*(inputboxline[0]-1))*lineyscale[0], linexscale[0], lineyscale[0], 0, c_white, image_alphaa);
	draw_sprite_ext(spr_main_icon, 1, 236 + inputboxx[1], (72+(40*line_spaces[0]+40)*lineyscale[0]) + (40*(inputboxline[1]-1))*lineyscale[1], linexscale[1], lineyscale[1], 0, c_white, image_alphaa);
}
if start_animation = true {
	//draw_sprite();
}
draw_text(32, 0, fps);