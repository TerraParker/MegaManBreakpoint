/// @description Insert description here
// You can write your code in this editor
switch STATE {
	
	case 0:
		h = 0;
		if ++waitTimer = WAIT_DELAY {
			
			if bbox_top = ORIGIN STATE = 1;
			else if bbox_bottom = ORIGIN + ( bbox_bottom - bbox_top ) + RANGE STATE = -1;
			waitTimer = 0;
			
		}
		break;
		
	case 1:
		if bbox_bottom + SPEED < ( ORIGIN + ( bbox_bottom - bbox_top ) + RANGE ) v = SPEED;
		else {
			
			h = ( ORIGIN + ( bbox_bottom - bbox_top ) + RANGE ) - bbox_bottom;
			STATE = 0;
			
		}
		break;
	case -1:
		if bbox_top - SPEED > ORIGIN v = -SPEED;
		else {
			
			h = ORIGIN - bbox_top;
			STATE = 0;
			
		}
		break;
	
}