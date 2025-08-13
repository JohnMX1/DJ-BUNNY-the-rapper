soc++;
if soc = 1 {
	if secret = 0 {
		secrt = 1;
	}
	else {
		secrt = 0;
	}
}
else {
	if secret = 1 {
		if point_distance(x, y, obj_chart.inputboxx[0], y) < 100 {
			secrtsus += 1;
			if secrtsus >= 3 {
				secrt = 0;
			}
			else {
				if secrt < 1 {
					secrt += lerp(1, secrt, 0.02);
				}
				else {
					secrt = 1;
				}
			}
		}
	}
	if turn = 0 {
		y = ((72 + (40*(line-1))*obj_chart.lineyscale[0])*secrt);
		image_yscale = obj_chart.lineyscale[0];
	}
	else {
		y = (((72+(40*obj_chart.line_spaces[0]+40)*obj_chart.lineyscale[0]) + (40*(line-1))*obj_chart.lineyscale[1])*secrt);
		image_yscale = obj_chart.lineyscale[1];
	}
	if sec > 0.01 {
		sec -= 0.01;
	}
	else {
		sec = 0;
	}
	if sus = 0 {
		if image_xscale <= -1 {
			image_xscale = -1;
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
			image_xscale = 1;
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
}