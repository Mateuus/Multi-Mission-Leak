/*
	File: fn_bankTransfer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out again.
*/
private["_val","_unit","_tax"];
_val = ctrlText 7915;
_unit = call compile format["%1",(lbData[7917,(lbCurSel 7917)])];

if(isNull _unit) exitWith {};
if((lbCurSel 7917) == -1) exitWith {hint localize "STR_ATM_NoneSelected"};
if(isNil "_unit") exitWith {hint localize "STR_ATM_DoesntExist"};
if((parseNumber(_val)) > 10000000) exitWith {hint localize "STR_ATM_TransferMax";};
if((parseNumber(_val)) < 0) exitwith {};
if(!([_val] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if((parseNumber(_val)) > life_beatbankgeld) exitWith {hint localize "STR_ATM_NotEnough"};
_tax = [(parseNumber(_val))] call life_fnc_taxRate;
if(((parseNumber(_val)) + _tax) > life_beatbankgeld) exitWith {hint format[localize "STR_ATM_SentMoneyFail",(parseNumber(_val)),_tax]};

life_beatbankgeld = life_beatbankgeld - ((parseNumber(_val)) + _tax);

[_val,profileName] remoteExecCall ["SOA_fnc_clientWireTransfer",_unit];
//[] call life_fnc_atmmenu;
hint format[localize "STR_ATM_SentMoneySuccess",[(parseNumber(_val))] call life_fnc_numberText,_unit getVariable["realname",name _unit],[_tax] call life_fnc_numberText];
[1] call SOCK_fnc_updatePartial;

[[(parseNumber(_val))] call life_fnc_numberText, player getVariable["realname",name player], _unit getVariable["realname",name _unit],0] remoteExecCall ["life_fnc_logDat",2];