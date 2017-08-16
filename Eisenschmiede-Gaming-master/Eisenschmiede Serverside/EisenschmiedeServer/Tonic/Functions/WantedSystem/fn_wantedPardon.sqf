/*
	File: fn_wantedPardon.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Unwants / pardons a person from the wanted list.
*/
private["_uid"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
if(_uid == "") exitWith {};

_index = [_uid,ES_wanted_list] call ES_fnc_index;

if(_index != -1) then {
	ES_wanted_list set[_index,-1];
	ES_wanted_list = ES_wanted_list - [-1];
	//publicVariable "ES_wanted_list";
};