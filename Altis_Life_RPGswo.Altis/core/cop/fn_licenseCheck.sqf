#include "..\..\macros.hpp"
/*
	File: fn_licenseCheck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the licenses to the cop.
*/
private ["_cop","_licenses","_licensesConfigs"];
_cop = param [0,objNull,[objNull]];
if (isNull _cop) exitWith {}; //Bad entry

_licenses = "";

//Config entries for licenses that are civilian
_licensesConfigs = "getText(_x >> 'side') isEqualTo 'civ'" configClasses (missionConfigFile >> "Licenses");

{
    if (LICENSE_VALUE(configName _x,"c")) then {
        _licenses = _licenses + getText(_x >> "displayName") + "<br/>";
    };
} forEach _licensesConfigs;

if (_licenses isEqualTo "") then {_licenses = ("Keine Lizenzen");};

[getMyName,_licenses] remoteExec ["DWEV_fnc_licensesRead",_cop];