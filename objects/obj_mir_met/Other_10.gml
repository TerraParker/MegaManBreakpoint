/// @description State Control
// You can write your code in this editor
event_inherited();
if get_distance_center_to_center_h( self, obj_spawn_mega_man ) <= active_range {
	
	switch state {
		
		case 0:
			if stateTimer == 0 {
				
				if get_distance_center_to_center_h( self, obj_spawn_mega_man ) <= detection_range {
					
					state = 1;
					stateTimer = 15;
					
				}
				
				
			}
			else stateTimer--;
			break;
		
		case 1:
			if stateTimer == 10 aniFrame = 1;
			if stateTimer == 5 {
				
				aniFrame = 2;
				instance_deactivate_object( shield );
				
			}
			if stateTimer == 0 {
				
				aniFrame = 3;
				state = 2;
				stateTimer = 100;
				break;
				
			}
			stateTimer--;
			break;
		
		case 2:
			if stateTimer == 80 {
				
				//play sound
				switch orientation {
					
					case 0:
						var _p = spawn_projectile( obj_mir_met_shot, x + 3, y + 16, 180, 1, obj_mega_man );
						_p.orientation = 0;
						orientation = 1;
						break;
						
					case 1:
						var _p = spawn_projectile( obj_mir_met_shot, x + 3, y + 16, 180, 1, obj_mega_man );
						_p.orientation = 1;
						orientation = 0;
						break;
					
				}
				
			}
			if stateTimer == 0 {
				
				state = 3;
				stateTimer = 15;
				break;
				
			}
			stateTimer--;
			break;
		
		case 3:
			if stateTimer == 10 aniFrame = 2;
			if stateTimer == 5 {
				
				aniFrame = 1;
				instance_activate_object( shield );
				
			}
			if stateTimer == 0 {
				
				aniFrame = 0;
				state = 0;
				stateTimer = 180;
				break;
				
			}
			stateTimer--;
			break;
		
	}
	
}