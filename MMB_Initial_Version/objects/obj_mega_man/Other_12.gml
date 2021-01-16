/// @description Movement Execution Phase

xprev = x;
yprev = y;

x += h;
y += v;

if bbox_right > room_width x = room_width - ( bbox_right - x ) - 1;
if bbox_left < 0 x -= bbox_left;
camera_set_view_pos( view_camera, get_instance_center_view( self ), 0 );

//clean up subpixels by snapping to geometry

//snap to ground
if collision_line( bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, tmp_geometry, 0, 1 )
and y mod 1 != 0 y = y div 1 + 1;
else if collision_line( bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, tmp_ladder, 0, 1 )
and !collision_line( bbox_left, bbox_bottom, bbox_right, bbox_bottom, tmp_ladder, 0, 1 )
and y mod 1 != 0 y = y div 1 + 1;

//snap to left
if collision_line( bbox_left - 1, bbox_top, bbox_left - 1, bbox_bottom, tmp_geometry, 0, 1 )
and x mod 1 != 0 round( x );

//snap to right
if collision_line( bbox_right + 1, bbox_top, bbox_right + 1, bbox_bottom, tmp_geometry, 0, 1 )
and x mod 1 != 0 round( x );

//snap to top
if collision_line( bbox_left, bbox_top - 1, bbox_right, bbox_top - 1, tmp_geometry, 0, 1 )
and y mod 1 != 0 round( y );	

//death checks for spikes, crushing, pits
if h > 0 {
	
	if collision_in_direction( right, h, tmp_spike ) {
		while collision_in_direction( right, h, tmp_spike ) {
		
			instance_deactivate_object( collision_in_direction( right, h, tmp_spike ) );
		
		}
		if !collision_in_direction( right, h, tmp_geometry ) {
		
			instance_activate_all();
			event_perform( ev_other, ev_user4 );
			exit;
		
		}
		else instance_activate_all();
	}
	
}
if h < 0 {
	
	if collision_in_direction( left, h, tmp_spike ) {
		while collision_in_direction( left, h, tmp_spike ) {
		
			instance_deactivate_object( collision_in_direction( left, h, tmp_spike ) );
		
		}
		if !collision_in_direction( left, h, tmp_geometry ) {
		
			instance_activate_all();
			event_perform( ev_other, ev_user4 );
			exit;
		
		}
		else instance_activate_all();
	}
	
}
if collision_line( bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, tmp_spike, 0, 1 ) {
	
	while collision_line( bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, tmp_spike, 0, 1 ) {
		
		instance_deactivate_object( collision_line( bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, tmp_spike, 0, 1 ) );
		
	}
	if !collision_line( bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, tmp_geometry, 0, 1 ) {
		
		instance_activate_all();
		event_perform( ev_other, ev_user4 );
		exit;
		
	}
	else instance_activate_all();
	
}
if v < 0 {
	
	if collision_in_direction( up, v, tmp_spike ) {
		while collision_in_direction( up, v, tmp_spike ) {
		
			instance_deactivate_object( collision_in_direction( up, v, tmp_spike ) );
		
		}
		if !collision_in_direction( up, v, tmp_geometry ) {
		
			instance_activate_all();
			event_perform( ev_other, ev_user4 );
			exit;
		
		}
		else instance_activate_all();
	}
	
}

if y > 240 {
	
	event_perform( ev_other, ev_user4 );
	exit;
	
}
if isCrushed {
	
	event_perform( ev_other, ev_user4 );
	exit;
	
}
if collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom, obj_screentrans, 0, 1 ) {
	
	if collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom, obj_screentrans, 0, 1 ).EDIT_Orientation == right
	and bbox_right == collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom, obj_screentrans, 0, 1 ).bbox_right {
		
		destination = collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom, obj_screentrans, 0, 1 ).EDIT_DESTINATION;
		isAdvancing = collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom, obj_screentrans, 0, 1 ).EDIT_Orientation;
		event_perform( ev_other, ev_user5 );
		exit;
		
	}
	
	else if collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom, obj_screentrans, 0, 1 ).EDIT_Orientation == down
	and bbox_bottom >= collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom, obj_screentrans, 0, 1 ).bbox_bottom {
		
		y = room_height - ( bbox_bottom - y );
		destination = collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom, obj_screentrans, 0, 1 ).EDIT_DESTINATION;
		isAdvancing = collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom, obj_screentrans, 0, 1 ).EDIT_Orientation;
		offset = collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom, obj_screentrans, 0, 1 ).EDIT_offset;
		event_perform( ev_other, ev_user5 );
		exit;
		
	}
	
}
else if collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom, obj_screentrans_reverse, 0, 1 ) {
	
	if collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom, obj_screentrans_reverse, 0, 1 ).EDIT_Orientation == up
	and bbox_top <= collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom, obj_screentrans_reverse, 0, 1 ).bbox_top {
		
		if isOnLadder {
			
			y = 0 + ( bbox_top - y );
			destination = collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom, obj_screentrans_reverse, 0, 1 ).EDIT_DESTINATION;
			isAdvancing = collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom, obj_screentrans_reverse, 0, 1 ).EDIT_Orientation;
			offset = collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom, obj_screentrans_reverse, 0, 1 ).EDIT_offset;
			event_perform( ev_other, ev_user5 );
			exit;
			
		}
		
	}
	else if collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom, obj_screentrans_reverse, 0, 1 ).EDIT_Orientation == left
	and bbox_left <= collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom, obj_screentrans_reverse, 0, 1 ).bbox_left {
		
		destination = collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom, obj_screentrans_reverse, 0, 1 ).EDIT_DESTINATION;
		isAdvancing = collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom, obj_screentrans_reverse, 0, 1 ).EDIT_Orientation;
		event_perform( ev_other, ev_user5 );
		exit;
		
	}
	
}
