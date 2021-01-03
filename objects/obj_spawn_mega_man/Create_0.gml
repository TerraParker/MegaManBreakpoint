/// @description Insert description here
// You can write your code in this editor
sceneTimer = 0;
Health = EDIT_startHealth;
if instance_exists( obj_mega_man ) {
	
	currentStage.checkpoint = room;
	instance_destroy();
	exit;
	
}

else {
		
	currentStage.stageState = start;
	currentStage.Health = 28;
	text = draw_text_sprite( view_get_xport( view_camera ), 100, c_white, "BEGIN!" );
	text.x = view_get_xport( view_camera ) + 128 - ( ( text.bbox_right - text.bbox_left ) / 2 );
	
}