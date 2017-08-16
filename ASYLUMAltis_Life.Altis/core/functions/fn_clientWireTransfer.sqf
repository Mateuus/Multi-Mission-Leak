/*
	File: fn_clientWireTransfer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	
*/

private["_unit","_val","_from"];
_val = _this select 0;
_from = _this select 1;
if(!([str(_val)] call life_fnc_isnumber)) exitWith {};
if(_from == "") exitWith {};
["atm","add",_val] call life_fnc_uC;
hint format["%1 has wire transferred $%2 to you.",_from,[_val] call life_fnc_numberText];