#include <macro.h>
/*
		fn_massTeleport.sqf
		Author: G00olplexian
		
		Description: teleports everyone to you.
*/

if(__GETC__(life_adminlevel) < 3) exitWith {
	closeDialog 0; 
	[] call life_fnc_crashStart;
	_message = format["%1 verwendet unbefugt den Admin-Teleport (wegporten)!", name player];
	[["",_message,player,8],"SOA_fnc_handleMessages",false,false] spawn life_fnc_MP;
};

[position player,name player] remoteExec ["life_fnc_massteleportaction",0];