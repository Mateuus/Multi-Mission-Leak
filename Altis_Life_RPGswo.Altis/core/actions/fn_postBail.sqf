#include "..\..\macros.hpp"
/*
	File: fn_postBail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when the player attempts to post bail.
	Needs to be revised.
*/
private["_unit"];
_unit = _this select 1;
if(DWEV_bail_paid) exitWith {};
if(isNil {DWEV_bail_amount}) then {DWEV_bail_amount = 3500;};
if(!isNil "DWEV_canpay_bail") exitWith {hint "Du musst mindestens 3 minuten im Gefängnis sein, bevor du Kaution stellen darfst."};
if(dwf_atmcash < DWEV_bail_amount) exitWith {hint format["Du hast keine %1€ auf deinem Konto, um die Kaution zu stellen.",DWEV_bail_amount];};

dwf_atmcash = dwf_atmcash - DWEV_bail_amount;
DWEV_bail_paid = true;
format["%1 hat Kaution gestellt!", getPlayerDName(_unit)] remoteExec ["systemChat", west]; 