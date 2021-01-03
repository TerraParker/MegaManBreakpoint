/// @description Insert description here
// You can write your code in this editor
draw_bar( 10, 10, Health, spr_mm_health_bar );
draw_set_color( c_black );
draw_text( camera_get_view_x( view_camera ) + 30, 10, string( stageState ) );