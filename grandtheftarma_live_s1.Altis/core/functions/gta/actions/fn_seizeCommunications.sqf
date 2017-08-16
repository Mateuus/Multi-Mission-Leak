/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

{

	//--- Check type
	if ( _x in [ "ItemRadio", "ItemGPS", "B_UavTerminal", "O_UavTerminal", "I_UavTerminal" ] ) then {

		//--- Remove
		player unassignItem _x;
		player removeItem _x;

	};

} forEach ( assignedItems player + items player );

//--- Close the messaging display
[ "GTA_RscDisplayMessaging", 1 ] call GTA_fnc_closeDisplay;

//--- RP hint
hint parseText localize "STR_GTA_ACTIONS_SEIZECOMMUNICATIONS_HINT";

//--- Broadcast
[ [ 0, [ "STR_GTA_ACTIONS_SEIZECOMMUNICATIONS", profileName ] ], "GTA_fnc_broadcast" ] call GTA_fnc_remoteExec;
