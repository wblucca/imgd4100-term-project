/// @description Insert description here
// You can write your code in this editor

depth = -y - 50;

player = instance_find(obj_player, 0)

vaccel = 0;
haccel = 0;

if (using_gp) {
	vaccel = V_ACCEL_RATIO * gamepad_axis_value(0, gp_axislv);
	haccel = H_ACCEL_RATIO * gamepad_axis_value(0, gp_axislh);
} else {
	if (player.y - y < 0) {
		vaccel -= V_ACCEL_RATIO;
	}
	if (player.y - y > 0) {
		vaccel += V_ACCEL_RATIO;
	}
	if (player.x - x < 0) {
		haccel -= H_ACCEL_RATIO;
	}
	if (player.x - x > 0) {
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

hspeed += haccel;
if (hspeed < -H_MAX_SPD) {
	hspeed = -H_MAX_SPD;
} else if (hspeed > H_MAX_SPD) {
	hspeed = H_MAX_SPD;
}

vspeed += vaccel;
if (vspeed < -V_MAX_SPD) {
	vspeed = -V_MAX_SPD;
}
if (vspeed > V_MAX_SPD) {
	vspeed = V_MAX_SPD;
}