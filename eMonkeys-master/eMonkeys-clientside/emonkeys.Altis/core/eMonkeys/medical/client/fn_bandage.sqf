/*
	File: fn_bandage.sqf
	
	Description:
	bandage the Injuries
*/
private ["_unit"];
_unit = cursorTarget;
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
uisleep 3;

[[player],"EMonkeys_fnc_healexmed",_unit,false] call EMonkeys_fnc_mp;