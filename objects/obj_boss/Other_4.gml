/// @description Insert description here
// You can write your code in this editor
do {
    var boss_difficulty = 0;


for (var i = 0; i < 2; ++i) {
    var rand = irandom_range(0, 2);
	new_head = global.heads[rand];
	if (global.head == new_head) {
	    
	}
	else {
		boss_difficulty += rand;
		break;
	}
}

for (var i = 0; i < 2; ++i) {
    var rand = irandom_range(0, 2);
	new_body = global.bodies[rand];
	if (global.body == new_body) {
	    
	}
	else {
		boss_difficulty += rand;
		break;
	}
}

for (var i = 0; i < 2; ++i) {
	var rand = irandom_range(0, 2);
	new_legs = global.legs[rand];
	if (global.leg == new_legs) {
	    
	}
	else {
		boss_difficulty += rand;
		break;
	}
}
} until (boss_difficulty <= global.difficulty);


global.difficulty += .5;


object_set_sprite(self, new_legs)