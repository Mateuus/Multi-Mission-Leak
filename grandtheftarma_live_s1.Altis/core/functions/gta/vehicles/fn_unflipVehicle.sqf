/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [
  ["_vehicle", objNull, [objNull]]
];

//--- Action
if ([15, "Unflipping Vehicle", nil, {!isNull _this && {[player, _this, 2] call GTA_fnc_boundingCollision}}, _vehicle] call GTA_fnc_action) then {
  [_vehicle] remoteExecCall ["GTA_fnc_resetVehicleVector", _vehicle];

  //--- Add fatigue
  player setFatigue (getFatigue player + 0.7);
};
