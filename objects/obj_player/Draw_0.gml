/// @description Draw with hue shift shader

shader_set(shd_hue_swap);

// Get hue shift variable
v_hueDelta = shader_get_uniform(shd_hue_swap, "hueDelta");
shader_set_uniform_f(v_hueDelta, hueDelta);

// Draw
draw_self();
shader_reset();
