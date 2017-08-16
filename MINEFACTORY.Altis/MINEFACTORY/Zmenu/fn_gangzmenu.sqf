/*################################
#	(c) 2016 Minefactory         #
#								 #
#	Author: PierreAmyf      	 #
#	Lizenz: Lizenz.txt Lesen!	 #
################################*/
#include "..\..\script_macros.hpp"

if(FETCH_CONST(life_coplevel) > 0 || FETCH_CONST(life_mediclevel) > 0) exitWith {["Nur fur Zivilisten!"] spawn life_fnc_nachricht;}; 

if(isNil "life_action_gangInUse") then {
	if(isNil {(group player) getVariable "gang_owner"}) then {
		createDialog "Life_Create_Gang_Diag";
	} else {
		[] spawn life_fnc_gangMenu;
	};
};