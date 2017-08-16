/*
	File: fn_requestMedic.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	N/A
*/
private["_medicsOnline"];
_medicsOnline = {_x != player && {side _x isEqualTo independent} && {alive _x}} count allPlayers > 0;
if(_medicsOnline) then {
	[life_corpse] remoteExecCall ["life_fnc_foadroejlestoev",independent];
	life_corpse setVariable["medicRequested",true,true];
};
((findDisplay 7300) displayCtrl 2400) ctrlEnable false;
