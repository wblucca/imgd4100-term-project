/// @description Initialize variables

hueDelta = 0;
turningSpeed = 0;

// Find the player for later
player = instance_find(obj_player, 0);

// Start timeout timer
alarm_set(0, 4 * room_speed);
