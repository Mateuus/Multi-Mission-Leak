/*
@Version: 0.3
@Author: =IFD= Cryptonat
@Edited: 5/16/14

Description:
Saves the player's gear every 10 minutes.
*/
while {true} do {
  sleep 600;
  [] call SOCK_fnc_updateRequest;
  hint "Game Autosaved."
};
  
