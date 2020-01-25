/*
	File: fn_receiveMoney.sqf
	
	
	Description:
	Receives money
*/

params [["_unit", objNull, [objNull]], ["_val", 0, [0]], ["_from", objNull, [objNull]]];
_val = round(abs(_val));
if(isNull _unit OR isNull _from OR _val < 0) exitWith {["Cos poszlo nietak z otrzymawaniem pieniedzy", false] spawn domsg;};
if(player != _unit) exitWith {};

if(_unit isEqualTo _from) exitWith {}; //Bad boy, trying to exploit his way to riches.

[format[localize "STR_NOTF_GivenMoney",_from getVariable["realname",name _from],[_val] call life_fnc_numberText], false] spawn doquickmsg;
["cash","add",_val] call life_fnc_handleCash;