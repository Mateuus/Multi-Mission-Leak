/*
	File: fn_dogShotAt.sqf
	Author: ishi
	Rewrite of |TG-355th| Yink's dog PoC
	
	Description:
	Someone is firing at our dog..
*/
private ["_dog","_firer","_unit"];
_dog = _this select 0;
_firer = _this select 1;
_unit = _dog getvariable "player";


if ((_unit getvariable "seek") == "true") then
{
	_unit setVariable ["order","idle"];
	_unit setVariable ["step","go"];
	_unit setVariable ["seek","false"];
	_dog doMove (getpos _unit);
	["dog_whine", _dog] spawn life_fnc_dogPlaySound;
};