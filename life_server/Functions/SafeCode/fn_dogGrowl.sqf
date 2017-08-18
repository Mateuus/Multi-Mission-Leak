/*
	File: fn_dogGrowl.sqf
	Author: ishi
	Rewrite of |TG-355th| Yink's dog PoC
	
	Description:
	Growls at civilian players
*/
private ["_unit","_dog","_side","_objs"];
_unit 	= _this select 0;
_dog 	= _unit getvariable "dog";
_side 	= civilian;

while {alive _dog} do
{
	_timer 	= round(random 5);
	_timer	= _timer + 5;
	_objs 	= nearestobjects [_dog, ["Man"], 5];

	{
		if ((side (group _x)) != _side) then
		{
			_objs = _objs - [_x];
		};
	} foreach _objs;
	
	if ((count _objs) > 0) then
	{
		["dog_growl", _dog] spawn life_fnc_dogPlaySound;
	};
		
	sleep _timer;
	_dog = _unit getvariable "dog";
};