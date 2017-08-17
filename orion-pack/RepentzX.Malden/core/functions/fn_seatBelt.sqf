/*
//--By Repentz for orion
*/

#include "..\..\script_macros.hpp"
/*
	fn_seatBelt.sqf
*/
playSound "seatbelt"; 
if(!life_seatbelt) then {
	life_seatbelt = true;
} else {
	life_seatbelt = false;
};

[] call life_fnc_hudUpdate;