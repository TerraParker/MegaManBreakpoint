/// @description Insert description here
// You can write your code in this editor
if camera_get_view_x( view_camera ) + 128 < get_instance_center_view( self ) camera_set_view_pos( view_camera, x - 128, 0 );
sceneTimer++;
if sceneTimer == 30 update_text_sprite( text, c_white, "" );
if sceneTimer == 60 update_text_sprite( text, c_white, "BEGIN!" );
if sceneTimer == 90 update_text_sprite( text, c_white, "" );
if sceneTimer == 120 update_text_sprite( text, c_white, "BEGIN!" );
if sceneTimer == 150 instance_destroy( text );
if sceneTimer == 180 {
	
	instance_create_layer( x, y, "Instances", obj_mega_man );
	with obj_mega_man snap_to_floor();
	obj_mega_man.drawHB = EDIT_drawHB;
	currentStage.stageState = play;
	instance_destroy();
	
}