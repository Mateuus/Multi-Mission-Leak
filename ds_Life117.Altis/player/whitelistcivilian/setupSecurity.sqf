/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Sets up a whitelisted civilian
*/
if(isServer)then
	{
	DS_WLLevel = 4;
	};
{ _x setFuelCargo 0; } forEach (nearestObjects [player, ["Land_FS_Feed_F"], 30000]); 
DS_copLevel = 0;
[] call compile PreprocessFileLineNumbers "player\whitelistcivilian\compileSecurity.sqf";
[] call compile PreprocessFileLineNumbers "player\police\compile.sqf";
[] call compile PreprocessFileLineNumbers "player\police\variables.sqf";
//Login checks
//Is the player temp banned
if((getPlayerUID player) in DS_tempBans)exitWith
	{
	player setPos (getMarkerPos "chopDrop");
	["tempBan",false,true] call BIS_fnc_endMission;
	sleep 30;
	};
	
if((!([(name player),"Security"] call KRON_StrInStr))&&(!([(name player),"security"] call KRON_StrInStr))&&(!isServer))then
	{
	player setPos (getMarkerPos "chopDrop");
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
	};
	
if((str(player) in ["wlciv_1","wlciv_2","wlciv_3","wlciv_4","wlciv_5","wlciv_6"]))then
	{
	player setPos (getMarkerPos "chopDrop");
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
	};
/*	
if((str(player) in ["wlciv_7","wlciv_8","wlciv_9"])&&(DS_WLLevel > 2))then
	{
	player setPos (getMarkerPos "chopDrop");
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
	};
	
if((str(player) in ["wlciv_10","wlciv_11","wlciv_12"])&&(DS_WLLevel < 3))then
	{
	player setPos (getMarkerPos "chopDrop");
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
	};
*/
if(DS_WLLevel < 2)exitWith	
	{
	player setPos (getMarkerPos "chopDrop");
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
	};

//Set Unit Variable to admins
if((getPlayerUID player) in DS_adminlist1)then
	{
	player setVariable["DSAdmin",TRUE,TRUE];
	};

//Is player arrested
if(DS_jailed) then
	{
	_time = "30";
	_reason = "Logging out during a jail sentence";
	[player,_time,_reason,true] spawn DS_fnc_jail;
	};
player addRating 9999999;
player setVariable["security",TRUE,TRUE];

[] call DS_sec_securityLoadout;
_wantedUids = [];

[[civilian,player],"HUNT_fnc_setupChat",false,false] spawn DS_fnc_MP;
[[west,player],"HUNT_fnc_setupChat",false,false] spawn DS_fnc_MP;	
player setVariable ["stunAmmo",true,true];
//[] call DS_fnc_setupPlayerActions;