#include "..\..\script_macros.hpp"

/*
Author: Repentz 
Description: you can collect a treasure
*/


if (life_inv_oilSupplies == 1) exitWith { hint "You cannot have more than one treasure at once, go sell the one you have.." };
if (!(life_inv_excavator > 0)) exitWith {["You do not have a excavator, buy one from the archeologist!",true,"slow"] call life_fnc_notificationSystem; };

[true,"oilSupplies",1] call life_fnc_handleInv;

hint "you have collected the oil Supplies, bring them to the trader!";