/*
	File: fn_bankDeposit.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out.
*/
private["_value","_noATMs"];
ctrlEnable[7912,false];

_val = ctrlText 7911;


if((parseNumber(_val)) > 10000000) exitWith {hint "Du kannst nicht mehr als 10.000.000€ einzahlen."; ctrlEnable[7912,true];};
if((parseNumber(_val)) < 0) exitWith {ctrlEnable[7912,true];};
if(!([_val] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"; ctrlEnable[7912,true];};
if((parseNumber(_val)) > life_beatgeld) exitWith {hint localize "STR_ATM_NotEnoughCash"; ctrlEnable[7912,true];};

life_beatgeld = life_beatgeld - (parseNumber(_val));
life_beatbankgeld = life_beatbankgeld + (parseNumber(_val));
hint format[localize "STR_ATM_DepositMSG",[(parseNumber(_val))] call life_fnc_numberText];

//[''] call life_fnc_atmmenu;
[6] call SOCK_fnc_updatePartial;

sleep 1;
ctrlEnable[7912,true];