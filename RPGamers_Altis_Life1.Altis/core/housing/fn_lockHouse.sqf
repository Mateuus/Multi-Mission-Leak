#include "..\..\script_macros.hpp"
/*
    File: fn_lockHouse.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Unlocks / locks the house.
*/
private ["_house"];
_house = param [0,objNull,[objNull]];
if (isNull _house || !(_house isKindOf "House_F")) exitWith {};

_state = _house getVariable ["locked",true];
if (_state) then {
    _house setVariable ["locked",false,true];
    [localize "STR_House_StorageUnlock",5,"blue"] call RPG_Fnc_Msg;
} else {
    _house setVariable ["locked",true,true];
    [localize "STR_House_StorageLock",5,"blue"] call RPG_Fnc_Msg;
};