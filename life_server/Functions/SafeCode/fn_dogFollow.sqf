/*
	File: fn_dogFollow.sqf
	Author: ishi
	Rewrite of |TG-355th| Yink's dog PoC
	
	Description:
	Tell the dog to follow its owner
*/
private ["_unit","_dog"];
_unit 	= _this select 0;
_dog	= _unit getvariable "dog";

["dog_one", _dog] spawn life_fnc_dogPlaySound;
hint "Rex, follow me!";

_unit setvariable ["order","active"];
_unit setvariable ["step","go"];
_unit setvariable ["follow",'true'];

while {(_unit getvariable "follow") == 'true'} do 
{
	sleep 0.5;
	if ((_dog distance _unit) < 2) then 
	{
		_dog domove getpos _dog;
	} 
	else 
	{
		_dog domove getpos _unit;	
	};
	sleep 1;
};