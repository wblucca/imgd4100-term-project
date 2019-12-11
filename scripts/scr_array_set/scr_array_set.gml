/// @function scr_check_bounds(arr, x, y, value)
/// @description scr_check_bounds Check to see if an index is valid in an array
/// @param arr Array to modify
/// @param x X-coord in 2D array
/// @param y Y-coord in 2D array
/// @param value Value to store

if (argument1 >= 0 && argument1 < array_height_2d(argument0)) {
	if (argument2 >= 0 && argument2 < array_length_2d(argument0, argument1)) {
		argument0[@ argument1, argument2] = argument3;
		return true;
	}
}
return false;
