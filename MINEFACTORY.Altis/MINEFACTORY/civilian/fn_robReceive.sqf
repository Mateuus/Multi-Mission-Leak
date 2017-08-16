#include "..\..\script_macros.hpp"
/*
	File: fn_robReceive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	
*/
params [
	["_cash",0,[0]],
	["_victim",objNull,[objNull]],
	["_robber",objNull,[objNull]]
];

if(_robber == _victim) exitWith {};
if(EQUAL(_cash,0)) exitWith {titleText[ "Er hatte kein Geld...","PLAIN"]};

ADD(CASH,_cash);
titleText[format[ "Du hast $%1 geraubt.",[_cash] call life_fnc_numberText],"PLAIN"];