/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
params [
  ["_playerToGive",objNull,[objNull]]
];
if(isNull _playerToGive OR {isNil "_playerToGive"}) exitWith {};
if(_playerToGive isEqualTo player) exitWith {};
if(player distance _playerToGive > 5) exitWith {};
createDialog "give_items";
disableSerialization;
_display = findDisplay 57632;
(_display displayCtrl 1001) ctrlSetText "Give Items";
call life_fnc_vuste;
