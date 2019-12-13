/// @description Constants


//////////////
// Movement //
//////////////

// Wizard
WZ_MAX_SPD = 4;
WZ_ACCEL = 0.02;

// Stone giant
SG_SPEED = 1;
SG_WALK_DUR = 50;
sgWalkFrames = 0;

// Spider
SP_SPEED = 2;


/////////////
// Attacks //
/////////////

// Machine gun
MG_DURATION = 60;
MG_DELAY = 3;
MG_SPEED = 7;

// Electro ball
EL_DURATION = 60;
EL_DELAY = 30;
EL_SPEED = 3.5;
EL_TURNING_SPEED = 2;  // Degrees per frame
EL_SCALE = 4;

// Missile turret
MS_DURATION = 18;
MS_DELAY = 3;
MS_ACCEL = 0.28;
MS_MAX_SPD = 8.5;

// Hallowfire heart
HH_DURATION = 90;
HH_DELAY = 30;
HH_SPEED = -2.5;
HH_ACCEL = 0.3;
HH_SCALE = 2;

// Laser
LZR_DURATION = 1;
LZR_FOLLOW_SPEED = 0.05;

// Shield gen


// Stone giant


// Spider


// Wizard


// Player character instance
player = instance_find(obj_player, 0);
