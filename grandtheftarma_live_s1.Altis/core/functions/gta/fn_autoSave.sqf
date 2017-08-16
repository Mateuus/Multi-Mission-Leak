/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

while { true } do {

	sleep ( 60 * ( 10 + ( random 10 ) ) );

	if ( !( player getVariable [ "incapacitated", false ] ) ) then {

		[ "Auto save." ] call GTA_fnc_log;
		[] spawn GTA_fnc_updatePlayer;

	};

};
