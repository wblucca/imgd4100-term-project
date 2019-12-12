/// @description Insert description here
// You can write your code in this editor

shader_set(shd_hue_swap);

// Get hue shift variable
var s_hueDelta = shader_get_uniform(shd_hue_swap, "hueDelta");
shader_set_uniform_f(s_hueDelta, hueDelta);

// Draw
draw_self();
shader_reset();