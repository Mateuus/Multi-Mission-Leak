#include <macro.h>
private["_cop","_licenses"];
_cop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {};
_licenses = "";
_licensesConfigs = "getText(_x >> 'side') isEqualTo 'civ'" configClasses (missionConfigFile >> "Licenses");
{
	if(LICENSE_VALUE(configName _x,"civ")) then {
		ADD(_licenses,localize getText(_x >> "displayName") + "<br/>");
	};
} foreach _licensesConfigs;
if(_licenses == "") then {_licenses = (localize "STR_Cop_NoLicensesFound");};
[[profileName,_licenses],"life_fnc_licensesRead",_cop,FALSE] spawn life_fnc_MP;