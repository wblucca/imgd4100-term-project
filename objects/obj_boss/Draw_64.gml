/// @description Draw health bar at top of screen

draw_healthbar(
	80,
	80,
	window_get_width() - 80,
	110,
	health / maxHealth * 100,
	c_dkgray, c_red, c_green,
	0, true, true);
