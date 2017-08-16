#include "..\..\script_macros.hpp"
/*
	File: fn_showLicenses.sqf
	
	Description:
	Sends the licenses to the cop.
*/
private["_licenses","_licensesConfigs","_message","_target"];

_target = cursorTarget;

//Anti spam
if (life_lcTarget == _target && life_lcTime > time + 5) exitWith {};
life_lcTarget = _target;
life_lcTime = time;

_licenses = "";

//Config entries for licenses that are civilian
_licensesConfigs = "getText(_x >> 'side') isEqualTo 'civ'" configClasses (missionConfigFile >> "Licenses");

{
	if(LICENSE_VALUE(configName _x,"civ")) then {
		ADD(_licenses,localize getText(_x >> "displayName") + "<br/>");
	};
} foreach _licensesConfigs;

if(EQUAL(_licenses,"")) then {_licenses = (localize "STR_Cop_NoLicensesFound");};
[profileName,_licenses,player] remoteExecCall ["life_fnc_licensesRead",_target];
hint "Du hast deine Lizenzen gezeigt.";
