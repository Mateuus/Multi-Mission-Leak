/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Force sync from admins
*/
private["_type","_tempVal"];

if(!DS_player_setup)exitwith{};
if(isServer)exitwith{};
[] call DS_fnc_compileData;