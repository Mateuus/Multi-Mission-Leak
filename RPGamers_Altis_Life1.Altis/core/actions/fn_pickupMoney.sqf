#include "..\..\script_macros.hpp"
/*
    File: fn_pickupMoney.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Picks up money
*/
private "_value";
if ((time - life_action_delay) < 1.5) exitWith {[localize "STR_NOTF_ActionDelay",5,"gray"] call RPG_Fnc_Msg; _this setVariable ["inUse",false,true];};
if (isNull _this || {player distance _this > 3}) exitWith {_this setVariable ["inUse",false,true];};

_value = ((_this getVariable "item") select 1);
if (!isNil "_value") exitWith {
    deleteVehicle _this;

    switch (true) do {
        case (_value > 5000000) : {_value = 250000;}; //VAL>5mil->250k
        default {};
    };

    player playMove "AinvPknlMstpSlayWrflDnon";
    [format [localize "STR_NOTF_PickedMoney",[_value] call life_fnc_numberText],5,"blue"] call RPG_Fnc_Msg;
    CASH = CASH + _value;
    [0] call SOCK_fnc_updatePartial;
    life_action_delay = time;

    if (LIFE_SETTINGS(getNumber,"player_moneyLog") isEqualTo 1) then {
        if (LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
            money_log = format [localize "STR_DL_ML_pickedUpMoney_BEF",[_value] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
        } else {
            money_log = format [localize "STR_DL_ML_pickedUpMoney",profileName,(getPlayerUID player),[_value] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
        };
    publicVariableServer "money_log";
    };
};