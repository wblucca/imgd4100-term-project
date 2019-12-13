/// @description Perform attacks and movement

// Update draw depth
depth = -y - 50;


//////////////
// Movement //
//////////////

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
			if (attackTime < MG_DURATION && attackTime % MG_DELAY == 0) {
				// Shoot 2 bullets
				var startX = x - 5
				var startY = y - 80;
				for (var num = 0; num < 2; num++) {
					// Create one bullet
					var bullet = instance_create_depth(startX + 10 * num, startY, -startY, obj_machine_gun_bullet);
					bullet.direction = point_direction(bullet.x, bullet.y, player.x, player.y);
					bullet.image_angle = bullet.direction;
					bullet.speed = MG_SPEED;
					bullet.hueDelta = hueDelta;
				}
			}
			break;
		
		case spr_hallowfire_heart:
			if (attackTime < HH_DURATION && attackTime % HH_DELAY == 0) {
				// Shoot a fireball
				var startY = y - 40;
				var fire = instance_create_depth(x, startY, -startY, obj_fireball);
				fire.direction = point_direction(fire.x, fire.y, player.x, player.y);
				fire.image_angle = fire.direction;
				fire.speed = HH_SPEED;
				fire.accel = HH_ACCEL;
				fire.hueDelta = hueDelta;
				fire.image_xscale = HH_SCALE;
				fire.image_yscale = HH_SCALE;
			}
			break;
			
		case spr_laser:
			if(attackTime < LZR_DURATION) {
				var startY = y - 40;
				var laser = instance_create_depth(x, startY, -startY, obj_laser);
				laser.image_angle = point_direction(laser.x, laser.y, player.x, player.y);
				laser.followSpeed = LZR_FOLLOW_SPEED;
				laser.hueDelta = hueDelta;
			}
			break;
			
		case spr_electro_ball:
			if(attackTime < EL_DURATION && attackTime % EL_DELAY == 0) {
				var startY = y - 40;
				var electroBall = instance_create_depth(x, startY, -startY, obj_electro_ball_attack);
				electroBall.direction = point_direction(electroBall.x, electroBall.y, player.x, player.y);
				electroBall.speed = EL_SPEED;
				electroBall.turningSpeed = EL_TURNING_SPEED;
				electroBall.hueDelta = hueDelta;
				electroBall.image_xscale = EL_SCALE;
				electroBall.image_yscale = EL_SCALE;
			}
			break;
			
		case spr_missle_turret:
			if(attackTime < MS_DURATION && attackTime % MS_DELAY == 0) {
				var startY = y - 80;
				var missile = instance_create_depth(x, startY, -startY, obj_missile);
				missile.direction = point_direction(missile.x, missile.y, player.x, player.y);
				missile.hueDelta = hueDelta;
				missile.accel = MS_ACCEL;
				missile.maxSpeed = MS_MAX_SPD;
				missile.direction = random(360);
				missile.speed = 2;
			}
			break;
	}
	
	// Update time
	currentAttacks[? attack] += 1;
	
	// Continue iterating through map
	attack = ds_map_find_next(currentAttacks, attack);
}
