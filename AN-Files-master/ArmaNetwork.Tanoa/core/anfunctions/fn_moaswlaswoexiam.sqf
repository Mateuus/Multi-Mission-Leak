/*
  ArmA.Network
  Rathbone
  Accept selected Job
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
if(lbCurSel 1500 isEqualTo -1) exitWith {};
_data = lbData[1500,(lbCurSel 1500)];
_data = call compile format["%1",_data];
closeDialog 0;
[player,_data] remoteExec ["life_fnc_acceptJob",2];
