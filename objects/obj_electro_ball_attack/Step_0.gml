/// @description Accelerate and update draw depth

depth = -y - 50;

// Home in
direction = lerp(
	direction,
	point_direction(x, y, player.x, player.y),
	turningSpeed);
