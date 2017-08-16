/*
	File: fn_updateTurfMarkers.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Updates ownership on map markers
*/

private ["_marker"];

{
	diag_log format["Turf Marker: %1",_x];
	_marker = format["turf_label_%1", _forEachIndex + 1];
	if ((_x select 1) != "0") then { _marker setMarkerTextLocal format["Turf of %1", _x select 2]; }
	else { _marker setMarkerTextLocal "Contested gang turf"; };
} forEach life_turf_list;