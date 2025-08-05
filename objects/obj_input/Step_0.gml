if turn = 0 {
	y = (72+(40*obj_chart.line_spaces[0]+40)*obj_chart.lineyscale[0]);
}
else {
	y = (72+(40*obj_chart.line_spaces[0]+40)*obj_chart.lineyscale[0]) + (40*(line-1))*obj_chart.lineyscale[1];
}
image_yscale = obj_chart.lineyscale[1];
if sec > 0.01 {
	sec -= 0.01;
}
if sus = 0 {
	if image_xscale <= -1 {
		if sac < 3 {
			sus = 1;
			sac++;
		}
		else {
			sus = 2;
		}
	}
	else {
		image_xscale -= sec;
	}
}
else if sus = 1 {
	if image_xscale >= 1 {
		if sac < 3 {
			sus = 0;
			sac++;
		}
		else {
			sus = 2;
		}
	}
	else {
		image_xscale += sec;
	}
}