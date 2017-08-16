/*
	File: fn_untie.sqf
*/
private["_unit"];
_unit = cursorTarget;
if((life_action_inUse) || (player getVariable ["tied", false]) || (player getVariable ["restrained", false])) exitWith { 
hint "You can not do that.";
titleFadeOut 5;
}; 
if(isNull _unit || !(_unit getVariable ["tied", false])) exitWith {};

_unit setVariable["tied", nil, true];
[true,"ziptie",1] call life_fnc_handleInv;
//[[0,format["%1 was released by %2.", name _unit, name player]],"life_fnc_broadcast",west,false] call BIS_fnc_MP;