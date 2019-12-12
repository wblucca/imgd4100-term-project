/// @description Perform attacks and movement

// Update draw depth
depth = -y - 50;


//////////////
// Movement //
//////////////

player = instance_find(obj_player, 0)

vaccel = 0;
haccel = 0;

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


/////////////
// Attacks //
/////////////

// Get attack key
var attack = ds_map_find_first(currentAttacks);
for (var i = 0; i < ds_map_size(currentAttacks); i++) {
    // How many frames since attack started
	var attackTime = currentAttacks[? attack];
	
	// Run attack
	switch (attack) {
		
		case spr_machine_gun:
			if (attackTime < 60 && attackTime % 3 == 0) {
				show_debug_message(attackTime);
			}
			break;
			
	}
	
	// Update time
	currentAttacks[? attack] += 1;
	
	// Continue iterating through map
	attack = ds_map_find_next(currentAttacks, attack);
}
