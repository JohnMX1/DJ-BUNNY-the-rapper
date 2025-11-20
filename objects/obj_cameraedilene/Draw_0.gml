/// @description Camera code.
if keyboard_check_pressed(vk_lcontrol) {
	global.lap --;
}
if keyboard_check_pressed(vk_rcontrol) {
	global.lap ++;
}

#region camera
draw_clear(c_blue);

shader_set(shd_basic_3d_stuff);

var camera = camera_get_active();
var camera_distance = obj_playeredilene.look_dist;

/*if room = rm_intro {
	var xto = obj_player.xstart;
	var yto = obj_player.ystart;
	if obj_player.start = true {
		var xfrom = xto - camera_distance * dcos(obj_player.look_dir);
		var yfrom = yto + camera_distance * dsin(obj_player.look_dir);
	}
	else {
		var xfrom = xto - camera_distance * dcos(270);
		var yfrom = yto + camera_distance * dsin(270);
	}
}*/
//else {
	var xto = obj_playeredilene.fake_x;
	var yto = obj_playeredilene.fake_y;
	var xfrom = xto - camera_distance * dcos(obj_playeredilene.look_dir);
	var yfrom = yto + camera_distance * dsin(obj_playeredilene.look_dir);
//}
var zto = obj_playeredilene.z;
var zfrom = zto + camera_distance * dsin(obj_playeredilene.look_pitch);

view_mat = matrix_build_lookat(xfrom, yfrom, zfrom, xto, yto, zto, 0, 0, 1);
proj_mat = matrix_build_projection_perspective_fov(60, window_get_height() / window_get_width(), 1, 32000);
camera_set_view_mat(camera, view_mat);
camera_set_proj_mat(camera, proj_mat);
camera_apply(camera);

gpu_set_tex_repeat(true);
// Everything must be drawn after the 3D projection has been set
vertex_submit(vbuffer, pr_trianglelist, sprite_get_texture(spr_grass, 0));

shader_reset();
#endregion
#region toon shader
/*shader_set(shd_toon);
var uniform_light_pos = shader_get_uniform(shd_toon, "lightPosition");
var uniform_light_color = shader_get_uniform(shd_toon, "lightColor");
var uniform_light_range = shader_get_uniform(shd_toon, "lightRange");
shader_set_uniform_f(uniform_light_pos, 150, 150, 32);
shader_set_uniform_f(uniform_light_color, 1, 1, 1, 1);
shader_set_uniform_f(uniform_light_range, 1000);

var sampler_toon_ramp = shader_get_sampler_index(shd_toon, "rampTex");
texture_set_stage(sampler_toon_ramp, sprite_get_texture(spr_toonification, 0));*/
#endregion
#region unused
/*
if obj_player.drift = false {
	if hinput = -1 and obj_player.action != 2 {
		xscale = -80;
	}
	else {
		if hinput = 0 {
			if obj_player.player_direction = 0 {
				xscale = 80;
			}
		}
		else {
			xscale = 80;
		}
	}
}
else {
	if obj_player.hinputi = -1 {
		xscale = -80;
	}
	else {
		xscale = 80;
	}
}
*/#endregion
#region Player, Player Shadow & ItemBoxes
var hinput = keyboard_check(vk_right) - keyboard_check(vk_left);
if obj_playeredilene.boost = true {
	matrix_set(matrix_world, matrix_build(obj_playeredilene.x, obj_playeredilene.y, (obj_playeredilene.z-130)+((obj_playeredilene.image_scale+2)*2), obj_playeredilene.wii*5, 180, dir, 80, 80, 120));
	vertex_submit(vb_boost, pr_trianglelist, sprite_get_texture(spr_boost, obj_playeredilene.wii));
	matrix_set(matrix_world, matrix_build_identity());
}
if obj_playeredilene.drift = true {
	if obj_playeredilene.hinputi = -1 {
		spr = spr_shadow;
	}
	else if obj_playeredilene.hinputi = 1 {
		spr = spr_shadow_flip;
	}
	sus = obj_playeredilene.player_direction;
}
else {
	if sus > 0 {
		sus -= 1;
	}
	else {
		sus = 0;
		spr = spr_shadow;
	}
}

