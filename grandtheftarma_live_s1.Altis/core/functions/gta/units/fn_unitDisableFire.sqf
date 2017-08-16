/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [["_unit", player, [objNull]], ["_duration", true, [true, 0]]];

if (!local _unit) exitWith {
  [[_unit, _duration], _fnc_scriptName, _unit] call GTA_fnc_remoteExec;
};

if (typeName _duration == typeName 0) then {
  //--- Timed duration
  _duration spawn {
    GTA_disableFire = true;
    uiSleep _this;
    GTA_disableFire = false;
  };
} else {
  //--- Set
  GTA_disableFire = _duration;
};
