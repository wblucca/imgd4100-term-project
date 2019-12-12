/// @description Initialize variables

DURATION = 2;
hueDelta = 0;

// Activation/deactivation
NON_DAMAGING_DUR = 60;
damaging = false;
alarm_set(1, NON_DAMAGING_DUR);

// Endpoint of laser
length = 1000;
endX = x;
endY = y;

// Find instances
boss = instance_find(obj_boss, 0);
player = instance_find(obj_player, 0);

// Start timeout timer
alarm_set(0, DURATION * room_speed);
