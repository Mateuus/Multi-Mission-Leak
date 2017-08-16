/*
	File: fn_spawnPointSelected.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sorts out the spawn point selected and does a map zoom.
*/
disableSerialization;
_control = param [0,controlNull,[controlNull]];
_selection = param [1,0,[0]];
ES_spawn_point = _control lbData _selection;
ES_CamTa = getMarkerPos ES_spawn_point;