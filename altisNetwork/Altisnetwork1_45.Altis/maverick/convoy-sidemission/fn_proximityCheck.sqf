scriptName "fn_proximityCheck";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_proximityCheck.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_proximityCheck.sqf"

_vehicle = param[0,objNull,[objNull]];
if (isNull _vehicle) exitWith {};

while {!isNull _vehicle} do {
	sleep 1;
	if (player distance _vehicle < 7.5) then {
		if (isNil "mav_convoy_attackme_scriptthread") then {
			[] spawn mav_convoy_fnc_attackMe;
		};
	};
};