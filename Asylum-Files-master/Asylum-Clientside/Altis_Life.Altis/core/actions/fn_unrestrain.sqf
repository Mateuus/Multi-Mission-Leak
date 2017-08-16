/*
	File: fn_unrestrain.sqf
*/
private["_unit"];
_unit = [_this,3,player,[player]] call BIS_fnc_param;
if (_unit != player) then { _unit = cursorTarget; };
if(isNull _unit || !(_unit getVariable ["restrained",false])) exitWith {};
_unit setVariable ["restrained", nil, true];
[[_unit,false],"life_fnc_setRestrained",false,false] spawn life_fnc_MP;