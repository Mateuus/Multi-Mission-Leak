#include <macro.h>
/*
	Author: ME
	
	Description:
	Geld vom Gangkonto abheben
*/
private["_val","_gFund"];

_val = ctrlText 7920;

//__SUB__(_gFund,_value);
_gFund = grpPlayer getVariable ["gang_bank",0];
_ownerID = grpPlayer getVariable["gang_owner",""];
if(_ownerID == "") exitWith {closeDialog 0;};

if(_ownerID != steamid) exitWith {hint "Nur der Anführer der Gruppierung kann Geld vom Konto abheben."};
if((parseNumber(_val)) > 10000000) exitWith {hint "Du kannst nicht mehr als 10.000.000€ abheben.";};
if((parseNumber(_val)) < 0) exitWith {};
if!([_val] call life_fnc_isnumeric) exitWith {hint localize "STR_AIM_notnumeric"};
if((parseNumber(_val)) > _gFund) exitWith {hint "Es ist nicht genügend Geld auf dem Gang-Konto!"};
if((parseNumber(_val)) < 100) exitWith {hint "Du kannst nicht weniger als 100€ abheben"};

life_beatgeld = life_beatgeld + (parseNumber(_val));
_gFund = _gFund - (parseNumber(_val));
grpPlayer setVariable ["gang_bank",_gFund,true];

hint format[localize "STR_ATM_WithdrawGang",[(parseNumber(_val))] call life_fnc_numberText];
//[] call life_fnc_atmmenu;
[6] call SOCK_fnc_updatePartial;
[1,grpPlayer] remoteExecCall ["SOA_fnc_updateGang",2];

[[(parseNumber(_val))] call life_fnc_numberText, grpPlayer getvariable "gang_name", player getVariable["realname",name player],5,[(group player getvariable "gang_bank")] call life_fnc_numberText] remoteExecCall ["life_fnc_logDat",2];

closedialog 0;