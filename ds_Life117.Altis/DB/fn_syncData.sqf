/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Runs the check that someone might be spamming the DB with sync request
*/
if(!DS_canSync) exitWith {hint "You have already used this within the last 5 minutes, please wait....";};
[true] call DS_fnc_compileData;
hint "Syncing your data, be sure to wait at least 20 seconds before logging out";
[] spawn
	{
	DS_canSync = false;
	sleep 300;
	DS_canSync = true;
	};
	