/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

if (isNil "_thisScript") exitWith {_this spawn (currentNamespace getVariable _fnc_scriptName)};
params [
  ["_unit", objNull, [objNull]],
  ["_sound", true, [true]]
];

//--- Error checks
if (
  isNull _unit
  || {!alive _unit}
  || {_unit getVariable ["incapacited", false]}
  || {_unit getVariable ["tased", false]}
) exitWith {};

_unit setVariable ["tased", true, true];

//--- Close displays
[] call GTA_fnc_closeAllDisplays;

//--- Detach
detach _unit;

//--- Eject
if (vehicle _unit != _unit && {[vehicle _unit, ["Kart_01_Base_F", "Quadbike_01_base_F"]] call GTA_fnc_isKindOf} || {assignedVehicleRole player select 0 == "Turret"}) then {
  moveOut _unit;
  waitUntil {vehicle _unit == _unit};
};

if (vehicle player == player) then {
  //--- Disupt deployment
  if (isWeaponDeployed _unit) then {
    _unit setPosASL getPosASL _unit;
  };

  //--- Animation
  [[_unit, "acts_injuredlyingrifle02"], "switchMove"] call GTA_fnc_remoteExec;
};

//--- Taser sound
if (_sound) then {
  [_unit, "Tazersound", 20] remoteExec ["GTA_fnc_say3D"];
};

//--- Wait
sleep 15;

//--- Reset animation
if (alive _unit && {vehicle _unit == _unit} && {!(_unit getVariable ["incapacitated", false])}) then {
  [[_unit, "AmovPpneMstpSnonWnonDnon"], "switchMove"] call GTA_fnc_remoteExec;
};

_unit setVariable ["tased", nil, true];
