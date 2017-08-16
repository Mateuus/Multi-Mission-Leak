/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [
  ["_object", objNull, [objNull]],
  ["_type", "", [""]],
  ["_product", "Product", [""]],
  ["_format", "%1 Processing", [""]]
];

//--- Error checks
if (isNull _object || {_type == ""}) exitWith {};

//--- Disable simulation and damage
_object enableSimulation false;
_object allowDamage false;

//--- Action
_object addAction [format ["<t color='#9000ff'>[Process]</t> %1", _product], format ["[""%1""] call GTA_fnc_process", _type], _type, 1.5, true, true, "", "playerSide == civilian && {_this distance _target <= 4}"];

//--- Nametag
_object setVariable ["nametag_title", format [_format, _product]];
_object setVariable ["nametag_subtitle", "Machine"];
_object setVariable ["nametag_icon", "Gear"];
