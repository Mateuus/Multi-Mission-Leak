/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Deposits money
*/

private ["_value"];

_value = parseNumber(ctrlText 1400);

closeDialog 0;

if(_value > 999999)exitWith{hint "You can not deposit a value greater than $999,999";[] spawn DS_fnc_menuAtm;};
if(_value < 1)exitWith{hint "You can not deposit any value lower than $1";[] spawn DS_fnc_menuAtm;};
if(_value > DS_coin)exitWith{hint "You do not have enough money on you deposit this amount";[] spawn DS_fnc_menuAtm;};

[_value,false,false] call DS_fnc_handleMoney;
[_value,true,true] call DS_fnc_handleMoney;

hint format ["You have deposited $%1 into your bank",[_value] call DS_fnc_numberText];
[] spawn DS_fnc_menuAtm;
[] call DS_fnc_compileData;