/*
	File: fn_speedtrapActivate.sqf
	Author: Skrow & Skyfezzer
	
	Description:
	speedtrap is a speedtrap ans sometimes a speedtrap
   
*/

private["_speedtrap", "_status"];

_speedtrap = cursorTarget;
if(isNull _speedtrap) exitwith {};

_status = _speedtrap getVariable ["speedtrap_active", false];

if(_status) then
{
    _status = false;
}
else
{
    _status = true;
};

_speedtrap setVariable ["speedtrap_active", _status, true];


