/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
_container = _this select 0;
_player = _this select 1;
_container removeEventHandler ["ContainerClosed",0];
hintSilent "Cargo Box has been wiped and will be deleted shortly.";
_container spawn {sleep 3; deleteVehicle _this;};
