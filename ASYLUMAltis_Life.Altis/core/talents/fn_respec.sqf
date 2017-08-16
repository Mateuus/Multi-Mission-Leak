/*
	File: fn_respec.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Clears all talent points, at a cost.
*/

private ["_display","_label"];

_cost = life_respec_fee * (count life_talents);

_handle = [format["<t align='center'>If you proceed you will unlearn %1 talent(s) for a total cost of $%2!</t>", count life_talents, [_cost] call life_fnc_numberText]] spawn life_fnc_confirmMenu;
waitUntil {scriptDone _handle};
if(!life_confirm_response) exitWith {};

if(!([_cost] call life_fnc_debitCard)) exitWith {};

life_talents = [];
hint "You have forgotten everything you knew.";