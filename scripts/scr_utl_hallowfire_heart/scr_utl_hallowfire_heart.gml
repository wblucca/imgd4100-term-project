{
	result = 0;
	boss = instance_find(obj_boss, 0);
	player = instance_find(obj_player, 0);
	if (collision_line(boss.x, boss.y, player.x, player.y, obj_wall, false, false) == noone || collision_line(boss.x, boss.y, player.x, player.y, obj_obst, false, false) == noone) {
		result =+ 1;
	}
	if (abs(player.x - boss.x) > 50 && abs(player.y - boss.y) > 50) {
		result =+ 1;
	}
	
	return result;
}