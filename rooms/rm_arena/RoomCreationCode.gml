// Create a randomly generated arena

//////////////
// Tile IDs //
//////////////

FLOOR = 0;
OBSTACLE = 1;
WALL = 2;
EDGE = 3;
PIT = 9;

/////////////////////////////
// Random parameter bounds //
/////////////////////////////

// Room dimensions
MIN_WIDTH = 50;
MAX_WIDTH = 90;
MIN_HEIGHT = 40;
MAX_HEIGHT = 80;

// Walls
MIN_WALLS = 3;
MAX_WALLS = 7;
WALL_SIZE = 20;

// Obstacles
MIN_OBSTACLES = 5;
MAX_OBSTACLES = 10;
OBSTACLE_SIZE = 30;

// Pits
MIN_PITS = 2;
MAX_PITS = 4;
PIT_SIZE = 40;

// Grid of all objects
var arena;

// Randomize width and height
arenaWidth = random_range(MIN_WIDTH, MAX_WIDTH);
arenaHeight = random_range(MIN_HEIGHT, MAX_HEIGHT);

// Initialize arena with empty floor
for (i = 0; i < arenaWidth; i++) {
	for (j = 0; j < arenaHeight; j++) {
		arena[i, j] = FLOOR;
	}
}

// Add some walls
numWalls = random_range(MIN_WALLS, MAX_WALLS);
for (i = 0; i < numWalls; i++) {
	// Pick a random location in arena and random walk some
	randLoc[0] = irandom_range(0, arenaWidth - 1);
	randLoc[1] = irandom_range(0, arenaHeight - 1);
	for (walk = 0; walk < WALL_SIZE; walk++) {
		randLoc = scr_random_walk(randLoc);
		scr_array_set(arena, randLoc[0], randLoc[1], WALL);
	}
}

// Add some obstacles
numObstacles = random_range(MIN_OBSTACLES, MAX_OBSTACLES);
for (i = 0; i < numObstacles; i++) {
	// Pick a random location in arena and random walk some
	randLoc[0] = irandom_range(0, arenaWidth - 1);
	randLoc[1] = irandom_range(0, arenaHeight - 1);
	for (walk = 0; walk < OBSTACLE_SIZE; walk++) {
		randLoc = scr_random_walk(randLoc);
		scr_array_set(arena, randLoc[0], randLoc[1], OBSTACLE);
	}
}

// Add some pits
numPits = random_range(MIN_PITS, MAX_PITS);
for (i = 0; i < numPits; i++) {
	// Pick a random location in arena and random walk some
	randLoc[0] = irandom_range(0, arenaWidth - 1);
	randLoc[1] = irandom_range(0, arenaHeight - 1);
	for (walk = 0; walk < PIT_SIZE; walk++) {
		randLoc = scr_random_walk(randLoc);
		scr_array_set(arena, randLoc[0], randLoc[1], PIT);
	}
}

for (i = 0; i < arenaWidth; i++) {
	row = "";
	for (j = 0; j < arenaHeight; j++) {
		row += string(arena[i, j]) + "\t"
	}
	show_debug_message(row);
}
