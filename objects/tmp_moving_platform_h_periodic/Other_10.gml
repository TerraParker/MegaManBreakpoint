/// @description Insert description here
// You can write your code in this editor
switch STATE {
	
	case 0:
		h = 0;
		if ++waitTimer = WAIT_DELAY {
			
			if bbox_left = ORIGIN STATE = 1;
			else if bbox_right = ORIGIN + ( bbox_right - bbox_left ) + RANGE STATE = -1;
			waitTimer = 0;
			
		}
		break;
		
	case 1:
		if bbox_right + SPEED < ( ORIGIN + ( bbox_right - bbox_left ) + RANGE ) h = SPEED;
		else {
			
			h = ( ORIGIN + ( bbox_right - bbox_left ) + RANGE ) - bbox_right;
			STATE = 0;
			
		}
		break;
	case -1:
		if bbox_left - SPEED > ORIGIN h = -SPEED;
		else {
			
			h = ORIGIN - bbox_left;
			STATE = 0;
			
		}
		break;
	
}