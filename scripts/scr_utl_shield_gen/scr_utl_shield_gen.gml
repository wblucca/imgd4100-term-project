{
	result = 0;
	boss = instance_find(obj_boss, 0);
	player = instance_find(obj_player, 0);
	if (abs(player.x - boss.x) < 25 && abs(player.y - boss.y) < 25) {
		result =+ 2;
	}
	
	return result;
}