/// @description Camera Vbuffer & Format
global.stage = stage_get_name(0);
stgtext = 1040;
stg_plus = 1;
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
gpu_set_alphatestenable(true);
gpu_set_alphatestref(10);


vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
vertex_format = vertex_format_end();

vbuffer = vertex_create_buffer();
vertex_begin(vbuffer, vertex_format);

/*
var x1 = obj_player.x;
var y1 = obj_player.y;
var x2 = obj_player.x+32;
var y2 = obj_player.y+32;
var zz = obj_player.z;

vertex_add_point(vbuffer, x1, y1, zz,		0, 0, 1,		0, 0,		c_white, 1);
vertex_add_point(vbuffer, x2, y1, zz,		0, 0, 1,		0, 0,		c_white, 1);
vertex_add_point(vbuffer, x2, y2, zz,		0, 0, 1,		0, 0,		c_white, 1);

vertex_add_point(vbuffer, x2, y2, zz,		0, 0, 1,		0, 0,		c_white, 1);
vertex_add_point(vbuffer, x2, y2, zz,		0, 0, 1,		0, 0,		c_white, 1);
vertex_add_point(vbuffer, x1, y1, zz,		0, 0, 1,		0, 0,		c_white, 1);
*/


var s = 128;
for (var i = 0; i < room_width; i += s) {
	for (var j = 0; j < room_height; j += s) {
		if ((i % (s * 2) == 0 && j % (s * 2) == 0) || (i % (s * 2) > 0 && j % (s * 2) > 0)){
			var color = c_gray;
		}
		else {
			var color = c_white;
		}
		vertex_add_point(vbuffer, i, j, 10,				0, 0, 1,		0, 0,		color, 1);
		vertex_add_point(vbuffer, i + s, j, 10,			0, 0, 1,		1, 0,		color, 1);
		vertex_add_point(vbuffer, i + s, j + s, 10,		0, 0, 1,		1, 1,		color, 1);
		
		vertex_add_point(vbuffer, i + s, j + s, 10,		0, 0, 1,		1, 1,		color, 1);
		vertex_add_point(vbuffer, i, j + s, 10,			0, 0, 1,		0, 1,		color, 1);
		vertex_add_point(vbuffer, i, j, 10,				0, 0, 1,		0, 0,		color, 1);
	}
}

vertex_end(vbuffer);

view_mat = undefined;
proj_mat = undefined;

vb_player_alt = import_obj("cardboard.obj", vertex_format);
vb_player = import_obj("Carro finalizado.obj", vertex_format);
vb_boost = import_obj("boost.obj", vertex_format);
vb_player_shadow = import_obj("shadow.obj", vertex_format);
vb_limit = import_obj("Square.obj", vertex_format);
vb_itembox = import_obj("circle.obj", vertex_format);
vb_itemboxalt = import_obj("rectcircle.obj", vertex_format);
vb_itemq = import_obj("unbasedsquare.obj", vertex_format);
vb_skybox = import_obj("box.obj", vertex_format);
global.lap = 0;
red = 0;
green = 0;
blue = 255;

time = 0;
xscale = 100;
sus = 0;