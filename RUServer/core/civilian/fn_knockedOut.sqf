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
    ["_who","",[""]],
    ["_wer", objNull,[objNull]]
];

if (isNull _target) exitWith {};
if (_target != player) exitWith {};
if (_who isEqualTo "") exitWith {};

titleText[format[localize "STR_Civ_KnockedOut",_who],"PLAIN"];
player setVariable ["knocked", true, true];
player playMoveNow "Incapacitated";

_obj = "Land_ClutterCutter_small_F" createVehicle ASLTOATL(visiblePositionASL player);
_obj setPosATL ASLTOATL(visiblePositionASL player);

life_isknocked = true;
player attachTo [_obj,[0,0,0]];
sleep 15;
player playMoveNow "AmovPpneMstpSrasWrflDnon";
detach player;
deleteVehicle _obj;
life_isknocked = false;
player setVariable ["knocked", false, true];
player setVariable ["robbed",FALSE,TRUE];

if (life_HC_isActive) then {
    [getPlayerUID _wer,_wer getVariable ["realname",name _wer],"28"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
} else {
    [getPlayerUID _wer,_wer getVariable ["realname",name _wer],"28"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
};

if (!local _wer) then {
    [4] remoteExecCall ["life_fnc_removeLicenses",_wer];
};



//#include "..\..\script_macros.hpp"
/*
    File: fn_knockedOut.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts and monitors the knocked out state.
*//*
private "_obj";
params [
    ["_target",objNull,[objNull]],
    ["_who","",[""]]
];

if (isNull _target) exitWith {};
if !(_target isEqualTo player) exitWith {};
if (_who isEqualTo "") exitWith {};

titleText[format [localize "STR_Civ_KnockedOut",_who],"PLAIN"];
player playMoveNow "Incapacitated";
disableUserInput true;

_obj = "Land_ClutterCutter_small_F" createVehicle ASLTOATL(visiblePositionASL player);
_obj setPosATL ASLTOATL(visiblePositionASL player);

life_isknocked = true;
player attachTo [_obj,[0,0,0]];
sleep 15;
player playMoveNow "AmovPpneMstpSrasWrflDnon";
disableUserInput false;
detach player;
deleteVehicle _obj;
life_isknocked = false;
player setVariable ["robbed",false,true];
*/
