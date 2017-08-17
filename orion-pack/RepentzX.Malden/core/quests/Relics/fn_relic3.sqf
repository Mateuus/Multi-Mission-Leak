#include "..\..\..\script_macros.hpp"

/*
Author: Repentz 
Description: relics to reward a new skill!
*/


if (life_inv_relic3 == 1) exitWith { hint "You do not need more than one of each relic!" };

[true,"relic3",1] call life_fnc_handleInv;

hint "you have collected a Shakrhi Relic!";