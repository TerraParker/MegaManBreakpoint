/// @description Insert description here
switch surfaceInit {
	
	case 0:
		
		if surface_exists( textSurface ) surface_free( textSurface );
		textSurface = surface_create( 256, 224 );
		textList = ds_list_create();
		var i, _index, _indexmax, _line;
		for ( i = 0;  i < string_length( stringText ); i++; ) {
	
			ds_list_add( textList, string_char_at( stringText, i + 1 ) );
	
		}
		
		surface_set_target( textSurface );
		_index = 0; _indexmax = 0; _line = 0;
		for ( i = 0; i < ds_list_size( textList ); i++; ) {
			
			if ds_list_find_value( textList, i ) == "|" {
				
				_line++; _index = 0;
				
			}
			
			else {
				
				draw_sprite_part_ext( img_sprite_font, 0, get_sprite_font_x( textList, i ), 0, 8, 8, _index * 8, _line * 8, 1, 1, stringColor, 1 );
				_index++;
				_indexmax++;
				
			}
			
		}
		surface_reset_target();
		if sprite_exists( textSprite ) sprite_delete( textSprite );
		textSprite = sprite_create_from_surface( textSurface, 0, 0, ( _indexmax + 1 ) * 8, ( _line + 1 ) * 8, 1, 0, 0, 0 );
		surfaceInit = 1;
		
	default:
		draw_sprite( textSprite, 0, x, y );
		break;
		
}