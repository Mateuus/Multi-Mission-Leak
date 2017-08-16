#include <macro.h>
/*
	File: fn_showLicenses.sqf
	Author: Rafi Quak
	
	Description:
	Sends the licenses to the cop.
*/
private["_licenses","_licensesConfigs","_message","_target"];

_target = cursorTarget;

//Anti spam
if (life_lcTarget == _target && life_lcTime > time + 5) exitWith {};
life_lcTarget = _target;
life_lcTime = time;

//Fuck errors
if( isNull _target) exitWith {hint "Es ist niemand in der Nähe."};
if( !(_target isKindOf "Man")) exitWith {hint "Es ist niemand in der Nähe."};
if( !(alive _target)) exitWith {hint "Es ist niemand in der Nähe."};

_licenses = "";

//Config entries for licenses that are civilian
_licensesConfigs = "getText(_x >> 'side') isEqualTo 'civ'" configClasses (missionConfigFile >> "Licenses");

{
	if(LICENSE_VALUE(configName _x,"civ")) then {
		ADD(_licenses,localize getText(_x >> "displayName") + "<br/>");
	};
} foreach _licensesConfigs;

if(EQUAL(_licenses,"")) then {_licenses = (localize "STR_Cop_NoLicensesFound");};
[[profileName,_licenses,player],"life_fnc_licensesRead",_target,FALSE] call life_fnc_MP;
hint "Du hast deine Lizenzen gezeigt.";
