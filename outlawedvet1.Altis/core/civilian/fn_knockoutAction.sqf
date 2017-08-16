#include "..\..\script_macros.hpp"
/*
    File: fn_knockoutAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Knocks out the target.
*/
private "_target";
_target = param [0,objNull,[objNull]];

if(player distance (getMarkerPos "campnorth") < 175) exitWith {};
if(player distance (getMarkerPos "campsouth") < 175) exitWith {};
if(player distance (getMarkerPos "spawn_green_protection_zone") < 150) exitWith {};
if(player distance (getMarkerPos "Donator_Zone_1") < 150) exitWith {};
if(player distance (getMarkerPos "jail_marker") < 80) exitWith {};
if(player distance (getMarkerPos "police_hq_1") < 34) exitWith {};
if(player distance (getMarkerPos "swat_hq") < 30) exitWith {};
if(player distance (getMarkerPos "police_hq_2") < 25) exitWith {};
if(player distance (getMarkerPos "police_hq_5") < 35) exitWith {};
if(player distance (getMarkerPos "police_hq_4") < 20) exitWith {};
if(player distance (getMarkerPos "jail_combatlog") < 20) exitWith {};
if(player distance (getMarkerPos "police_hq_3") < 50) exitWith {};

//Error checks
if (isNull _target) exitWith {};
if (!isPlayer _target) exitWith {};
if (player distance _target > 4) exitWith {};
life_knockout = true;
[player,"AwopPercMstpSgthWrflDnon_End2"] remoteExecCall ["life_fnc_animSync",RCLIENT];
sleep 0.08;
[_target,profileName] remoteExec ["life_fnc_knockedOut",_target];

sleep 3;
life_knockout = false;
