/*
	File: fn_dogStop.sqf
	Author: ishi
	Rewrite of |TG-355th| Yink's dog PoC
	
	Description:
	Stop seeking/following, go to idle state
*/
private ["_unit","_dog"];
_unit 	= _this select 0;
_dog 	= _unit getVariable "dog";

//["dog_one",_dog] spawn life_fnc_dogPlaySound;
_unit setvariable ["seek","false"];
_unit setvariable ["searchDrugs","false"];
hint "Rex, stop!";
_unit setvariable ["follow",'false'];
_dog domove getpos _dog;
_unit setvariable ["order","idle"];
_unit setvariable ["step","go"];