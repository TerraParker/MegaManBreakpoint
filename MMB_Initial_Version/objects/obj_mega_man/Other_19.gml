/// @description Free Activity Loop
//running left
if inputGrid[# right, held] and !inputGrid[# left, held ] {
	if facing == -1 {
		facing = 1;
		runningTimer = 0;
	}
	if ++runningTimer > RUN_DELAY {
		runningTimer = RUN_DELAY;
		isRunning = true;
	}
}

//running right		
else if inputGrid[# left, held] and !inputGrid[# right, held ] {
	if facing == 1 {
		facing = -1;
		runningTimer = 0;
	}
	if ++runningTimer > RUN_DELAY {
		runningTimer = RUN_DELAY;
		isRunning = true;
	}
}

//tippy-toes		
else {
	if runningTimer > 0 {	
		runningTimer = 0;
		isNudging = true;
	}
}

//jumping
if !isAirborne and inputGrid[# jump, pressed ] {
	isJumping = true;
	isAirborne = true;
}
		
//terminating jump
else if isAirborne {
	if inputGrid[# jump, released ] {
		hasFinishedJumping = true;
	}
}

//firing
if inputGrid [# fire, pressed ] {
	firingTimer = 0;
	if inputGrid[# fire, pressed ] and instance_number( obj_lemon ) < 3 {
		if inputGrid[# left, held ] and !inputGrid[# right, held ] facing = -1;
		else if inputGrid[# right, held ] facing = 1;
		firingTimer = 0;
		//determine shot creation position based on sprite
		switch sprite_index {
			case spr_megaman_idle:
				switch facing {
					
					case 1:
						spawn_projectile( obj_lemon, x + 19, y + 7, 0, 4, tmp_enemy );
						break;
					case -1:
						spawn_projectile( obj_lemon, x - 5, y + 7, 0, -4, tmp_enemy );
						break;
				}
				break;
			case spr_megaman_run:
				switch facing {
					
					case 1:
						spawn_projectile( obj_lemon, x + 16, y + 7, 0, 4, tmp_enemy );
						break;
					case -1:
						spawn_projectile( obj_lemon, x - 2, y + 7, 0, -4, tmp_enemy );
						break;
				}
				break;
			case spr_megaman_jump:
				switch facing {
					case 1:
						spawn_projectile( obj_lemon, x + 15, y + 6, 0, 4, tmp_enemy );
						break;
					case -1:
						spawn_projectile( obj_lemon, x - 1, y + 6, 0, -4, tmp_enemy );
						break;	
				}
				break;			
		}	
	}
}