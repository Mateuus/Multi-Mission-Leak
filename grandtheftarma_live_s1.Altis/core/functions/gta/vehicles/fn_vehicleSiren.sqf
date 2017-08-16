/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

#define SIREN_LENGTH 5.6

if (!hasInterface) exitWith {};
if (isNil "_thisScript") exitWith {_this spawn (currentNamespace getVariable _fnc_scriptName)};
params [
  ["_vehicle", objNull, [objNull]],
  ["_active", true, [true]]
];

//--- Error checks
if (isNull _vehicle) exitWith {};

if (_active) then {
  //--- Enable
  _vehicle setVariable ["siren", true];

  //--- Loop
  if (isNull (_vehicle getVariable ["GTA_fnc_vehicleSiren_loop", scriptNull])) then {
    private _loop = [_vehicle] spawn {
      params ["_vehicle"];
      private _delta = time;

      while {
        !isNull _vehicle
        && {_vehicle getVariable ["siren", false]}
        && {alive _vehicle}
        && {!isNull driver _vehicle}
      } do {
        //--- Sound
        if (cameraOn distance _vehicle <= 800) then {
          _vehicle say3D "SirenLong";
        };
        
        //--- Wait
        sleep SIREN_LENGTH - (time - _delta);
        _delta = time;
      };

      //--- Disable siren
      _vehicle setVariable ["siren", false];
    };

    //--- Store the loop handle
    _vehicle setVariable ["GTA_fnc_vehicleSiren_loop", _loop];
  };
} else {
  //--- Disable
  _vehicle setVariable ["siren", false];
};
