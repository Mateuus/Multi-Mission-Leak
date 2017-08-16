#include "..\..\script_macros.hpp"
/*
    File: fn_removeItem.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Removes the selected item & amount to remove from the players
    virtual inventory.
*/
private ["_data","_value","_obj"];
disableSerialization;
_data = lbData[2005,(lbCurSel 2005)];
_value = ctrlText 2010;

if (_data isEqualTo "") exitWith {[localize "STR_NOTF_didNotSelectToRemove",5,"gray"] call RPG_Fnc_Msg;};
if (!([_value] call TON_fnc_isnumber)) exitWith {[localize "STR_NOTF_notNumberFormat",5,"gray"] call RPG_Fnc_Msg;};
if (parseNumber(_value) <= 0) exitWith {[localize "STR_NOTF_enterAmountRemove",5,"gray"] call RPG_Fnc_Msg;hint localize "";};
if (ITEM_ILLEGAL(_data) isEqualTo 1 && ([west,visiblePosition player,100] call life_fnc_nearUnits)) exitWith {titleText[localize "STR_NOTF_illegalItemCannotDispose","PLAIN"]};
if !(isNull objectParent player) exitWith {titleText[localize "STR_NOTF_cannotRemoveInVeh","PLAIN"]};
if (!([false,_data,(parseNumber _value)] call life_fnc_handleInv)) exitWith {[localize "STR_NOTF_couldNotRemoveThatMuch",5,"gray"] call RPG_Fnc_Msg;};

[format [localize "STR_NOTF_removedFromInventory",(parseNumber _value),(localize ITEM_NAME(_data))],5,"blue"] call RPG_Fnc_Msg;

[] call life_fnc_inv;
