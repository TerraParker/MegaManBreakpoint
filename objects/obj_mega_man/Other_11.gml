/// @description Movement Prediction Phase

h = 0;
if isAirborne {
	
	if hasFinishedJumping and v < -.1 {
		
		v = -.1;
		
	}
	
	v += GRAVITY;
	
	if isStunned and v < 0 {
		
		v = 0;
		
	}
	
}
else {
	
	if collision_in_direction( down, v, tmp_geometry ) y += truncate_movement_to_nearest( down, v, tmp_geometry )
	else if collision_in_direction( down, v, tmp_ladder )
	and	!collision_line( bbox_left, bbox_bottom, bbox_right, bbox_bottom, tmp_ladder, 0, 1 )
	and !isOnLadder y += truncate_movement_to_nearest( down, v, tmp_ladder );
	v = 0; yslop = 0;
	
}
if isStunned {
	
	h = -.5 * facing;
	
}
if isJumping v = -JUMP_VEL;
if isOnLadder {
	
	if isClimbing != 0 {
		
		v = isClimbing;
		
	}
	else if isSlidingDown {
		
		if collision_line( bbox_left + 1, yprev - 1, bbox_right - 1, yprev - 1, tmp_ladder, 0, 1 )
		and !collision_line( bbox_left + 1, bbox_top + 6, bbox_right - 1, bbox_top + 6, tmp_ladder, 0, 1 ) {
			
			v = 0;
		    y = collision_line( bbox_left + 1, yprev - 1, bbox_right - 1, yprev - 1, tmp_ladder, 0, 1 ).y + 8;
			
		}
		else v = SLIDE_VEL;
		
	}
	else v = 0;
	
}

if isRunning h = facing * RUN_VEL;
else if isSliding h = facing * SLIDE_VEL;
if isNudging h = facing;

//movement cutoff
if h > 0 {
	
	h = truncate_movement_to_nearest( right, h, tmp_geometry );
	
}

else if h < 0 {
	
	h = truncate_movement_to_nearest( left, h, tmp_geometry );
	
}

if v > 0 {
	
	if collision_in_direction( down, v, tmp_geometry ) {
		
		v = truncate_movement_to_nearest( down, v, tmp_geometry );
		
	}
	
	else if collision_in_direction( down, v, tmp_ladder )
	and	!collision_line( bbox_left, bbox_bottom, bbox_right, bbox_bottom, tmp_ladder, 0, 1 )
	and !isOnLadder {
		
		v = truncate_movement_to_nearest( down, v, tmp_ladder );
		
	}
	
}

else if v < 0 {
	
	v = truncate_movement_to_nearest( up, v, tmp_geometry );
	
}

var _c;

if h > 0 and v > 0 {
	
	_c = collision_point( bbox_right + h, bbox_bottom + v, tmp_geometry, 0, 1 );
	if _c {
		
		h = _c.bbox_left - bbox_right - 1;
		xslop = 0;
		
	}
	
}
	
else if h > 0 and v < 0 {
	
	_c = collision_point( bbox_right + h, bbox_top + v, tmp_geometry, 0, 1 );
	if _c {
		
		h = _c.bbox_left - bbox_right - 1;
		xslop = 0;
		
	}
	
}

else if h < 0 and v > 0 {
	
	_c = collision_point( bbox_left + h, bbox_bottom + v, tmp_geometry, 0, 1 );
	if _c {
		
		h = _c.bbox_right - bbox_left + 1;
		xslop = 0;
		
	}
	
}

else if h < 0 and v < 0 {
	
	_c = collision_point( bbox_left + h, bbox_top + v, tmp_geometry, 0, 1 );
	if _c {
		
		h = _c.bbox_right - bbox_left + 1;
		xslop = 0;
		
	}
	
}