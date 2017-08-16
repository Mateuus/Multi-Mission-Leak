#include "..\script_macros.hpp"
private["_val"];

if(!DarfGangGeldNehmen) exitWith {hint localize "STR_NOTF_Transfer_GangDownMoney";};
if(DarfGangGeldNehmen) then {
	DarfGangGeldNehmen = false;
	[] spawn {
		sleep 5;
		DarfGangGeldNehmen = true;
	};
};

_val = parseNumber(ctrlText 2702);
group player setVariable["gbank_in_use_by",player,true];
_gFund = group player getVariable ["gang_bank",0];
if(_val > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call ES_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > _gFund) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
if(_val < 100 && _gFund > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.
if((group player getVariable ["gbank_in_use_by",player]) != player) exitWith {hint localize "STR_ATM_WithdrawInUseG"};

ES_cash = ES_cash + _val;
_gFund = _gFund - _val;

group player setVariable ["gang_bank",_gFund,true];

[1,group player] remoteExec ["ES_fnc_updateGang",2];

hint format [localize "STR_ATM_WithdrawSuccess",[_val] call ES_fnc_numberText];
[] call ES_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;

_toLog = format ["Name: %1 (%2) hat Geld Genommen: %3 $ Gang: %4", player getVariable["realname",name player], getPlayerUID player, [_val] call ES_fnc_numberText, group player getVariable "gang_name"];
["GANG_WITHDRAW_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];