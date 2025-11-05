if global.countdown = true {
	s += 1//random_range(0.5, 2);
	if ccnt < 3 {
		draw_sprite_ext(countdown_sprite, ccnt, 683, 384, ccntx, ccntx, 0, c_white, cnt[ccnt]);
		draw_sprite_ext(countdown_sprite_bright, ccnt, 683, 384, ccntx+s*cnt1[ccnt], ccntx+s*cnt1[ccnt], 0, c_white, cnt1[ccnt]);
	}
	else {
		draw_sprite_ext(countdown_sprite, 3, 683-(64*ccntx), 384, ccntx, ccntx, 0, c_white, cnt[3]);
		draw_sprite_ext(countdown_sprite_bright, 3, 683-(64*ccntx), 384, ccntx+s*cnt1[ccnt], ccntx+s*cnt1[ccnt], 0, c_white, cnt1[3]);
		draw_sprite_ext(countdown_sprite, 4, 683+(64*ccntx), 384, ccntx, ccntx, 0, c_white, cnt[4]);
		draw_sprite_ext(countdown_sprite_bright, 4, 683+(64*ccntx), 384, ccntx+s*cnt1[ccnt], ccntx+s*cnt1[ccnt], 0, c_white, cnt1[4]);
	}
}