/// @description Insert description here
// You can write your code in this editor	
switch EDIT_TYPE {
	
	case standard:
		if get_distance_center_to_center_h( self, obj_spawn_mega_man ) <= EDIT_RANGE {
			instance_create_layer( x, y, "Instances", enemy );
			instance_destroy();
		}
		break;
	
	case timed:
		if get_distance_center_to_center_h( self, obj_spawn_mega_man ) <= EDIT_RANGE {
			if timer = 0 {
				for (var i = 0; i < ds_list_size( list ); i++;) {
					if !instance_exists( ds_list_find_value( list, i ) ) ds_list_delete( list, i );
				}
				if ds_list_size( list ) < EDIT_Population {
					ds_list_add( list, instance_create_layer( x, y, "Instances", enemy ) );
					EDIT_Stock--;
					timer = EDIT_Interval;
				}
				if EDIT_Stock == 0 instance_destroy();
			}
			else timer--;
		}
		break;
	
}