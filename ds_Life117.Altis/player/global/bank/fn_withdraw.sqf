/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Withdraws money 
*/

private ["_value","_fail"];

_value = parseNumber(ctrlText 1400);
closeDialog 0;
//Checks because humans do stupid things
_fail = false;
//if(!([str(_value)] call DS_fnc_isNumber)) then {hint "You entered an incorrect input";_fail = true}; Since this parses the number I don't believe it does anything
if(_value > 999999) then {hint "You can not withdraw a value greater than $999,999";_fail = true};
if(_value < 1) then {hint "You can not withdraw any value lower than $1";_fail = true};
if(_value > DS_atmcoin) then {hint "You do not have enough money in your account to withdraw this amount";_fail = true};
if(_fail)exitwith{[] spawn DS_fnc_menuAtm;};
[_value,true,false] call DS_fnc_handleMoney;
[_value,false,true] call DS_fnc_handleMoney;

hint format ["You have withdrawn $%1 from your bank",[_value] call DS_fnc_numberText];
[] spawn DS_fnc_menuAtm;
[] call DS_fnc_compileData;








