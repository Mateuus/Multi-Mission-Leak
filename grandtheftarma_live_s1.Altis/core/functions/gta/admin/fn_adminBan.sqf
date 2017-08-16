/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

//--- Check if ban is available
if ( !serverCommandAvailable "#exec ban" || !isMultiplayer ) exitWith { false };

private "_player";
_player = [ _this, 0, objNull, [objNull,0] ] call GTA_fnc_param;

//--- Exit if object is not player
if ( isNull _player || { isPlayer _player } ) exitWith { false };

//--- Execute ban command
serverCommand format [ "#exec ban '%1'", getPlayerUID _player ];

true
