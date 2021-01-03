/// @description Behavior Code
// You can write your code in this editor
if shatter == 1 {
	
	switch orientation {
		
		case 0:
			var _s = spawn_projectile( obj_mir_met_shard, x + 3, y, 270, 1.3, obj_mega_man );
			_s.aniFrame = 4;
			_s = spawn_projectile( obj_mir_met_shard, x + 5, y + 3, 0, 1.3, obj_mega_man );
			_s.aniFrame = 5;
			_s = spawn_projectile( obj_mir_met_shard, x + 2, y + 5, 90, 1.3, obj_mega_man );
			_s.aniFrame = 6;
			_s = spawn_projectile( obj_mir_met_shard, x, y + 2, 180, 1.3, obj_mega_man );
			_s.aniFrame = 7;
			break;
		
		case 1:
			var _s = spawn_projectile( obj_mir_met_shard, x, y, 225, 1.3, obj_mega_man );
			_s.aniFrame = 0;
			_s = spawn_projectile( obj_mir_met_shard, x + 5, y, 315, 1.3, obj_mega_man );
			_s.aniFrame = 1;
			_s = spawn_projectile( obj_mir_met_shard, x + 5, y + 5, 45, 1.3, obj_mega_man );
			_s.aniFrame = 2;
			_s = spawn_projectile( obj_mir_met_shard, x, y + 5, 135, 1.3, obj_mega_man );
			_s.aniFrame = 3;
			break;
		
	}
	shatter = 2;
	
}
if shatter == 0 {
	
	switch orientation {
	
		case 0:
			if get_distance_center_to_center_h( self, obj_mega_man ) <= 2 {
			
				aniFrame = 3;
				shatter = true;
			
			}
			else aniFrame = 2;
			break;
	
		case 1:
			if get_distance_center_to_center_h( self, obj_mega_man ) <= 2 {
			
				aniFrame = 1;
				shatter = true;
			
			}
			else aniFrame = 0;
			break;
	
	}
	
}