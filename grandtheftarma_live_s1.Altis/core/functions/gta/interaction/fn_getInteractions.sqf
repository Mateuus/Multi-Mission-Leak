/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private ["_object", "_interactions"];
_object = [_this, 0, objNull, [objNull]] call GTA_fnc_param;

//--- Error checks
if (isNull _object) exitWith {[]};

//--- Get interactions
switch true do {
  //--- Build
  case (_object getVariable ["build", false]): {
    [_object] call GTA_fnc_interactionsBuild;
  };

  //--- Man
  case (_object isKindOf "Man"): {
    [_object] call GTA_fnc_interactionsMan;
  };

  //--- House
  case (_object isKindOf "House_F"): {
    [_object] call GTA_fnc_interactionsHouse;
  };

  //--- Vehicle
  case ([_object, ["Car_F", "Tank_F", "Air", "Ship_F", "Slingload_01_Base_F"]] call GTA_fnc_isKindOf): {
    [_object] call GTA_fnc_interactionsVehicle;
  };

  default {[]};
};
