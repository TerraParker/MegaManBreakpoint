/// @description Insert description here
// You can write your code in this editor
list = noone;
enemy = pointer_null;
EDIT_TYPE = EDIT_Type;
EDIT_Stock = EDIT_stock; //used with timertypes, max number of enemies that can be spawned (use 0 for infinite)
EDIT_Interval = EDIT_interval; //used with timed types, interval between death of most recent instance and creation of new (in frames)
EDIT_Population = EDIT_population; //used with timed types, max number of instances that can exist at one time
EDIT_RANGE = EDIT_Range; //range at which spawner activates and spawns enemies
timer = 0;


if EDIT_TYPE = timed {
	list = ds_list_create();
}