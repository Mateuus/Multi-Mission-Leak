/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Withdraws money
*/

private ["_value"];

_value = parseNumber(ctrlText 1400);

closeDialog 0;

if(_value > 999999)exitWith{hint "You can not withdraw a value greater than $999,999";[] spawn DS_fnc_menuAtm;};
if(_value < 1)exitWith{hint "You can not withdraw any value lower than $1";[] spawn DS_fnc_menuAtm;};
if(_value > DS_atmCoin)exitWith{hint "You do not have enough money in your account to withdraw this amount";[] spawn DS_fnc_menuAtm;};

[_value,true,false] call DS_fnc_handleMoney;
[_value,false,true] call DS_fnc_handleMoney;

hint format ["You have withdrawn $%1 from your bank",[_value] call DS_fnc_numberText];
[] spawn DS_fnc_menuAtm;
[] call DS_fnc_compileData;