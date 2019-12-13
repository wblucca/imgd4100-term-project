{
	result = 0;
	boss = instance_find(obj_boss, 0);
	player = instance_find(obj_player, 0);
	dist = point_distance(boss.x, boss.y, player.x, player.y);
	if (dist >= (13 * 32)) {
		result += dist/(45 * 32);
	}	
	return result;
}