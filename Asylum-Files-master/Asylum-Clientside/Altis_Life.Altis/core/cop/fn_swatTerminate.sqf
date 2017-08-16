/*
	File: fn_swatTerminate.sqf
	Author: John "Paratus" VanderZwet
	
	Description: SWAT leader has chosen to deactivate.
*/

if (!life_activeSWAT) exitWith {};
if (life_roleSWAT != 2) exitWith {};

_handle = [format["<t align='center'>Are you sure you want to deactivate SWAT?</t>"]] spawn life_fnc_confirmMenu;
waitUntil {scriptDone _handle};
if(!life_confirm_response) exitWith {};

[] call life_fnc_swatDeactivate;