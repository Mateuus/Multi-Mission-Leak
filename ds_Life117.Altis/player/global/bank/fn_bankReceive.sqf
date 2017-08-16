/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Receives transferred money
*/

private ["_value","_sender"];

_value = _this select 0;
_sender = _this select 1;

if(_value < 1)exitwith{};//Shouldn't be able to happen but meh
[_value,true,true] call DS_fnc_handleMoney;
hint format ["%1 has deposited $%2 into your bank account",_sender,[_value] call DS_fnc_numberText];
[] call DS_fnc_compileData;