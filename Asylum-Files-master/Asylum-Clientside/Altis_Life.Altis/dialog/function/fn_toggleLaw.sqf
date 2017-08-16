/*
	File: fn_toggleLaw.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Toggle laws from governor menu
*/

_paramID = [_this,0,0,[0]] call BIS_fnc_param;

if (life_configuration select _paramID) then { life_configuration set [_paramID, false]; }
else { life_configuration set [_paramID, true]; };
publicVariable "life_configuration";
[] spawn life_fnc_configChanged;

[] call life_fnc_govMenu;