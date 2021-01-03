/// @description Insert description here
// You can write your code in this editor
if !isDead {
	var alpha = abs( (intangibleTimer mod 2 ) - 1 );
	if isStunned {
		sprite_index = spr_megaman_stun;
	
	}
	else if isOnLadder {
		sprite_index = spr_megaman_climb;
		if firingTimer < FIRE_DELAY {
			if aniFrame < 3 aniFrame += 3;
			if isAtLadderTop and !isSlidingDown {
				aniFrame = 5;
				aniTimer = 0;
			}
			else if isAtLadderTop and isSlidingDown {
				aniFrame = 3;
				aniTimer = 0;
			}
			else {
				if aniFrame = 5 aniFrame = 3;
				if isClimbing != 0 {
					if ++aniTimer > 6 {
						aniTimer = 0;
						aniFrame++;
						if aniFrame > 5 aniFrame = 3;
					}
				}
			}
		}
		else {
			if aniFrame > 2 aniFrame -= 3;
			if isAtLadderTop and !isSlidingDown {
				aniFrame = 2;
				aniTimer = 0;
			}
			else if isAtLadderTop and isSlidingDown {
				aniFrame = 0;
				aniTimer = 0;
			}
			else {
				if aniFrame = 2 aniFrame = 0;
				if isClimbing != 0 {
					if ++aniTimer > 6 {
						aniTimer = 0;
						aniFrame++;
						if aniFrame > 1 aniFrame = 0;
					}
				}
			}
		}
	}
	else if isAirborne {
		sprite_index = spr_megaman_jump;
		aniTimer = 0;
		if firingTimer < FIRE_DELAY aniFrame = 1;
		else aniFrame = 0;
	}
	else if isRunning != 0 {
		sprite_index = spr_megaman_run;
		if firingTimer < FIRE_DELAY {
			if aniFrame < 4 aniFrame += 4;
			if ++aniTimer > 10 {
				if ++aniFrame > 7 aniFrame = 4;
				aniTimer = 0;
			}
		}
		else {
			if aniFrame > 3 aniFrame -= 4;
			if ++aniTimer > 10 {
				if ++aniFrame > 3 aniFrame = 0;
				aniTimer = 0;
			}
		}
	}
	else if isSliding != 0 {
		sprite_index = spr_megaman_slide;
		aniTimer = 0;
		aniFrame = 0;
	}
	else {
		sprite_index = spr_megaman_idle;
		if firingTimer < FIRE_DELAY {
			aniFrame = 3;
			aniTimer = 0;
		}
		else {
			if runningTimer = 0 {
				if aniFrame != 1 {
					aniFrame = 0;
					if ++aniTimer = 220 {
						aniFrame = 1;
						aniTimer = 0;
					}
				}
				else if aniFrame = 1 {
					if ++aniTimer = 5 {
						aniFrame = 0;
						aniTimer = 0;
					}
				}
			}
			else {
				aniFrame = 2;
				aniTimer = 0;
			}
		}
	}
	draw_sprite_ext( sprite_index, aniFrame, x + 12 - facing * 12, y, facing, 1, 0, c_white, alpha );
	if drawHB = true draw_hitbox( c_green );
}