if image_yscale < 0 {
	y += 5;
	image_yscale += 1;
}
else {
	y -= 5;
	image_yscale -= 1;
}
if image_yscale <= 1 and image_yscale >= -1 {
	instance_destroy();
}
sus++;