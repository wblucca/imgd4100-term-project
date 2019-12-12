/// @description Stop when hitting an pit

// If horizontal collision
if (!place_meeting(x - hspeed, y, obj_obst)) {
	// Step back to before
	x -= hspeed;
	
	// Halt horizontal speed
	hspeed = 0;
	haccel = 0;
}

// If vertical collision
if (!place_meeting(x, y - vspeed, obj_obst)) {
	// Step back to before
	y -= vspeed;
	
	// Halt vertical speed
	vspeed = 0;
	vaccel = 0;
}
