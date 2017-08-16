/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

#include "defineRscIncDesign.inc"
#define SELF GTA_RscDisplayAction_script

#define VAR_START GTA_RscDisplayAction_start
#define VAR_DURATION GTA_RscDisplayAction_duration
#define VAR_ACTION GTA_RscDisplayAction_action
#define VAR_PARAMS GTA_RscDisplayAction_params
#define VAR_CONDITION GTA_RscDisplayAction_condition
#define VAR_RESULT GTA_RscDisplayAction_result

private ["_mode", "_params"];
_mode = _this select 0;
_params = _this select 1;

switch _mode do {
  case "onLoad": {
    private _display = _params select 0;
    _display displayAddEventHandler ["KeyDown", {["onKeyDown", _this] call SELF}];

    _ctrlTextAction = _display displayCtrl IDC_RSCDISPLAYACTION_TEXTACTION;
    _ctrlTextAction ctrlSetText toUpper VAR_ACTION;

    VAR_START = diag_tickTime;
    private _pfh = addMissionEventHandler ["EachFrame", {["pfh", [_display]] call SELF}];
    _display setVariable ["pfh", _pfh];
  };

  case "onUnload": {
    _params params ["_display", "_exitCode"];
    removeMissionEventHandler ["EachFrame", _display getVariable ["pfh", -1]];

    VAR_RESULT = _exitCode == 1;
  };

  case "onKeyDown": {
    _params params ["_display", "_key"];

    !(_key == 1
      || {_key in actionKeys "PushToTalk"}
      || {_key in actionKeys "VoiceOverNet"}
      || {_key in actionKeys "PushToTalkDirect"}
      || {_key in actionKeys "PrevChannel"}
      || {_key in actionKeys "NextChannel"}
      || {_key in actionKeys "Chat"})
  };

  case "pfh": {
    disableSerialization;
    private _display = ["GTA_RscDisplayAction"] call GTA_fnc_getDisplay;
    private _ctrlProgress = _display displayCtrl IDC_RSCDISPLAYACTION_PROGRESS;
    private _ctrlTextProgress = _display displayCtrl IDC_RSCDISPLAYACTION_TEXTPROGRESS;

    if (GTA_actionInterrupt
      || {player getVariable ["tased", false]}
      || {!alive player}
      || {player getVariable ["restrained", false]}
      || {player != vehicle player}
      || {!(VAR_PARAMS call VAR_CONDITION)}
      || {animationState player == "unconscious"}
      || {player getVariable ["unconscious", false]}) exitWith {_display closeDisplay 2};

    private _progress = (100 * (diag_tickTime - VAR_START)) / VAR_DURATION;
    _progress = _progress min 100;

    //--- Set progress
    _ctrlProgress progressSetPosition (_progress / 100);
    _ctrlTextProgress ctrlSetText format ["%1%2", round _progress, "%"];

    if (_progress >= 100) exitWith {
      _display closeDisplay 1;
    };
  };
};
