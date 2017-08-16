/*
	File: fn_adminSync.sqf
	Author: Shawn "Huntah" Macgillivray
 
	Description: Syncs all players data
*/
hint "Syncing all players data";
[[],"DS_fnc_massSync",true,false] spawn BIS_fnc_MP;
