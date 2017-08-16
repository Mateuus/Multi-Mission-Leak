/*################################
#	(c) 2016 Minefactory         #
#								 #
#	Author: PierreAmyf      	 #
#	Lizenz: Lizenz.txt Lesen!	 #
################################*/
#include "..\..\script_macros.hpp"

if(FETCH_CONST(life_mediclevel) < 3) exitWith {["Du hast nicht das richtige level!!!"] spawn life_fnc_nachricht;}; 
[] spawn life_fnc_placeablesMenu;