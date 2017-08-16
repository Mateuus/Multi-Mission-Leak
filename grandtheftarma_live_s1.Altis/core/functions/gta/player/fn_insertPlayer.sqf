/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

if ( GTA_player_received ) exitWith {};

//--- Send request to server
[ [ getPlayerUID player, player, profileName, GTA_money_cash, GTA_money_bank ], "GTA_db_fnc_insertPlayer", false ] call GTA_fnc_remoteExec;
