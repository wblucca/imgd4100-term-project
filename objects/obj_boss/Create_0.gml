/// @description Constants


//////////////
// Movement //
//////////////

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
EL_SPEED = 4;
EL_TURNING_SPEED = 0.2;
EL_SCALE = 3;

// Missile turret


// Hallowfire heart
HH_DURATION = 90;
HH_DELAY = 30;
HH_SPEED = -2.5;
HH_ACCEL = 0.3;
HH_SCALE = 2;

// Laser
LZR_DURATION = 10;
LZR_DELAY = 1;
LZR_SPEED = 9;


// Shield gen


// Stone giant


// Spider


// Wizard


// Player character instance
player = instance_find(obj_player, 0);
