/*if (surface_exists(global.surf_break)) {
    shader_set(shd_glassbreak);

    var u_time = shader_get_uniform(shd_glassbreak, "u_time");
    var u_strength = shader_get_uniform(shd_glassbreak, "u_strength");

    var u_tex_screen = shader_get_uniform(shd_glassbreak, "tex_screen");
    var u_tex_cracks = shader_get_uniform(shd_glassbreak, "tex_cracks");

    texture_set_stage(0, surface_get_texture(global.surf_break));
    texture_set_stage(1, sprite_get_texture(spr_glass_shatter, 0));

    shader_set_uniform_f(u_time, time / duration);
    shader_set_uniform_f(u_strength, strength);

    draw_rectangle(0, 0, display_get_width(), display_get_height(), false);

    shader_reset();
}*/
draw_sprite(global.part1, 0, 0-xx, 0);
draw_sprite(global.part2, 0, 640+xx, 0);