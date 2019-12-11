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
DIAG_MULT = 0.3535;  // sqrt(2) / 2
FRICTION = 0.15;
vaccel = 0;
haccel = 0;

// Hue shift value [0.0, 1.0)
hueDelta = 0;

// Using gamepad
using_gp = false;

// Camera control
CAM_SPD = 0.08;
camX = x;
camY = y;
camHSpeed = 0;
camVSpeed = 0;
camWidth = camera_get_view_width(view_camera[0]);
camHeight = camera_get_view_height(view_camera[0]);
