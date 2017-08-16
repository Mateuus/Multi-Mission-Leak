/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_unit", "_anim", "_stance" ];
_unit = [ _this, 0, objNull, [objNull] ] call GTA_fnc_param;
_anim = toLower animationState _unit;
_stance = stance _unit;

//--- Compile the animation name
format [ "AmovP%1M%2S%3W%4D%5",

  [ "erc", "knl", "pne" ] select ( [ "STAND", "CROUCH", "PRONE" ] find _stance) max 0,
  [ "stp", "run" ] select ( vectorMagnitude velocity _unit > 1 ),
  [ [ "ras", "low" ] select weaponLowered _unit, "non" ] select ( currentWeapon _unit == "" ),
  [ "non", "rfl", "lnr", "pst", "bin" ] select ( [ "", primaryWeapon _unit, secondaryWeapon _unit, handgunWeapon _unit, binocular _unit ] find currentWeapon _unit ) max 0,
  "non"

]
