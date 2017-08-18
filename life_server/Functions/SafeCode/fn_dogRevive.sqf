/*
	File: fn_dogRevive.sqf
	Author: ishi
	Rewrite of |TG-355th| Yink's dog PoC
	
	Description:
	Revives the dog
*/
private ["_unit","_dog","_side","_tempPos","_group1"];
_unit = _this select 0;
_dog = _unit getvariable "dog";

sleep 5;

_side = side (group _unit);
_unit setvariable ["follow",'false'];
_tempPos = getpos _unit;

_group1 = createGroup _side;

"Alsatian_Sandblack_F" createUnit [_tempPos,_group1,"_unit setvariable ['dog',format['%1',this]]", 1.0, "private"];

sleep 0.5;

_dog = _unit getvariable "dog";
_unit setvariable ["step","go"];