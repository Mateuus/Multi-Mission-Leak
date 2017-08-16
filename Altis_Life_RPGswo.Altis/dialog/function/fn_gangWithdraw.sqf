#include "..\..\macros.hpp"
/*
	Author: ME

	Description:
	Geld vom Gangkonto abheben
*/
private["_value","_gang_id"];
_value = parseNumber(ctrlText 2702);
_gang_id = grpPlayer getVariable ["gang_id",[]];
if (isNil "DWEV_virtBuyInUse") then {DWEV_virtBuyInUse = false;};
if (DWEV_virtBuyInUse) exitWith {hint "Du kannst nicht so schnell abheben! Lass dir etwas Zeit!";};
if(!([str(_value)] call DWEV_fnc_isnumeric)) exitWith {hint "Es sind nur Zahlen erlaubt.";};
if(_val <= 0) exitWith {hint "Gebe ein wieviel du abheben möchtest.";};
if(_val < 1000) exitWith {hint "Du kannst nicht weniger als 1000€ abheben.";};
if(_val > 10000000) exitWith {hint "Du kannst nicht mehr als 10000000€ abheben.";};

if (__GETC__(DWEV_coplevel) > 0) then
{
	DWEV_virtBuyInUse = true;

	[player,_value,"Abbuchung ATM"] remoteExec ["DWF_fnc_getFromStateBank",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];

}
else
{
	_gFund = _gFund - _value;
	_gFund = grpPlayer getVariable ["gang_bank",0];
	if(_value > _gFund) exitWith {hint "Es ist nicht genug Geld auf dem Gangkonto!"};
	DWEV_virtBuyInUse = true;
	dwf_cash = dwf_cash + _value;
	
	[grpPlayer,_value] remoteExec ["DWF_fnc_gangBankWithdraw",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
	
	if (_value >= 25000) then 
	{
		[16,player,format ["Spieler %1 (%2€) vom Gangkonto der Gang ID %5 abgehoben - Bargeld. %3 € Bankkonto. %4 €",getMyDName,[_value] call DWEV_fnc_numberText,[dwf_cash] call DWEV_fnc_numberText,[dwf_atmcash] call DWEV_fnc_numberText,_gang_id]] remoteExec ["DB_fnc_logToDB",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
	};
	
	hint format["Du hast %1€ vom Gangkonto abgehoben",[_value] call DWEV_fnc_numberText];
	[] call DWEV_fnc_atmMenu;

	if (isNil "DWEV_bank_transfer_gangWithdraw") then {DWEV_bank_transfer_gangWithdraw = false;};
	if !(DWEV_bank_transfer_gangWithdraw) then
	{
		DWEV_bank_transfer_gangWithdraw = true;
		[] spawn
		{
			sleep 5;
			[0] call SOCK_fnc_updatePartial;
			DWEV_bank_transfer_gangWithdraw = false;
		};
	};
};

[] spawn
{
	sleep 2;
	DWEV_virtBuyInUse = false;
};