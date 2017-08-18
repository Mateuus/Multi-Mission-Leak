/*
	File: fn_dogKilled.sqf
	Author: ishi
	Rewrite of |TG-355th| Yink's dog PoC
	
	Description:
	Called when the dog dies
*/
private ["_unit"];
_unit = _this select 0;
_unit setvariable ["order","dead"];
_unit setvariable ["action","false"];
_unit setvariable ["step","go"];
