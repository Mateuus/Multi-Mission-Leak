/*
	File: playCurator.sqf

	Description:
	this will requesting zeus support for given player
	still need some tweaks !

	Author: Blackd0g

*/
closeDialog 0;

Hint "requesting Zeus assignment please wait...";

sleep (random 3);
[[player,(call lhm_adminlevel)],"lhm_fnc_getZeus",false,false] call lhm_fnc_mp;

[["admin",(format["%1 with UID %2 activates ZEUS on the Server",name player,getPlayerUID player])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;