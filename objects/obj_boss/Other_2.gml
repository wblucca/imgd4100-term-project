/// @description Instantiate constants for boss generation

global.difficulty = 1;

global.heads = array_create(3);
global.heads[0] = spr_machine_gun;
global.heads[1] = spr_electro_ball;
global.heads[2] = spr_missle_turret;

global.bodies = array_create(3);
global.bodies[0] = spr_hallowfire_heart;
global.bodies[1] = spr_laser;
global.bodies[2] = spr_heart_gen;

global.legs = array_create(3);
global.legs[0] = spr_stone_giant;
global.legs[1] = spr_spider;
global.legs[2] = spr_wizard;


global.head = pointer_null;
global.body = pointer_null;
global.leg = pointer_null;
