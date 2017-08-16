/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [
  ["_object", objNull, [objNull]],
  ["_type", "", [""]],
  ["_product", "Product", [""]],
  ["_format", "%1 Trader", [""]]
];

//--- Error checks
if (isNull _object || {_type == ""}) exitWith {};

//--- Disable simulation and damage
_object enableSimulation false;
_object allowDamage false;

//--- Action
_object addAction [format ["<t color='#9000ff'>[Trade]</t> %1", _product], life_fnc_virt_menu, _type, 1.5, true, true, "", "playerSide == civilian && {_this distance _target <= 4}"];

//--- Laptop texture
if (typeOf _object == "Land_Laptop_unfolded_F") then {
  _object setObjectTexture [0, "textures\laptops\trader.paa"];
};

//--- Nametag
_object setVariable ["nametag_title", format [_format, _product]];
_object setVariable ["nametag_icon", "NPC"];
