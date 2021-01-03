/// @description Behavior Code
// You can write your code in this editor
var _c = collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom, obj_mega_man, 0, 1 );
if _c {
	
	_c.damage = damage;
	with _c event_perform( ev_other, ev_user3 );
	
}