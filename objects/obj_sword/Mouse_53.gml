/// @description Insert description here
// You can write your code in this editor

bullet = instance_create_depth(x,y,-y,obj_sword_bullet);
bullet.speed = 10;
bullet.direction = image_angle;
bullet.image_angle = point_direction(x,y,mouse_x,mouse_y);