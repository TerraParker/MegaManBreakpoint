/// read controller and keyboard info into inputGrid
if controller != -1 {
	
	ds_grid_set_region( inputGrid, 0, 0, 2, 10, false );
	
	//interpret buttons into grid
	ds_grid_set( inputGrid, up, held, gamepad_button_check( controller, gp_padu ) );
	ds_grid_set( inputGrid, up, pressed, gamepad_button_check_pressed( controller, gp_padu ) );
	ds_grid_set( inputGrid, up, released, gamepad_button_check_released( controller, gp_padu ) );
	ds_grid_set( inputGrid, left, held, gamepad_button_check( controller, gp_padl ) );
	ds_grid_set( inputGrid, left, pressed, gamepad_button_check_pressed( controller, gp_padl ) );
	ds_grid_set( inputGrid, left, released, gamepad_button_check_released( controller, gp_padl ) );
	ds_grid_set( inputGrid, down, held, gamepad_button_check( controller, gp_padd ) );
	ds_grid_set( inputGrid, down, pressed, gamepad_button_check_pressed( controller, gp_padd ) );
	ds_grid_set( inputGrid, down, released, gamepad_button_check_released( controller, gp_padd ) );
	ds_grid_set( inputGrid, right, held, gamepad_button_check( controller, gp_padr ) );
	ds_grid_set( inputGrid, right, pressed, gamepad_button_check_pressed( controller, gp_padr ) );
	ds_grid_set( inputGrid, right, released, gamepad_button_check_released( controller, gp_padr ) );
	ds_grid_set( inputGrid, jump, held, gamepad_button_check( controller, gp_face1 ) );
	ds_grid_set( inputGrid, jump, pressed, gamepad_button_check_pressed( controller, gp_face1 ) );
	ds_grid_set( inputGrid, jump, released, gamepad_button_check_released( controller, gp_face1 ) );
	ds_grid_set( inputGrid, fire, held, gamepad_button_check( controller, gp_face3 ) );
	ds_grid_set( inputGrid, fire, pressed, gamepad_button_check_pressed( controller, gp_face3 ) );
	ds_grid_set( inputGrid, fire, released, gamepad_button_check_released( controller, gp_face3 ) );
	ds_grid_set( inputGrid, slide, held, gamepad_button_check( controller, gp_face2 ) );
	ds_grid_set( inputGrid, slide, pressed, gamepad_button_check_pressed( controller, gp_face2 ) );
	ds_grid_set( inputGrid, slide, released, gamepad_button_check_released( controller, gp_face2 ) );
	ds_grid_set( inputGrid, selectl, held, gamepad_button_check( controller, gp_shoulderl ) );
	ds_grid_set( inputGrid, selectl, pressed, gamepad_button_check_pressed( controller, gp_shoulderl ) );
	ds_grid_set( inputGrid, selectl, released, gamepad_button_check_released( controller, gp_shoulderl ) );
	ds_grid_set( inputGrid, selectr, held, gamepad_button_check( controller, gp_shoulderr ) );
	ds_grid_set( inputGrid, selectr, pressed, gamepad_button_check_pressed( controller, gp_shoulderr ) );
	ds_grid_set( inputGrid, selectr, released, gamepad_button_check_released( controller, gp_shoulderr ) );
	ds_grid_set( inputGrid, start, held, gamepad_button_check( controller, gp_start ) );
	ds_grid_set( inputGrid, start, pressed, gamepad_button_check_pressed( controller, gp_start ) );
	ds_grid_set( inputGrid, start, released, gamepad_button_check_released( controller, gp_start ) );
	ds_grid_set( inputGrid, back, held, gamepad_button_check( controller, gp_select ) );
	ds_grid_set( inputGrid, back, pressed, gamepad_button_check_pressed( controller, gp_select ) );
	ds_grid_set( inputGrid, back, released, gamepad_button_check_released( controller, gp_select ) );
	
	//interpret stick into grid
	var _h; _h = gamepad_axis_value( controller, gp_axislh );
	var _v; _v = gamepad_axis_value( controller, gp_axislv );
	
	if _h = 0 and xAxisPrev != 0 {
		
		if xAxisPrev < 0 ds_grid_set( inputGrid, left, released, true );
		if xAxisPrev > 0 ds_grid_set( inputGrid, right, released, true );
		
	}
	
	if _h < 0 {
		
		ds_grid_set( inputGrid, left, held, true );
		if xAxisPrev >= 0 ds_grid_set( inputGrid, left, pressed, true );
		if xAxisPrev > 0 ds_grid_set( inputGrid, right, released, true );
		
	}
	
	if _h > 0 {
		
		ds_grid_set( inputGrid, right, held, true );
		if xAxisPrev <= 0 ds_grid_set( inputGrid, right, pressed, true );
		if xAxisPrev < 0 ds_grid_set( inputGrid, left, released, true );
		
	}
	
	if _v = 0 and yAxisPrev != 0 {
		
		if yAxisPrev < 0 ds_grid_set( inputGrid, up, released, true );
		if yAxisPrev > 0 ds_grid_set( inputGrid, down, released, true );
		
	}
	
	if _v < 0 {
		
		ds_grid_set( inputGrid, up, held, true );
		if yAxisPrev >= 0 ds_grid_set( inputGrid, up, pressed, true );
		if yAxisPrev > 0 ds_grid_set( inputGrid, down, released, true );
		
	}
	
	if _v > 0 {
		
		ds_grid_set( inputGrid, down, held, true );
		if yAxisPrev <= 0 ds_grid_set( inputGrid, down, pressed, true );
		if yAxisPrev < 0 ds_grid_set( inputGrid, up, released, true );
		
	}
	
	xAxisPrev = _h;
	yAxisPrev = _v;
	
}

