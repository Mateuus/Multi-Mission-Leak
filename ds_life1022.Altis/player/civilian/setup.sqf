/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up a civilian
*/

private ["_legalChars","_wantedUids","_myGroup","_gangName","_noBlack"];
waitUntil {!(isNull (findDisplay 46))};
waitUntil {!isNull player};

civ_spawn_1 = nearestObjects[getMarkerPos "civ_spawn_1",["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F","Land_Shop_City_01_F","Land_Shop_City_02_F"],120];
civ_spawn_2 = nearestObjects[getMarkerPos "civ_spawn_2",["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F","Land_Shop_City_01_F","Land_Shop_City_02_F"],500];
civ_spawn_3 = nearestObjects[getMarkerPos "civ_spawn_3",["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F","Land_Shop_City_01_F","Land_Shop_City_02_F"],500];
civ_spawn_4 = nearestObjects[getMarkerPos "civ_spawn_4",["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F","Land_Shop_City_01_F","Land_Shop_City_02_F"],500];
civ_spawn_5 = nearestObjects[getMarkerPos "civ_spawn_5",["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F","Land_Shop_City_01_F","Land_Shop_City_02_F"],500];
reb_spawn_2 = nearestObjects[getMarkerPos "reb_spawn_2",["Land_Cargo_Patrol_V3_F","Land_Cargo_House_V3_F"],200];
reb_spawn_3 = nearestObjects[getMarkerPos "reb_spawn_3",["Land_i_Stone_Shed_V3_F"],200];
if(isServer)then
	{
	[] spawn DS_fnc_loadGear;
	};

//Login checks
//Is the player temp banned
if((getPlayerUID player) in DS_tempBans)exitWith
	{
	player setPos (getMarkerPos "chopDrop");
	["tempBan",false,true] call BIS_fnc_endMission;
	sleep 30;
	};

if(([(name player),"(1)"] call DS_fnc_strInStr)||([(name player),"(2)"] call DS_fnc_strInStr)||([(name player),"(3)"] call DS_fnc_strInStr)||([(name player),"(4)"] call DS_fnc_strInStr))then
	{
	player setPos (getMarkerPos "chopDrop");
	["sameName",false,true] call BIS_fnc_endMission;
	sleep 35;
	};

[] call DS_fnc_nameError;

//Is the player in a donor slot but not a donor
if(!(str(player) in ["civ_1","civ_2","civ_3","civ_4","civ_5","civ_6","civ_7","civ_8","civ_9","civ_10","civ_11","civ_12","civ_13","civ_14","civ_15","civ_16","civ_17","civ_18","civ_19","civ_20","civ_21","civ_22","civ_23","civ_24","civ_25","civ_26","civ_27","civ_28","civ_29","civ_30","civ_31","civ_32","civ_33","civ_34","civ_35","civ_36","civ_37","civ_38","civ_39","civ_40","civ_41","civ_42","civ_43","civ_44","civ_45","civ_46","civ_47","civ_48","civ_49","civ_50","civ_51","civ_52","civ_53","civ_54","civ_55","civ_56","civ_57","civ_58","civ_59","civ_60","civ_61","civ_62","civ_63","civ_64","civ_65"])) then
	{
	if(((DS_donorLevel) == 0)&&(DS_adminLevel == 0)) then
		{
		player setPos (getMarkerPos "chopDrop");
		["donorSlot",false,true] call BIS_fnc_endMission;
		sleep 35;
		};
	};
if(str(player) in ["civ_1","civ_2","civ_3","civ_4","civ_5","civ_6","civ_7","civ_8","civ_9","civ_10","civ_11","civ_12","civ_13","civ_14","civ_15","civ_16","civ_17","civ_18","civ_19","civ_20","civ_21","civ_22","civ_23","civ_24","civ_25","civ_26","civ_27","civ_28","civ_29","civ_30","civ_31","civ_32","civ_33","civ_34","civ_35","civ_36","civ_37","civ_38","civ_39","civ_40","civ_41","civ_42","civ_43","civ_44","civ_45","civ_46","civ_47","civ_48","civ_49","civ_50","civ_51","civ_52","civ_53","civ_54","civ_55","civ_56","civ_57","civ_58","civ_59","civ_60","civ_61","civ_62","civ_63","civ_64","civ_65"]) then
	{
	if(((DS_donorLevel) > 0)&&(DS_adminLevel == 0)) then
		{
		[] spawn
			{
			while{true}do
				{
				if(DS_overflow)exitwith{};
				sleep 30;
				hint "You are a donator, please join a donator slot";
				sleep 60;
				if(DS_overflow)exitwith{};
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
//Is the player in an admin slot
if(str(player) in ["civ_132","civ_133","civ_134","civ_135","civ_136"]) then
	{
	if(DS_adminLevel < 2) then
		{
		player setPos (getMarkerPos "chopDrop");
		["donorSlot",false,true] call BIS_fnc_endMission;
		sleep 35;
		};
	};

if(DS_jailed) then
	{
	_time = (DS_realEstateArray select 7);
	_time = floor(_time/60);
	if(_time == 0)then{_time = 30}else{_time = _time + 1};
	_time = format ["%1",_time];
	_reason = "Logging out during a jail sentence";
	[player,_time,_reason,true] spawn DS_fnc_jail;
	cutText ["","BLACK IN"];
	player enableFatigue false;
	(vehicle player) switchCamera "EXTERNAL";
	[] call DS_fnc_setupHud;
	if(!isNil "DS_blockEsc")then{(findDisplay 666671) displayRemoveEventHandler ["KeyDown", DS_blockEsc];};
	}
	else
	{
	//No black UID's
	_noBlack = ["76561198038366032","76561197992718808","76561198073680229","76561198067949555","76561198088153735","76561198176900577","76561198139940358","76561198073613608","76561198144709998","76561198124984854"];

	if((getPlayerUID player) in _noBlack)then
		{
		DS_teleportAction = player addAction ["<t color='#5dde1c'>Switch Islands</t>",{
			if(player distance spawnIsland < 1000)then {
				player setPos (getMarkerPos "spawnIsland2");
				systemChat "You teleported to voice spawn island.";
			} else {
				player setPos (getPos spawnIsland);
				systemChat "You teleported to main spawn island.";
			};
		}];

		DS_spawnInAction = player addAction ["<t color='#5dde1c'>Open Spawn Menu</t>",{
			[] call DS_fnc_menuSpawnScreen;
			player removeAction DS_spawnInAction;
			player removeAction DS_teleportAction;
		}];
		}
		else
		{
		[] call DS_fnc_menuSpawnScreen;
		};
	};
player addRating 9999999;

if((DS_infoArray select 13) > 43)then
	{
	DS_bankInsurance = true;
	};

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

if(DS_adminLevel > 0)then {
	[civilian,player,false,false,true] remoteExec ["HUNT_fnc_setupChat",2];
} else {
	if(((DS_infoArray select 0)+(DS_infoArray select 1)+(DS_infoArray select 2)) > 1200)then {
		[civilian,player] remoteExec ["HUNT_fnc_setupChat",2];
	} else {
		[civilian,player,false,false,true] remoteExec ["HUNT_fnc_setupChat",2];
	};
};
sleep 3;

DSL_security = false;

[] call DS_civ_gangRejoin;
[] call DS_civ_gangCheck;

player linkItem "ItemMap";
player linkItem "ItemCompass";
7 enableChannel [true,false];
8 enableChannel [true,false];
9 enableChannel [true,false];