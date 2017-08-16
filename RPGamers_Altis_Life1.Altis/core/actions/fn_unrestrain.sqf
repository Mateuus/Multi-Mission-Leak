#include "..\..\script_macros.hpp"
/*
    File: fn_unrestrain.sqf
    Author:

    Description:

*/
private ["_unit"];
_unit = param [0,objNull,[objNull]];
if (isNull _unit) exitWith {}; //Error check?

_unit setVariable ["restrained",false,true];
_unit setVariable ["restrainedz",false,true];
_unit setVariable ["Escorting",false,true];
_unit setVariable ["transporting",false,true];
detach _unit;

[_unit,"handcuffs"] spawn life_fnc_nearestSound;
[0,"STR_NOTF_Unrestrain",true,[_unit getVariable ["realname",name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",west];
["Unrestrained Player",5,"blue"] call RPG_Fnc_Msg;