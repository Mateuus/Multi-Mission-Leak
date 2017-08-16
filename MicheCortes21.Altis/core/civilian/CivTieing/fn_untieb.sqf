/*
	File: fn_untie.sqf
*/
private["_unit"];
_unit = cursorTarget;

if((life_action_inUse) || (player getVariable ["tied", false]) || (player getVariable ["restrained", false])) exitWith { 
	hint "Du kannst das nicht!";
}; 

if(isNull _unit || !(_unit getVariable ["blindfolded", false])) exitWith {};

_unit setVariable["blindfolded", nil, true];
