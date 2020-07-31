/*
	File: fn_spawnPointSelected.sqf
	
	
	Description:
	Sorts out the spawn point selected and does a map zoom.
*/
disableSerialization;
private["_control","_selection","_spCfg","_sp"];
_control = param [0,controlNull,[controlNull]];
_selection = param [1,0,[0]];

_spCfg = [playerSide] call life_fnc_spawnPointCfg;
_sp = _spCfg select _selection;
[((findDisplay 38500) displayCtrl 38502),1,0.1,getMarkerPos (_sp select 0)] call life_fnc_setMapPosition;
life_spawn_point = _sp;

ctrlSetText[38501,format["%2: %1",_sp select 1,localize "STR_Spawn_CSP"]];