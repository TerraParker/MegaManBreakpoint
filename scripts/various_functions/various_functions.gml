/// @function object_get_highest_parent( index );
/// @param index {index} the object to check

function object_get_highest_parent( _index ){
	
	var i, ii;
	i = object_get_parent( _index );
	if i == -1 show_error( "Invalid object input", 1 )
	if i == -100 return i;
	while i != -100 {
		
		ii = i;
		i = object_get_parent( i );
		
	}
	return ii;

}

/// @function execute_menu_command( grid, index );
/// @param grid {index} the loaded menu's cursor grid
/// @param index {int} the present cursor index

function execute_menu_command( _grid, _index ) {
	var i;
	i = ds_grid_get( _grid, _index, 2 );

	switch i {
	
		case 0:
			room_goto( ds_grid_get( _grid, _index, 3 ) );
			break;
		
		case 10:
			game_end();
			
		case -1:
			break;
		
	}


}

/// @function get_value_bounded( value, min, max );
/// @param value {real} the value to be limited
/// @param min {real} the minimum boundary permitted
/// @param max {real} the maximum boundary permitted

function get_value_bounded( _value, _min, _max ) {
	
	return min( max( _value, _min ), _max );
	
}