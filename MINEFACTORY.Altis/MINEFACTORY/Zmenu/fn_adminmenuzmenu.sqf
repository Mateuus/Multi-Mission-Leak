/*################################
#	(c) 2016 Minefactory         #
#								 #
#	Author: PierreAmyf      	 #
#	Lizenz: Lizenz.txt Lesen!	 #
################################*/
#include "..\..\script_macros.hpp"

if(FETCH_CONST(life_adminlevel) < 1) exitWith {["Du bist kein Admin | Supporter!"] spawn life_fnc_nachricht;}; 
createDialog "life_admin_menu"