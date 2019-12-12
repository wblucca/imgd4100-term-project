/// @description Insert description here
// You can write your code in this editor

dir = point_direction(x,y,mouse_x,mouse_y);

bullet = instance_create_depth(x,y,-y,obj_sword_bullet);
bullet.speed = 7;
bullet.direction = dir;
bullet.image_angle = dir;