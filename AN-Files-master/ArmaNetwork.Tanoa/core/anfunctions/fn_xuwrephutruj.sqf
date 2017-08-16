/*
  ArmA.Network
  Rathbone
  Trys selected item from customization selection list
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
_control = _this select 0;
_selection = _this select 1;
_data = _control lbData _selection;
[_data,true] call life_fnc_waxecruwuka;
if(!(ctrlEnabled 3400)) then {
  ctrlEnable [3400, true];
};
