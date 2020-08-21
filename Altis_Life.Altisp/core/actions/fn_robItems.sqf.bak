/*
	File: fn_robItems.sqf
	
	Description:
	Starts the robbing process?
*/
private["_target"];
_target = cursorObject;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};

uiSleep 1;
cursorObject unassignItem "ItemMap";
cursorObject removeItem "ItemMap";
cursorObject unassignItem "ItemGPS";
cursorObject removeItem "ItemGPS";
cursorObject unassignItem "ItemRadio";
cursorObject removeItem "ItemRadio";
hint "Telefon/GPS został skonfiskowany";