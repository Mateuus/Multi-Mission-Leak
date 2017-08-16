/*
	fn_moneytransfer.sqf
	Author: G00golplexian
	
	Description: Transfers selected money to one fraction
*/

private ["_geld","_von","_check","_adac"];
_geld = _this select 0;
_von = _this select 1;
_check = _this select 2;
_toAll = _this select 3;

if(_toAll) exitWith {
	life_beatbankgeld = life_beatbankgeld + _geld; hint format["%1€ wurden von %2 auf dein Bankkonto überwiesen.",[_geld] call life_fnc_numbertext, _von];
	if(playerside in [west,independent]) then {life_activity = life_activity + 3};
};

switch(_check) do {
	case 0: {life_beatgeld = life_beatgeld + _geld; hint format["%1€ wurden von %2 auf dein Bankkonto überwiesen.",[_geld] call life_fnc_numbertext, _von];};
	case 1: {life_beatgeld = life_beatgeld - _geld; hint format["%1€ wurden von %2 von deinem Bankkonto abgebucht.",[_geld] call life_fnc_numbertext, _von]; 
	if(life_beatgeld < 0) then {life_beatgeld = 0};};
	
	case 2: {life_beatbankgeld = life_beatbankgeld + _geld; hint format["%1€ wurden von %2 auf dein Bankkonto überwiesen.",[_geld] call life_fnc_numbertext, _von];};
	case 3: {life_beatbankgeld = life_beatbankgeld - _geld; hint format["%1€ wurden von %2 von deinem Bankkonto abgebucht.",[_geld] call life_fnc_numbertext, _von]; 
	if(life_beatbankgeld < 0) then {life_beatbankgeld = 0};};
};