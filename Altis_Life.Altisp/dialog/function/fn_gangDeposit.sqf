#include "..\..\script_macros.hpp"
/*
    File: fn_gangDeposit.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Deposits money into the players gang bank.
*/
private ["_value"];
_value = parseNumber(ctrlText 2702);
_gFund = GANG_FUNDS;

//Series of stupid checks
if (_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if (_value < 0) exitWith {};
if (!([str(_value)] call TON_fnc_isnumber)) exitWith {hint localize "STR_ATM_notnumeric"};
if (_value > CASH) exitWith {hint localize "STR_ATM_NotEnoughCash"};
if ((time - life_gang_bank_time) < (6 + (round random 5))) exitWith {hint localize "STR_NOTF_ActionDelay"};

if((EAL_slowDownSon != 0) && ((time - EAL_slowDownSon) < 0.3)) exitWith {EAL_autoClickAmount = EAL_autoClickAmount +1;};
EAL_slowDownSon = time;
if(EAL_autoClickAmount >= 5) then { diag_log format["EAL AUTO CLICK DETECTION LOG ***CLICK BURSTS***:%1:      ***HACKER*** ",EAL_autoClickAmount]; };

CASH = CASH - _value;
_gFund = _gFund + _value;
group player setVariable ["gang_bank",_gFund,true];

if (life_HC_isActive) then {
    [1,group player] remoteExecCall ["HC_fnc_updateGang",HC_Life];
} else {
    [1,group player] remoteExecCall ["TON_fnc_updateGang",RSERV];
};

hint format [localize "STR_ATM_DepositSuccessG",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial; //Silent Sync

life_gang_bank_time = time;

if (LIFE_SETTINGS(getNumber,"player_moneyLog") isEqualTo 1) then {
    if (LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        money_log = format [localize "STR_DL_ML_depositeGang_BEF",_value,[_gFund] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    } else {
        money_log = format [localize "STR_DL_ML_depositeGang",profileName,(getPlayerUID player),_value,[_gFund] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    };
    publicVariableServer "money_log";
};