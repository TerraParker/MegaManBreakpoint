/// main game loop
//derive controller/keyboard input
with inputHandler event_perform( ev_other, ev_user0 );

//run state machine
switch gameState {

	case menu:
	
		with currentMenu event_perform( ev_other, ev_user0 );
		break;
		
	case play:
	
		with currentStage event_perform( ev_other, ev_user0 );
		break;
		
}

if keyboard_check( vk_escape ) game_end();