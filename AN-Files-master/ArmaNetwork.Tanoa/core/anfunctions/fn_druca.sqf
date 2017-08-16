/*
  ArmA.Network
  RageBone && Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
private["_sender"];
disableSerialization;
_display = findDisplay 88888;
_cMessageList = _display displayCtrl 88882;
_data = call compile (_cMessageList lnbData[lnbCurSelRow _cMessageList,0]);
_senderID = _data select 0;
{
  if(_senderID isEqualTo getPlayerUID _x) exitWith {_sender = _x;};
} forEach (allPlayers - entities "HeadlessClient_F");
_sender
