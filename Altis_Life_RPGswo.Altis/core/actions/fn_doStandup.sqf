/*
	File: fn_doStandup.sqf
	Author: BreedXLP
	
	Description:
	Stand up from Chair
*/
private["_unit"];
_unit = _this select 0; 
if !(DWEV_doSit) exitWith {};
[_unit,""] remoteExec ["DWEV_fnc_animSync",-2]; 

detach player;
DWEV_doSit = false;