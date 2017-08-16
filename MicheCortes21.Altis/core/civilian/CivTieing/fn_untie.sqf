/*
	File: fn_untie.sqf
*/
private["_unit"];
_unit = cursorTarget;
if((life_action_inUse) || (player getVariable ["tied", false]) || (player getVariable ["restrained", false])) exitWith {
	hintSilent "Du kannst das nicht."
};

if(isNull _unit || !(_unit getVariable ["tied", false])) exitWith {};

_unit setVariable["tied", nil, true];
_unit setVariable ["Escorting",false,true];
_unit setVariable ["transporting",false,true];
[_unit,"cuff"] remoteExec ["life_fnc_say3D",RANY];

//[0,format["%1 wurde freigelassen von %2.", name _unit, name player]] remoteExecCall ["life_fnc_broadcast", west];
