/*
  ArmA.Network
  Permission only given to ArmA.Network to use this.
  Author: R4thbone
*/
private["_display","_progress","_text","_cpRate"];

createDialog "loading_screen";

disableSerialization;
_display = findDisplay 98342;
_progress = _display displayCtrl 1800;
_text = _display displayCtrl 1000;
_text ctrlSetText "Loading Information...";
_progress progressSetPosition 0.01;
_cpRate = 0.40;

while {true} do {
  sleep 0.3;
  _cpRate = _cpRate + 0.10;
  _progress progressSetPosition _cpRate;
  if(_cpRate >= 1) exitWith {};
};

closeDialog 0;

life_session_loading = true;
