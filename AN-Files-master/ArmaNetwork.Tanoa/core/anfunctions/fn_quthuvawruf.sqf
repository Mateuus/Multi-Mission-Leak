/*
	File: fn_quthuvawruf.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Receives money
*/
params [
	["_unit",objNull,[objNull]],
	["_val",0,[0]],
	["_from",objNull,[objNull]]
];
if(isNull _unit OR {isNull _from} OR {_val isEqualTo 0}) exitWith {};
if(player != _unit) exitWith {};
if(!([str(_val)] call life_fnc_spunetuwada)) exitWith {};
if(_unit isEqualTo _from) exitWith {};
["CashGiven"] call life_fnc_notificationHandler;
[_val,0,0] call life_fnc_sewawruk;
