#include "..\..\..\script_macros.hpp"
/*
	File: fn_gangConvoyCheck.sqf
	Author: !TS JORDAN

	Desc: Allows police to search the gangs convoy
*/
private ["_bonus"];
params [
    ["_vehicle",objNull,[objNull]]
];
_bonus = selectRandom [85000,70000,55000,40000,75000];

if(playerSide != west) exitWith {hint "Only police can search vehicles!"};
if (_vehicle getVariable ["notFilled"]) exitWith {hint "The truck is empty! Looks like your not getting that bonus, get back to normal duty!"};
_vehicle setVariable ["policeSearched", true, false];

hint "Well done! The civilians convoy has been brought to a hault. You have done the police proud, impound the truck and recive that bonus early!";
waitUntil([_vehicle] spawn life_fnc_impoundAction);

{
	if(playerSide isEqualTo west) then {
		hint format ["Your fellow police officers have stopped a civilian convoy, as your reward the APF will recive their christmass bonus of $%1 early, enjoy!", [_bonus] call life_fnc_numberText];
		life_bank = life_bank + _bonus;
	};
}forEach playableUnits
