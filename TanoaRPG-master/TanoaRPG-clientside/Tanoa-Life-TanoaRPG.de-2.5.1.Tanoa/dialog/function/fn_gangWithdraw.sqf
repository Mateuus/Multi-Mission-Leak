#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	
	Description:
	Withdraw money from the players gang bank.
*/
private["_value","_gFund"];
_value = parseNumber(ctrlText 2702);


//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 1) exitWith {};
if(!([str(_value)] call tanoarpg_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};

_gFund = grpPlayer getVariable ["gang_bank",0];
if(_value > _gFund) exitWith {hint localize "STR_NOTF_NotEnoughFunds"};
if(!isNull (grpPlayer getVariable ["gang_bank_inUse", ObjNull])) exitWith {hint "Ein anderer Spieler der Gang greift gerade aufs Gangkonto zu"};
grpPlayer setVariable ["gang_bank_inUse", player, true];

[_gFund, _value] spawn {
	private["_value","_gFund"];
	_gFund = (_this select 0);
	_value = (_this select 1);
	
	hint "Bitte warte etwas der Vorgang wird bearbeitet";
	if((grpPlayer getVariable ["gang_bank_inUse", ObjNull]) != player) exitWith {hint "Ein anderer Spieler der Gang greift gerade aufs Gangkonto zu"};
	sleep 0.5;
	_gFund = _gFund - _value;
	if((grpPlayer getVariable ["gang_bank_inUse", ObjNull]) != player) exitWith {hint "Ein anderer Spieler der Gang greift gerade aufs Gangkonto zu"};
	sleep 0.5;
	grpPlayer setVariable ["gang_bank",_gFund,true];
	if((grpPlayer getVariable ["gang_bank_inUse", ObjNull]) != player) exitWith {hint "Ein anderer Spieler der Gang greift gerade aufs Gangkonto zu"};
	sleep 0.5;
	life_cash = life_cash + _value;
	if((grpPlayer getVariable ["gang_bank_inUse", ObjNull]) != player) exitWith {hint "Ein anderer Spieler der Gang greift gerade aufs Gangkonto zu"};
	sleep 0.5;
	[1,grpPlayer] remoteExec ["TEX_fnc_updateGang", 2, false];
	if((grpPlayer getVariable ["gang_bank_inUse", ObjNull]) != player) exitWith {hint "Ein anderer Spieler der Gang greift gerade aufs Gangkonto zu"};
	sleep 0.5;
	[6] call XAS_fnc_updatePartial;
	if((grpPlayer getVariable ["gang_bank_inUse", ObjNull]) != player) exitWith {hint "Ein anderer Spieler der Gang greift gerade aufs Gangkonto zu"};
	sleep 0.5;
	[] call tanoarpg_fnc_atmMenu;
	hint format["Du hast $%1 von deinem Gang Konto abgehoben",[_value] call tanoarpg_fnc_numberText];
	if((grpPlayer getVariable ["gang_bank_inUse", ObjNull]) != player) exitWith {hint "Ein anderer Spieler der Gang greift gerade aufs Gangkonto zu"};
	grpPlayer setVariable ["gang_bank_inUse", ObjNull, true];
	[player, player, _value, "GANGDWITHDRAW", life_atmcash, life_cash] remoteExec ["TEX_fnc_handleDBLog", 2];
};