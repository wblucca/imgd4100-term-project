/// @description Draw body parts with hue shift

shader_set(shd_hue_swap);

// Get hue shift variable
var s_hueDelta = shader_get_uniform(shd_hue_swap, "hueDelta");
shader_set_uniform_f(s_hueDelta, hueDelta);
draw_sprite(head, 0, x, y - sprite_get_height(leg) - sprite_get_height(body));
draw_sprite(body, 0, x, y - sprite_get_height(leg));
draw_sprite(leg, 0, x, y);

shader_reset();
