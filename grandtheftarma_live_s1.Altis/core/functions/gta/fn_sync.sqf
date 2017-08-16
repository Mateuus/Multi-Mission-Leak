/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

if ( isNil "GTA_fnc_sync_last" || { diag_tickTime - 300 >= GTA_fnc_sync_last } ) then {

	//--- Sync
	[] call GTA_fnc_updatePlayer;
	hint localize "STR_Session_SyncData";

	//--- Set lasy sync
	GTA_fnc_sync_last = diag_tickTime;

} else {

	hint localize "STR_Session_SyncdAlready";

};
