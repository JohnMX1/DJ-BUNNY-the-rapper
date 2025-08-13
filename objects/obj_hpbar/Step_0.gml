image_xscale = lerp(image_xscale, base_xscale, 0.1);
image_yscale = lerp(image_yscale, base_yscale, 0.1);
image_alphaa = obj_chart.image_alphaa;
image_alpha = 0;
global.opphp = clamp(global.opphp, 0, 100);
global.mainhp = clamp(global.mainhp, 0, 100);