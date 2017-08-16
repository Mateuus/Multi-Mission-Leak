#include "..\..\script_macros.hpp"
/*
    File: fn_safeStore.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Gateway copy of fn_vehStoreItem but designed for the safe.
*/
private ["_ctrl","_num"];
disableSerialization;
_ctrl = CONTROL_DATA(3503);
_num = ctrlText 3506;

//Error checks
if (!([_num] call TON_fnc_isnumber)) exitWith {[localize "STR_MISC_WrongNumFormat",5,"gray"] call RPG_Fnc_Msg;};
_num = parseNumber(_num);
if (_num < 1) exitWith {[localize "STR_Cop_VaultUnder1",5,"gray"] call RPG_Fnc_Msg;};
if (!(_ctrl isEqualTo "goldBar")) exitWith {[localize "STR_Cop_OnlyGold",5,"gray"] call RPG_Fnc_Msg;};
if (_num > life_inv_goldbar) exitWith {[format [localize "STR_Cop_NotEnoughGold",_num],5,"gray"] call RPG_Fnc_Msg;};

//Store it.
if (!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {[localize "STR_Cop_CantRemove",5,"gray"] call RPG_Fnc_Msg;};
_safeInfo = life_safeObj getVariable ["safe",0];
life_safeObj getVariable ["safe",_safeInfo + _num,true];

[life_safeObj] call life_fnc_safeInventory;
