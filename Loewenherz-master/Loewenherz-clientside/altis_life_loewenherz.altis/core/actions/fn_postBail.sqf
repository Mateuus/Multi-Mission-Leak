/*
	File: fn_postBail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when the player attempts to post bail.
	Needs to be revised.
*/
private["_unit"];
_unit = _this select 1;
if(lhm_bail_paid) exitWith {};
if(isNil {lhm_bail_amount}) then {lhm_bail_amount = 3500;};
if(!isNil "lhm_canpay_bail") exitWith {hint localize "STR_NOTF_Bail_Post"};
if(lhm_atmcash < lhm_bail_amount) exitWith {hint format[localize "STR_NOTF_Bail_NotEnough",lhm_bail_amount];};

lhm_atmcash = lhm_atmcash - lhm_bail_amount;
lhm_bail_paid = true;
[[0,"STR_NOTF_Bail_Bailed",true,[profileName]],"lhm_fnc_broadcast",true,false] call lhm_fnc_mp;

[1] call SOCK_fnc_updatePartial;