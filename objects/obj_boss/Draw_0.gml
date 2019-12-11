/// @description Insert description here
// You can write your code in this editor

shader_set(shd_hue_swap);

// Get hue shift variable
var s_hueDelta = shader_get_uniform(shd_hue_swap, "hueDelta");
shader_set_uniform_f(s_hueDelta, hueDelta);
draw_sprite(new_head, 0, x, y - sprite_get_height(new_legs) - sprite_get_height(new_body));
draw_sprite(new_body, 0, x, y - sprite_get_height(new_legs));
draw_sprite(new_legs, 0, x, y);

shader_reset();