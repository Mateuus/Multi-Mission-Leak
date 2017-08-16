#include "..\..\script_macros.hpp"
/*
    File: fn_adminCompensate.sqf
    Author: ColinM9991

    Description:
    Figure it out.
*/
private ["_value","_action"];
if (FETCH_CONST(life_adminlevel) < 2) exitWith {closeDialog 0; [localize "STR_ANOTF_ErrorLevel",5,"gray"] call RPG_Fnc_Msg;};
_value = parseNumber(ctrlText 9922);
if (_value < 0) exitWith {};
if (_value > 999999) exitWith {[localize "STR_ANOTF_Fail",5,"gray"] call RPG_Fnc_Msg;};

_action = [
    format [localize "STR_ANOTF_CompWarn",[_value] call life_fnc_numberText],
    localize "STR_Admin_Compensate",
    localize "STR_Global_Yes",
    localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
    CASH = CASH + _value;
    [format [localize "STR_ANOTF_Success",[_value] call life_fnc_numberText],5,"blue"] call RPG_Fnc_Msg;
    closeDialog 0;
} else {
    [localize "STR_NOTF_ActionCancel",5,"gray"] call RPG_Fnc_Msg;
    closeDialog 0;
};