/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [
  ["_building", objNull, [objNull]],
  ["_distance", 5, [0]]
];

//--- Error checks
if (isNull _building) exitWith {0};
if !(_building isKindOf "House_F") exitWith {0};

//--- Get number of doors
private _doorCount = getNumber (configFile >> "CfgVehicles" >> typeOf _building >> "numberOfDoors");

//--- Exit if no doors
if (_doorCount == 0) exitWith {0};

//--- Gather door positions
private _doors = [];
for "_i" from 1 to _doorCount do {
  _doors pushBack (_building modelToWorld (_building selectionPosition format ["door_%1_trigger", _i]));
};

//--- Find the closest
_door = [ASLtoAGL getPosASL player, _doors] call GTA_fnc_nearestPosition;

//--- Retrive the index
if (player distance _door <= _distance) then {
  (_doors find _door) + 1
} else { 0 };
