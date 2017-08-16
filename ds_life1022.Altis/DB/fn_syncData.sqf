/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Syncs the player's data
*/

if(!DS_canSync)exitWith{hint "You have already used this within the last 10 minutes, please wait...";};

[true] call DS_fnc_compileData;

hint "Syncing your data, be sure to wait at least 20 seconds before logging out";

[] spawn {
	DS_canSync = false;
	sleep 600;
	DS_canSync = true;
};