/*
	File: fn_bankDeposit.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Figure it out.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(!([str(_value)] call DWEV_fnc_isnumeric)) exitWith {hint "Es sind nur Zahlen erlaubt."};
if(_value > dwf_cash) exitWith {hint "Du hast nicht so viel Geld!"};
if(_value <= 0) exitWith {hint "Gebe ein wieviel du einzahlen möchtest.";};
if(_value < 1000) exitWith {hint "Du kannst nicht weniger als 1000€ einzahlen"};
if(_value > 10000000) exitWith {hint "Du kannst nicht mehr als 10000000€ einzahlen";};
dwf_cash = dwf_cash - _value;
dwf_atmcash = dwf_atmcash + _value;

hint format["Du hast %1€ auf dein Konto eingezahlt.",[_value] call DWEV_fnc_numberText];
[] call DWEV_fnc_atmMenu;

if (isNil "DWEV_bank_transfer") then {DWEV_bank_transfer = false;};
if !(DWEV_bank_transfer) then
{
	DWEV_bank_transfer = true;
	[] spawn
	{
		sleep 5;
		[6] call SOCK_fnc_updatePartial; //Silent Sync
		DWEV_bank_transfer = false;
	};
};
