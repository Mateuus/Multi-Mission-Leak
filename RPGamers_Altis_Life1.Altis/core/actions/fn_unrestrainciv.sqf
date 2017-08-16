#include "..\..\script_macros.hpp"
/*
    File: fn_unrestrain.sqf
    Author:

    Description:

*/
private ["_unit"];
_unit = param [0,objNull,[objNull]];
if (isNull _unit || !(_unit getVariable ["restrainedz",false])) exitWith {}; //Error check?

_unit setVariable ["restrainedz",false,true];
_unit setVariable ["Escorting",false,true];
_unit setVariable ["transporting",false,true];
detach _unit;

[_unit,"handcuffs"] spawn life_fnc_nearestSound;
["You have unziptied him",5,"blue"] call RPG_Fnc_Msg;