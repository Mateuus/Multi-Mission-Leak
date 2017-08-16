/*
	File: fn_adventsloseask.sqf
	Author: Firly | Division-Wolf.de
	
	Description:
	Öffnet das GUI, wie viele gekauft werden sollen!
*/
private["_preis"];
_preis = 2500;
if(player getVariable["noobschutz",false]) then {
	_preis = 2500;
} else {
	_preis = 20000;
}; 
[format["Wie viel Adventslose möchtest du für %1€ kaufen?", str(_preis)], "DWEV_fnc_adventslose"] call DWEV_fnc_howMuch;