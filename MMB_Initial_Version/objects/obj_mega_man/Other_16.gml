/// @description Airborne check event (including landing code)

if isAirborne and v >= 0 {
	
	if collision_line( bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, tmp_geometry, 0, 1 ) {
		
		isAirborne = false;
		//code for playing sound
		
	}
	
	else if collision_line( bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, tmp_ladder, 0, 1 )
	and !collision_line( bbox_left, bbox_bottom, bbox_right, bbox_bottom, tmp_ladder, 0, 1 ) {
		
		isAirborne = false;
		//code for playing sound
		
	}
}

else if v < 0 isAirborne = true;

else if !isOnLadder
and !collision_line( bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, tmp_geometry, 0, 1 ) {
	
	if !collision_line( bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, tmp_ladder, 0, 1 ) isAirborne = true;
	else if collision_line( bbox_left, bbox_bottom, bbox_right, bbox_bottom, tmp_ladder, 0, 1 ) isAirborne = true;
	
}