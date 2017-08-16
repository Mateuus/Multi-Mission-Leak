/*
	File: fn_bank_debit.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Purchases a shiny new debit card.
*/

if (life_inv_debitcard > 0) exitWith {hint "You already have a debit card."};
//if (life_donator < 2) exitWith {hint "You have been declined for a debit card by the bank due to a poor credit score.  Must be donor level 2 or above."};
if (life_atmmoney < 2500) exitWith {hint "You don't have $2,500 in your bank account for a new debit card."};

[true,"debitcard",1] call life_fnc_handleInv;
["atm","take",2500] call life_fnc_uC;

hint "You've purchased a brand new debit card. The letters aren't even worn off yet. If you were donor level 2 (visit gaming-asylum.com) you'd always have a debit card for free!";
closeDialog 0;