/*
	fn_bankWithdraw.sqf
*/
private["_val","_unit"];
_unit = cursortarget;
_val = round(parseNumber(ctrlText 2702));
if(_val > 999999) exitWith {[localize "STR_ATM_WithdrawMax", false] spawn domsg;};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {[localize "STR_ATM_notnumeric", false] spawn domsg;};
if(_val > cash_in_bank) exitWith {[localize "STR_ATM_NotEnoughFunds", false] spawn domsg;};
if(_val < 100 && cash_in_bank > 20000000) exitWith {[localize "STR_ATM_WithdrawMin", false] spawn domsg;}; //Temp fix for something.

["cash","add",_val] call life_fnc_handleCash;
["bank","take",_val] call life_fnc_handleCash;

if (isPlayer _unit && uniform _unit isEqualTo "KAEL_SUITS_BR_F12" && (_unit getVariable "ATM_MAN")) then {
	cheap_buffs = true;
	["Otrzymales kupon na 30% znizki przy nastepnym zakupie pizzy lub donutow!", false] spawn domsg;
	_val remoteExec ["fnc_totalatm",_unit];
};

[format [localize "STR_ATM_WithdrawSuccess",[_val] call life_fnc_numberText], false] spawn doquickmsg;
[] call life_fnc_atmMenu;
