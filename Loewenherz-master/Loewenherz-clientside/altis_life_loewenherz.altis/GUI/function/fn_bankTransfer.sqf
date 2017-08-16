/*
	File: fn_bankTransfer.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Figure it out again.
*/
private["_val","_unit","_tax"];
if(LHM_transfer_cooldown) exitWIth{hint "Du kannst nur alle 5 Minuten Etwas überweisen";};

_val = parseNumber(ctrlText 2702);
_unit = call compile format["%1",(lbData[2703,(lbCurSel 2703)])];
if(isNull _unit) exitWith {};
if((lbCurSel 2703) == -1) exitWith {hint localize "STR_ATM_NoneSelected"};
if(isNil "_unit") exitWith {hint localize "STR_ATM_DoesntExist"};
if(_val > 50000) exitWith {hint localize "STR_ATM_TransferMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call lhm_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > lhm_atmcash) exitWith {hint localize "STR_ATM_NotEnough"};
_tax = [_val] call lhm_fnc_taxRate;
if((_val + _tax) > lhm_atmcash) exitWith {hint format[localize "STR_ATM_SentMoneyFail",_val,_tax]};

LHM_transfer_cooldown = true;

[] spawn {
	sleep 320;
	LHM_transfer_cooldown = false;
};
lhm_atmcash = lhm_atmcash - (_val + _tax);

[[_val,profileName],"TON_fnc_clientWireTransfer",_unit,false] call lhm_fnc_mp;
[] call lhm_fnc_atmMenu;
hint format[localize "STR_ATM_SentMoneySuccess",[_val] call lhm_fnc_numberText,_unit getVariable["realname",name _unit],[_tax] call lhm_fnc_numberText];
[1] call SOCK_fnc_updatePartial;