/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

//--- Validate session
if !( [ _this ] call GTA_fnc_validateSession ) exitWith {};

private [ "_freeze" ];
_freeze = [ _this, 0, true, [true] ] call GTA_fnc_param;

//--- Set player's frozen status
[ player, "frozen", _freeze ] call GTA_fnc_setVariable;

//--- Disable user input
disableUserInput _freeze;
