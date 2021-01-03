/// @description Insert description here
// You can write your code in this editor
var i;
for ( i = 0; i < ds_list_size( textList ); i++; ) instance_destroy( ds_list_find_value( textList, i ) );