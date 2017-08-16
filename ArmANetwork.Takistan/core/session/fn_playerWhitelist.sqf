/*
ArmA.Network
*/
if(life_player_whitelisted) exitWith {};
[getPlayerUID player,player,profileName] remoteExecCall ["life_fnc_isPlayerWhitelisted",2];