dir = obj_playeredilene.look_dir;
//player
matrix_set(matrix_world, matrix_build(obj_playeredilene.x, obj_playeredilene.y, (obj_playeredilene.z-130)+((obj_playeredilene.image_scale+2)*2), 270, 0, dir, 80, 80, 100+(obj_playeredilene.image_scale*2)));
vertex_submit(vb_player_alt, pr_trianglelist, sprite_get_texture(global.sprite[obj_playeredilene.action], obj_playeredilene.player_direction));
matrix_set(matrix_world, matrix_build_identity());
matrix_set(matrix_world, matrix_build(obj_playeredilene.x, obj_playeredilene.y, -2, 270, 0, dir+90, 100+(obj_playeredilene.z/2), 100+(obj_playeredilene.z/2), 100));
vertex_submit(vb_player_shadow, pr_trianglelist, sprite_get_texture(spr, sus));
matrix_set(matrix_world, matrix_build_identity());


//map
matrix_set(matrix_world, matrix_build(obj_map.x, obj_map.y, 2, 0, 0, 0, 8345, 8345, 8345));
vertex_submit(vb_player_shadow, pr_trianglelist, sprite_get_texture(spr_map1, 0));
matrix_set(matrix_world, matrix_build_identity());

itembox(obj_itembox1);
itembox(obj_itembox2);
itembox(obj_itembox3);
itembox(obj_itembox4);
itembox(obj_itembox5);
itembox(obj_itembox6);
itembox(obj_itembox7);
itembox(obj_itembox8);
itembox(obj_itembox9);
#endregion

if keyboard_check(ord("Z")) and obj_playeredilene.drift = false and obj_playeredilene.jump = false or keyboard_check(ord("X")) or obj_playeredilene.drift = true {
	matrix_set(matrix_world, matrix_build(obj_smoke1.x, obj_smoke1.y, -3, 270, obj_playeredilene.zprev, obj_playeredilene.look_dir, 40, 40, 80));
	vertex_submit(vb_player_alt, pr_trianglelist, sprite_get_texture(obj_smoke1.sprite_index, obj_smoke1.image_index));
	matrix_set(matrix_world, matrix_build_identity());
	
	matrix_set(matrix_world, matrix_build(obj_smoke2.x, obj_smoke2.y, -3, 270, obj_playeredilene.zprev, obj_playeredilene.look_dir, 40, 40, 80));
	vertex_submit(vb_player_alt, pr_trianglelist, sprite_get_texture(obj_smoke2.sprite_index, obj_smoke2.image_index));
	matrix_set(matrix_world, matrix_build_identity());
	
	matrix_set(matrix_world, matrix_build(obj_smoke3.x, obj_smoke3.y, -3, 270, obj_playeredilene.zprev, obj_playeredilene.look_dir, 40, 40, 80));
	vertex_submit(vb_player_alt, pr_trianglelist, sprite_get_texture(obj_smoke3.sprite_index, obj_smoke3.image_index));
	matrix_set(matrix_world, matrix_build_identity());
	
	matrix_set(matrix_world, matrix_build(obj_smoke4.x, obj_smoke4.y, -3, 270, obj_playeredilene.zprev, obj_playeredilene.look_dir, 40, 40, 80));
	vertex_submit(vb_player_alt, pr_trianglelist, sprite_get_texture(obj_smoke4.sprite_index, obj_smoke4.image_index));
	matrix_set(matrix_world, matrix_build_identity());
}

if global.lap = 0 {
	red = 0;
	green = 0;
	blue = 255;
}
else if global.lap = 1 {
	red = 255;
	green = 0;
	blue = 255;
}
else if global.lap = 2 {
	red = 255;
	green = 0;
	blue = 0;
}

if stgtext > 0 {
	stgtext -= 2.5*stg_plus;
	if stgtext < 1040/1.5 {
		stg_plus += 0.5/5;
	}
}
else {
	stgtext = 0;
	stg_plus = 0;
}