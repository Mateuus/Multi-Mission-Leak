/*
	File: fn_bankTransfer.sqf
	
	
	Description:
	Figure it out again.
*/
private["_val","_unit","_tax"];
_val = parseNumber(ctrlText 2702);
_unit = call compile format["%1",(lbData[2703,(lbCurSel 2703)])];
if(isNull _unit) exitWith {};
if((lbCurSel 2703) isEqualTo -1) exitWith {[localize "STR_ATM_NoneSelected", false] spawn domsg;};
if(isNil "_unit") exitWith {[localize "STR_ATM_DoesntExist", false] spawn domsg;};
if(_val > 999999) exitWith {[localize "STR_ATM_TransferMax", false] spawn domsg;};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {[localize "STR_ATM_notnumeric", false] spawn domsg;};
if(_val > cash_in_bank) exitWith {[localize "STR_ATM_NotEnough", false] spawn domsg;};
_tax = round(_val / 15);
if((_val + _tax) > cash_in_bank) exitWith {[format[localize "STR_ATM_SentMoneyFail",_val,_tax], false] spawn domsg;};

["bank","take",(_val + _tax)] call life_fnc_handleCash; 

[_val,profileName,name _unit] remoteExecCall ["clientWireTransfer",_unit];
[] call life_fnc_atmMenu;
[format[localize "STR_ATM_SentMoneySuccess",[_val] call life_fnc_numberText,_unit getVariable["realname",name _unit],[_tax] call life_fnc_numberText], false] spawn domsg;
