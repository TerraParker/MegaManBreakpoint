/// @function draw_bar( x, y, value, sprite );
/// @param x {real} the x position of the bar (relative to view)
/// @param y {real} the y position of the bar
/// @param value {int} the current value of the bar
/// @param sprite {index} the sprite to overlay on the black bar

function draw_bar( _x, _y, _value, _sprite ){
	
	draw_sprite( spr_bar_bg, 0, _x + camera_get_view_x( view_camera ), _y );
	for (var i = 0; i < _value; ++i) {
		
	    draw_sprite( _sprite, 0, _x + camera_get_view_x( view_camera ) + 1, _y + 55 - ( i * 2 ) );
		
	}

}