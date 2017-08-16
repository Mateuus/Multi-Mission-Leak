#include "..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Deposits money into the players gang bank.
*/
private["_value"];

if(!DarfGangGeldZahlen) exitWith {hint localize "STR_NOTF_Transfer_GangUpMoney";};
if(DarfGangGeldZahlen) then {
	DarfGangGeldZahlen = false;
	[] spawn {
		sleep 5;
		DarfGangGeldZahlen = true;
	};
};

_value = parseNumber(ctrlText 2702);
group player setVariable["gbank_in_use_by",player,true];

//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call ES_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > ES_atmbank) exitWith {hint localize "STR_NOTF_NotEnoughFunds"};
if((group player getVariable ["gbank_in_use_by",player]) != player) exitWith {hint localize "STR_ATM_WithdrawInUseG"};

ES_atmbank = ES_atmbank - _value;
_gFund = group player getVariable ["gang_bank",0];;
_gFund = _gFund + _value;

group player setVariable ["gang_bank",_gFund,true];

hint format[localize "STR_ATM_DepositGang",[_value] call ES_fnc_numberText];
[] call ES_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial; //Silent Sync
[1,group player] remoteExec ["ES_fnc_updateGang",2];

_toLog = format ["Name: %1 (%2) hat Geld Eingezahlt: %3 $ Gang: %4", player getVariable["realname",name player], getPlayerUID player, [_value] call ES_fnc_numberText, group player getVariable "gang_name"];
["GANG_DEPOSITS_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];