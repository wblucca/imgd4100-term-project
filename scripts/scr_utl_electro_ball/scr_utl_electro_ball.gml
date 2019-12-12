{
	result = 1;
	boss = instance_find(obj_boss, 0);
	player = instance_find(obj_player, 0);
	if (abs(player.x - boss.x) > 50 && abs(player.y - boss.y) > 50) {
		result += 1;
	}
	
	return result;
}