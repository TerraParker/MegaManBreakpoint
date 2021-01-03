/// @description Mega Man Control FLowchart
//initialize variables

isFiring = false;
isJumping = false;
hasFinishedJumping = false;
isLanding = false;
isRunning = false;
isNudging = false;
isClimbing = 0;
isSlidingDown = false;

if ladderDropTimer > 0 ladderDropTimer--;

if ++firingTimer > FIRE_DELAY {
	
	firingTimer = FIRE_DELAY;
	
}

if isIntangible {
	
	if ++intangibleTimer > 90 {
		
		isIntangible = false;
		intangibleTimer = 0;
		
	}
	
}

if isAirborne and v > 0 {

	if collision_line( bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, tmp_geometry, 0, 1 ) {
		
		isAirborne = false;
		isLanding = true;
		
	}
	
	else if collision_line( bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, tmp_ladder, 0, 1 ) and
	!collision_line( bbox_left, bbox_bottom, bbox_right, bbox_bottom, tmp_ladder, 0, 1 ) {
		
		isAirborne = false;
		isLanding = true;
		
	}
}

else if !isOnLadder
and !collision_line( bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, tmp_geometry, 0, 1 ) {
	
	if !collision_line( bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, tmp_ladder, 0, 1 ) isAirborne = true;
	else if collision_line( bbox_left, bbox_bottom, bbox_right, bbox_bottom, tmp_ladder, 0, 1 ) isAirborne = true;
	
}

if isStunned {
	
	if isOnLadder {
		
		isOnLadder = false;
		if !collision_line( bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, tmp_geometry, 0, 1 ) isAirborne = true;
		else isAirborne = false;
		
	}
	
	if isSliding {
		
		isSliding = false;
		slidingTimer = 0;
		x += facing;
		y -= 5;
		
	}
	
	isCharging = false;
	chargingTimer = 0;
	firingTimer = FIRE_DELAY;
	isRunning = false;
	runningTimer = 0;
	if ++stunnedTimer = 20 {
		
		isStunned = false;
		stunnedTimer = 0;
		
	}
	
}

