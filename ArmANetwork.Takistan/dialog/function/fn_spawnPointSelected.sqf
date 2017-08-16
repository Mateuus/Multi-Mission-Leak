/*
	File: fn_spawnPointSelected.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sorts out the spawn point selected and does a map zoom.
*/
disableSerialization;
private["_control","_selection","_spCfg","_sp"];
_spawnimage = ((findDisplay 38500) displayCtrl 1201);
_spawnbutton = ((findDisplay 38500) displayCtrl 2405);
_sp = _this select 0;

ctrlShow [1201,true];
_spawnbutton ctrlEnable true;

[((findDisplay 38500) displayCtrl 38502),1,0.1,getMarkerPos _sp] call life_fnc_setMapPosition;

life_spawn_point = _sp;
