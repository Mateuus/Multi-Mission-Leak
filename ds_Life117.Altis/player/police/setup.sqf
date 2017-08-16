/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Sets up a police officer
*/

private ["_rankStr"];

waitUntil {!(isNull (findDisplay 46))};
waitUntil {player distance spawnIsland < 500};
{ _x setFuelCargo 0; } forEach (nearestObjects [player, ["Land_FS_Feed_F"], 30000]); 
if(!isServer)then
	{
	if(cop_gear isEqualTo [])then
		{
		[] call DS_cop_copDefault;
		};
	}
	else
	{
	[] call DS_cop_copDefault;
	};

if((str(player) in ["cop_4","cop_1","cop_3","cop_5"]))then
	{
	DS_pubCop = true;
	player setVariable["pubCop",true,true];
	}
	else
	{
	player setVariable["cop",true,true];
	};
	
player setVariable["rank",(DS_coplevel),true];	
switch(DS_copLevel)do
	{
	case 0:
		{
		_rankStr = "Rent-A-Cop";
		};
	case 1:
		{
		_rankStr = "Cadet";
		};
	case 2:
		{
		_rankStr = "Patrol Officer";
		};
	case 3:
		{
		_rankStr = "Sergeant";
		};
	case 4:
		{
		_rankStr = "Senior Sergeant";
		};
	case 5:
		{
		_rankStr = "Lieutenant";
		};
	case 6:
		{
		_rankStr = "Super Intendant";
		};
	case 7:
		{
		_rankStr = "Deputy Chief";
		};
	};
if(getPlayerUID player in ["76561197992718808"])then
	{
	_rankStr = "Police Chief";
	};
player setVariable ["rankStr",_rankStr,true];		
		
[] call DS_fnc_menuSpawnScreen;
//waitUntil{!isNull (findDisplay 666671)}; 
//waitUntil{isNull (findDisplay 666671)}; 
	
[] call DS_fnc_copuniform;
	
if((getPlayerUID player) in DS_tempBans)exitWith	
	{
	player setPos (getMarkerPos "chopDrop");
	["tempBan",false,true] call BIS_fnc_endMission;
	sleep 30;
	};

if(DS_blacklisted) exitWith
{
	player setPos (getMarkerPos "chopDrop");
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if((getPlayerUID player) in firedCops)exitWith	
	{
	player setPos (getMarkerPos "chopDrop");
	["officerKick",false,true] call BIS_fnc_endMission;
	sleep 30;
	};	
	
if(!(str(player) in ["cop_4","cop_1","cop_3","cop_5"])) then 
	{
	if(DS_copLevel == 0) then 
		{
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
		};	
	};

if(((str(player) in ["cop_4","cop_1","cop_3","cop_5"]))&&((DS_infoArray select 1) < 300))exitWith	
	{
	player setPos (getMarkerPos "chopDrop");
	["NotEnoughHours",false,true] call BIS_fnc_endMission;
	sleep 30;
	};

[[west,player],"HUNT_fnc_setupChat",false,false] spawn DS_fnc_MP;	
player setVariable ["stunAmmo",true,true];	
player setVariable ["policeAction","",true];	
	
[] call DS_cop_addToSquad;	
	
	
	
	