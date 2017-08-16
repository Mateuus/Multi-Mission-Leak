/*
	File: fn_wantedRemove.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Removes a person from the wanted list.
*/
private["_uid","_index"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
if(_uid == "") exitWith {}; //Bad data

_index = [_uid,ES_wanted_list] call ES_fnc_index;
if(_index == -1) exitWith {};
ES_wanted_list set[_index,-1];
ES_wanted_list = ES_wanted_list - [-1];