/// @description Insert description here
// You can write your code in this editor
var _h, _v, _x, _y;

xprev = x;
yprev = y;

_x = ( x + xslop + h ) div 1;
_y = ( y + yslop + v ) div 1;

_h = _x - xprev;
_v = _y - yprev;

//move Mega Man if needed
if collision_line( bbox_left, bbox_top - 1, bbox_right, bbox_top - 1, obj_mega_man, 0, 1 ) {
	
	with obj_mega_man {
		var __h = _h;
		var __v = _v;
		
		if __h > 0 __h = truncate_movement_to_nearest( right, _h, tmp_geometry );
		else if __h < 0 __h = truncate_movement_to_nearest( left, _h, tmp_geometry );
		if __v > 0 __v = truncate_movement_to_nearest( up, _v, tmp_geometry );
		x += __h;
		y += __v;
		if __v < 0 {
			
			if collision_in_direction( up, 0, tmp_geometry ) isCrushed = true;
			
		}
		
	}
	
}

else {
	
	if h > 0 {
	
		if collision_in_direction( right, _h, obj_mega_man ) {
			
			if obj_mega_man.bbox_bottom == bbox_top with obj_mega_man y--;
			while collision_in_direction( right, _h, obj_mega_man ) with obj_mega_man x++;
			with obj_mega_man {
				
				if isOnLadder {
					
					isOnLadder = false;
					isClimbing = 0;
					isSlidingDown = 0;
					isAtLadderTop = 0;
					isAirborne = true;
					
				}
				if collision_in_direction( right, 0, tmp_geometry ) isCrushed = true;
				
			}
			
		}

	}
	
	if h < 0 {
		
		if collision_in_direction( left, _h, obj_mega_man ) {
			
			if obj_mega_man.bbox_bottom == bbox_top with obj_mega_man y--;
			while collision_in_direction( left, _h, obj_mega_man ) with obj_mega_man x--;
			with obj_mega_man {
				
				if isOnLadder {
					
					isOnLadder = false;
					isClimbing = 0;
					isSlidingDown = 0;
					isAtLadderTop = 0;
					isAirborne = true;
					
				}
				if collision_in_direction( left, 0, tmp_geometry ) isCrushed = true;
				
			}
			
		}
		
	}
	
	if v > 0 {
		
		if collision_in_direction( down, _h, obj_mega_man ) {
			
			while collision_in_direction( down, _h, obj_mega_man ) with obj_mega_man y++;
			with obj_mega_man {
				
				if isOnLadder {
					
					isOnLadder = false;
					isClimbing = 0;
					isSlidingDown = 0;
					isAtLadderTop = 0;
					isAirborne = true;
					
				}
				if collision_in_direction( down, 0, tmp_geometry ) isCrushed = true;
				
			}
			
		}
		
	}
	
	if v < 0 {
		
		if collision_in_direction( up, _h, obj_mega_man ) {
			
			while collision_in_direction( up, _h, obj_mega_man ) with obj_mega_man y--;
			with obj_mega_man {
				
				if isOnLadder {
					
					isOnLadder = false;
					isClimbing = 0;
					isSlidingDown = 0;
					isAtLadderTop = 0;
					isAirborne = false;
					
				}
				if collision_in_direction( up, 0, tmp_geometry ) isCrushed = true;
				
			}
			
		}
		
	}
	
}

x += xslop;
y += yslop;

x += h;
y += v;

xslop = x mod 1;
yslop = y mod 1;

x = x div 1;
y = y div 1;