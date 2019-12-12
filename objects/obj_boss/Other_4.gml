/// @description Generate random boss and initialize

do {

// Evaluation of boss difficulty
var boss_difficulty = 0;

// Head
for (var i = 0; i < 2; i++) {
    var rand = irandom_range(0, 2);
	var new_head = heads[rand];
	if (head != new_head) {
		boss_difficulty += rand;
		break;
	}
}

// Body
for (var i = 0; i < 2; i++) {
    var rand = irandom_range(0, 2);
	var new_body = bodies[rand];
	if (body != new_body) {
		boss_difficulty += rand;
		break;
	}
}

// Legs
for (var i = 0; i < 2; i++) {
	var rand = irandom_range(0, 2);
	var new_leg = legs[rand];
	if (leg != new_leg) {
		boss_difficulty += rand;
		break;
	}
}

} until (boss_difficulty <= difficulty);

// Increase game difficulty
difficulty += .5;

// Store new body layout
head = new_head;
body = new_body;
leg = new_leg;
object_set_sprite(self, leg);


///////////////////////////////////
// Initialize instance variables //
///////////////////////////////////

// Health
var BASE_HEALTH = 50.0;
var HEALTH_FACTOR = 10.0;

// Attack speed
var BASE_ATTACK_SPD = 5.5;
var ATTACK_SPD_FACTOR = 0.5;

// Health scales with difficulty
maxHealth = BASE_HEALTH + difficulty * HEALTH_FACTOR;
health = maxHealth;

// Attack speed scales with difficulty
attackSpd = BASE_ATTACK_SPD - difficulty * ATTACK_SPD_FACTOR;

// Hue shift value [0.0, 1.0)
hueDelta = random(1);

// Array of all attacks currently being used
currentAttacks = ds_map_create();
currentAttacks[? head] = 9999;
currentAttacks[? body] = 9999;
currentAttacks[? leg] = 9999;

// Begin the attacking
alarm_set(0, 1);
