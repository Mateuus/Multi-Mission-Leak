/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up a whitelisted civilian
*/

DS_mechanicMission = false;

if(isServer)then
	{
	DS_WLLevel = 4;
	};
//{ _x setFuelCargo 0; } forEach (nearestObjects [player, ["Land_FS_Feed_F"], 30000]);
[] call compile preprocessFileLineNumbers "player\whitelistcivilian\compileMechanic.sqf";

//Login checks
//Is the player temp banned
if((getPlayerUID player) in DS_tempBans)exitWith
	{
	player setPos (getMarkerPos "chopDrop");
	["tempBan",false,true] call BIS_fnc_endMission;
	sleep 30;
	};

if((!isServer)&&(!([(name player),"MECHANIC"] call DS_fnc_strInStr))&&(!([(name player),"Mechanic"] call DS_fnc_strInStr))&&(!([(name player),"mechanic"] call DS_fnc_strInStr)))then
	{
	player setPos (getMarkerPos "chopDrop");
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
	};

if((str(player) in ["wlciv_7","wlciv_8","wlciv_9","wlciv_10","wlciv_11","wlciv_12"]))then
	{
	player setPos (getMarkerPos "chopDrop");
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
	};

if(DS_WLLevel < 1)exitWith
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
player setVariable["Mechanic",TRUE,TRUE];

[] call DS_mech_mechanicLoadout;

[civilian,player] remoteExec ["HUNT_fnc_setupChat",2];
//[west,player] remoteExec ["HUNT_fnc_setupChat",2];
sleep 5;
6 enableChannel false;