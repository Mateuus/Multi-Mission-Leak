/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
_vehicle = param [0,objNull,[objNull]];
_price = param [1,-1,[0]];
if(isNull _vehicle || {_price isEqualTo -1}) exitWith {};
life_vehicles pushBack _vehicle;
player reveal _vehicle;
_dank = 1;
call life_fnc_tleproaviuqiup;
if(playerSide isEqualTo west && {_vehicle isKindOf "Car"}) then {
  _weaponLocker = _vehicle getVariable "WeaponLocker";
  if!(_weaponLocker isEqualType []) exitWith {};
  if((call life_swatlevel) > 0) then {
    _weaponLocker pushBack [format["swatloadout_%1",(call life_swatlevel)],2];
  };
  if((call life_detective) > 0) then {
    _weaponLocker pushBack [format["detective_%1",(call life_detective)],2];
  };
  _vehicle setVariable ["WeaponLocker",_weaponLocker,true];
};

if(playerSide isEqualTo independent) then {
  _weaponLocker = _vehicle getVariable "WeaponLocker";
  if!(_weaponLocker isEqualType []) exitWith {};
  if((call life_mediclevel) > 2) then {
    _weaponLocker pushBack [format["medicloadout_%1",_dank],2];
  };
  _vehicle setVariable ["WeaponLocker",_weaponLocker,true];
};
