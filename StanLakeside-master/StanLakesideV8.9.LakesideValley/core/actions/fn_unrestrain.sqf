/*
	File: fn_unrestrain.sqf
*/
private["_unit"];
_unit = param [0,ObjNull,[ObjNull]];
if(isNull _unit OR !(_unit getVariable["restrained", false])) exitWith {}; //Error check?
_unit setVariable["restrained2", nil, true];
_unit setVariable["restrained", nil, true];
_unit setVariable["Escorting", nil, true];
_unit setVariable["transporting", nil, true];

[player,"handcuff"] spawn life_fnc_nearestSound;
detach _unit;
player switchmove "";

//[0,format[localize "STR_NOTF_Unrestrain",_unit getVariable["realname",name _unit], profileName]] remoteExecCall ["life_fnc_broadcast", west];