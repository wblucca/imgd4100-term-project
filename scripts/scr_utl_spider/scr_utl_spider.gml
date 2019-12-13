{
	result = 0;
	boss = instance_find(obj_boss, 0);
	player = instance_find(obj_player, 0);
	dist = point_distance(boss.x, boss.y, player.x, player.y);
	nearest_pit = instance_nearest(player.x, player.y, obj_pit);
	pit_dist = point_distance(player.x, player.y, nearest_pit.x, nearest_pit.y);
	if (dist <= (12 * 32)) {
		if (dist <= (6 * 32)) {
			result += dist/(6 * 32);
		}
		else {
			result += ((12 * 32) - dist)/(6 * 32);
		}
	}
	
	if (pit_dist <= (3 * 32)) {
		result =+ (1 - result) * .5;
	}
	
}