#include <macro.h>
/*
	fn_hideMe.sqf
	Author: Kevin Webb
	
	Description: For dat undercover work!
*/
if(__GETC__(life_adminlevel) < 5) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

if(player getVariable["invis",false]) then {
	[[player],"life_fnc_adminInvisReveal",false,false] spawn life_fnc_MP;
	player setVariable["invis",false,true];
	player allowDamage true;
	hint "Visible state returned to normal.";
	[[3,format["This is a message only to the admins: %1 has removed his cloak of invisibility!",profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
} else {
	[[player],"life_fnc_adminInvisHide",false,false] spawn life_fnc_MP;
	player setVariable["invis",true,true];
	player allowDamage false;
	hint "Invisibility Activated!";
	[[3,format["This is a message only to the admins: %1 has donned his cloak of invisibility!",profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
};