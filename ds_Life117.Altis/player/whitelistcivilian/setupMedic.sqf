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
[] call compile PreprocessFileLineNumbers "player\whitelistcivilian\compileMedic.sqf";

DS_uselessMedic = false;
DS_medicMission = false;
["bones",false,DS_item_bones] call DS_fnc_handleInventory;

//Login checks
//Is the player temp banned
if((getPlayerUID player) in DS_tempBans)exitWith
	{
	player setPos (getMarkerPos "chopDrop");
	["tempBan",false,true] call BIS_fnc_endMission;
	sleep 30;
	};
	
if((!([(name player),"Medic"] call KRON_StrInStr))&&(!([(name player),"medic"] call KRON_StrInStr))&&(!isServer))then
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
player setVariable["medic",TRUE,TRUE];

[] call DS_med_medicLoadout;
_wantedUids = [];
if((count DS_wanted_stats) > 1)then
	{
		{
			_wantedUids pushBack (_x select 0);
		}forEach DS_wantedList;
		
	if((getPlayerUID player) in _wantedUids)then
		{
		}
		else
		{
		_tempArray = [];
		_tempArray pushBack (getPlayerUID player);
		_tempArray pushBack (name player);
		DS_wantedList pushBack _tempArray;
		publicVariable "DS_wantedList";
		};
	};
DS_medic = true;
DS_police_nos = false;
[[civilian,player],"HUNT_fnc_setupChat",false,false] spawn DS_fnc_MP;
[[west,player],"HUNT_fnc_setupChat",false,false] spawn DS_fnc_MP;	