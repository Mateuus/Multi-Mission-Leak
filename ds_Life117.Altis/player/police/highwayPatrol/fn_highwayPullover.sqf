/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Messages the driver of a vehicle you are targeted on
	*/
private["_target"];

_target = cursorTarget;
if(isNull _target) exitWith {};
if(player distance _target > 1000)exitwith {};
if((_target isKindOf "Air")||(_target isKindOf "Car")||(_target isKindOf "Ship")) then 
	{
	_target = (driver _target);
	if(isNil {_target})exitwith {};
	hint "Message sent to driver!";
	[[],"DS_fnc_policePullover",_target,false] spawn BIS_fnc_MP;
	}
	else
	{
	hint "No valid target found";
	};
	
if(isNil {_target})exitwith {};