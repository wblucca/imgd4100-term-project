/// @description Constants


//////////////
// Movement //
//////////////

// Wizard
WZ_MAX_SPD = 4;
WZ_ACCEL = 0.02;

// Stone giant
SG_SPEED = 2.5;
sgWalkDuration = 0;

// Maximum speeds
V_MAX_SPD = 1.5;
H_MAX_SPD = 2;

// Change in velocity per frame
V_ACCEL_RATIO = V_MAX_SPD / 4;
H_ACCEL_RATIO = H_MAX_SPD / 4;
DIAG_MULT = 0.3535;  // sqrt(2) / 2
FRICTION = 0.15;
vaccel = 0;
haccel = 0;

// Using gamepad
using_gp = false;


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
