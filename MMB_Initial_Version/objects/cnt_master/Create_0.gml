/// game boot process
globalvar inputHandler, currentStage, currentMenu;
inputHandler = instance_create_layer( 100, 100, "Instances", cnt_input );
currentStage = noone;
currentMenu = noone;
room_goto( rm_main_menu );