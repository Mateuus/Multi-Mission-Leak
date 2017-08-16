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
  ["_player",objNull,[objNull]]
];
if(isNull _player OR {isNil "_player"}) exitWith {};
if(!isPlayer _player) exitWith {};
if(!alive _player) exitWith {};
if(player distance _player > 5) exitWith {};
//if(side _player isEqualTo playerSide) exitWith {};
if(isNil "ShowingID") then {ShowingID = false;};
if(ShowingID) exitWith {};
ShowingID = true;
[] spawn {uiSleep 12;ShowingID = nil;};
_message = [];
_rank = "";
switch(playerSide)do {
  case civilian: {
    _message = PlayerIDArray;
  };
  case west: {
    _rank = getText(missionConfigFile >> "CfgPaychecks" >> str(playerSide) >> "levels" >> format["level_%1",(call life_coplevel)] >> "name");
    _message = [profileName];
    _message pushBack _rank;
  };
  case independent: {
    _rank = getText(missionConfigFile >> "CfgPaychecks" >> str(playerSide) >> "levels" >> format["level_%1",(call life_medicLevel)] >> "name");
    _message = [profileName];
    _message pushBack _rank;
  };
};
[player,_message,playerSide] remoteExecCall ["life_fnc_drame",_player];
