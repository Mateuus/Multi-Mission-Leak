/*
	File: fn_prisonBreaker.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Involved in a successful prison break on Australia.
*/

private ["_started"];

_initiator = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if (player != _initiator) then 
{
	serv_killed = [player,"901B"];
	publicVariableServer "serv_killed";
};