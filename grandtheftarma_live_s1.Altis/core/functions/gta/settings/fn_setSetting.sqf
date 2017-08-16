/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

if (!params [
  ["_setting", "", [""]]
]) exitWith {};

//--- Check value
private _value = switch _setting do {
  case ("View_Infantry");
  case ("View_Ground");
  case ("View_Air"): {param [1, [_setting] call GTA_fnc_getSetting, [[]], 4]};
  default {param [1, [_setting] call GTA_fnc_getSetting]};
};

//--- Add prefix to setting name
_setting = "GTA_settings_" + _setting;

//--- Save value
profileNamespace setVariable [_setting, _value];
saveProfileNamespace;
