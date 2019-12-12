/// @description Draw body parts with hue shift

shader_set(shd_hue_swap);

// Get hue shift variable
var s_hueDelta = shader_get_uniform(shd_hue_swap, "hueDelta");
shader_set_uniform_f(s_hueDelta, hueDelta);
draw_sprite(new_head, 0, x, y - sprite_get_height(new_legs) - sprite_get_height(new_body));
draw_sprite(new_body, 0, x, y - sprite_get_height(new_legs));
draw_sprite(new_legs, 0, x, y);

shader_reset();

var healthX = camera_get_view_x(view_camera[0]) + 10;
var healthY = camera_get_view_y(view_camera[0]) + 10;
var healthWidth = camera_get_view_width(view_camera[0]) - 20;
var healthHeight = 20;
draw_healthbar(
	healthX,
	healthY,
	healthX + healthWidth,
	healthY + healthHeight,
	maxHealth,
	c_black, c_red, c_green,
	0, true, true);
