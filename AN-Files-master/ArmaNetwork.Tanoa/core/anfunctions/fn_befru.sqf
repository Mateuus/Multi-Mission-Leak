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
  ["_giveCashPlayer",objNull,[objNull]]
];
if(isNull _giveCashPlayer OR {isNil "_giveCashPlayer"} OR {!alive _giveCashPlayer}) exitWith {};
createDialog "give_money";
disableSerialization;
_display = findDisplay 57633;
(_display displayCtrl 1001) ctrlSetText "Give Cash";
(_display displayCtrl 1400) ctrlSetText "0";
(_display displayCtrl 1100) ctrlSetStructuredText parseText format ["<t size='1.3' valign='middle'>Cash on Hand: $%1</t>",[an_cash] call life_fnc_rupadudejat];
