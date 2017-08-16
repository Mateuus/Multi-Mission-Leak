/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Sets up a civilian
*/
private ["_wantedUids","_myGroup","_gangName"];
waitUntil {!(isNull (findDisplay 46))};
waitUntil {!isNull player};
civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],100];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_5 = nearestObjects[getMarkerPos  "civ_spawn_5", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
reb_spawn_2 = nearestObjects[getMarkerPos "reb_spawn_2",["Land_Cargo_Patrol_V3_F","Land_Cargo_House_V3_F"],100];
reb_spawn_3 = nearestObjects[getMarkerPos "reb_spawn_3",["Land_i_Stone_Shed_V3_F"],200];
if(isServer)then
	{
	[] call DS_fnc_civLoadGear;
	};

//Login checks
//Is the player temp banned
if((getPlayerUID player) in DS_tempBans)exitWith
	{
	player setPos (getMarkerPos "chopDrop");
	["tempBan",false,true] call BIS_fnc_endMission;
	sleep 30;
	};
/*	
{
	if(((name player) == (name _x))&&(_x != player))then
		{
		player setPos (getMarkerPos "chopDrop");
		["sameName",false,true] call BIS_fnc_endMission;
		sleep 35;
		};
}forEach playableUnits;
*/

if(([(name player),"(1)"] call KRON_StrInStr)||([(name player),"(2)"] call KRON_StrInStr)||([(name player),"(3)"] call KRON_StrInStr)||([(name player),"(4)"] call KRON_StrInStr))then
	{
	player setPos (getMarkerPos "chopDrop");
	["sameName",false,true] call BIS_fnc_endMission;
	sleep 35;
	};

//Is the player in a donor slot but not a donor
if(str(player) in ["civ_66","civ_67","civ_68","civ_69","civ_70","civ_71","civ_72","civ_73","civ_74","civ_75","civ_76","civ_77","civ_78","civ_79","civ_80","civ_81","civ_82","civ_83","civ_84","civ_85","civ_86","civ_87","civ_88","civ_89","civ_90","civ_91","civ_92","civ_93","civ_94","civ_95","civ_96","civ_97","civ_98","civ_99","civ_100","civ_101","civ_102","civ_103","civ_104","civ_105","civ_106","civ_107","civ_108","civ_109","civ_110"]) then 
	{
	if(((DS_donorLevel) == 0)&&(DS_adminLevel == 0)) then 
		{
		player setPos (getMarkerPos "chopDrop");
		["donorSlot",false,true] call BIS_fnc_endMission;
		sleep 35;
		};
	};
if(!(str(player) in ["civ_66","civ_67","civ_68","civ_69","civ_70","civ_71","civ_72","civ_73","civ_74","civ_75","civ_76","civ_77","civ_78","civ_79","civ_80","civ_81","civ_82","civ_83","civ_84","civ_85","civ_86","civ_87","civ_88","civ_89","civ_90","civ_91","civ_92","civ_93","civ_94","civ_95","civ_96","civ_97","civ_98","civ_99","civ_100","civ_101","civ_102","civ_103","civ_104","civ_105","civ_106","civ_107","civ_108","civ_109","civ_110"])) then 
	{
	if(((DS_donorLevel) > 0)||(DS_adminLevel > 0)) then 
		{
		[] spawn
			{
			while{true}do
				{
				sleep 30;
				hint "You are a donator, please join a donator slot";
				sleep 60;
				_action = [
				"You are a Donor, please join a donor slot to give new players a chance to join the server",
				"Donator",
				"Click Me",
				"No Click Me!"
				] call BIS_fnc_guiMessage;
				};
			};
		};
	};

{ _x setFuelCargo 0; } forEach (nearestObjects [player, ["Land_FS_Feed_F"], 30000]); 
if(DS_jailed) then
	{
	_time = (DS_realEstateArray select 7);
	_time = floor(_time/60);
	if(_time == 0)then{_time = 30}else{_time = _time + 1};
	_time = format ["%1",_time];
	_reason = "Logging out during a jail sentence";
	[player,_time,_reason,true] spawn DS_fnc_jail;
	cutText ["","BLACK IN"];
	enableEnvironment false;
	player enableFatigue false;
	vehicle player switchCamera "EXTERNAL";
	[] call DS_fnc_setupHud;
	(findDisplay 666671) displayRemoveEventHandler ["KeyDown", DS_blockEsc];
	[] execVM "scripts\welcome.sqf";
	}
	else
	{
	[] call DS_fnc_menuSpawnScreen;
	};
player addRating 9999999;

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
		player setVariable ["bounty",(DS_wanted_Stats select 0),true];
		};
	};
	
[[civilian,player],"HUNT_fnc_setupChat",false,false] spawn DS_fnc_MP;
sleep 3;
{
	_group = (_x select 0);
	_groupUIDS = (_group getVariable ["gangMembers",[""]]);
	if((getPlayerUID player) in (_groupUIDS))then
		{
		[player] joinSilent _group;
		};
} forEach DS_gangList;
DSL_security = false;

{
	if(((group player) == (_x select 0))||(isNull (group player)))then
		{
		if(!(getPlayerUID player) in _x)then
			{
			[player] joinSilent (createGroup civilian);
			(group player) setVariable ["gangName","",true];
			};
		};
}forEach DS_gangList;
	
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";

if((DS_infoArray select 13) > 42)then
	{
	DS_bankInsurance = true;
	};
