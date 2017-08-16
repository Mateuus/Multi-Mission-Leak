#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Deposits money into the players gang bank.
*/
private["_value","_gang_id"];
_value = parseNumber(ctrlText 2702);
_gang_id = grpPlayer getVariable ["gang_id",[]];
if (isNil "DWEV_virtBuyInUse") then {DWEV_virtBuyInUse = false;};
if (DWEV_virtBuyInUse) exitWith {hint "Du kannst nicht so schnell einzahlen! Lass dir etwas Zeit!";};

//Series of stupid checks
if(!([str(_value)] call DWEV_fnc_isnumeric)) exitWith {hint "Es sind nur Zahlen erlaubt.";};
if(_value > dwf_atmcash) exitWith {hint "Du hast nicht genug auf deiner Bank!";};
if(_val <= 0) exitWith {hint "Gebe ein wieviel du einzahlen möchtest.";};
if(_val < 1000) exitWith {hint "Du kannst nicht weniger als 1000€ einzahlen.";};
if(_val > 10000000) exitWith {hint "Du kannst nicht mehr als 10000000€ einzahlen.";};

DWEV_virtBuyInUse = true;

__SUB__(dwf_atmcash,_value);

if (__GETC__(DWEV_coplevel) > 0) then
{
	[player,_value,"Einzahlung ATM"] remoteExec ["DWF_fnc_addToStateBank",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
	hint format["Du hast %1€ in das Staatskonto eingezahlt",[_value] call DWEV_fnc_numberText];
	[1] call SOCK_fnc_updatePartial;
}
else
{
	[grpPlayer,_value] remoteExec ["DWF_fnc_gangBankDeposit",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
	
	if (_value >= 25000) then 
	{
		[16,player,format ["Spieler %1 hat %2€ ins Gangkonto der Gang ID %5 eingezahlt - Bargeld. %3 € Bankkonto. %4 €",getMyDName,[_value] call DWEV_fnc_numberText,[dwf_cash] call DWEV_fnc_numberText,[dwf_atmcash] call DWEV_fnc_numberText,_gang_id]] remoteExec ["DB_fnc_logToDB",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
	};
	
	hint format["Du hast %1€ in die Gangkasse eingezahlt.",[_value] call DWEV_fnc_numberText];
	[] call DWEV_fnc_atmMenu;

	if (isNil "DWEV_bank_transfer_gangDeposit") then {DWEV_bank_transfer_gangDeposit = false;};
	if !(DWEV_bank_transfer_gangDeposit) then
	{
		DWEV_bank_transfer_gangDeposit = true;
		[] spawn
		{
			sleep 5;
			[1] call SOCK_fnc_updatePartial;
			DWEV_bank_transfer_gangDeposit = false;
		};
	};
};

[] spawn
{
	sleep 2;
	DWEV_virtBuyInUse = false;
};