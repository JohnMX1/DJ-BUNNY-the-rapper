if y1 = -32 {
	p1 = 0;
	color1 = c_ltgray;
}
else if y1 = 0 and p1 = 0 {
	p1 = 1;
	color1 = c_white;
}
else if y1 = 32 {
	p1 = 2;
	color1 = c_grey;
}
if p1 = 0 {
	y1 += 2;
}
else if p1 = 1 {
	y1 += 2;
}
else {
	y1 -= 2;
}

if y2 = -32 {
	p2 = 0;
	color2 = c_ltgray;
}
else if y2 = 0 and p2 = 0 {
	p2 = 1;
	color2 = c_white;
}
else if y2 = 32 {
	p2 = 2;
	color2 = c_grey;
}
if p2 = 0 {
	y2 += 2;
}
else if p2 = 1 {
	y2 += 2;
}
else {
	y2 -= 2;
}

if y3 = -32 {
	p3 = 0;
	color3 = c_ltgray;
}
else if y3 = 0 and p3 = 0 {
	p3 = 1;
	color3 = c_white;
}
else if y3 = 32 {
	p3 = 2;
	color3 = c_grey;
}
if p3 = 0 {
	y3 += 2;
}
else if p3 = 1 {
	y3 += 2;
}
else {
	y3 -= 2;
}