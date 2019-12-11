/// @function scr_random_walk(loc)
/// @description scr_random_walk Get a random location by walking one up, down, left, or right
/// @param loc Location to move from

// Change in x
var dx;
dx[0] = 0;
dx[1] = 1;
dx[2] = 0;
dx[3] = -1;

// Change in y
var dy;
dy[0] = -1;
dy[1] = 0;
dy[2] = 1;
dy[3] = 0;

// Pick a direction
randDir = irandom(3);

// Walk in the direction
var newLoc;
newLoc[0] = argument0[0] + dx[randDir];
newLoc[1] = argument0[1] + dy[randDir];

return newLoc;
