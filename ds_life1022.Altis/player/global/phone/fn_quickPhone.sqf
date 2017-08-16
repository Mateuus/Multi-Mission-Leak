/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up quick phone options
*/

private ["_target"];

_target = cursorTarget;
if(isNull _target)exitWith{};
if(player distance _target > 1000)exitWith{};

if((_target isKindOf "Man")||(_target isKindOf "Air")||(_target isKindOf "Car")||(_target isKindOf "Ship"))then {
	if ((_target isKindOf "Air")||(_target isKindOf "Car")||(_target isKindOf "Ship"))then{
		if(!isNull (driver _target))then {
			_target = (driver _target);
		} else {
			if(!isNull (_target turretUnit [0]))then {
				_target = (_target turretUnit [0]);
			};
		};
	};

	if(isNil "_target")exitWith{};

	DS_cursorTarget = _target;
	[true] spawn DS_fnc_menuPhone;
} else {
	hint "No valid target found";
};