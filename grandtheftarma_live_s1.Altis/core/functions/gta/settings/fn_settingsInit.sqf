/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

//--- View distance loop
["GTA_fnc_initSettings_viewDistance", "onEachFrame", {
  with missionNamespace do {
    //--- Disable
    if !(missionNamespace getVariable ["GTA_settings_viewDistance_enable", true]) exitWith {};

    //--- Camera object
    private _object = vehicle cameraOn;

    //--- Exit if object is null
    if (isNull _object) exitWith {};

    //--- Check if refresh is needed
    if !(_object isEqualTo (missionNamespace getVariable ["GTA_settings_viewDistance_lastObject", objNull])) then {

      //--- Store last object
      GTA_settings_viewDistance_lastObject = _object;

      //--- Get the setting variable name
      private _setting = switch true do {
        case (_object isKindOf "Man"): {"View_Infantry"};
        case (_object isKindOf "Air"): {"View_Air"};
        default {"View_Ground"};
      };

      //--- Get setting value
      _setting = [_setting] call GTA_fnc_getSetting;

      //--- Apply
      setViewDistance (_setting select 0);
      setObjectViewDistance [_setting select 1, _setting select 2];
    };
  };
}] call BIS_fnc_addStackedEventHandler;
