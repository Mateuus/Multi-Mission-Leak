/*
	File: fn_postBail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when the player attempts to post bail.
	Needs to be revised.
*/
private["_unit"];
_unit = _this select 1;
if(life_bail_paid) exitWith {};
if (life_trial_inprogress && life_requested_trial) exitWith {hint "You cannot post bail when you're waiting on a trial."};
if(isNil {life_bail_amount}) then {life_bail_amount = 3500;};
if(!isNil "life_canpay_bail") exitWith {systemChat "You must wait at least 3 minutes in jail before paying a bail."};
if(life_atmmoney < life_bail_amount) exitWith {systemChat format["You do not have $%1 in your bank account to pay bail.",life_bail_amount];};

_handle = [format["Do you wish to pay $%1 to be release from jail?", [life_bail_amount] call life_fnc_numberText]] spawn life_fnc_confirmMenu;
waitUntil {scriptDone _handle};
if(!life_confirm_response) exitWith {};

["atm","take",life_bail_amount] call life_fnc_uC;
life_bail_paid = true;
[[0,format["%1 has posted bail!", name _unit]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
//[[35, _unit, format["Posted bail of %1", life_bail_amount]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;