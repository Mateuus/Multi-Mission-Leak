scriptName "fn_getMasterConfig";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_getMasterConfig.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_getMasterConfig.sqf"

_type = param[0,"",[""]];
_ret = "";
if (isClass(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _type)) then {
	_ret = _type;
} else {
	{
		if (isClass(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _x)) exitWith {
			_ret = _x;
		};
	} forEach ([(configFile >> "CfgVehicles" >> _type), true] call BIS_fnc_returnParents);
};

_ret