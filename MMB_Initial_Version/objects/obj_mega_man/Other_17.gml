/// @description Sliding Event

slidingTimer++;
if isAirborne {
	
	//end sliding event and shift position accordingly
	isSliding = false;
	slidingTimer = 0;
	x += facing * 1;
	y -= 4;
	exit;
	
}
		
else {
	//change directions if in a vent
	if collision_line( bbox_left, bbox_top - 5, bbox_right, bbox_top - 5, tmp_geometry, 0, 1 ) {
		if inputGrid[# left, pressed] {
			if !inputGrid[# right, held] and facing == 1 facing = -1;
		}
		else if inputGrid[# right, pressed] {
			if !inputGrid[# left, held] and facing == -1 facing = 1;
		}
		exit;
	}
			
	else {
		//jump out of slide, end sliding event, and trigger jump flag
		if inputGrid[# jump, pressed] {
			isSliding = false;
			slidingTimer = 0;
			isJumping = true;
			x += facing * 1;
			y -= 5;
			exit;
		}
				
		else {
			//stop slide and adjust position if hitting a wall
			if facing = -1 and collision_line( bbox_left - 1, bbox_top, bbox_left - 1, bbox_bottom, tmp_geometry, 0, 1 ) {
				isSliding = false;
				slidingTimer = 0;
				x += 1;
				y -= 5;
				sprite_index = spr_megaman_idle;
				exit;
			}
			else if facing = 1 and collision_line( bbox_right + 1, bbox_top, bbox_right + 1, bbox_bottom, tmp_geometry, 0, 1 ) {
				isSliding = false;
				slidingTimer = 0;
				x += 1;
				y -= 5;
				sprite_index = spr_megaman_idle;
				exit;
			}
			//stop slide if timer is up
			else {
				if slidingTimer > 20 {
					isSliding = false;
					slidingTimer = 0;
					x += facing * 1;
					y -= 5;
					exit;
				}
						
			}
					
		}
				
	}
			
}
		
