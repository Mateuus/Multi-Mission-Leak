#include "..\..\script_macros.hpp"
/*
	File: fn_freezePlayer.sqf
	Author: ColinM9991

	Description: Freezes selected player
*/
private["_admin"];
_admin = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(life_frozen) then {
	hint  "Ein Admin hat dich wieder aufgetaut";
	disableUserInput false;
	life_frozen = false;
} else {
	hint  "Du wurdest von einem Admin eingefroren";
	disableUserInput true;
	life_frozen = true;
};
