/*
	File: fn_postBail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when the player attempts to post bail.
	Needs to be revised.
*/
private["_unit"];
_unit = _this select 1;
if(EMonkeys_bail_paid) exitWith {};
if(isNil {EMonkeys_bail_amount}) then {EMonkeys_bail_amount = 3500;};
if(!isNil "EMonkeys_canpay_bail") exitWith {hint "Sie müssen mindestens 3 Minuten warten bis sie einen Antrag auf Kaution stellen können"};
if(EMonkeys_a164 < EMonkeys_bail_amount) exitWith {hint format["Sie haben keine %1€ auf ihrem Bankkonto um die Kaution zu bezahlen. ÄLÄBÄTSCH",EMonkeys_bail_amount];};

EMonkeys_a164 = EMonkeys_a164 - EMonkeys_bail_amount;
eM_bail_paid = true;
[[0,format["%1 wurde gegen Kaution frei gelassen", _unit getVariable ["realname",name _unit]]],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp;