{
	result = 0;
	boss = instance_find(obj_boss, 0);
	player = instance_find(obj_player, 0);
	if (abs(player.x - boss.x) > 100 && abs(player.y - boss.y) > 100) {
		result += 1;
	}
	
	return result;
}