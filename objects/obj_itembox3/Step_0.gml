spin++;
if spin = 360 {
	spin = 0;
}
if broke = true {
	x = !xstart;
	sus++;
	if sus = 300 {
		sus = 0;
		broke = false;
	}
}
else {
	x = xstart;
}