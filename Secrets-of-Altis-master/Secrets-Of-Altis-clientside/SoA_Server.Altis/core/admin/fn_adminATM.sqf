#include <macro.h>
/*
        File: fn_adminAtm.sqf
        Author: ColinM9991
        Description:
*/
if(__GETC__(life_adminlevel) < 1) exitWith {
	closeDialog 0; 
	[] call life_fnc_crashStart;
	_message = format["%1 verwendet unbefugt den Admin-ATM!", name player];
	[["",_message,player,8],"SOA_fnc_handleMessages",false,false] spawn life_fnc_MP;
};
     
while {dialog} do {
        closeDialog 0;
        sleep 0.01;
};
 
sleep 0.1;    
[] call life_fnc_atmmenu;

[name player, "hat die ATM-Funktion aktiviert!",call life_adminlevel,7] remoteExecCall ["life_fnc_logdat",2];