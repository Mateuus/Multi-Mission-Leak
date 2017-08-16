/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

//--- Check if kick is available
if ( !serverCommandAvailable "#kick" || !isMultiplayer ) exitWith { false };

private "_player";
_player = [ _this, 0, objNull, [objNull,0] ] call GTA_fnc_param;

//--- Exit if object is not player
if ( isNull _player || { isPlayer _player } ) exitWith { false };

//--- Execute kick command
serverCommand format [ "#kick '%1'", getPlayerUID _player ];

true
