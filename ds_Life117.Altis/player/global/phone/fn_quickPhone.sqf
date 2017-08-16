/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Sets up quick phone options
*/

private["_target"];

_target = cursorTarget;
if(isNull _target) exitWith {};
if(player distance _target > 1000)exitwith {};
if((_target isKindOf "Man")||(_target isKindOf "Air")||(_target isKindOf "Car")||(_target isKindOf "Ship")) then 
	{
	if ((_target isKindOf "Air")||(_target isKindOf "Car")||(_target isKindOf "Ship"))then
		{
		_target = (driver _target);
		};

	if(isNil {_target})exitwith {};
		
	DS_cursorTarget = _target;
	[true] spawn DS_fnc_menuPhone;
	}
	else
	{
	hint "No valid target found";
	};
	
if(isNil {_target})exitwith {};