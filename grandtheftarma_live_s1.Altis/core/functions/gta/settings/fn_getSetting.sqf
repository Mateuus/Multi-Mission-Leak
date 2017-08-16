/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

if (!params [
  ["_setting", "", [""]]
]) exitWith {};

//--- getVariable parameters
private _default = switch _setting do {
  case ("View_Infantry"): {[1600, 1400, 100, false]};
  case ("View_Ground"): {[1600, 1400, 100, false]};
  case ("View_Air"): {[1600, 1400, 100, false]};
  case ("Audio_EffectsMuted");
  case ("Audio_MusicMuted"): {0.2};
  default {[]};
};

//--- Add prefix to setting name
_setting = "GTA_settings_" + _setting;

//--- Get setting value
profileNamespace getVariable [_setting, _default];
