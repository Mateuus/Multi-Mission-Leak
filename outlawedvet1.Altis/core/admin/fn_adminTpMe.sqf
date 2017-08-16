#include "..\..\script_macros.hpp"
/*
    File: fn_adminTpHere.sqf
    Author: ColinM9991

    Description:
    Teleport selected player to you.
*/
if (FETCH_CONST(life_adminlevel) < 4) exitWith {closeDialog 0;};

private["_target","_spawnisland","_dis","_position"];
_dis = 170;  // distance    
_spawnisland = getMarkerPos "spawn_island";

_target = lbData[2902,lbCurSel (2902)];
_target = call compile format["%1", _target];
if(isNil "_target") exitwith {};
if(isNull _target) exitWith {};
if(_unit == player) exitWith {hint localize "STR_ANOTF_Error";};

_position = (getPos _target);

if (vehicle _target != _target) exitWith {hint "Targeted player is in a vehicle, it is not wise to teleport to him!";};
if (_spawnisland distance _position < _dis) exitWith {hint "Targeted player is dead!";};

player setPos (getPos _target);
hint format["You have teleported to %1",_target getVariable["realname",name _target]];

[0,"STR_RPG4YOU_Admin_TP_ME_TO_X",true,[_target getVariable ["realname",name _target], profileName]] remoteExecCall ["life_fnc_broadcast"];
