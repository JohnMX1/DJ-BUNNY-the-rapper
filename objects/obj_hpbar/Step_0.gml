x = camera_get_view_x(view_camera[0])+base_x;
y = camera_get_view_y(view_camera[0])+base_y;
if image_yscale < base_yscale {
	image_yscale += (base_yscale - image_yscale) * 0.1;
}
if image_xscale < base_xscale {
	image_xscale += (base_xscale - image_xscale) * 0.1;
}
image_alpha = obj_chart.image_alphaa;