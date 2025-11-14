/// @desc A Combination of 4 vertex functions in one!, this can save a lot of time.
/// @param {Id.VertexBuffer} Vbuffer Put the Vbuffer here.
/// @param {real} x1 Description
/// @param {real} y1 Description
/// @param {real} z Description
/// @param {real} nx Description
/// @param {real} ny Description
/// @param {real} nz Description
/// @param {real} u Description
/// @param {real} v Description
/// @param {constant.color} color Put the color here.
/// @param {real} alpha Put the alpha here.
function vertex_add_point(vbuffer, x1, y1, z, nx, ny, nz, u, v, color, alpha){
	vertex_position_3d(vbuffer, x1, y1, z);
	vertex_normal(vbuffer, nx, ny, nz);
	vertex_texcoord(vbuffer, u, v);
	vertex_color(vbuffer, color, alpha);
}