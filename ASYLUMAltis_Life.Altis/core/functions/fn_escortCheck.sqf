/*
	File: fn_escortCheck.sqf
	Author: Alan
	
	Description:
	Runs to check if player will die while escorted.
*/
_escorter = player getVariable ["escorted_by",[objNull, false]];
_escorter = _escorter select 0;
_checkTime = 15; 
_exit = false;

for "_i" from 0 to _checkTime do {
	sleep 1;
	if((player getVariable["escorted_by",[objNull,false]]) select 0 != _escorter) exitWith {_exit = true;}; //New Escorter, new timer.
};
if(_exit) exitWith {};
if((surfaceIsWater (position player)) && player getVariable ["restrained",false]) then {player setVariable ["restrained",nil, true];hint "Someone left you near the water, you broke these cuffs!"}; //Should not leave restrained people underwater!

player setVariable["escorted_by",[objNull,false],true];
