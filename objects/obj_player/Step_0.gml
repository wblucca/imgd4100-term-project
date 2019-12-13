/// @description Movement

vaccel = 0;
haccel = 0;

if (using_gp) {
	vaccel = V_ACCEL_RATIO * gamepad_axis_value(0, gp_axislv);
	haccel = H_ACCEL_RATIO * gamepad_axis_value(0, gp_axislh);
} else {
	if (keyboard_check(UP)) {
		vaccel -= V_ACCEL_RATIO;
	}
	if (keyboard_check(DOWN)) {
		vaccel += V_ACCEL_RATIO;
	}
	if (keyboard_check(LEFT)) {
		haccel -= H_ACCEL_RATIO;
	}
	if (keyboard_check(RIGHT)) {
		haccel += H_ACCEL_RATIO;
	}
	
	// Diagonal movement
	if (vaccel != 0 && haccel != 0) {
		vaccel *= DIAG_MULT;
		haccel *= DIAG_MULT;
	}
}

	
hspeed += haccel;
vspeed += vaccel;

if (!pushed) {
	// Friction
	hspeed = hspeed * (1.0 - FRICTION);
	vspeed = vspeed * (1.0 - FRICTION);
	if (hspeed < -H_MAX_SPD) {
		hspeed = -H_MAX_SPD;
	} else if (hspeed > H_MAX_SPD) {
		hspeed = H_MAX_SPD;
	}

	if (vspeed < -V_MAX_SPD) {
		vspeed = -V_MAX_SPD;
	}
	if (vspeed > V_MAX_SPD) {
		vspeed = V_MAX_SPD;
	}
} else {
	// Pushing friction
	hspeed = hspeed * 0.9;
	vspeed = vspeed * 0.9;
}

// If horizontal collision
if (place_meeting(x + hspeed, y, obj_wall) ||
	place_meeting(x + hspeed, y, obj_obst)) {	
	// Halt horizontal speed
	hspeed = 0;
	haccel = 0;
}

// If vertical collision
if (place_meeting(x, y + vspeed, obj_wall) ||
	place_meeting(x, y + vspeed, obj_obst)) {
	// Halt vertical speed
	vspeed = 0;
	vaccel = 0;
}

// Update draw depth
depth = -y;

// Get new camera position
camHSpeed = CAM_SPD * (x - camX);
camVSpeed = CAM_SPD * (y - camY);
camX += camHSpeed;
camY += camVSpeed;

// Move camera
camera_set_view_pos(view_camera[0],
camX - camWidth / 2,
camY - camHeight / 2);


if (life <= 0) {
	if show_question("You died! Want ot try again?") {
		game_restart();
	}
	else {
		game_end();
	}
}