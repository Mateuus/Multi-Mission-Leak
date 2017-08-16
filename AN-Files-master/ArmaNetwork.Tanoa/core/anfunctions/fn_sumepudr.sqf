/*
  ArmA.Network
  Rathbone
  Closes Locker & Sends Details to Server to finalize
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
(findDisplay 6000) displayRemoveAllEventHandlers "keyDown";
closeDialog 0;
if(count LockerInventory > 0) then {[0,LockerInventory,(getPlayerUID player)] remoteExecCall ["life_fnc_lockerUpdate",2];};
LockerInventory = nil;
RentTime = nil;
