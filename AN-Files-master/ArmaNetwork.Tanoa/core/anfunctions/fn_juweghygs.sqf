/*
  ArmA.Network
  Pydrex
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
_IsAdmin = ((call life_adminlevel) > 0);
if(playerSide isEqualTo west || playerSide isEqualTo independent) exitWith {createDialog "Life_my_smartphone";};
if(!("Mattaust_Phone" in assigneditems player || "Mattaust_Phone" in items player || _IsAdmin)) exitWith {hintSilent "You don't have your phone on you";};
createDialog "Life_my_smartphone";
