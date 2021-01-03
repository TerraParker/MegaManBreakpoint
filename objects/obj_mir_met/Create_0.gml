/// @description Insert description here
// You can write your code in this editor
event_inherited();
Health = 1;
active_range = 144;
detection_range = 96;
orientation = 0;
state = 0;
stateTimer = 0;
sprite_index = spr_mir_met;
aniFrame = 0;

snap_to_floor();

shield = instance_create_depth( x, y, depth - 1, obj_mir_met_mirror );