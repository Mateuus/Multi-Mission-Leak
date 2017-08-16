#include "..\..\script_macros.hpp"
/*
	Shows license to cop/medic
*/
private["_cop","_licenses","_licensesConfigs"];
_cop = param [0,ObjNull,[ObjNull]];
if(isNull _cop) exitWith {}; //Bad entry

_licenses = "";

//Config entries for licenses that are civilian
_licensesConfigs = "getText(_x >> 'side') isEqualTo 'civ'" configClasses (missionConfigFile >> "Licenses");
{
	if (LICENSE_VALUE(configName _x,"civ")) then {
        _licenses = _licenses + localize getText(_x >> "displayName") + "<br/>";
    };
} foreach _licensesConfigs;

if(EQUAL(_licenses,"")) then {_licenses = (localize "STR_Cop_NoLicensesFound");};
[profileName,_licenses] remoteExecCall ["life_fnc_licensesRead",_cop];
hint "Showing your licenses.";