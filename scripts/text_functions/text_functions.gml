/// @function get_sprite_font_x( textlist, index );
/// @param textlist {index} the list of characters to pull from
/// @param index {int} the position of the list for the needed character

function get_sprite_font_x( _textlist, _index) {
	var i;
	for ( i = 0; i < ds_grid_height( fontGrid ); i++; ) {
	
		if ds_list_find_value( _textlist, _index ) == ds_grid_get( fontGrid, 0, i ) return ds_grid_get( fontGrid, 1, i );
	
	}

	return 760;


}

/// @function draw_text_sprite( x, y, color, string );
/// @param x {real} x position of text sprite
/// @param y {real} y position of text sprite
/// @param color {index} color of text
/// @param string {string} string to be drawn

function draw_text_sprite(_x, _y, _color, _string ) {
	
	var _i = instance_create_layer( _x, _y, "Text", txt_normal );
	_i.stringText = _string;
	_i.stringColor = _color;
	return _i;


}

/// @function update_text_sprite( index, color, string );
/// @param index {index} text sprite to update
/// @param color {index} color of text
/// @param string {string} string to print

function update_text_sprite( _index, _color, _string ) {
	
	_index.stringText = _string;
	_index.stringColor = _color;
	_index.surfaceInit = 0;
	
}