/// @function get_vector_h( direction, speed );
/// @param direction {int} The Direction of Movement
/// @param speed {real} The Velocity of Movement

function get_vector_h( _direction, _speed ) {
	
	if _direction >= 360 _direction -= 360;
	return cos( degtorad( _direction ) ) * _speed;
	
}

/// @function get_vector_v( direction, speed )
/// @param direction {int} The Direction of Movement
/// @param speed {real} The Velocity of Movement

function get_vector_v( _direction, _speed ) {

	if _direction >= 360 _direction -= 360;
	return sin( degtorad( _direction ) ) * _speed;
	

}

/// @function collision_in_direction( direction, distance, object );
/// @param direction {constant} the direction of movement to check
/// @param distance {real} the distance to check
/// @param object {index} the index of the object to check for

function collision_in_direction( _direction, _distance, _object) {
	
	switch _direction {
	
		case right:
		return collision_rectangle( bbox_right, bbox_top, bbox_right + _distance, bbox_bottom, _object, 0, 1 );
	
		case down:
		return collision_rectangle( bbox_left, bbox_bottom, bbox_right, bbox_bottom + _distance, _object, 0, 1 );
	
		case left:
		return collision_rectangle( bbox_left + _distance, bbox_top, bbox_left, bbox_bottom, _object, 0, 1 );
	
		case up:
		return collision_rectangle( bbox_left, bbox_top + _distance, bbox_right, bbox_top, _object, 0, 1 );
	
		default:
		show_error( "Invalid direction for collision check", 1 );
	
	}


}

/// @function draw_hitbox( color );
/// @param color {index} the color of line to draw

function draw_hitbox( _color ){
	
	draw_line_color( bbox_left - 1, bbox_top, bbox_right, bbox_top, _color, _color );
	draw_line_color( bbox_left, bbox_bottom, bbox_right, bbox_bottom, _color, _color );
	draw_line_color( bbox_left, bbox_top, bbox_left, bbox_bottom, _color, _color );
	draw_line_color( bbox_right, bbox_top, bbox_right, bbox_bottom, _color, _color );

}

/// @function check_for_off_screen();

function check_for_off_screen( _amount ){
	
	if x < camera_get_view_x( view_get_camera( 0 ) ) - sprite_width - _amount
	or x > camera_get_view_x( view_get_camera( 0 ) ) + camera_get_view_width( view_get_camera( 0 ) ) + _amount
	or y < camera_get_view_y( view_get_camera( 0 ) ) - sprite_height - _amount
	or y > camera_get_view_y( view_get_camera( 0 ) ) + camera_get_view_height( view_get_camera( 0 ) ) + _amount return true;
	else return false;

}

/// @function get_instance_center_view( object );
/// @param object {index} the object to get the (hypothetical) centered view of

function get_instance_center_view( _object ){
	
	return get_value_bounded( _object.x + ( _object.bbox_left - _object.x ) + ( ( _object.bbox_right - _object.bbox_left ) / 2 - camera_get_view_width( view_camera ) ) / 2, 0, room_width - camera_get_view_width( view_camera ) );
	
}

/// @function get_distance_center_to_center_h( object1, object2 );
/// @param object1 {index} the first object
/// @param object2 {index} the second object
function get_distance_center_to_center_h( _object1, _object2 ){
	
	return abs( ( _object1.x + ( _object1.bbox_left - _object1.x ) + ( ( _object1.bbox_right - _object1.bbox_left ) / 2 ) ) - ( _object2.x + ( _object2.bbox_left - _object2.x ) + ( ( _object2.bbox_right - _object2.bbox_left ) / 2 ) ) );

}

/// @function check_for_prior_hit( projectile );
/// @param projectile {id} the projectile id to check against

function check_for_prior_hit( _object, _index ) {
	
	for (var i = 0; i < ds_list_size( _object.hitList ); ++i) {
	    if ds_list_find_value( _object.hitList, i ) == _index return true;
	}
	ds_list_add( _object.hitList, _index );
	return false;
	
}

/// @function truncate_movement_to_nearest( object, direction, distance );
/// @param direction {int} the direction to check for objects
/// @param distance {real} the distance to check for objects (usually the distance of motion)
/// @param object {index} the object to truncate movement toward

function truncate_movement_to_nearest( _direction, _distance, _object ) {
	
	if collision_in_direction( _direction, _distance, _object ) {
		var _list, i, _c, _least;
		_least = undefined;
		_list = ds_list_create();
		
		for ( i = 0; i < 1; i++; ) {
			
			_c = collision_in_direction( _direction, _distance, _object );
			if _c {
				
				ds_list_add( _list, _c );
				instance_deactivate_object( _c );
				
			}
			else i = 1;
			
		}
		
		for ( i = 0; i < ds_list_size( _list ); i++; ) {
			
			_c = ds_list_find_value( _list, i );
			instance_activate_object( _c );
			switch _direction {
				
				case right:
					if is_undefined( _least ) _least = _c.bbox_left;
					else if _c.bbox_left < _least _least = _c.bbox_left;
					break;
					
				case down:
					if is_undefined( _least ) _least = _c.bbox_top;
					else if _c.bbox_top < _least _least = _c.bbox_top;
					break;
					
				case left:
					if is_undefined( _least ) _least = _c.bbox_right;
					else if _c.bbox_right > _least _least = _c.bbox_right;
					break;
					
				case up:
					if is_undefined( _least ) _least = _c.bbox_bottom;
					else if _c.bbox_bottom < _least _least = _c.bbox_bottom;
					break;
					
			}
			
		}
		
		ds_list_destroy( _list );
		switch _direction {
			
			case right:
				xslop = 0;
				return _least - bbox_right - 1;
			
			case down:
				yslop = 0;
				return _least - bbox_bottom - 1;
				
			case left:
				xslop = 0;
				return _least - bbox_left + 1;
				
			case up:
				yslop = 0;
				return _least - bbox_top + 1;
		
		}
		
	}
	else return _distance;
	
}