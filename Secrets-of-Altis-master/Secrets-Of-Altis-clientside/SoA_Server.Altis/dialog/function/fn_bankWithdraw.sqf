/*
	COPY PASTE TIME
*/
private["_val","_noATMs"];
ctrlEnable[7912,false];

_val = ctrlText 7911;

if((parseNumber(_val)) > 10000000) exitWith {hint "Du kannst nicht mehr als 10.000.000€ abheben."; ctrlEnable[7912,true];};
if((parseNumber(_val)) < 0) exitwith {ctrlEnable[7912,true];};
if(!([_val] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"; ctrlEnable[7912,true];};
if((parseNumber(_val)) > life_beatbankgeld) exitWith {hint localize "STR_ATM_NotEnoughFunds"; ctrlEnable[7912,true];};
if((parseNumber(_val)) < 100 && life_beatbankgeld > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"; ctrlEnable[7912,true];};

life_beatbankgeld = life_beatbankgeld - (parseNumber(_val));
life_beatgeld = life_beatgeld + (parseNumber(_val));
hint format[localize "STR_ATM_WithdrawSuccess",[(parseNumber(_val))] call life_fnc_numberText];
	
//[] call life_fnc_atm;
[6] call SOCK_fnc_updatePartial;

sleep 1;
ctrlEnable[7912,true];