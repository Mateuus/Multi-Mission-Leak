#include "..\..\script_macros.hpp"
/*
	File: fn_bankDeposit.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Figure it out.
*/
private ["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > CASH) exitWith {hint localize "STR_ATM_NotEnoughCash"};

if((EAL_slowDownSon != 0) && ((time - EAL_slowDownSon) < 0.3)) exitWith {EAL_autoClickAmount = EAL_autoClickAmount +1;};
EAL_slowDownSon = time;
if(EAL_autoClickAmount >= 5) then { diag_log format["EAL AUTO CLICK DETECTION LOG ***CLICK BURSTS***:%1:      ***HACKER*** ",EAL_autoClickAmount]; };

CASH = CASH - _value;
BANK = BANK + _value;

hint format[localize "STR_ATM_DepositSuccess",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;

if(EQUAL(LIFE_SETTINGS(getNumber,"player_moneyLog"),1)) then {
	//money_log = format ["%1 - %2 deposited %3 to their bank. Bank Balance: %4  On Hand Balance: %5",profileName,(getPlayerUID player),_value,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
	money_log = format ["%1, %2, %3, ,%4  ,%5",profileName,(getPlayerUID player),_value, [BANK] call life_fnc_numberText2,[CASH] call life_fnc_numberText2];
	[money_log, "BankLogD"] remoteExecCall ["A3Log", 2];
};
