/// Stage Loop
switch stageState {
	
	case play:
		// Run spawn events
		with tmp_spawner_enemy event_perform( ev_other, ev_user0 );
		// Determine Moving Platform Movement
		with tmp_moving_geometry event_perform( ev_other, ev_user0 );
		// Moving Platform Movement
		with tmp_moving_geometry event_perform( ev_other, ev_user1 );
		// Get Player Input, Determine Mega Man Variables
		with obj_mega_man event_perform( ev_other, ev_user0 );
		// Determine Enemy Movement/Behavior
		with tmp_enemy event_perform( ev_other, ev_user0 );
		// Determine Projectile Movement
		with tmp_projectile event_perform( ev_other, ev_user0 );
		// Mega Man Movement
		with obj_mega_man event_perform( ev_other, ev_user1 );
		// Movement Resolution Phase
		with obj_mega_man event_perform( ev_other, ev_user2 );
		with tmp_projectile event_perform( ev_other, ev_user2 );
		with tmp_enemy event_perform( ev_other, ev_user2 );
		// Damage/Collision Resolution, Object Activation/Deactivation/Destruction
		with tmp_projectile event_perform( ev_other, ev_user1 );
		with tmp_animation event_perform( ev_other, ev_user0 );
		break;
		
	case start:
		with obj_spawn_mega_man event_perform( ev_other, ev_user0 );
		// Run spawn events
		with tmp_spawner_enemy event_perform( ev_other, ev_user0 );
		// Determine Moving Platform Movement
		with tmp_moving_geometry event_perform( ev_other, ev_user0 );
		// Moving Platform Movement
		with tmp_moving_geometry event_perform( ev_other, ev_user1 );
		with tmp_enemy event_perform( ev_other, ev_user0 );
		// Determine Projectile Movement
		with tmp_projectile event_perform( ev_other, ev_user0 );
		// Movement Resolution Phase
		with tmp_projectile event_perform( ev_other, ev_user2 );
		with tmp_enemy event_perform( ev_other, ev_user2 );
		// Damage/Collision Resolution, Object Activation/Deactivation/Destruction
		with tmp_projectile event_perform( ev_other, ev_user1 );
		with tmp_animation event_perform( ev_other, ev_user0 );
		// Check For Death/Events, Send Flags To Master
		break;
		
	case dead:
	// Run spawn events
		with tmp_spawner_enemy event_perform( ev_other, ev_user0 );
		// Determine Moving Platform Movement
		with tmp_moving_geometry event_perform( ev_other, ev_user0 );
		// Moving Platform Movement
		with tmp_moving_geometry event_perform( ev_other, ev_user1 );
		with tmp_enemy event_perform( ev_other, ev_user0 );
		// Determine Projectile Movement
		with tmp_projectile event_perform( ev_other, ev_user0 );
		// Movement Resolution Phase
		with tmp_projectile event_perform( ev_other, ev_user2 );
		with tmp_enemy event_perform( ev_other, ev_user2 );
		// Damage/Collision Resolution, Object Activation/Deactivation/Destruction
		with tmp_projectile event_perform( ev_other, ev_user1 );
		with tmp_animation event_perform( ev_other, ev_user0 );
		with obj_mega_man event_perform( ev_other, ev_user4 );
		break;
		
	case roomchange:
		break;
		
	case pause:
		break;
		
}