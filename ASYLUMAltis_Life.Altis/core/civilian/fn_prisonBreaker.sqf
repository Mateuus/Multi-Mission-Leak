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

player setVariable ["copLevel", 2];
[[0,2], "You now have access to all prison gates and doors for the next 10 minutes."] call life_fnc_broadcast;
_started = time;
_lockPenaltyApplied = false;

while {true} do
{
	sleep 4;
	if (time - _started > 600) exitWith {};
	if (player distance (getMarkerPos "corrections") > 100) exitWith {};
	if (life_is_arrested) exitWith {};
	if (!_lockPenaltyApplied && (life_prison_building animationPhase "LockdownA" < 0 || life_prison_building animationPhase "LockdownB" < 0)) then { _lockPenaltyApplied = true; _started = _started - 300; };
};

player setVariable ["copLevel", 0];
