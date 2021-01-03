/// @description Insert description here
// You can write your code in this editor
if check_for_off_screen( max( sprite_width, sprite_height ) + 16 ) instance_destroy();
if collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom, tmp_mirror, 0, 1 ) {
	
	event_perform( ev_other, ev_user3 );
	exit;
	
}
if collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom, tmp_barrier, 0, 1 ) {
	
	event_perform( ev_other, ev_user4 );
	exit;
	
}
if collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom, polarity, 0, 1 ) {
	
	var _c = collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom, polarity, 0, 1 );
	switch polarity {
		
		case obj_mega_man:
			_c.damage = damage;
			with _c event_perform( ev_other, ev_user3 );
			break;
			
		case tmp_enemy:
			if !check_for_prior_hit( _c, instance_id ) {
				_c.damage = damage;
				with _c event_perform( ev_other, ev_user3 );
				instance_destroy();
			}
			break;
		
	}
	
}