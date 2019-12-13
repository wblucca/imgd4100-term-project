/// @description Perform attacks and movement


//////////////
// Movement //
//////////////

// Update draw depth
if (leg == spr_wizard) {
	depth = -10000;
} else {
	depth = -y;
}

switch (leg) {
	case spr_wizard:
		// Home in on player slowly
		if (speed < WZ_MAX_SPD) {
			// Accelerate towards player if under top speed
			hspeed += sign(player.x - x) * WZ_ACCEL;
			vspeed += sign(player.y - y) * WZ_ACCEL;
		} else {
			// Slow it down
			hspeed *= 0.9;
			vspeed *= 0.9;
		}
		break;
		
	case spr_stone_giant:
		// Walk on 90s towards player
		sgWalkFrames++;
		if (sgWalkFrames >= SG_WALK_DUR) {
			// Change direction
			var xDiff = player.x - x;
			var yDiff = player.y - y;
			if (abs(xDiff) > abs(yDiff)) {
				hspeed = sign(xDiff) * SG_SPEED;
				vspeed = 0;
			} else {
				vspeed = sign(player.y - y) * SG_SPEED;
				hspeed = 0;
			}
			
			// Reset walk counter
			sgWalkFrames = 0;
		}
		break;
	
	case spr_spider:
		if (currentAttacks[? spr_spider] > SP_DURATION) {
			// Point at player and move
			direction = point_direction(x, y, player.x, player.y);
			speed = SP_SPEED;
		
			// If close, try to strafe
			var distToPlayer = distance_to_object(player);
			if (distToPlayer <= SP_STRAFE_DIST * 2) {
				dirChange = lerp(-180, 0, distToPlayer / (SP_STRAFE_DIST * 2));
				direction += dirChange;
				if (direction < 0) {
					direction += 360;
				}
			}
		}
		break;
}

// Collisions
if (leg != spr_wizard) {
	// If horizontal collision
	if (place_meeting(x + hspeed, y, obj_wall)) {	
		// Halt horizontal speed
		hspeed = 0;
	}

	// If vertical collision
	if (place_meeting(x, y + vspeed, obj_wall)) {
		// Halt vertical speed
		vspeed = 0;
	}
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
			
		case spr_heart_gen:
			if (attackTime < HRT_DURATION && attackTime % HRT_DELAY == 0) {
				// Heal
				health += .1;
			}
			
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
			
		case spr_spider:
			// Pick jump target
			if (attackTime == 0) {
				var randDirection = random(360);
				spTargetX = SP_TARGET_DIST * dcos(randDirection);
				spTargetY = SP_TARGET_DIST * dsin(randDirection);
			}
		
			if(attackTime < SP_DURATION) {
				speed = 0;
				direction = 0;
				if (attackTime < SP_DURATION / 2) {
					y -= SP_JUMP_SPD;
				} else {
					x = player.x + spTargetX;
					y = player.y  + spTargetY - ((SP_DURATION - attackTime) * SP_JUMP_SPD);
				}
			}
			
			// Push the player
			if (attackTime == SP_DURATION) {
				player.pushed = true;
				player.alarm[0] = 10;
				player.hspeed = SP_PUSH_FORCE * -spTargetX / SP_TARGET_DIST;
				player.vspeed = SP_PUSH_FORCE * -spTargetY / SP_TARGET_DIST;
			}
			break;
	}
	
	// Update time
	currentAttacks[? attack] += 1;
	
	// Continue iterating through map
	attack = ds_map_find_next(currentAttacks, attack);
}