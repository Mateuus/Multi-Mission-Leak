/*
	File: fn_jackpot.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Won he lottery!
*/

_amount = [_this,0,0,[0]] call BIS_fnc_param;
_toBank = _amount;
_toHand = 0;
if (life_atmmoney + _amount > 1000000) then
{
	_toBank = 1000000 - life_atmmoney;
	_toHand = _amount - _toBank;
	["cash","add",_toHand] call life_fnc_uC;
};
["atm","add",_toBank] call life_fnc_uC;
[[0,1,2],format["Congratulations, %1! You have won the jackpot of $%2! The money has already been added to your bank account.", name _unit, [_amount] call life_fnc_numberText]] call life_fnc_broadcast;