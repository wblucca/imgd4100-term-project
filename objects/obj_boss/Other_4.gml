/// @description Insert description here
// You can write your code in this editor

var head_check = true;
var body_check = true;
var legs_check = true;
var boss_difficulty = 0;

var rand = irandom_range(0, 2);
new_head = heads[rand];
boss_difficulty =+ rand;

var rand = irandom_range(0, 2);
new_body = bodies[rand];
boss_difficulty =+ rand;

var rand = irandom_range(0, 2);
new_legs = legs[rand];
boss_difficulty =+ rand;

object_set_sprite(obj_boss, new_legs)