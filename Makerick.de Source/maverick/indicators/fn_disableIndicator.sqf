scriptName "fn_disableIndicator";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_disableIndicator.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_disableIndicator.sqf"

_vehicle = param[0,objNull,[objNull]];

// Ex
if (isNull _vehicle) exitWith {};

// Kill thread
if (!isNil "mav_indicators_enginethread") then {
	//terminate mav_indicators_enginethread;
};

// Delete lightpoints
{
	_var = _x;
	if (!isNil {_vehicle getVariable _var}) then {
		{
			deleteVehicle _x;
		} forEach (_vehicle getVariable [_var,[]]);
		_vehicle setVariable [_var, nil];
	};
} forEach ["indicator_left_objects","indicator_right_objects","indicator_warn_objects"];

// Set mode to nil
_vehicle setVariable ["indicator_mode",nil];