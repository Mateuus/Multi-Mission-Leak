#include "..\script_macros.hpp"
/*
	File: fn_bankTransfer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out again.
*/
private["_val","_unit","_tax"];

if(!DarfTransfern) exitWith {hint localize "STR_NOTF_Transfer_Money";};
if(DarfTransfern) then {
	DarfTransfern = false;
	[] spawn {
		sleep 5;
		DarfTransfern = true;
	};
};

_val = parseNumber(ctrlText 2702);
_unit = call compile format["%1",(lbData[2703,(lbCurSel 2703)])];
if(isNull _unit) exitWith {};
if((lbCurSel 2703) == -1) exitWith {hint localize "STR_ATM_NoneSelected"};
if(isNil "_unit") exitWith {hint localize "STR_ATM_DoesntExist"};
if(_val > 999999) exitWith {hint localize "STR_ATM_TransferMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call ES_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > ES_atmbank) exitWith {hint localize "STR_ATM_NotEnough"};
_tax = [_val] call ES_fnc_taxRate;
if((_val + _tax) > ES_atmbank) exitWith {hint format[localize "STR_ATM_SentMoneyFail",_val,_tax]};

ES_atmbank = ES_atmbank - (_val + _tax);

[_val,profileName] remoteExec ["ES_fnc_wireTransfer",_unit];
[] call ES_fnc_atmMenu;
hint format[localize "STR_ATM_SentMoneySuccess",[_val] call ES_fnc_numberText,_unit getVariable["realname",name _unit],[_tax] call ES_fnc_numberText];
[1] call SOCK_fnc_updatePartial;

_toLog = format ["Name: %1 (%2) hat %3 $ An: %4 (%5) überwiesen", player getVariable["realname",name player], getPlayerUID player, [_val] call ES_fnc_numberText, _unit getVariable["realname",name _unit], getPlayerUID _unit];
["MONEY_TRANSFER_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];