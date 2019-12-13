/// @description Draw health bar at top of screen

draw_healthbar(
	window_get_width() - 280,
	850,
	window_get_width() - 30,
	880,
	life,
	c_dkgray, c_red, c_green,
	0, true, true);
