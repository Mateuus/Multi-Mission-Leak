scriptName "fn_init";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_init.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_init.sqf"

[] spawn {
	waitUntil {!isNull (findDisplay 46)};
	mav_indicator_lasttick = -999999;

	// Key handler
	(findDisplay 46) displayAddEventHandler ["KeyDown", {
		// Check if the player is in a vehicle and the driver
		if (player == vehicle player) exitWith {false};
		if ((driver (vehicle player)) != player) exitWith {false};

		// Check if its any key that actually does something in this script
		if !((_this select 1) in [16,18,34]) exitWith {};

		// Anti network spam measure
		if (diag_tickTime - mav_indicator_lasttick < 1) exitWith {false};
		mav_indicator_lasttick = diag_tickTime;

		// Cases
		if ((_this select 1) == 16) exitWith {
			[vehicle player, "left"] remoteExec ["mav_indicator_fnc_enableIndicator"];
		};
		if ((_this select 1) == 18) exitWith {
			[vehicle player, "right"] remoteExec ["mav_indicator_fnc_enableIndicator"];
		};
		if ((_this select 1) == 34) exitWith {
			[vehicle player, "warn"] remoteExec ["mav_indicator_fnc_enableIndicator"];
		};
	}];
};