//keyboard controls
else {
	
	ds_grid_set( inputGrid, up, held, keyboard_check( vk_up ) );
	ds_grid_set( inputGrid, up, pressed, keyboard_check_pressed( vk_up ) );
	ds_grid_set( inputGrid, up, released, keyboard_check_released( vk_up ) );
	ds_grid_set( inputGrid, left, held, keyboard_check( vk_left ) );
	ds_grid_set( inputGrid, left, pressed, keyboard_check_pressed( vk_left ) );
	ds_grid_set( inputGrid, left, released, keyboard_check_released( vk_left ) );
	ds_grid_set( inputGrid, down, held, keyboard_check( vk_down ) );
	ds_grid_set( inputGrid, down, pressed, keyboard_check_pressed( vk_down ) );
	ds_grid_set( inputGrid, down, released, keyboard_check_released( vk_down ) );
	ds_grid_set( inputGrid, right, held, keyboard_check( vk_right) );
	ds_grid_set( inputGrid, right, pressed, keyboard_check_pressed( vk_right ) );
	ds_grid_set( inputGrid, right, released, keyboard_check_released( vk_right ) );
	ds_grid_set( inputGrid, jump, held, keyboard_check( ord( "Z" ) ) );
	ds_grid_set( inputGrid, jump, pressed, keyboard_check_pressed( ord( "Z" ) ) );
	ds_grid_set( inputGrid, jump, released, keyboard_check_released( ord( "Z" ) ) );
	ds_grid_set( inputGrid, fire, held, keyboard_check( ord( "X" ) ) );
	ds_grid_set( inputGrid, fire, pressed, keyboard_check_pressed( ord( "X" ) ) );
	ds_grid_set( inputGrid, fire, released, keyboard_check_released( ord( "X" ) ) );
	ds_grid_set( inputGrid, slide, held, keyboard_check( ord( "C" ) ) );
	ds_grid_set( inputGrid, slide, pressed, keyboard_check_pressed( ord( "C" ) ) );
	ds_grid_set( inputGrid, slide, released, keyboard_check_released( ord( "C" ) ) );
	ds_grid_set( inputGrid, selectl, held, keyboard_check( ord( "A" ) ) );
	ds_grid_set( inputGrid, selectl, pressed, keyboard_check_pressed( ord( "A" ) ) );
	ds_grid_set( inputGrid, selectl, released, keyboard_check_released( ord( "A" ) ) );
	ds_grid_set( inputGrid, selectr, held, keyboard_check( ord( "D" ) ) );
	ds_grid_set( inputGrid, selectr, pressed, keyboard_check_pressed( ord( "D" ) ) );
	ds_grid_set( inputGrid, selectr, released, keyboard_check_released( ord( "D" ) ) );
	ds_grid_set( inputGrid, start, held, keyboard_check( vk_enter ) );
	ds_grid_set( inputGrid, start, pressed, keyboard_check_pressed( vk_enter ) );
	ds_grid_set( inputGrid, start, released, keyboard_check_released( vk_enter ) );
	ds_grid_set( inputGrid, back, held, keyboard_check( vk_backspace ) );
	ds_grid_set( inputGrid, back, pressed, keyboard_check_pressed( vk_backspace ) );
	ds_grid_set( inputGrid, back, released, keyboard_check_released( vk_backspace ) );
	
}

//clean up direction inputs
if dPadTiltV = 0 {
	
	if inputGrid[# up, held ] and !inputGrid[# up, pressed ] {
	
		if inputGrid[# down, pressed ] {
		
			ds_grid_set( inputGrid, up, held, false );
			ds_grid_set( inputGrid, up, released, true );
			dPadTiltV = 1;
		
		}
	
	}
	else if inputGrid[# down, held ] and !inputGrid[# down, pressed ] {
	
		if inputGrid[# up, pressed ] {
		
			ds_grid_set( inputGrid, down, held, false );
			ds_grid_set( inputGrid, down, released, true );
			dPadTiltV = -1;
		
		}
	
	}
	else if inputGrid[# up, pressed ] and inputGrid[# down, pressed ] {
	
		ds_grid_set( inputGrid, down, pressed, false );
		dPadTiltV = -1;
	
	}
}
else if dPadTiltV = -1 {
	
	if inputGrid[# up, released ] {
		
		if inputGrid[# down, held ] {
			
			ds_grid_set( inputGrid, down, pressed, true );
			dPadTiltV = 1;
			
		}
		else dPadTiltV = 0;
		
	}
	else {
		
		if inputGrid[# down, pressed ] {
		
			ds_grid_set( inputGrid, up, held, false );
			ds_grid_set( inputGrid, up, released, true );
			dPadTiltV = 1;
		
		}
		else ds_grid_set_region( inputGrid, down, held, down, released, false );
		
	}
	
}
else if dPadTiltV = 1 {
	
	if inputGrid[# down, released ] {
		
		if inputGrid[# up, held ] {
			
			ds_grid_set( inputGrid, up, pressed, true );
			dPadTiltV = -1;
			
		}
		else dPadTiltV = 0;
		
	}
	else {
		
		if inputGrid[# up, pressed ] {
		
			ds_grid_set( inputGrid, down, held, false );
			ds_grid_set( inputGrid, down, released, true );
			dPadTiltV = -1;
		
		}
		else ds_grid_set_region( inputGrid, up, held, up, released, false );
		
	}
	
}

