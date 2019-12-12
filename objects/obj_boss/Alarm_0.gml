/// @description Pick an attack and execute

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

// Get highest priority attack
var attack = ds_priority_delete_max(attackSel);

// If currently being used, skip to next
while (currentAttacks[? attack] < room_speed * attackSpd &&
       ds_priority_size(attackSel) > 0) {
	attack = ds_priority_delete_max(attackSel);
}
currentAttacks[? attack] = 0;

// Clean up
ds_priority_destroy(attackSel);

// Restart the attacking
alarm_set(0, room_speed * max(1, attackSpd * random_range(0.8, 1.2)));
