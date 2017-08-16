scriptName "functions_recoilCompensation_2";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: functions_recoilCompensation_2.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "functions_recoilCompensation_2.sqf"

_ownsDependency = [life_currentExpPerks, "perk_gunsspecialist_lessRecoil_3"] call mav_ttm_fnc_hasPerk;

if (!_ownsDependency) then {
	player setUnitRecoilCoefficient .9;

		player addEventHandler ["Respawn", {
		player setUnitRecoilCoefficient .9;
	}];
};