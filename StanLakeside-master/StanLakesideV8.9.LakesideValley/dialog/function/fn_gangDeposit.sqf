#include <macro.h>
/*
	
	
	Description:
	Deposits money into the players gang bank.
*/
private["_value"];
_value = round(parseNumber(ctrlText 2702));

//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > cash_in_bank) exitWith {hint localize "STR_NOTF_NotEnoughFunds"};

["bank","take",_value] call life_fnc_handleCash;
_gFund = grpPlayer getVariable ["gang_bank",0];
_gFund = _gFund + _value;
grpPlayer setVariable ["gang_bank",_gFund,true];

hint format[localize "STR_ATM_DepositGang",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
 //Silent Sync
[1,grpPlayer] remoteExecCall ["TON_fnc_updateGang",(call life_fnc_HCC)];
