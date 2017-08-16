/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
private["_amount"];
_amount = param [0,"",[""]];
if(_amount isEqualTo "") exitWith {};
if!(_amount isEqualType "") exitWith {};
[_amount,1,0] call life_fnc_sewawruk;
player setVariable["contractAccepted","",true];
deleteMarkerLocal "mrkHitmanTarget";
