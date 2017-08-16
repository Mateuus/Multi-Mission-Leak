scriptName "fn_checkUnit";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_checkUnit.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_checkUnit.sqf"

_unitThatDealtDamage = param[0,objNull,[objNull]];

if (_unitThatDealtDamage == player OR _unitThatDealtDamage == (vehicle player)) then {
	if ((str playerSide) in (getArray(missionConfigFile >> "Maverick_ConvoySidemission" >> "Config" >> "SidesNotAttackable"))) exitWith {};
	if (isNil "mav_convoy_attackme_scriptthread") then {
		[] spawn mav_convoy_fnc_attackMe;
	};
};