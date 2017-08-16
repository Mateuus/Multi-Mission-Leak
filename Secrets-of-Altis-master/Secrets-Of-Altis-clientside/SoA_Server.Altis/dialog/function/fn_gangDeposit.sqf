#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Deposits money into the players gang bank.
*/
private["_value"];
_val = (ctrlText 7918);
_gFund = grpPlayer getVariable ["gang_bank",0];
_ownerID = grpPlayer getVariable["gang_owner",""];
if(_ownerID == "") exitWith {closeDialog 0;};

//Series of stupid checks
if((parseNumber (_val)) > 10000000) exitWith {hint "Du kannst nicht mehr als 10.000.000€ einzahlen."};
if((parseNumber (_val)) < 0) exitWith {};
if!([_val] call life_fnc_isnumeric) exitWith {hint localize "STR_ATM_notnumeric"};
if((parseNumber (_val)) > life_beatbankgeld) exitWith {hint localize "STR_NOTF_NotEnoughFunds"};

life_beatbankgeld = life_beatbankgeld - (parseNumber(_val));
_gFund = _gFund + (parseNumber(_val));
grpPlayer setVariable ["gang_bank",_gFund,true];

hint format[localize "STR_ATM_DepositGang",[(parseNumber(_val))] call life_fnc_numberText];
//[] call life_fnc_atmmenu;
[6] call SOCK_fnc_updatePartial; //Silent Sync
[1,grpPlayer] remoteExecCall ["SOA_fnc_updateGang",2];

[[(parseNumber(_val))] call life_fnc_numberText, grpPlayer getvariable "gang_name", player getVariable["realname",name player],6,[(group player getvariable "gang_bank")] call life_fnc_numberText] remoteExecCall ["life_fnc_logDat",2];

closedialog 0;