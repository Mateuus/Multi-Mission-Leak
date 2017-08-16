#include "..\..\script_macros.hpp"
/*
	File: fn_postBail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when the player attempts to post bail.
	Needs to be revised.
*/
private["_unit"];
_unit = param [1,objNull,[objNull]];
if(life_bail_paid) exitWith {};
if(isNil {life_bail_amount}) then {life_bail_amount = 3500;};
if(!isNil "life_canpay_bail") exitWith {hint  "Du musst mindestens 3 Minuten lang im Gefängnis bleiben, bevor du die Kaution beantragen kannst."};
if(BANK < life_bail_amount) exitWith {hint format[ "Du hast keine $%1 auf deinem Bankkonto, um die Kaution zu bezahlen.",life_bail_amount];};

SUB(BANK,life_bail_amount);
life_bail_paid = true;
[0,"%1 hat die Kaution bezahlt!",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];