/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

disableSerialization;

with missionNamespace do {
  params [
    ["_params", []],
    ["_class", "", [""]],
    ["_single", false, [true]]
  ];
   _params params ["_display"];

  //--- Prevent duplicate displays
  if (_single && {!isNull ([_class] call GTA_fnc_getDisplay)}) exitWith {
    _display closeDisplay 1;
  };

  //--- Variables
  private _varScript = _class + "_script";
  private _varInit = _class + "_init";

  //--- onUnload
  _display displayAddEventHandler ["Unload", format ["
    ['onUnload', _this] call %1;
    missionNamespace setVariable ['%2', nil];
  ", _varScript, _varInit]];

  //--- Store dispaly in uiNamespace
  uiNamespace setVariable [_class, _display];

  //--- Effects
  [_display, _class] call BIS_fnc_guiEffectTiles;

  //--- Declare init var
  missionNamespace setVariable [_varInit, false];

  //--- Call
  ["onLoad", _params] call ( missionNamespace getVariable _varScript );

  //--- Initialized
  missionNamespace setVariable [_varInit, true];
};
