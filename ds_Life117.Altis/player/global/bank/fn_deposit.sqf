/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Deposits money 
*/

private ["_value","_fail"];

_value = parseNumber(ctrlText 1400);
closeDialog 0;
//Checks because humans do stupid things
_fail = false;
//if(!([str(_value)] call DS_fnc_isNumber)) then {hint "You entered an incorrect input";_fail = true}; Since this parses the number I don't believe it does anything
if(_value > 999999) then {hint "You can not deposit a value greater than $999,999";_fail = true};
if(_value < 1) then {hint "You can not deposit any value lower than $1";_fail = true};
if(_value > DS_coin) then {hint "You do not have enough money on you deposit this amount";_fail = true};
if(_fail)exitwith{[] spawn DS_fnc_menuAtm;};
[_value,false,false] call DS_fnc_handleMoney;
[_value,true,true] call DS_fnc_handleMoney;

hint format ["You have deposited $%1 into your bank",[_value] call DS_fnc_numberText];
[] spawn DS_fnc_menuAtm;
[] call DS_fnc_compileData;








