/*
	File: fn_gangBank.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Update gang ATM UI with received value
*/
private ["_value"];

_value = [_this,0,0,[0]] call BIS_fnc_param;

disableSerialization;

_display = findDisplay 2700;
_text = _display displayCtrl 2701;

_text ctrlSetStructuredText parseText format["<img size='1.7' image='icons\bank.paa'/> $%1<br/><img size='1.6' image='icons\money.paa'/> $%2",[_value] call life_fnc_numberText,[life_money] call life_fnc_numberText];

life_gang_atm_val = _value;