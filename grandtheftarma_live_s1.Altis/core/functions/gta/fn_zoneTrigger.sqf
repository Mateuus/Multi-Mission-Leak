/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [
  ["_zone", "", [""]],
  ["_entity", objNull, [objNull]],
  ["_entered", true, [true]]
];

if (_zone == "") exitWith {};

//--- Zones
switch _zone do {
  //--- Green
  case "green": {
    if (playerSide == civilian) then {
      if (_entered) then {
        [1, "STR_GTA_ZONES_GREEN_ENTER", ["Warning", "#ff0000"]] call GTA_fnc_broadcast;
      } else {
        [1, "STR_GTA_ZONES_GREEN_LEAVE", ["Notice", "#ff8800"]] call GTA_fnc_broadcast;
      };
    };
  };

  //--- No Fly
  case "no_fly": {
    if (playerSide == civilian && {_entered} && {_entity isKindOf "Helicopter"}) then {
      [1, "STR_GTA_ZONES_NO_FLY", ["Warning", "#ff0000"]] call GTA_fnc_broadcast;
    };
  };

  //--- Oil Rig
  case "oil_rig": {
    if (playerSide == civilian && {_entered} && {_entity isKindOf "Helicopter"} && {effectiveCommander vehicle player == player}) then {
      //--- Warn law enforcement
      private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _entity >> "displayName");
      [[1, ["STR_GTA_ZONES_OIL", _vehicleName], ["Alert", "#ff0000"]], "GTA_fnc_broadcast", west] call GTA_fnc_remoteExec;
    };
  };

  default {};
};
