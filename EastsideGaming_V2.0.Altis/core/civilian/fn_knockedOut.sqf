#include "..\..\script_macros.hpp"
/*
    File: fn_knockedOut.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts and monitors the knocked out state.
*/
private "_obj";
params [
    ["_target",objNull,[objNull]],
    ["_who","",[""]]
];

if (isNull _target) exitWith {};
if (_target != player) exitWith {};
if (_who isEqualTo "") exitWith {};

titleText["Du wurdest niedergeschlagen","BLACK OUT",1];
player playMoveNow "Incapacitated";
player say3d "knockout";
[player,"knockout"]remoteExec["life_fnc_say3D"];
disableUserInput true;

_obj = "Land_ClutterCutter_small_F" createVehicle ASLTOATL(visiblePositionASL player);
_obj setPosATL ASLTOATL(visiblePositionASL player);

life_isknocked = true;
player attachTo [_obj,[0,0,0]];
sleep 13;
titleText ["","BLACK IN",3];
sleep 2;
player playMoveNow "AmovPpneMstpSrasWrflDnon";

disableUserInput false;
detach player;
deleteVehicle _obj;
life_isknocked = false;
player setVariable ["robbed",false,true];
