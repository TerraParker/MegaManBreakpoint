/// @description Room Change Event
// You can write your code in this editor
room_goto( destination );
switch isAdvancing {
	
	case right:
		x = 0 - ( bbox_right - x );
		break;
	
	case down:
		y = ( y - bbox_top ) + 1;
		x = x mod 256 + ( offset * 16 );
		break;
		
	case up:
		y = room_height - ( bbox_bottom - y ) - 1;
		x = x mod 256 + ( offset * 16 );
		break;
		
	case left:
		x = room_width - ( bbox_left - x );
		break;
	
}