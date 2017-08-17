#include "..\..\..\script_macros.hpp"
/*
	File: fn_gangConvoyFill.sqf
	Author: !TS JORDAN
	
	Desc: Fills the gangs truck with the supplys to end the mission
*/
params [
    ["_vehicle",objNull,[objNull]]
];

_vehicle setVariable ["convoyFilled", true, true]; 
_vehicle setVariable ["notFilled", false, true];
 
hint "you have filled the truck with the supplies, now take it to the drop off point marked on the map";