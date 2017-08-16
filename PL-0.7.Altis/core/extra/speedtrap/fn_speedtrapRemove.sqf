/*
	File: fn_speedtrapRemove.sqf
	Author: Skrow & Skyfezzer
	
	Description:
	speedtrap is a speedtrap ans sometimes a speedtrap
   
*/
private["_speedtrap"];
if(playerSide != west) exitWith {};
_speedtrap = cursorTarget;
if(isNull _speedtrap) exitwith {};

deleteVehicle _speedtrap;

[true,"radarfalle",1] call life_fnc_handleInv;