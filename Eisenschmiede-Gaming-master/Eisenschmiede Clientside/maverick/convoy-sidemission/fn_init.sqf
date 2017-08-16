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
	// Do not run this script on the client
	if (!isServer) exitWith {};

	// Spawn looper
	mav_convoy_missiongenerator_scriptthread = [] spawn {
		mav_convoy_missiongenerator_loop = true;

		// Fetch sleep delay from config
		_delay = getNumber(missionConfigFile >> "Maverick_ConvoySidemission" >> "Config" >> "SleepTime");
		while {mav_convoy_missiongenerator_loop} do {
			// Sleep
			sleep _delay;

			// Select random convoy from config
			_convoyClassname = (getArray(missionConfigFile >> "Maverick_ConvoySidemission" >> "Config" >> "ConfigPool")) call BIS_fnc_selectRandom;

			// Start convoy and wait for it to be done
			mav_convoy_currentsessiondone = false;
			[_convoyClassname] spawn mav_convoy_fnc_startConvoy;
			waitUntil {mav_convoy_currentsessiondone};
		};
	};
};