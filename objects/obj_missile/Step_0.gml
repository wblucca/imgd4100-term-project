/// @description Accelerate and update draw depth

depth = -y - 50;

if (speed < maxSpeed) {
	// Accelerate towards player if under top speed
	hspeed += sign(player.x - x) * accel;
	vspeed += sign(player.y - y) * accel;
} else {
	// Slow it down
	hspeed *= 0.9;
	vspeed *= 0.9;
}

image_angle = darctan2(-vspeed, hspeed);
