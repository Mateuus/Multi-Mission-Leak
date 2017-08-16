#include "..\script_macros.hpp"
/*
	File: fn_postBail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when the player attempts to post bail.
	Needs to be revised.
*/
private["_unit"];
_unit = param [1,objNull,[objNull]];
if(ES_bail_paid) exitWith {};
if(isNil {ES_bail_amount}) then {ES_bail_amount = 3500;};
if(!isNil "ES_canpay_bail") exitWith {hint localize "STR_NOTF_Bail_Post"};
if(ES_atmbank < ES_bail_amount) exitWith {hint format[localize "STR_NOTF_Bail_NotEnough",ES_bail_amount];};

ES_atmbank = ES_atmbank - ES_bail_amount;
ES_bail_paid = true;
[0,"STR_NOTF_Bail_Bailed",true,[profileName]] remoteExec ["ES_fnc_broadcast",-2];