image_xscale = 100;
image_yscale = 100;
image_alpha -= 0.01;
if image_alpha <= 0 {
	instance_destroy();
}