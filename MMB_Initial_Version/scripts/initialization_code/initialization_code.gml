// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///Initialization code
surface_resize( application_surface, 512, 448 );

/* change this variable to the room you want to test. MAKE SURE YOU
HAVE A MEGA MAN SPAWN OBJECT IN THE FIRST SCREEN OF THE ROOM OR THE
GAME WILL NOT BE PLAYABLE. */
globalvar testStage;
testStage = rm_new_engine_test;

globalvar fontGrid;
fontGrid = ds_grid_create( 2, 207 );
for ( var i = 0; i < ds_grid_height( fontGrid ); i++; ) {
    
	ds_grid_set( fontGrid, 1, i, i * 8 );
	
}
{
ds_grid_set( fontGrid, 0, 0, "0" );
ds_grid_set( fontGrid, 0, 1, "1" );
ds_grid_set( fontGrid, 0, 2, "2" );
ds_grid_set( fontGrid, 0, 3, "3" );
ds_grid_set( fontGrid, 0, 4, "4" );
ds_grid_set( fontGrid, 0, 5, "5" );
ds_grid_set( fontGrid, 0, 6, "6" );
ds_grid_set( fontGrid, 0, 7, "7" );
ds_grid_set( fontGrid, 0, 8, "8" );
ds_grid_set( fontGrid, 0, 9, "9" );
ds_grid_set( fontGrid, 0, 10, "A" );
ds_grid_set( fontGrid, 0, 11, "B" );
ds_grid_set( fontGrid, 0, 12, "C" );
ds_grid_set( fontGrid, 0, 13, "D" );
ds_grid_set( fontGrid, 0, 14, "E" );
ds_grid_set( fontGrid, 0, 15, "F" );
ds_grid_set( fontGrid, 0, 16, "G" );
ds_grid_set( fontGrid, 0, 17, "H" );
ds_grid_set( fontGrid, 0, 18, "I" );
ds_grid_set( fontGrid, 0, 19, "J" );
ds_grid_set( fontGrid, 0, 20, "K" );
ds_grid_set( fontGrid, 0, 21, "L" );
ds_grid_set( fontGrid, 0, 22, "M" );
ds_grid_set( fontGrid, 0, 23, "N" );
ds_grid_set( fontGrid, 0, 24, "O" );
ds_grid_set( fontGrid, 0, 25, "P" );
ds_grid_set( fontGrid, 0, 26, "Q" );
ds_grid_set( fontGrid, 0, 27, "R" );
ds_grid_set( fontGrid, 0, 28, "S" );
ds_grid_set( fontGrid, 0, 29, "T" );
ds_grid_set( fontGrid, 0, 30, "U" );
ds_grid_set( fontGrid, 0, 31, "V" );
ds_grid_set( fontGrid, 0, 32, "W" );
ds_grid_set( fontGrid, 0, 33, "X" );
ds_grid_set( fontGrid, 0, 34, "Y" );
ds_grid_set( fontGrid, 0, 35, "Z" );
ds_grid_set( fontGrid, 0, 36, "a" );
ds_grid_set( fontGrid, 0, 37, "b" );
ds_grid_set( fontGrid, 0, 38, "c" );
ds_grid_set( fontGrid, 0, 39, "d" );
ds_grid_set( fontGrid, 0, 40, "e" );
ds_grid_set( fontGrid, 0, 41, "f" );
ds_grid_set( fontGrid, 0, 42, "g" );
ds_grid_set( fontGrid, 0, 43, "h" );
ds_grid_set( fontGrid, 0, 44, "i" );
ds_grid_set( fontGrid, 0, 45, "j" );
ds_grid_set( fontGrid, 0, 46, "k" );
ds_grid_set( fontGrid, 0, 47, "l" );
ds_grid_set( fontGrid, 0, 48, "m" );
ds_grid_set( fontGrid, 0, 49, "n" );
ds_grid_set( fontGrid, 0, 50, "o" );
ds_grid_set( fontGrid, 0, 51, "p" );
ds_grid_set( fontGrid, 0, 52, "q" );
ds_grid_set( fontGrid, 0, 53, "r" );
ds_grid_set( fontGrid, 0, 54, "s" );
ds_grid_set( fontGrid, 0, 55, "t" );
ds_grid_set( fontGrid, 0, 56, "u" );
ds_grid_set( fontGrid, 0, 57, "v" );
ds_grid_set( fontGrid, 0, 58, "w" );
ds_grid_set( fontGrid, 0, 59, "x" );
ds_grid_set( fontGrid, 0, 60, "y" );
ds_grid_set( fontGrid, 0, 61, "z" );
ds_grid_set( fontGrid, 0, 62, "!" );
ds_grid_set( fontGrid, 0, 63, "\"" );
ds_grid_set( fontGrid, 0, 64, "#" );
ds_grid_set( fontGrid, 0, 65, "$" );
ds_grid_set( fontGrid, 0, 66, "%" );
ds_grid_set( fontGrid, 0, 67, "&" );
ds_grid_set( fontGrid, 0, 68, "'" );
ds_grid_set( fontGrid, 0, 69, "(" );
ds_grid_set( fontGrid, 0, 70, ")" );
ds_grid_set( fontGrid, 0, 71, "*" );
ds_grid_set( fontGrid, 0, 72, "+" );
ds_grid_set( fontGrid, 0, 73, "," );
ds_grid_set( fontGrid, 0, 74, "-" );
ds_grid_set( fontGrid, 0, 75, "." );
ds_grid_set( fontGrid, 0, 76, "/" );
ds_grid_set( fontGrid, 0, 77, ":" );
ds_grid_set( fontGrid, 0, 78, ";" );
ds_grid_set( fontGrid, 0, 79, "<" );
ds_grid_set( fontGrid, 0, 80, "=" );
ds_grid_set( fontGrid, 0, 81, ">" );
ds_grid_set( fontGrid, 0, 82, "?" );
ds_grid_set( fontGrid, 0, 83, "@" );
ds_grid_set( fontGrid, 0, 84, "[" );
ds_grid_set( fontGrid, 0, 85, "]" );
ds_grid_set( fontGrid, 0, 86, "^" );
ds_grid_set( fontGrid, 0, 87, "_" );
ds_grid_set( fontGrid, 0, 88, "`" );
ds_grid_set( fontGrid, 0, 89, "{" );
ds_grid_set( fontGrid, 0, 90, "|" );
ds_grid_set( fontGrid, 0, 91, "}" );
ds_grid_set( fontGrid, 0, 92, "~" );
ds_grid_set( fontGrid, 0, 93, "•" );
ds_grid_set( fontGrid, 0, 94, " " );
ds_grid_set( fontGrid, 0, 95, "⚠" );

}

globalvar inputGrid; inputGrid = ds_grid_create( 11, 3 );
#macro up 0
#macro left 1
#macro down 2
#macro right 3
#macro jump 4
#macro fire 5
#macro slide 6
#macro selectl 7
#macro selectr 8
#macro start 9
#macro back 10
#macro pressed 0
#macro held 1
#macro released 2
#macro standard 0
#macro timed 1
#macro dummy -1 //menu command, does nothing
#macro roomchange 0 //menu command, goes to a room (grid ypos 3) w/o extra code, stage state
#macro runscript 1 //menu command, runs a script (grid ypos 3)
#macro switchmenu 2 //menu command, changes current menu to a different one (grid ypos 3)
#macro quit 10 //menu command, quits game
#macro menu 0
#macro play 1
#macro dead 2
#macro pause 3


globalvar Up, Down, Left, Right, Jump, Fire, Slide, SelectL, SelectR, Start, Back;

globalvar controller; controller = -1;
var gp_num = gamepad_get_device_count();
for (var i = 0; i < gp_num; i++;) {
	
   if gamepad_is_connected(i) {
	   
	   controller = i;
	   break;
	   
	   }
	   
   }
if controller != -1 gamepad_set_axis_deadzone( controller, .35 );

room_goto( rm_boot );