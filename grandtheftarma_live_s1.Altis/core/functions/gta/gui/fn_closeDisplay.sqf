/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

disableSerialization;
private ["_class", "_exitCode", "_display"];
_class = [_this, 0, "", [""]] call GTA_fnc_param;
_exitCode = [_this, 1, 1, [0]] call GTA_fnc_param;

//--- Error checks
if (_class == "") exitWith { false };

//--- Get the display
_display = [_class] call GTA_fnc_getDisplay;

//--- Close display if exists
if (!isNull _display) then {
  _display closeDisplay _exitCode;
};

true
