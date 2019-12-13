/// @description Generate random boss and initialize

do {

// Evaluation of boss difficulty
var boss_difficulty = 0;

// Head
for (var i = 0; i < 2; i++) {
    var rand = irandom_range(0, 2);
	var new_head = global.heads[rand];
	if (global.head != new_head) {
		boss_difficulty += rand;
		break;
	}
}

// Body
for (var i = 0; i < 2; i++) {
    var rand = irandom_range(0, 2);
	var new_body = global.bodies[rand];
	if (global.body != new_body) {
		boss_difficulty += rand;
		break;
	}
}

// Legs
for (var i = 0; i < 2; i++) {
	var rand = irandom_range(0, 2);
	var new_leg = global.legs[rand];
	if (global.leg != new_leg) {
		boss_difficulty += rand;
		break;
	}
}

} until (boss_difficulty <= global.difficulty);

// Increase game difficulty
global.difficulty += .5;

// Store new body layout
global.head = new_head;
global.body = new_body;
global.leg = new_leg;
head = global.head;
body = global.body;
leg = global.leg;
object_set_sprite(self, leg);


///////////////////////////////////
// Initialize instance variables //
///////////////////////////////////

// Attacks
ATTACK_UTILS = ds_map_create();
ATTACK_UTILS[? spr_machine_gun] = scr_utl_machine_gun;
ATTACK_UTILS[? spr_electro_ball] = scr_utl_electro_ball;
ATTACK_UTILS[? spr_missle_turret] = scr_utl_missile_turret;
ATTACK_UTILS[? spr_hallowfire_heart] = scr_utl_hallowfire_heart;
ATTACK_UTILS[? spr_laser] = scr_utl_laser;
ATTACK_UTILS[? spr_heart_gen] = scr_utl_heart_gen;
ATTACK_UTILS[? spr_stone_giant] = scr_utl_stone_giant;
ATTACK_UTILS[? spr_spider] = scr_utl_spider;
ATTACK_UTILS[? spr_wizard] = scr_utl_wizard;

// Health
var BASE_HEALTH = 30.0;
var HEALTH_FACTOR = 7.0;

// Attack speed (in seconds)
var BASE_ATTACK_SPD = 5.5;
var ATTACK_SPD_FACTOR = 0.5;

// Health scales with difficulty
maxHealth = BASE_HEALTH + global.difficulty * HEALTH_FACTOR;
health = maxHealth;

// Attack speed scales with difficulty
attackSpd = BASE_ATTACK_SPD - global.difficulty * ATTACK_SPD_FACTOR;

// Hue shift value [0.0, 1.0)
hueDelta = random(1);

// Array of all attacks currently being used
currentAttacks = ds_map_create();
currentAttacks[? head] = 9999;
currentAttacks[? body] = 9999;
currentAttacks[? leg] = 9999;

// Begin the attacking
alarm_set(0, room_speed);
