/// @description Draw frankenbody and do hue shift

draw_sprite(new_head, 0, x, y - sprite_get_height(new_legs) - sprite_get_height(new_body));
draw_sprite(new_body, 0, x, y - sprite_get_height(new_legs));
draw_sprite(new_legs, 0, x, y);
