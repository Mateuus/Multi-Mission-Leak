/*
	File: fn_deleteMarkers.sqf
	Author: Mario2002
	
	Description:
	deletes the markers for player houses
*/

{
	deleteMarkerLocal _x;
}forEach life_houses_markers;

life_houses_markers = [];