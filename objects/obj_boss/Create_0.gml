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


// Missile turret


// Hallowfire heart
HH_DURATION = 90;
HH_DELAY = 30;
HH_SPEED = -2.5;
HH_ACCEL = 0.3;

// Laser


// Shield gen


// Stone giant


// Spider


// Wizard


// Player character instance
player = instance_find(obj_player, 0);
