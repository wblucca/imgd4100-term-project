/// @description Stop when hitting an obst

var STEP = 0.05;

// If hitting horizontal
if (place_meeting(x + hspeed, y, obj_wall)) {
	// Step up to wall
	while (place_meeting(x + STEP, y, obj_wall)) {
		x += STEP;
	}
	
	// Halt horizontal speed
	hspeed = 0;
	haccel = 0;
}

// If hitting vertical
if (place_meeting(x, y + vspeed, obj_wall)) {
	// Step up to wall
	while (place_meeting(x, y + STEP, obj_wall)) {
		y += STEP;
	}
	
	// Halt horizontal speed
	vspeed = 0;
	vaccel = 0;
}
