#include <macro.h>
/*
	File: fn_RestrictSlingLoad.sqf
	Author: Paul "Jerico" Smith
	
	Description:
	Disables a vehicle from being Sling Loaded.
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

//diag_log format[ "Checking %1 rope attach", typeOf _vehicle];
if(typeOf _vehicle in (__GETC__(Amarok_RestrictSling))) then
{
	//diag_log format[ "Setting %1 Rope Attach to False", typeOf _vehicle];
	_vehicle enableRopeAttach false;
};