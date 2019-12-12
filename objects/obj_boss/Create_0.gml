/// @description Insert description here
// You can write your code in this editor


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