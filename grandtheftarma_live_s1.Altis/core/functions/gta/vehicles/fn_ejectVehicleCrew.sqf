/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [["_vehicle", objNull, [objNull]]];

{
  [_x] call GTA_fnc_ejectVehicleUnit;
} forEach crew _vehicle;
