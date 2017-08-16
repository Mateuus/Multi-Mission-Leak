/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
if(alive player) exitwith {hint "Lockers are currently disabled due to an issue with them saving"};
if(dialog) exitWith {};
//_vendor = param [0,Objnull,[Objnull]];
//if(isNull _vendor) exitWith {};
if((diag_tickTime - life_combat_lastTick) < 120) exitWith {hintSilent "You're currently in Combat";};
if(lockerOpen) exitwith {hintSilent "You're already opening your locker!"};
lockerOpen = true;
[player,(getPlayerUID player)] remoteExecCall ["life_fnc_lockerDetails",2];
["LookingLocker"] call life_fnc_notificationHandler;
disableUserInput true;
