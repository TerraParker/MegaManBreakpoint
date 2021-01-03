/// @description Death Event
// You can write your code in this editor

/* things to be done:

create death animation(s)
play sound
shift to death event mode and set timer
*/

//create death animations
//play sound
if deadTimer == 0 {
	
	isDead = true;
	currentStage.stageState = dead;
	
}
if deadTimer = 300 {
	
	room_goto( currentStage.checkpoint );
	instance_destroy();
	
}
deadTimer++;