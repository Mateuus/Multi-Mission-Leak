#include "..\..\script_macros.hpp"
/*
	File: fn_robReceive.sqf
	Author: Bryan "Tonic" Boardwine

	Description:

*/
params [
	["_cash",0,[0]],
	["_victim",objNull,[objNull]],
	["_robber",objNull,[objNull]]
];

if(_robber == _victim) exitWith {};
if(EQUAL(_cash,0)) exitWith {titleText[localize "STR_Civ_RobFail","PLAIN"]};

ADD(CASH,_cash);
titleText[format[localize "STR_Civ_Robbed",[_cash] call life_fnc_numberText],"PLAIN"];
[0] call SOCK_fnc_updatePartial;

if(EQUAL(LIFE_SETTINGS(getNumber,"player_moneyLog"),1)) then {
	if(EQUAL(LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging"),1)) then {
		money_log = format ["robbed %1 from %2. Bank Balance: %3  On Hand Balance: %4", [_cash] call life_fnc_numberText, _victim,[BANK] call life_fnc_numberText, [CASH] call life_fnc_numberText];
	} else {
		money_log = format ["%1 - %2 robbed %3 from %4. Bank Balance: %5  On Hand Balance: %6", profileName, (getPlayerUID player), [_cash] call life_fnc_numberText, _victim,[BANK] call life_fnc_numberText, [CASH] call life_fnc_numberText];
	};
	publicVariableServer "money_log";
};