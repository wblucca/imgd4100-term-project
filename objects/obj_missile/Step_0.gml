/// @description Accelerate and update draw depth

depth = -y - 50;

// Get difference in direction
var playerDir = point_direction(x, y, player.x, player.y) - 180;
var diff = direction - playerDir;

// Home in
if (abs(diff) < 180) {
	direction += sign(diff) * turningSpeed;
} else {
	diff -= sign(diff) * 360;
	direction += sign(diff) * turningSpeed;
}
