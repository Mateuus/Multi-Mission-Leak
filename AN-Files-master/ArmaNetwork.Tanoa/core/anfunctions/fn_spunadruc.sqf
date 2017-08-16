/*
  ArmA.Network
  Rathbone
  Handles Icon Dynamically
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
private["_display","_icon"];
params [
  ["_state",false,[true]],
  ["_number",-1,[0]]
];
if(_number isEqualTo -1) exitWith {};
disableSerialization;
_display = uiNamespace getVariable "playerHUD";
_icon = _display displayCtrl _number;
_icon ctrlShow _state;
