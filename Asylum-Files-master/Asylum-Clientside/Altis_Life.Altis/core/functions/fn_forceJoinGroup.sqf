/*
	File: fn_forceJoinGroup.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Add player to given group object
*/

private ["_group"];
waitUntil{life_session_completed}; //Unsure of the timing of when this file gets called, put this here to be safe
_group = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if (count (units _group) > 9) exitWith { [[0,2], "The gang group is full and you were unable to join!"] call life_fnc_broadcast; };

[player] joinSilent _group;