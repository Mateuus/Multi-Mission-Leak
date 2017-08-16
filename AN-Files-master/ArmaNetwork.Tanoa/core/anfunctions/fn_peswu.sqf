/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
if(lbCurSel 1501 isEqualTo -1) exitWith {hintSilent "You must select a Vehicle!";};
disableSerialization;
_className = lbData[1501,(lbCurSel 1501)];
[player,_className] remoteExecCall ["life_fnc_adminSpawnVehicle",2];
call life_fnc_brefr;
