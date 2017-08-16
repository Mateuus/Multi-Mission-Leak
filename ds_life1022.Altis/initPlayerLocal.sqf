/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Initializes a local player
*/

_didJIP = _this select 1;

waitUntil {(!isNull player)&&(player isEqualTo player)};
[] execVM "setUpPlayer.sqf";
[] execVM "player\fn_noSideChat.sqf";