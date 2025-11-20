draw_clear(c_blue);

shader_set(shd_basic_3d_stuff);

var camera = camera_get_active();
var camera_distance = obj_camera_follow.look_dist;
var xto = obj_camera_follow.x;
var yto = obj_camera_follow.y;
var zto = obj_camera_follow.z;
var xfrom = xto - camera_distance * dcos(obj_camera_follow.look_dir);
var yfrom = yto + camera_distance * dsin(obj_camera_follow.look_dir);
var zfrom = zto + camera_distance * dsin(obj_camera_follow.look_pitch);

view_mat = matrix_build_lookat(xfrom, yfrom, zfrom, xto, yto, zto, 0, 0, 1);
proj_mat = matrix_build_projection_perspective_fov(60, window_get_height() / window_get_width(), 1, 32000);
camera_set_view_mat(camera, view_mat);
camera_set_proj_mat(camera, proj_mat);
camera_apply(camera);

gpu_set_tex_repeat(true);
// Everything must be drawn after the 3D projection has been set
vertex_submit(vbuffer, pr_trianglelist, sprite_get_texture(spr_load, 0));

shader_reset();