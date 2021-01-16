/// @description Ladder Event

//get off ladder if at bottom of it and not sliding down
if collision_line( bbox_left + 1, yprev - 1, bbox_right - 1, yprev - 1, tmp_ladder, 0, 1 )
and !collision_line( bbox_left + 1, bbox_top + 4, bbox_right - 1, bbox_top + 4, tmp_ladder, 0, 1 ) {
	if !isSlidingDown {
		isOnLadder = false;
		isClimbing = 0;
		isAtLadderTop = false;
		if !collision_line( bbox_left + 1, bbox_bottom + 1, bbox_right - 1, bbox_bottom + 1, tmp_geometry, 0, 1 ) {
			isAirborne = true;
			ladderDropTimer = 7;
		}
		else isAirborne = false;
	}
	exit;
}
		
//if at top of ladder get to top of ladder
{
if collision_line( bbox_left + 1, bbox_bottom + 1, bbox_right - 1, bbox_bottom + 1, tmp_ladder, 0, 1 )
and !collision_line( bbox_left + 1, bbox_top + 10, bbox_right - 1, bbox_top + 10, tmp_ladder, 0, 1 ) {
	isOnLadder = false;
	isClimbing = false;
	isSlidingDown = false;
	isAtLadderTop = false;
	isAirborne = false;
	y = collision_line( bbox_left + 1, bbox_bottom + 1, bbox_right - 1, bbox_bottom + 1, tmp_ladder, 0, 1 ).y + ( y - bbox_bottom - 1 );
	exit;
}
}
		
//get off if touching ground
if collision_line( bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, tmp_geometry, 0, 1 )
and !inputGrid[# up, held ] {
	isOnLadder = false;
	isClimbing = 0;
	isSlidingDown = false;
	isAirborne = false;
	isAtLadderTop = false;
	exit;
}
		
//switch to or from ladder top sprite
if collision_line( bbox_left + 1, bbox_bottom, bbox_right - 1, bbox_bottom, tmp_ladder, 0, 1 ) and
!collision_line( bbox_left + 1, y + 7, bbox_right - 1, y + 7, tmp_ladder, 0, 1 ) {
	isAtLadderTop = true;
}
else isAtLadderTop = false;
		
//dropping off
if inputGrid[# jump, pressed ] and !inputGrid[# down, held ] {
	isOnLadder = false;
	isAtLadderTop = false;
	isClimbing = 0;
	isSlidingDown = false;
	isAirborne = true;
	ladderDropTimer = 7;
	exit;
}
		
//sliding down
{
if inputGrid[# jump, held ] and inputGrid[# down, held ] {
	isSlidingDown = true;
	isClimbing = 0;
	exit;
}
//also sliding down
if inputGrid[# slide, held ] {
	isSlidingDown = true;
	isClimbing = 0;
	exit;
}
//reset sliding down otherwise
isSlidingDown = false;
}

//set climbing variables
if inputGrid[# up, held ] isClimbing = -1;
else if inputGrid[# down, held ] isClimbing = 1;

//fire buster and change facing if needed
if inputGrid[# fire, pressed ] and instance_number( obj_lemon ) < 3 {
	if inputGrid[# left, held ] and !inputGrid[# right, held ] facing = -1;
	else if inputGrid[# right, held ] facing = 1;
	firingTimer = 0;
	switch facing {
		case 1:
			spawn_projectile( obj_lemon, x + 14, y + 7, 0, 4, tmp_enemy );
			break;
		case -1:
			spawn_projectile( obj_lemon, x, y + 7, 0, -4, tmp_enemy );
			break;
	}		
}