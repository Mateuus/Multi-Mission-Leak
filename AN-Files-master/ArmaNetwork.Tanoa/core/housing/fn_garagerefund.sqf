/*
	Author: Bryan "Tonic" Boardwine

	Description:
	I don't know?
*/
_price = _this select 0;
_unit = _this select 1;
if(_unit != player) exitWith {};
[_price,0,0] call life_fnc_sewawruk;
