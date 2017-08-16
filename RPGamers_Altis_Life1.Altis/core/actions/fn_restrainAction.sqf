#include "..\..\script_macros.hpp"
/*
    File: fn_restrainAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Restrains the target.
*/
private ["_unit"];
_unit = cursorObject;
if (isNull _unit) exitWith {}; //Not valid
if (player distance _unit > 3) exitWith {};
if (_unit getVariable "restrained") exitWith {};
if (_unit getVariable "restrainedz") exitWith {};
if (side _unit isEqualTo west) exitWith {};
if (player isEqualTo _unit) exitWith {};
if (!isPlayer _unit) exitWith {};
//Broadcast!

[_unit,"cuffs"] spawn life_fnc_nearestSound;
_unit setVariable ["playerSurrender",false,true];
_unit setVariable ["restrained",true,true];
[player] remoteExec ["life_fnc_restrain",_unit];
[0,"STR_NOTF_Restrained",true,[_unit getVariable ["realname", name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",west];
["Restrained Player",5,"blue"] call RPG_Fnc_Msg;