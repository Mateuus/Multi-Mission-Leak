#include "..\..\script_macros.hpp"
/*
    File: fn_safeOpen.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens the safe inventory menu.
*/
if (dialog) exitWith {}; //A dialog is already open.
life_safeObj = param [0,objNull,[objNull]];
if (isNull life_safeObj) exitWith {};
if !(playerSide isEqualTo civilian) exitWith {};
if ((life_safeObj getVariable ["safe",-1]) < 1) exitWith {[localize "STR_Civ_VaultEmpty",5,"gray"] call RPG_Fnc_Msg;};
if (life_safeObj getVariable ["inUse",false]) exitWith {[localize "STR_Civ_VaultInUse",5,"gray"] call RPG_Fnc_Msg;};
if (west countSide playableUnits < (LIFE_SETTINGS(getNumber,"minimum_cops"))) exitWith {
    [format [localize "STR_Civ_NotEnoughCops",(LIFE_SETTINGS(getNumber,"minimum_cops"))],5,"gray"] call RPG_Fnc_Msg;
};
if (!createDialog "Federal_Safe") exitWith {localize "STR_MISC_DialogError"};

disableSerialization;
ctrlSetText[3501,(localize "STR_Civ_SafeInv")];
[life_safeObj] call life_fnc_safeInventory;
life_safeObj setVariable ["inUse",true,true];

[life_safeObj] spawn {
    waitUntil {isNull (findDisplay 3500)};
    (_this select 0) setVariable ["inUse",false,true];
};
