/// @description Damage Event
// You can write your code in this editor

//play sound
Health -= damage;
if Health <= 0 event_perform( ev_other, ev_user1 );