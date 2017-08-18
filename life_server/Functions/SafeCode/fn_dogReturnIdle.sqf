/*
	File: fn_dogReturnIdle.sqf
	Author: ishi
	Rewrite of |TG-355th| Yink's dog PoC
	
	Description:
	Go into idle state
*/
private ["_unit","_dog"];
_unit 	= _this select 0;
_dog	= _unit getvariable "dog";

while {alive _dog} do
{
	waituntil {(((_dog distance _unit)>30)&&((_unit getvariable "order")=="idle"))};
	_dog domove (getpos _unit);
	["dog_whine", _dog] spawn life_fnc_dogPlaySound;
	waituntil {unitReady _dog};
};