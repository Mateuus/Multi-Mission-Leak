/*
	COPY PASTE TIME
*/
private["_val"];
_val = parseNumber(ctrlText 2702);
if(!([str(_val)] call DWEV_fnc_isnumeric)) exitWith {hint "Es sind nur Zahlen erlaubt.";};
if(_val > dwf_atmcash) exitWith {hint "Du hast nicht soviel Geld auf deiner Bank.";};
if(_val <= 0) exitWith {hint "Gebe ein wieviel du abheben möchtest.";};
if(_val < 1000) exitWith {hint "Du kannst nicht weniger als 1000€ abheben.";};
if(_val > 10000000) exitWith {hint "Du kannst nicht mehr als 10000000€ abheben.";};

dwf_cash = dwf_cash + _val;
dwf_atmcash = dwf_atmcash - _val;
hint format ["Du hast %1€ von deinem Konto abgebucht.",[_val] call DWEV_fnc_numberText];
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


