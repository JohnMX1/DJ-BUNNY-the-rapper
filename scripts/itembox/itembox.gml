/// Function Description
/// @param {Asset.GMObject} obj Description

function itembox(obj){
	if instance_exists(obj) {
		//item_box direita e esquerda
		matrix_set(matrix_world, matrix_build(obj.x, obj.y, obj.z-80, obj.spin, obj.spin, obj.spin, 40, 40, 60));
		vertex_submit(vb_itembox, pr_trianglelist, sprite_get_texture(obj.sprite_index, 0));
		matrix_set(matrix_world, matrix_build_identity());
		//spinning question mark
		matrix_set(matrix_world, matrix_build(obj.x, obj.y, obj.z-75, 0, 0, obj.spin, 40, 40, -380));
		vertex_submit(vb_itemboxalt, pr_trianglelist, sprite_get_texture(spr_question, 0));
		matrix_set(matrix_world, matrix_build_identity());
		//item_box direita e esquerda
		matrix_set(matrix_world, matrix_build(obj.x, obj.y, obj.z-140, 0, 0, obj.spin, 40, 40, 60));
		vertex_submit(vb_itemboxalt, pr_trianglelist, sprite_get_texture(spr_bumper, 2));
		matrix_set(matrix_world, matrix_build_identity());
		//item_box direita e esquerda
		matrix_set(matrix_world, matrix_build(obj.x, obj.y, obj.z-8, 0, 0, -obj.spin, 40, 40, 60));
		vertex_submit(vb_itemboxalt, pr_trianglelist, sprite_get_texture(spr_bumper, 0));
		matrix_set(matrix_world, matrix_build_identity());
	}
}