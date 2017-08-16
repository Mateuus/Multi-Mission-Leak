/*
	File: fn_bankTransfer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out again.
*/
private["_val","_unit","_tax"];
_val = parseNumber(ctrlText 2702);
_unit = call compile format["%1",(lbData[2703,(lbCurSel 2703)])];
if(isNull _unit) exitWith {};
if((lbCurSel 2703) == -1) exitWith {hint localize "STR_ATM_NoneSelected"};
if(isNil "_unit") exitWith {hint localize "STR_ATM_DoesntExist"};
if(_val > 999999) exitWith {hint localize "STR_ATM_TransferMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call tanoarpg_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > life_atmcash) exitWith {hint localize "STR_ATM_NotEnough"};
_tax = [_val] call tanoarpg_fnc_taxRate;
if((_val + _tax) > life_atmcash) exitWith {hint format[localize "STR_ATM_SentMoneyFail",_val,_tax]};

life_atmcash = life_atmcash - (_val + _tax);

[player, _unit, _val, "ATM", life_atmcash, life_cash] remoteExec ["TEX_fnc_handleDBLog", 2];
[] call tanoarpg_fnc_atmMenu;
hint format[localize "STR_ATM_SentMoneySuccess",[_val] call tanoarpg_fnc_numberText,_unit getVariable["realname",name _unit],[_tax] call tanoarpg_fnc_numberText];
[1] call XAS_fnc_updatePartial;
[_val,profileName] remoteExec ["TEX_fnc_clientWireTransfer", _unit, false];