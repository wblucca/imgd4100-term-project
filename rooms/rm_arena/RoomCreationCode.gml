// Initialize game and create a randomly generated arena

// Set a random seed for generators
randomize();

//////////////
// Tile IDs //
//////////////

enum TILE {
	Floor,
	Obst,
	Wall,
	Pit
	}


/////////////////////////////
// Random parameter bounds //
/////////////////////////////

// Room dimensions
var MIN_WIDTH = 50;
var MAX_WIDTH = 90;
var MIN_HEIGHT = 40;
var MAX_HEIGHT = 80;

// Walls
var MIN_WALLS = 3;
var MAX_WALLS = 7;
var WALL_SIZE = 20;

// Obstacles
var MIN_OBSTS = 5;
var MAX_OBSTS = 10;
var OBST_SIZE = 30;

// Pits
var MIN_PITS = 2;
var MAX_PITS = 4;
var PIT_SIZE = 40;


//////////////////////
// Arena generation //
//////////////////////

// Change in x
var dx = array_create(8);
dx[0] = 0;
dx[1] = 1;
dx[2] = 1;
dx[3] = 1;
dx[4] = 0;
dx[5] = -1;
dx[6] = -1;
dx[7] = -1;

// Change in y
var dy = array_create(8);
dy[0] = -1;
dy[1] = -1;
dy[2] = 0;
dy[3] = 1;
dy[4] = 1;
dy[5] = 1;
dy[6] = 0;
dy[7] = -1;

// Randomize width and height
var arenaWidth = random_range(MIN_WIDTH, MAX_WIDTH);
var arenaHeight = random_range(MIN_HEIGHT, MAX_HEIGHT);

// Grid of all arena objects
var arena;
for (var i = 0; i < arenaWidth; i++) {
    for (var j = 0; j < arenaHeight; j++) {
	    arena[i, j] = TILE.Floor;
	}
}

var randLoc = array_create(2);

// Add some walls
var numWalls = random_range(MIN_WALLS, MAX_WALLS);
for (var i = 0; i < numWalls; i++) {
	// Pick a random location in arena and random walk some
	randLoc[0] = irandom_range(0, arenaWidth - 1);
	randLoc[1] = irandom_range(0, arenaHeight - 1);
	for (var walk = 0; walk < WALL_SIZE; walk++) {
		randLoc = scr_random_walk(randLoc);
		scr_array_2d_set(arena, randLoc[0], randLoc[1], TILE.Wall);
	}
}

// Add some obstacles
var numObsts = random_range(MIN_OBSTS, MAX_OBSTS);
for (var i = 0; i < numObsts; i++) {
	// Pick a random location in arena and random walk some
	randLoc[0] = irandom_range(0, arenaWidth - 1);
	randLoc[1] = irandom_range(0, arenaHeight - 1);
	for (var walk = 0; walk < OBST_SIZE; walk++) {
		randLoc = scr_random_walk(randLoc);
		scr_array_2d_set(arena, randLoc[0], randLoc[1], TILE.Obst);
	}
}

// Add some pits
var numPits = random_range(MIN_PITS, MAX_PITS);
for (var i = 0; i < numPits; i++) {
	// Pick a random location in arena and random walk some
	randLoc[0] = irandom_range(0, arenaWidth - 1);
	randLoc[1] = irandom_range(0, arenaHeight - 1);
	for (var walk = 0; walk < PIT_SIZE; walk++) {
		randLoc = scr_random_walk(randLoc);
		scr_array_2d_set(arena, randLoc[0], randLoc[1], TILE.Pit);
	}
}

// Blur terrain to make it look a little more natural
var blurredArena = arena;
for (var i = 0; i < arenaWidth; i++) {
    for (var j = 0; j < arenaHeight; j++) {
	    var nonFloorTiles = 0;
		var lastTile = TILE.Floor;
		
		// Count up occurrences of non-floor tiles next to this one
		for (var dir = 0; dir < 8; dir++) {
		    var adjX = i + dx[dir];
			var adjY = j + dy[dir];
			var adjTile = TILE.Floor;
			if (adjX >= 0 && adjX < arenaWidth && adjY >= 0 && adjY < arenaHeight) {
				adjTile = arena[adjX, adjY];
			}
			
			// Check non-floor tile
			if (adjTile != TILE.Floor) {
				nonFloorTiles++;
				lastTile = adjTile;
			}
		}
		
		// If populated enough, change tile to match last seen
		if (nonFloorTiles >= 3) {
			blurredArena[i, j] = lastTile;
		}
		// If not populated enough, change tile to empty floor
		else if (nonFloorTiles <= 1) {
			blurredArena[i, j] = TILE.Floor;
		}
	}
}

// Swap blurred arena into arena
arena = blurredArena;

// Print the arena out
show_debug_message("Arena:");
for (var i = 0; i < arenaWidth; i++) {
	var row = "";
	for (var j = 0; j < arenaHeight; j++) {
		row += string(arena[i, j]) + "\t";
	}
	show_debug_message(row);
}


///////////////////////
// Populate the room //
///////////////////////

// Dimensions of tiles placed in arena
var TILE_WIDTH = 32;
var TILE_HEIGHT = 24;

// Top left corner of arena
var START_X = (room_width - arenaWidth * TILE_WIDTH) / 2;
var START_Y = (room_height - arenaHeight * TILE_HEIGHT) / 2;

// Pick a random hue shift value [0.0, 1.0)
var hueShift = random(1)

// Loop through whole arena
for (var i = 0; i < arenaWidth; i++) {
    for (var j = 0; j < arenaHeight; j++) {
		// Get the corresponding object for this position
		var tileObj = pointer_null;
		switch (arena[i, j]) {
			case TILE.Floor:
				tileObj = obj_floor;
				break;
			case TILE.Wall:
				tileObj = obj_wall;
				break;
			case TILE.Obst:
				tileObj = obj_obst;
				break;
			case TILE.Pit:
				tileObj = obj_pit;
				break;
		}
		
		// Add the object to the room at the correct location
		var xOffset = 0;
		if (j % 2 == 1) {
			xOffset = TILE_WIDTH / 2;
		}
	    var tileInst = instance_create_depth(
		START_X + i * TILE_WIDTH + xOffset,
		START_Y + j * (TILE_HEIGHT / 2),
		-(START_Y + j * (TILE_HEIGHT / 2)),
		tileObj);
		
		// Set hue shift for arena
		tileInst.hueDelta = hueShift;
	}
}

///////////////////
// Other objects //
///////////////////

with (obj_player) {
	// Set player character to have same hue delta
	hueDelta = hueShift;
	
	// Move to valid location
	var invalidLoc = false;
	do {
		x = random_range(50, arenaWidth * TILE_WIDTH - 50) + START_X;
		y = random_range(50, arenaHeight * TILE_HEIGHT - 50) + START_Y;
		invalidLoc = place_meeting(x, y, obj_wall);
		invalidLoc = invalidLoc || place_meeting(x, y, obj_obst);
		invalidLoc = invalidLoc || place_meeting(x, y, obj_pit);
	} until (!invalidLoc);
}

with (obj_boss) {	
	// Move to valid location
	var invalidLoc = false;
	do {
		x = random_range(50, arenaWidth * TILE_WIDTH - 50) + START_X;
		y = random_range(50, arenaHeight * TILE_HEIGHT - 50) + START_Y;
		invalidLoc = place_meeting(x, y, obj_wall);
		invalidLoc = invalidLoc || place_meeting(x, y, obj_pit);
	} until (!invalidLoc);
}
