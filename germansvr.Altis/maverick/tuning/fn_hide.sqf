scriptName "fn_hide";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_hide.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_hide.sqf"

_veh = param[0,objNull,[objNull]];
_show = param[1,false,[false]];

if (isNull _veh) exitWith {};

if (_show) exitWith {
	// Hide
	_veh hideObjectGlobal false;
	{
		_x hideObjectGlobal false;
	} forEach (crew _veh);

	// Enable damage
	_veh allowDamage true;
};

// Hide
_veh hideObjectGlobal true;
{
	_x hideObjectGlobal true;
} forEach (crew _veh);

// Disable damage
_veh allowDamage false;