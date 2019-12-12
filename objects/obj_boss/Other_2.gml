/// @description Instantiate constants for boss generation

difficulty = 1;

// Attacks
ATTACK_UTILS = ds_map_create();
ATTACK_UTILS[? spr_machine_gun] = scr_utl_machine_gun;
ATTACK_UTILS[? spr_electro_ball] = scr_utl_electro_ball;
ATTACK_UTILS[? spr_missle_turret] = scr_utl_missile_turret;
ATTACK_UTILS[? spr_hallowfire_heart] = scr_utl_hallowfire_heart;
ATTACK_UTILS[? spr_laser] = scr_utl_laser;
ATTACK_UTILS[? spr_shield_gen] = scr_utl_shield_gen;
ATTACK_UTILS[? spr_stone_giant] = scr_utl_stone_giant;
ATTACK_UTILS[? spr_spider] = scr_utl_spider;
ATTACK_UTILS[? spr_wizard] = scr_utl_wizard;

heads = array_create(3);
heads[0] = spr_machine_gun;
heads[1] = spr_electro_ball;
heads[2] = spr_missle_turret;

bodies = array_create(3);
bodies[0] = spr_hallowfire_heart;
bodies[1] = spr_laser;
bodies[2] = spr_shield_gen;

legs = array_create(3);
legs[0] = spr_stone_giant;
legs[1] = spr_spider;
legs[2] = spr_wizard;


head = pointer_null;
body = pointer_null;
leg = pointer_null;
