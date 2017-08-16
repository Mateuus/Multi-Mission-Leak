#include <macro.h>
/*
	File: fn_adminGodMode.sqf
	Author: Tobias 'Xetoxyc' Sittenauer
 
	Description: Enables God mode for Admin
*/

if(__GETC__(life_adminlevel) < 2) exitWith {
	closeDialog 0; 
	[] call life_fnc_crashStart;
	_message = format["%1 verwendet unbefugt den Admin-GodMode!", name player];
	["",_message,player,8] remoteExecCall ["SOA_fnc_handleMessages",2];
};

if(__GETC__(life_adminlevel < 3)) then {
	createDialog "checkAdmin";
	WaitUntil{isnull (finddisplay 8600)};
};

if(life_god) then {
	life_god = false;
	80 cutFadeout 1;
	player allowDamage true;
	vehicle player allowDamage true;
	
	[name player, "hat die Gottmode-Funktion deaktiviert!",call life_adminlevel,7] remoteExecCall ["life_fnc_logdat",2];
} else {

	life_god = true;
	80 cutRSC ["godmode","PLAIN",1];
	player allowDamage false;
	player setdamage 0;
	vehicle player setfuel 1;
	vehicle player setvehicleammo 1;
	vehicle player setdamage 0;
	vehicle player allowDamage false;
	life_thirst = 1000;
	life_hunger = 1000;
	life_toilet = 0;
	life_zustand = "Gesund";
	[] call life_fnc_hudupdate;
	
	[name player, "hat die Gottmode-Funktion aktiviert!",call life_adminlevel,7,"",admingrund] remoteExecCall ["life_fnc_logdat",2];
};