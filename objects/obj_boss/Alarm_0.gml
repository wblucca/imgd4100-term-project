/// @description Pick an attack and execute

show_debug_message("Decide time!");

// Priority queue for sorting attacks by utility score
var attackSel = ds_priority_create();

// Add attacks to the queue with priority equal to their utility
ds_priority_add(
	attackSel,
	head,
	script_execute(ATTACK_UTILS[? head]));
ds_priority_add(
	attackSel,
	body,
	script_execute(ATTACK_UTILS[? body]));
ds_priority_add(
	attackSel,
	leg,
	script_execute(ATTACK_UTILS[? leg]));

// Get highest priority attack and use it
var attack = ds_priority_find_max(attackSel);
currentAttacks[? attack] = 0;

// Clean up
ds_priority_destroy(attackSel);

// Restart the attacking
alarm_set(0, room_speed * max(0, attackSpd + random_range(-1, 1)));
