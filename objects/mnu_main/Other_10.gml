/// @description Insert description here
// check inputs
var _move; _move = 0;
if ds_grid_get( inputGrid, up, pressed ) _move = -1;
if ds_grid_get( inputGrid, down, pressed ) _move = 1;
switch _move {
	
	case 1:
		if cursorIndex < 3 cursorIndex++;
		break;
	case -1:
		if cursorIndex > 0 cursorIndex--;
		
}
if ds_grid_get( inputGrid, jump, pressed )
or ds_grid_get( inputGrid, start, pressed )	execute_menu_command( cursorGrid, cursorIndex );