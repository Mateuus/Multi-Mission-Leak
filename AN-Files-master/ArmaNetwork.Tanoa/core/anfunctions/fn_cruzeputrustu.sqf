/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
if((call life_coplevel) < 1) exitWith {};
_uniform = "";
_uniform = switch(call life_coplevel)do {
  case 1: {"AN_TSO_CADET"};
  case 2: {"AN_TSO_DEPUTY"};
  case 3: {"AN_TSO_CORP"};
  case 4: {"AN_TSO_SERG"};
  case 5: {"AN_TSO_LT"};
  case 6: {"AN_TSO_CPT"};
  case 7: {"AN_TSO_CHIEF"};
  case 8: {"AN_TSO_USHERIFF"};
  case 9: {"AN_TSO_SHERIFF"};
  default {};
};
if(_uniform isEqualTo "") exitWith {};
_uniform
