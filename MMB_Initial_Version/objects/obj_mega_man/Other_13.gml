/// @description Damage Event
// You can write your code in this editor
if !isIntangible {
	Health -= damage;
	currentStage.Health = Health;
	damage = 0;
	isStunned = true;
	isIntangible = true;
}
if Health <= 0 {
	
	Health = 0;
	event_perform( ev_other, ev_user4 );
	
}