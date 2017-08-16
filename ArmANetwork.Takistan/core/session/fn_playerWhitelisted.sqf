/*
ArmA.Network
*/
_mode = param [0,-1];

switch(_mode) do {
  case 0: {["WhitelistedPlayer",true,false] call BIS_fnc_endMission;};
  case 1: {life_player_whitelisted = true;};
};
