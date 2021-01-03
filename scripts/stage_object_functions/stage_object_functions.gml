/// @function spawn_projectile( projectile, x, y, direction, speed, polarity );
/// @param projectile {index} the projectile to spawn
/// @param x {real} the x position to spawn the projectile to
/// @param y {real} the y position to spawn the projectile to
/// @param direction {int} the (initial) direction to move the projectile in
/// @param speed {real} the (initial) speed for the projectile to move at
/// @param polarity {index} the object or object type for the projectile to cause damage to, use "pointer_null" for none

function spawn_projectile( _index, _x, _y, _direction, _speed, _polarity ){

	if _polarity != obj_mega_man and _polarity != tmp_enemy and _polarity != pointer_null show_error( "Invalid projectile polarity assigned", 0 );
	if object_get_highest_parent( _index ) != tmp_projectile show_error( "Invalid object selected as projectile", 1 );
	var _c;
	_c = instance_create_layer( _x, _y, "Projectiles", _index );
	with _c {
		
		h = get_vector_h( _direction, _speed );
		v = get_vector_v( _direction, _speed );
		polarity = _polarity;
		
	}
	return _c;

}

function snap_to_floor() {
	
	if !collision_line( bbox_left + 1, bbox_bottom + 1, bbox_right - 1, bbox_bottom + 1, tmp_geometry, 0, 1 ) {
	
	while !collision_line( bbox_left + 1, bbox_bottom + 1, bbox_right - 1, bbox_bottom + 1, tmp_geometry, 0, 1 )
	and y < 240 {
		
		y++;
		if y > 240 instance_destroy();
		
	}
	
}
	
}