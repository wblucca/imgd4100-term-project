{
	result = 0;
	boss = instance_find(obj_boss, 0);
	player = instance_find(obj_player, 0);
	dist = point_distance(boss.x, boss.y, player.x, player.y);
	if (dist >= (13 * 32)) {
		result += dist/(45 * 32);
	}	
	if (collision_line(boss.x, boss.y, player.x, player.y, obj_wall, false, false) == noone || collision_line(boss.x, boss.y, player.x, player.y, obj_obst, false, false) == noone) {
		result += (1 - result) * .2;
	}
	else {
		result -= (1 - result) * .1;
	}
	return result;
}