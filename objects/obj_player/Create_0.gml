/// @description Initialize constants, variables, etc.

// Controls
UP = ord("W");
DOWN = ord("S");
LEFT = ord("A");
RIGHT = ord("D");

// Maximum speeds
V_MAX_SPD = 7;
H_MAX_SPD = 10;

// Change in velocity per frame
V_ACCEL_RATIO = V_MAX_SPD / 4;
H_ACCEL_RATIO = H_MAX_SPD / 4;

DIAG_MULT = 0.3535;

FRICTION = 0.15;

// Hue shift value [0.0, 1.0)
hueDelta = 0;

// Using gamepad
using_gp = false;

vaccel = 0;
haccel = 0;
