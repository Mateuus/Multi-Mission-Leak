/*
	File: fn_dogSeek.sqf
	Author: ishi
	Rewrite of |TG-355th| Yink's dog PoC
	
	Description:
	Let the dog seek
*/
private ["_unit","_dog","_nearestunits","_radius","_nearestunitsofside"];
_unit = _this select 0;

hint "Rex, search!";

_unit setvariable ["follow",'false'];
_unit setvariable ["seek","true"];
_unit setvariable ["order","active"];
_unit setvariable ["step","go"];

_dog = _unit getvariable "dog";
_radius = 300;

_nearestunits = nearestObjects [_dog, ["Man"], _radius];
_nearestunitofside = [];

if (civilian countSide _nearestunits > 0 || east countSide _nearestunits > 0) then
{
	["dog_one", _dog] spawn life_fnc_dogPlaySound;
	{
		_unit = _x;
		if (side (group _unit) in [civilian,east] && isPlayer _unit) then 
		{
			_nearestunitofside = _nearestunitofside + [_unit]
		};
	} foreach _nearestunits;
} else {
	["dog_ruff", _dog] spawn life_fnc_dogPlaySound;
	_unit setvariable ["order","idle"];
};

_dog domove getpos (_nearestunitofside select 0);

waituntil {(_dog distance (_nearestunitofside select 0))<10};
["dog_ruff", _dog] spawn life_fnc_dogPlaySound;