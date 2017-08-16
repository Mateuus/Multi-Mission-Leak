#include "..\..\script_macros.hpp"
/*
    File: fn_healHospital.sqf
    Author: Bryan "Tonic" Boardwine
    Reworked: Jesse "TKCJesse" Schultz

    Description:
    Prompts user with a confirmation dialog to heal themselves.
    Used at the hospitals to restore health to full.
    Note: Dialog helps stop a few issues regarding money loss.
*/
private ["_healCost","_action"];
if (life_action_inUse) exitWith {};
if ((damage player) < 0.01) exitWith {hint localize "STR_NOTF_HS_FullHealth"};
_healCost = LIFE_SETTINGS(getNumber,"hospital_heal_fee");
if (CASH < _healCost) exitWith {
    [format[localize "STR_NOTF_HS_NoCash",1000],true,"fast"] call life_fnc_notification_system;
    };

life_action_inUse = true;
_action = [
    format [localize "STR_NOTF_HS_PopUp",[_healCost] call life_fnc_numberText],
    localize "STR_NOTF_HS_TITLE",
    localize "STR_Global_Yes",
    localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
    [localize "STR_NOTF_HS_Healing",true,"fast"] call life_fnc_notification_system;
    closeDialog 0;
    uiSleep 8;
    if (player distance (_this select 0) > 5) exitWith {
        life_action_inUse = false; 
        [localize "STR_NOTF_HS_ToFar",true,"fast"] call life_fnc_notification_system;
    };
    [localize "STR_NOTF_HS_Healed",true,"fast"] call life_fnc_notification_system;
    player setDamage 0;
    CASH = CASH - _healCost;
    life_action_inUse = false;
} else {
    [localize "STR_NOTF_ActionCancel",true,"fast"] call life_fnc_notification_system;
    closeDialog 0;
    life_action_inUse = false;
};
