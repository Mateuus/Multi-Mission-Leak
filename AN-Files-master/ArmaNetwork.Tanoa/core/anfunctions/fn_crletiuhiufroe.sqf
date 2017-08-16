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
_container removeAllEventHandlers "ContainerOpened";
_canAccess = false;
_perm = (_container getVariable ["PlayerOwner",""]);
if(_perm isEqualTo "") exitWith {true};
if(_perm isEqualTo getPlayerUID player) then {_canAccess = true;};
if(!_canAccess) exitWith {_container addEventHandler ["ContainerOpened", "[_this select 0,_this select 1] call life_fnc_crletiuhiufroe"]; systemChat "You can't access this gear"; _player action ["Gear",objNull]; true;};
_container addEventHandler ["ContainerClosed","[_this select 0,_this select 1] call life_fnc_xiuthlefrluwoe"];