if dPadTiltH = 0 {
	
	if inputGrid[# left, held ] and !inputGrid[# left, pressed ] {
	
		if inputGrid[# right, pressed ] {
		
			ds_grid_set( inputGrid, left, held, false );
			ds_grid_set( inputGrid, left, released, true );
			dPadTiltH = 1;
		
		}
	
	}
	else if inputGrid[# right, held ] and !inputGrid[# right, pressed ] {
	
		if inputGrid[# left, pressed ] {
		
			ds_grid_set( inputGrid, right, held, false );
			ds_grid_set( inputGrid, right, released, true );
			dPadTiltH = -1;
		
		}
	
	}
	else if inputGrid[# left, pressed ] and inputGrid[# right, pressed ] {
	
		ds_grid_set( inputGrid, right, pressed, false );
		dPadTiltH = -1;
	
	}
}
else if dPadTiltH = -1 {
	
	if inputGrid[# left, released ] {
		
		if inputGrid[# right, held ] {
			
			ds_grid_set( inputGrid, right, pressed, true );
			dPadTiltH = 1;
			
		}
		else dPadTiltH = 0;
		
	}
	else {
		
		if inputGrid[# right, pressed ] {
		
			ds_grid_set( inputGrid, left, held, false );
			ds_grid_set( inputGrid, left, released, true );
			dPadTiltH = 1;
		
		}
		else ds_grid_set_region( inputGrid, right, held, right, released, false );
		
	}
	
}
else if dPadTiltH = 1 {
	
	if inputGrid[# right, released ] {
		
		if inputGrid[# left, held ] {
			
			ds_grid_set( inputGrid, left, pressed, true );
			dPadTiltH = -1;
			
		}
		else dPadTiltH = 0;
		
	}
	else {
		
		if inputGrid[# left, pressed ] {
		
			ds_grid_set( inputGrid, right, held, false );
			ds_grid_set( inputGrid, right, released, true );
			dPadTiltH = -1;
		
		}
		else ds_grid_set_region( inputGrid, left, held, left, released, false );
		
	}
	
}

//set test/debug variables
Up = 0;
if inputGrid[# up, held ] Up = 2;
if inputGrid[# up, pressed ] Up = 1;
if inputGrid[# up, released ] Up = 3;

Right = 0;
if inputGrid[# right, held ] Right = 2;
if inputGrid[# right, pressed ] Right = 1;
if inputGrid[# right, released ] Right = 3;

Down = 0;
if inputGrid[# down, held ] Down = 2;
if inputGrid[# down, pressed ] Down = 1;
if inputGrid[# down, released ] Down = 3;

Left = 0;
if inputGrid[# left, held ] Left = 2;
if inputGrid[# left, pressed ] Left = 1;
if inputGrid[# left, released ] Left = 3;

Jump = 0;
if inputGrid[# jump, held ] Jump = 2;
if inputGrid[# jump, pressed ] Jump = 1;
if inputGrid[# jump, released ] Jump = 3;

Fire = 0;
if inputGrid[# fire, held ] Fire = 2;
if inputGrid[# fire, pressed ] Fire = 1;
if inputGrid[# fire, released ] Fire = 3;

Slide = 0;
if inputGrid[# slide, held ] Slide = 2;
if inputGrid[# slide, pressed ] Slide = 1;
if inputGrid[# slide, released ] Slide = 3;

SelectL = 0;
if inputGrid[# selectl, held ] SelectL = 2;
if inputGrid[# selectl, pressed ] SelectL = 1;
if inputGrid[# selectl, released ] SelectL = 3;

SelectR = 0;
if inputGrid[# selectr, held ] SelectR = 2;
if inputGrid[# selectr, pressed ] SelectR = 1;
if inputGrid[# selectr, released ] SelectR = 3;

Start = 0;
if inputGrid[# start, held ] Start = 2;
if inputGrid[# start, pressed ] Start = 1;
if inputGrid[# start, released ] Start = 3;

Back = 0;
if inputGrid[# back, held ] Back = 2;
if inputGrid[# back, pressed ] Back = 1;
if inputGrid[# back, released ] Back = 3;