/*
	File: fn_untie.sqf
*/
private["_unit"];
_unit = cursorTarget;
if((life_action_inUse) || (player getVariable ["tied", false]) || (player getVariable ["restrained", false])) exitWith { 
["Nie mozesz tego zrobic.", false] spawn domsg;
titleFadeOut 5;
}; 
if(isNull _unit || !(_unit getVariable ["tied", false])) exitWith {};

_unit setVariable["tied", nil, true];
//[0,format["%1 was released by %2.", name _unit, name player]] remoteExecCall ["life_fnc_broadcast", west];