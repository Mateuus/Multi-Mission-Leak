/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

if (!hasInterface) exitWith {};

private "_name";
_name = [_this, 0, "", [""]] call GTA_fnc_param;

//--- Error checks
if !([] call GTA_fnc_isMedic) exitWith {};

//--- Show notification
["ReviveIncapacitated", [_name]] call BIS_fnc_showNotification;
