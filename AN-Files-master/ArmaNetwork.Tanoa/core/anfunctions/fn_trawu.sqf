/*
  ArmA.Network
  Rathbone
  Handles Vehicle Lock for Interaction Menu
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
params [
  ["_lock",-1,[0]],
  ["_vehicle",objNull,[objNull]]
];
if(_lock isEqualTo -1 OR {isNull _vehicle}) exitWith {};
if(_lock isEqualTo 0) then {
  if(local _vehicle) then {
    _vehicle lock 0;
  } else {
    [_vehicle,0] remoteExecCall ["life_fnc_lockVehicle",_vehicle];
  };
  ["UnlockVehicle"] call life_fnc_notificationHandler;
  [player,"unlock",15] remoteExecCall ["life_fnc_quvucamaph",-2];
} else {
  if(local _vehicle) then {
    _vehicle lock 2;
  } else {
    [_vehicle,2] remoteExecCall ["life_fnc_lockVehicle",_vehicle];
  };
  ["LockVehicle"] call life_fnc_notificationHandler;
  [player,"lock",15] remoteExecCall ["life_fnc_quvucamaph",-2];
};
