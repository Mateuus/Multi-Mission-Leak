/*
  	ArmA.Network
  	Author: Rathbone
	Copyright (c) ArmA.Network 2015 - 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
if !(playerSide isEqualTo civilian) exitWith
{
	SideInfo = true;
};

if (life_gangData isEqualTo []) exitWith
{
	diag_log "Gang Data - Corrupt";
};

[player,profileName,(getPlayerUID player),life_gangData] remoteExec ["life_fnc_getGang",2];
