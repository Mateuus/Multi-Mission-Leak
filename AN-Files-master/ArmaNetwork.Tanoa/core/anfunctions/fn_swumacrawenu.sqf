#include <macro.h>
/*
	File: fn_licenseCheck.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Returns the licenses to the cop.
*/
private["_cop","_licenses","_licensesConfigs"];
_cop = param[0,ObjNull,[ObjNull]];
if(isNull _cop) exitWith {};
_licenses = "";
{
	if(missionNamespace getVariable [format["license_%1",configName _x],false]) then {
		_licenses = _licenses + localize getText(_x >> "displayName") + "<br/>";
	};
} forEach ("true" configClasses (missionConfigFile >> "Licenses"));
if(_licenses isEqualTo "") then {_licenses = (localize "STR_Cop_NoLicensesFound");};
[profileName,_licenses] remoteExecCall ["life_fnc_tejawutramaf",_cop];
