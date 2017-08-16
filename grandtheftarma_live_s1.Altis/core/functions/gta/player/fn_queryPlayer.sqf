/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

if ( GTA_player_received ) exitWith {};

//--- Send request to server
[ [ getPlayerUID player, player, playerSide ], "GTA_db_fnc_queryPlayer", false ] call GTA_fnc_remoteExec;
