/// @description Initialize variables

hueDelta = 0;
accel = 0;
maxSpeed = 0;

// Find the player for later
player = instance_find(obj_player, 0);

// Start timeout timer
alarm_set(0, 5 * room_speed);
