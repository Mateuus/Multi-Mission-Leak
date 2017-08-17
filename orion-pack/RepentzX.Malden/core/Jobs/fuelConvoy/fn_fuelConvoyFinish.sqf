#include "..\..\..\script_macros.hpp"
/*
	File: fn_gangConvoyFinish.sqf
	Author: !TS JORDAN

	Desc: Finishes the gangs convoy and gives them the reward
*/

params [
    ["_vehicle",objNull,[objNull]]
];

private ["_payCheck"];

_payCheck = selectRandom [200000,215000,225000,235000,245000,255000,260000,270000,280000,295000,307500,315000,350000];

if !(_vehicle getVariable ["convoyFilled", false]) exitWith {hint "You didn't fill the convoy! You want money for half a job?!"};
if !(_vehicle getVariable ["convoyFinished", false]) exitWith {hint "You didn't even deliver the convoy to the point! You want money for half a job?!"};
if(_vehicle getVariable "policeSearched") exitWith {hint "The police have already searched the vehicle, your convoy is over!"};

civRDM = civRDM + _payCheck;
hint format ["Congratulations you have finished the convoy and recived the reward of $%1. Enjoy!", [_payCheck] call life_fnc_numberText];

_vehicle setVariable ["convoyEnd", true, true];
