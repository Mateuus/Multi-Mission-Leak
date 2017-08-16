/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
private ["_weaponLocker"];
params [
  ["_vehicle",objNull,[objNull]]
];
_dank = 1;
if(isNull _vehicle) exitWith {};
if(playerSide isEqualTo west && {_vehicle isKindOf "Car"}) then {
  _weaponLocker = _vehicle getVariable "WeaponLocker";
  if!(_weaponLocker isEqualType []) exitWith {};
  if((call life_swatlevel) > 0) then {
    _weaponLocker pushBack [format["swatloadout_%1",(call life_swatlevel)],2];
    _vehicle setVariable ["WeaponLocker",_weaponLocker,true];
  };
};

if(playerSide isEqualTo independent) then {
  _weaponLocker = _vehicle getVariable "WeaponLocker";
  if!(_weaponLocker isEqualType []) exitWith {};
  if((call life_mediclevel) > 2) then {
    _weaponLocker pushBack [format["medicloadout_%1",_dank],2];
  };
  _vehicle setVariable ["WeaponLocker",_weaponLocker,true];
};
