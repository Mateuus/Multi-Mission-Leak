#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initiates the wire-transfer
*/
private "_log";
params [
	["_value",0,[0]],
	["_from","",[""]]
];

if(EQUAL(_value,0) || EQUAL(_from,"") || EQUAL(_from,profileName)) exitWith {}; //No
ADD(BANK,_value);
[1] call SOCK_fnc_updatePartial;