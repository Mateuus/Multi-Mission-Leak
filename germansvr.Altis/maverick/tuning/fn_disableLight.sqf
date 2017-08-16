scriptName "fn_disableLight";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_disableLight.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_disableLight.sqf"

_v = param[0,objNull,[objNull]];

deleteVehicle (_v getVariable ["mav_tuning_light",objNull]);