else {
	
	if isSliding {
		
		slidingTimer++;
		if isAirborne {
			
			isSliding = false;
			slidingTimer = 0;
			x += facing * 1;
			y -= 4;
			isAirborne = true;
			
		}
		
		else {
			
			if collision_line( bbox_left, bbox_top - 5, bbox_right, bbox_top - 5, tmp_geometry, 0, 1 ) {
				
				if inputGrid[# left, pressed] {
					
					if !inputGrid[# right, held] and facing == 1 facing = -1;
					
				}
				
				else if inputGrid[# right, pressed] {
					
					if !inputGrid[# left, held] and facing == -1 facing = 1;
					
				}
				
			}
			
			else {
				
				if inputGrid[# jump, pressed] {
					
					isSliding = false;
					slidingTimer = 0;
					isJumping = true;
					x += facing * 1;
					y -= 5;
					
				}
				
				else {
					
					if facing = -1 and collision_line( bbox_left - 1, bbox_top, bbox_left - 1, bbox_bottom, tmp_geometry, 0, 1 ) {
						
						isSliding = false;
						slidingTimer = 0;
						x += 1;
						y -= 5;
						sprite_index = spr_megaman_idle;
						
					}
					
					else if facing = 1 and collision_line( bbox_right + 1, bbox_top, bbox_right + 1, bbox_bottom, tmp_geometry, 0, 1 ) {
						
						isSliding = false;
						slidingTimer = 0;
						x += 1;
						y -= 5;
						sprite_index = spr_megaman_idle;
						
					}
					
					else {
						
						if slidingTimer > 20 {
							
							isSliding = false;
							slidingTimer = 0;
							x += facing * 1;
							y -= 5;
							
						}
						
					}
					
				}
				
			}
			
		}
		
	}
	
	else if isOnLadder {
		
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
			
		}
		
		//if at top of ladder get to top of ladder
		else if collision_line( bbox_left + 1, bbox_bottom + 1, bbox_right - 1, bbox_bottom + 1, tmp_ladder, 0, 1 )
		and !collision_line( bbox_left + 1, bbox_top + 10, bbox_right - 1, bbox_top + 10, tmp_ladder, 0, 1 ) {
			
			isOnLadder = false;
			isClimbing = false;
			isSlidingDown = false;
			isAtLadderTop = false;
			isAirborne = false;
			y = collision_line( bbox_left + 1, bbox_bottom + 1, bbox_right - 1, bbox_bottom + 1, tmp_ladder, 0, 1 ).y + ( y - bbox_bottom - 1 );
			
		}
		
		//get off if touching ground
		if collision_line( bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, tmp_geometry, 0, 1 )
		and !inputGrid[# up, held ] {
			
			isOnLadder = false;
			isClimbing = 0;
			isSlidingDown = false;
			isAirborne = false;
			isAtLadderTop = false;
			
		}
		
		//switch to ladder top sprite
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
			
		}
		
		//sliding down
		else if inputGrid[# jump, held ] and inputGrid[# down, held ] {
			
			isSlidingDown = true;
			isClimbing = 0;
			
		}
		
		//also sliding down
		else if inputGrid[# slide, held ] {
			
			isSlidingDown = true;
			isClimbing = 0;
			
		}
		
		else {
			
			if inputGrid[# up, held ] {
				
				isClimbing = -1;
				isSlidingDown = false;
					
			}
		
			else if inputGrid[# down, held ] {
			
				isClimbing = 1;
				isSlidingDown = false;
			
			}
			
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
				
		}
		
	}
	
	else {
			
		if collision_rectangle( bbox_left + 4, bbox_top + 4, bbox_right - 4, bbox_bottom, tmp_ladder, 0, 1 )
		and inputGrid[# up, held ] {
			
			if ladderDropTimer = 0 or !isAirborne {
				
				isOnLadder = true;
				isAirborne = false;
				x = collision_rectangle( bbox_left + 1, bbox_top + 4, bbox_right - 1, bbox_bottom + 1, tmp_ladder, 0, 1 ).x - 4;
				
			}
					
		}
		
		else if collision_rectangle( bbox_left + 4, bbox_top + 4, bbox_right - 4, bbox_bottom + 1, tmp_ladder, 0, 1 )
		and inputGrid[# down, held ] 
		and isAirborne {
			
			if ladderDropTimer = 0 {
				
				isOnLadder = true;
				isAirborne = false;
				x = collision_rectangle( bbox_left, bbox_top + 4, bbox_right, bbox_bottom + 1, tmp_ladder, 0, 1 ).x - 4;
				
			}
			
		}
		
		else if collision_line( bbox_left + 4, bbox_bottom + 1, bbox_right - 4, bbox_bottom + 1, tmp_ladder, 0, 1 )
		and inputGrid[# down, pressed ] 
		and !isAirborne {
			
			isOnLadder = true;
			isAirborne = false;
			x = collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom + 1, tmp_ladder, 0, 1 ).x - 4;
			y = collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom + 1, tmp_ladder, 0, 1 ).y + ( y - bbox_top ) - 9;
			isAtLadderTop = true;
			
		}
      
		else {
			
			if !isAirborne and inputGrid[# jump, pressed] and inputGrid[# down, held] {
				switch facing {
				
					case 1:
						if !collision_line( bbox_right + 1, bbox_bottom - 4, bbox_right + 1, bbox_bottom - 1, tmp_geometry, 0, 1 ) {
							isSliding = true;
							x += facing * -1;
							y += 5;
							sprite_index = spr_megaman_slide;
						}
						break;
					case -1:
						if !collision_line( bbox_left - 1, bbox_bottom - 4, bbox_left - 1, bbox_bottom - 1, tmp_geometry, 0, 1 ) {
							isSliding = true;
							x += facing * -1;
							y += 5;
							sprite_index = spr_megaman_slide;
						}
						break;
				}
			}
		
			else if !isAirborne and inputGrid[# slide, pressed ] {
				switch facing {
				
					case 1:
						if !collision_line( bbox_right + 1, bbox_bottom - 4, bbox_right + 1, bbox_bottom - 1, tmp_geometry, 0, 1 ) {
							isSliding = true;
							x += facing * -1;
							y += 5;
							sprite_index = spr_megaman_slide;
						}
						break;
					case -1:
						if !collision_line( bbox_left - 1, bbox_bottom - 4, bbox_left - 1, bbox_bottom - 1, tmp_geometry, 0, 1 ) {
							isSliding = true;
							x += facing * -1;
							y += 5;
							sprite_index = spr_megaman_slide;
						}
						break;
				}
			}
		
			//space for other special situations
		
			else {
			
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
			
				else {
				
					if runningTimer > 0 {
					
						runningTimer = 0;
						isNudging = true;
					
					}
				
				}
			
				if !isAirborne and inputGrid[# jump, pressed ] {
				
					isJumping = true;
					isAirborne = true;
				
				}
			
				else if isAirborne {
				
					if inputGrid[# jump, released ] {
						
						hasFinishedJumping = true;
						
					}
				
				}
			
				if inputGrid [# fire, pressed ] {
				
					//projectile stuff
					firingTimer = 0;
					if inputGrid[# fire, pressed ] and instance_number( obj_lemon ) < 3 {
				
						if inputGrid[# left, held ] and !inputGrid[# right, held ] facing = -1;
						else if inputGrid[# right, held ] facing = 1;
						firingTimer = 0;
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
			
			}
		
		}
		
	}
	
}