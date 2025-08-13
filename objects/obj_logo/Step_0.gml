sus += 5;
image_angle = lerp(image_angle, 360, 0.02);
if image_angle <= 380 {
	col = true;
}
if y < 320 {
	y += (320 - y) * 0.02;
}
else {
	y = 320;
}
if col = true {
	if ui = true {
		micx = lerp(micx, 1, 0.2);
		if susx < 32 {
			susx += 2;
		}
		if susy < 32 {
			susy += 2;
		}
	}
	image_xscale_text = lerp(image_xscale_text, 1, 0.2);
	image_yscale_text = lerp(image_yscale_text, 1, 0.2);
	if image_alphaa < 1 {
		image_alphaa += lerp(1, image_alphaa, 0.5);
	}
	else {
		ui = true;
	}
}