/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Initializes a local player
*/
//[] execVM "scripts\zlt_fastrope.sqf";
//didJIP (Player joined while mission was in progress)

_didJIP = _this select 1;
[] execVM "setUpPlayer.sqf";
[] execVM "player\no_side_chat.sqf";