/// @description Insert description here
// You can write your code in this editor

depth = -y - 10000;

// Emerge from boss
x = boss.x;
y = boss.y - sprite_get_height(boss.leg) - 19.5;

// Follow player
endX = lerp(endX, player.x, followSpeed);
endY = lerp(endY, player.y, followSpeed);

// Update drawing
image_angle = point_direction(x, y, endX, endY);
var hitObj = collision_line(
	x, y,
	x + length * dcos(image_angle), y - length * dsin(image_angle),
	obj_wall,
	false,
	true);
image_xscale = distance_to_object(hitObj) / sprite_get_width(spr_laser);

// Activated laser
if (!damaging) {
	image_yscale = 0.1;
} else {
	image_yscale = 1.0;
}
