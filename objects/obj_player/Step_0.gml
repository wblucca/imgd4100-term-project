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

// Friction
hspeed = hspeed * (1.0 - FRICTION);
vspeed = vspeed * (1.0 - FRICTION);

hspeed += haccel
if (hspeed < -H_MAX_SPD) {
	hspeed = -H_MAX_SPD;
} else if (hspeed > H_MAX_SPD) {
	hspeed = H_MAX_SPD;
}

vspeed += vaccel
if (vspeed < -V_MAX_SPD) {
	vspeed = -V_MAX_SPD;
}
if (vspeed > V_MAX_SPD) {
	vspeed = V_MAX_SPD;
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
