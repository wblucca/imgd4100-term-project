/// @function					scr_array_2d_set(arr, x, y, value);
/// @param	{array2d}	arr		Array to modify
/// @param	{int}		x		X-coord in 2D array
/// @param	{int}		y		Y-coord in 2D array
/// @param	{any}		value	Value to store
/// @description				Check to see if an index is valid in an array

{
	if (argument[1] >= 0 && argument1 < array_height_2d(argument0)) {
		if (argument2 >= 0 && argument2 < array_length_2d(argument0, argument1)) {
			argument0[@ argument1, argument2] = argument3;
			return true;
		}
	}
	return false;
}
