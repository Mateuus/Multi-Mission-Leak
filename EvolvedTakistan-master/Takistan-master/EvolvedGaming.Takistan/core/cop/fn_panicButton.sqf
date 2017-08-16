#include <macro.h>
/*
	File: fn_panicButton.sqf
	Script file made by: Maximum
	Idea based off: Liemans script - did way to much to achieve the same thing.
	Description: Lets a officer request backup VIA scroll menu, made for AltisLifeRPG.com
	Edit: blaster
*/
private ["_backupmsg"];
if(life_backup) exitWith {hint "Please try your call again later."};

life_backup = true;
[[0,"STR_NOTF_panic",true,[profileName,mapGridPosition player]],"life_fnc_broadcast",west,false] call life_fnc_MP;
[[getPos player,name player],"life_fnc_panicButtonMarkers",west,false] call life_fnc_MP;

sleep 320;
//hint format ["%1 You can now call for backup again",name player];
life_backup = false;