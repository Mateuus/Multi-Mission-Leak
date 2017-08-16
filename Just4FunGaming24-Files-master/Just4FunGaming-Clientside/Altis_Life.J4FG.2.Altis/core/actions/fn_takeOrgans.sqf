/*
file: fn_takeOrgans.sqf
author: [midgetgrimm] - A Grimm Life | Altis Life • Index page

taken from the same idea of robbing script by tonic
*/
private _unit = cursorTarget;

if( XY_actionInUse || XY_isTazed || player getVariable["restrained", false] || (animationState player) isEqualTo "incapacitated" || !(isPlayer _unit) || _unit getVariable ["missingOrgan", false] || animationState _unit != "incapacitated" || player == _unit ) exitWith {};

if(missionNamespace getVariable[ format["%1%2", XY_ssv_mniPrefix, "kidney"], 0] >= 2) exitWith {
    hint "Du kannst nicht mehr als 2 Nieren tragen"
};
if(missionNamespace getVariable[ format["%1%2", XY_ssv_mniPrefix, "scalpel"], 0] < 1) exitWith {
    hint "Wie willst du ohne Skalpell eine Niere entfernen?"
};
if( !([true, "kidney", 1] call XY_fnc_handleInv)) exitWith {
    hint "Dein Inventar ist voll!"
};
if( !([false, "scalpel", 1] call XY_fnc_handleInv)) exitWith {};

XY_actionInUse = true;
player playMove "AinvPknlMstpSnonWnonDnon_medic";
sleep 3;

_unit setVariable["missingOrgan", true, true];
XY_actionInUse = false;

if( !([_robber] call XY_fnc_playerMasked) ) then {
    [0, format["%1 hat eine Niere geklaut", profileName]] remoteExec ["XY_fnc_broadcast"];
    [getPlayerUID player, "135"] remoteExec ["XY_fnc_wantedAdd", 2];
};

[getPlayerUID player, 7, format ["Hat %1 (%2) eine Niere geklaut @ %3", name _unit, getPlayerUID _unit, mapGridPosition player ]] remoteExec ["XYDB_fnc_log", XYDB];
[getPlayerUID _unit, 7, format ["Wurde von %1 (%2) eine Niere geklaut @ %3", profileName, getPlayerUID player, mapGridPosition player ]] remoteExec ["XYDB_fnc_log", XYDB];