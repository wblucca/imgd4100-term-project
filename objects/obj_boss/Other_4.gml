/// @description Generate random boss and initialize

do {

// Evaluation of boss difficulty
var boss_difficulty = 0;

// Head
for (var i = 0; i < 2; ++i) {
    var rand = irandom_range(0, 2);
	new_head = global.heads[rand];
	if (global.head != new_head) {
		boss_difficulty += rand;
		break;
	}
}

// Body
for (var i = 0; i < 2; ++i) {
    var rand = irandom_range(0, 2);
	new_body = global.bodies[rand];
	if (global.body != new_body) {
		boss_difficulty += rand;
		break;
	}
}

// Legs
for (var i = 0; i < 2; ++i) {
	var rand = irandom_range(0, 2);
	new_legs = global.legs[rand];
	if (global.leg != new_legs) {
		boss_difficulty += rand;
		break;
	}
}

} until (boss_difficulty <= global.difficulty);

// Increase game difficulty
global.difficulty += .5;

object_set_sprite(self, new_legs);


///////////////////////////////////
// Initialize instance variables //
///////////////////////////////////

// Health
var BASE_HEALTH = 50.0;
var HEALTH_FACTOR = 10.0;

// Attack speed
var BASE_ATTACK_SPD = 5.5;
var ATTACK_SPD_FACTOR = 0.5;

// Attacks
ATTACK_UTILS = ds_map_create();
ATTACK_UTILS[? global.heads[0]] = scr_utl_machine_gun;
ATTACK_UTILS[? global.heads[1]] = scr_utl_electro_ball;
ATTACK_UTILS[? global.heads[2]] = scr_utl_missile_turret;
ATTACK_UTILS[? global.bodies[0]] = scr_utl_hallowfire_heart;
ATTACK_UTILS[? global.bodies[1]] = scr_utl_laser;
ATTACK_UTILS[? global.bodies[2]] = scr_utl_shield_gen;
ATTACK_UTILS[? global.legs[0]] = scr_utl_stone_giant;
ATTACK_UTILS[? global.legs[1]] = scr_utl_spider;
ATTACK_UTILS[? global.legs[2]] = scr_utl_wizard;

// Health scales with difficulty
maxHealth = BASE_HEALTH + global.difficulty * HEALTH_FACTOR;
health = maxHealth;

// Attack speed scales with difficulty
attackSpd = BASE_ATTACK_SPD - global.difficulty * ATTACK_SPD_FACTOR;

// Hue shift value [0.0, 1.0)
hueDelta = random(1);

currentAttack = pointer_null;

alarm_set(0, attackSpd + random_range(-1, 1));
