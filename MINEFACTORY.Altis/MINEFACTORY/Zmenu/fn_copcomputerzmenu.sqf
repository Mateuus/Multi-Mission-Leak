/*################################
#	(c) 2016 Minefactory         #
#								 #
#	Author: PierreAmyf      	 #
#	Lizenz: Lizenz.txt Lesen!	 #
################################*/
#include "..\..\script_macros.hpp"

if(FETCH_CONST(life_coplevel) < 1) exitWith {["Du bist kein Polizist!"] spawn life_fnc_nachricht;}; 
createDialog "life_polizei2computer";