/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Gang area guns convoys
*/

private["_tempNum","_payment","_infoArray","_playerCount","_randomSpawn","_vehArray","_veh","_vehicle","_failed","_markerojb","_randNum","_firstMarker","_secondMarker"];

if(!([] call DS_civ_myHideout))exitwith{hint "You must own this gang hideout to do this mission"};
_infoArray = [];

switch(true)do
	{
	case (player distance (getMarkerPos "gang_area_2") < 100):
		{
		switch(DS_missionSync)do
			{
			case 0:
				{
				_infoArray = ["g_2_1","g"];
				};
			case 1:
				{
				_infoArray = ["powerMarker","g_2"];
				};
			case 2:
				{
				_infoArray = ["1d","1d_2"];
				};
			case 3:
				{
				_infoArray = ["gt","boat_9"];
				};
			case 4:
				{
				_infoArray = ["boat_9","gt_1"];
				};
			case 5:
				{
				_infoArray = ["oilp_1_3","1_1"];
				};
			case 6:
				{
				_infoArray = ["g","methExplosion_1"];
				};
			case 7:
				{
				_infoArray = ["salt","illegalRelic1_1"];
				};
			case 8:
				{
				_infoArray = ["gt_1","gang_area_2_1"];
				};
			case 9:
				{
				_infoArray = ["bv_1_2_1_1_1_3","1_5"];
				};
			case 10:
				{
				_infoArray = ["wood","1d_2"];
				};
			case 11:
				{
				_infoArray = ["bv_1_1_3","g"];
				};
			case 12:
				{
				_infoArray = ["g","sand"];
				};
			};
		};
	case (player distance (getMarkerPos "gangarea") < 100):
		{
		switch(DS_missionSync)do
			{
			case 0:
				{
				_infoArray = ["methExplosion_1","g_1"];
				};
			case 1:
				{
				_infoArray = ["boat_5","Gas1_1_1_2_1_1_1"];
				};
			case 2:
				{
				_infoArray = ["Gas1_1_1_2_1_1_1","gang_area_2"];
				};
			case 3:
				{
				_infoArray = ["1d_1","gt_1"];
				};
			case 4:
				{
				_infoArray = ["gt_1","g"];
				};
			case 5:
				{
				_infoArray = ["boat_10","1_5"];
				};
			case 6:
				{
				_infoArray = ["1_5","hospital_3"];
				};
			case 7:
				{
				_infoArray = ["hospital_3","oilp_1_3"];
				};
			case 8:
				{
				_infoArray = ["oilp_1_3","hospital_3"];
				};
			case 9:
				{
				_infoArray = ["Gas1_1_1_2_1","gang_area_2"];
				};
			case 10:
				{
				_infoArray = ["gt","1d"];
				};
			case 11:
				{
				_infoArray = ["1d","g"];
				};
			case 12:
				{
				_infoArray = ["g","methExplosion_1"];
				};
			};
		};
	case (player distance (getMarkerPos "gang_area_3_1") < 100):
		{
		switch(DS_missionSync)do
			{
			case 0:
				{
				_infoArray = ["gang_area_2","1d"];
				};
			case 1:
				{
				_infoArray = ["1d","g_2_1"];
				};
			case 2:
				{
				_infoArray = ["g_2","gang_area_2_1"];
				};
			case 3:
				{
				_infoArray = ["gang_area_2_1","g"];
				};
			case 4:
				{
				_infoArray = ["g","air_serv_3"];
				};
			case 5:
				{
				_infoArray = ["wood","hospital_3"];
				};
			case 6:
				{
				_infoArray = ["hospital_2","1d_2"];
				};
			case 7:
				{
				_infoArray = ["1d_2","hostage2"];
				};
			case 8:
				{
				_infoArray = ["hostage2","illegalRelic1_1"];
				};
			case 9:
				{
				_infoArray = ["illegalRelic1_1","oilp_1_1"];
				};
			case 10:
				{
				_infoArray = ["oilp_1_1","g_2_1"];//
				};
			case 11:
				{
				_infoArray = ["hospital_2","Gen_3_1_1_2_2"];
				};
			case 12:
				{
				_infoArray = ["Gen_3_1_1_2_2","hospital_2"];
				};
			};
		};
	};

_firstMarker = _infoArray select 0;
_secondMarker = _infoArray select 1;
if(isNil "_firstMarker")then{_infoArray set [0,"hospital_2"];};
if(isNil "_secondMarker")then{_infoArray set [1,"g_2_1"];};

switch(DS_perkLevel)do
	{
	case 1:
		{
		_playerCount = 18;
		};
	case 2:
		{
		_playerCount = 16;
		};
	case 3:
		{
		_playerCount = 14;
		};
	case 4:
		{
		_playerCount = 12;
		};
	case 5:
		{
		_playerCount = 10;
		};
	case 0:
		{
		_playerCount = 20;
		};
	};

if(((playersNumber west)+(playersNumber civilian)+(playersNumber independent)) < _playerCount)exitwith{hint format ["There needs to be at least %1 people online for you do start this mission",_playerCount]};

_action = [
		"This mission requires $50k to begin and places some rare weapons in your truck upon completion. It involves driving between all three gang hideouts, Are you sure you wish to continue?",
		"Weapons Convoy",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;
if(!_action)exitwith{};
_action = [
		"Air Lifting your convoy or jumping it high will cause it to blow up, Understand?",
		"Warning",
		"Yes",
		"No"
		] call BIS_fnc_guiMessage;
		if(!_action)exitwith{};
if(count(nearestObjects[(getMarkerPos (DS_spawnPoint select 0)),["Car","Ship","Air"],15]) != 0)exitWith{hint "There is a vehicle blocking the spawn point"};
if([50000,true] call DS_fnc_checkMoney)exitwith{hint "You need at least $50k in your bank to begin this mission"};
if(DS_convoy)exitwith {hint "You already have a convoy mission active";};
if((DS_infoArray select 15) < 10)then
	{
	[50000,true,false] call DS_fnc_handleMoney;
	};
DS_convoy = true;

_markerLocation = (getMarkerPos (_infoArray select 1));
player removeSimpleTask DS_convoyTask;
DS_convoyTask = player createSimpleTask ["convoyTask"];
DS_convoyTask setSimpleTaskDescription ["Drive to your weapons pickup point to collect the weapons","Weapons Pickup Point",""];
DS_convoyTask setSimpleTaskDestination _markerLocation;
DS_convoyTask setTaskState "Assigned";
player setCurrentTask DS_convoyTask;

[] spawn
	{
	sleep (random 600) + 900;
	["519"] spawn DS_fnc_addCharge;
	};
_vehArray = ["B_Truck_01_box_F","B_Truck_01_covered_F","B_Truck_01_transport_F","I_Truck_02_covered_F","I_Truck_02_transport_F"];
_veh = (selectRandom _vehArray);
_vehicle = createVehicle [_veh, (getMarkerPos (DS_spawnPoint select 0)), [], 0, "NONE"];
waitUntil {!isNil "_vehicle"};
_vehicle setVariable["vehicle_owners",[[getPlayerUID player,profileName]],true];
_vehicle setVariable["convoy_truck",true,true];
_vehicle lock 2;
DS_keyRing pushBack _vehicle;
_vehicle setVariable["boot_open",true,true];
hint "You must travel to the weapon pick up point at the marked location to pick up your load of weapons";
systemchat "You must travel to the weapon pick up point at the marked location to pick up your load of weapons";

DS_currentTask1 = "Weapons Convoy Driver - Phase One";
DS_currentTask2 = "You must drive your convoy truck to the point marked on your map, once there remain in place while your truck is filled with weapons";

while{true}do
	{
	if(_vehicle distance _markerLocation < 50)exitwith{_failed = false;};
	if ((getPos (_vehicle) select 2) > 20) then {_vehicle setDamage 1};
	if(!alive _vehicle)exitwith{_failed = true;};
	sleep 10;
	};
	if(_failed)exitwith
	{
	DS_currentTask1 = "";
	DS_convoy = false;
	player say3D "fail";
	player removeSimpleTask DS_convoyTask;
	hint "You have failed this mission";
	systemchat "You have failed this mission";
	deleteVehicle _vehicle;
	};
player say3D "dingDong";
hint "You have filled your truck with weapons, you must now drop them off at the location marked on your map";
systemchat "You have filled your truck with weapons, you must now drop them off at the location marked on your map";

DS_currentTask1 = "Weapons Convoy Driver - Final Phase";
DS_currentTask2 = "You must drive your convoy truck to the marked location to drop off the weapons. A small collection will be left in the truck for you. You must remove then within 10 minutes (Before the truck despawns)";

_markerLocation = (getMarkerPos (_infoArray select 0));
player removeSimpleTask DS_convoyTask;
DS_convoyTask = player createSimpleTask ["convoyTask"];
DS_convoyTask setSimpleTaskDescription ["Drive to your weapons drop off point to deliver the weapons","Weapons Drop Off Point",""];
DS_convoyTask setSimpleTaskDestination _markerLocation;
DS_convoyTask setTaskState "Assigned";
player setCurrentTask DS_convoyTask;

while{true}do
	{
	if(_vehicle distance _markerLocation < 50)exitwith{_failed = false;};
	if ((getPos (_vehicle) select 2) > 20) then {_vehicle setDamage 1};
	if(!alive _vehicle)exitwith{_failed = true;};
	sleep 10;
	};

if(_failed)exitwith
	{
	DS_currentTask1 = "";
	DS_convoy = false;
	player say3D "fail";
	player removeSimpleTask DS_convoyTask;
	hint "You have failed this mission";
	systemchat "You have failed this mission";
	deleteVehicle _vehicle;
	};
player say3D "success";
hint "You have completed the mission, some weapons have been left in your truck \n\n ~ WARNING ~~ \n\nThe truck will despawn in 15 minutes";
systemchat "You have completed the mission, some weapons have been left in your truck";

_randNum = round random 5;

switch(_randNum)do
	{
	case 0:
		{
		//AK GL
		_vehicle addItemCargoGlobal["O_NVGoggles_ghex_F",3];
		_vehicle addMagazineCargoGlobal["MiniGrenade",5];
		_vehicle addWeaponCargoGlobal["arifle_AK12_GL_F",2];
		_vehicle addMagazineCargoGlobal["1Rnd_HE_Grenade_shell",20];
		_vehicle addMagazineCargoGlobal["30Rnd_762x39_Mag_F",30];
		};
	case 1:
		{
		//Lynx - Combat Helmet
		_vehicle addItemCargoGlobal["O_NVGoggles_ghex_F",3];
		_vehicle addWeaponCargoGlobal["srifle_GM6_camo_F",2];
		_vehicle addMagazineCargoGlobal["5Rnd_127x108_APDS_Mag",40];
		_vehicle addItemCargoGlobal["H_HelmetB_TI_tna_F",2];
		};
	case 2:
		{
		//RPG 7
		_vehicle addItemCargoGlobal["O_NVGoggles_ghex_F",3];
		_vehicle addWeaponCargoGlobal["launch_RPG7_F",2];
		_vehicle addMagazineCargoGlobal["RPG7_F",20];
		_vehicle addMagazineCargoGlobal["MiniGrenade",6];
		};
	case 3:
		{
		//Navid
		_vehicle addItemCargoGlobal["O_NVGoggles_ghex_F",3];
		_vehicle addWeaponCargoGlobal["MMG_01_hex_F",2];
		_vehicle addMagazineCargoGlobal["150Rnd_93x64_Mag",50];
		_vehicle addMagazineCargoGlobal["MiniGrenade",6];
		};
	case 4:
		{
		//Old RPG
		_vehicle addWeaponCargoGlobal["O_NVGoggles_ghex_F",3];
		_vehicle addWeaponCargoGlobal["launch_RPG32_F",2];
		_vehicle addMagazineCargoGlobal["RPG32_F",15];
		_vehicle addMagazineCargoGlobal["RPG32_HE_F",15];
		};
	case 5:
		{
		//SPMG
		_vehicle addItemCargoGlobal["O_NVGoggles_ghex_F",3];
		_vehicle addMagazineCargoGlobal["MiniGrenade",5];
		_vehicle addWeaponCargoGlobal["MMG_02_camo_F",2];
		_vehicle addMagazineCargoGlobal["130Rnd_338_Mag",30];
		_vehicle addItemCargoGlobal["optic_Nightstalker",1];
		DS_item_battery = DS_item_battery + 1;
		};
	};

if((DS_infoArray select 15) > 38)then
	{
	_vehicle addItemCargoGlobal["H_CrewHelmetHeli_I",1];
	};

if((DS_infoArray select 15) > 44)then
	{
	_vehicle addItemCargoGlobal["H_CrewHelmetHeli_I",1];
	};

_amount = [] call DS_fnc_getCopScore;
_amount = (_amount*10000);
[_amount] spawn DS_civ_payGangAccount;

player removeSimpleTask DS_convoyTask;
DS_convoy = false;
[_vehicle,900] remoteExec ["HUNT_fnc_clearVehicle",2];
DS_currentTask1 = "";
if(DS_tokenMission == 0)then
	{
	DS_tokenMission = -1;
	[80,name player,false] spawn DS_civ_payTokens;
	DS_rebelMissionToken = false;
	};

if((DS_infoArray select 15) == 9)then { [1] call DS_fnc_questCompleted };

if((DS_infoArray select 15) == 26)then {
	_tempNum = (DS_infoArray select 16) + 1;
	if(_tempNum > 2)then {
		[1] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [16,_tempNum];
	};
};

if((DS_infoArray select 15) == 38)then {
	_tempNum = (DS_infoArray select 16) + 1;
	if(_tempNum > 2)then {
		[1] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [16,_tempNum];
	};
};

if((DS_infoArray select 15) == 44)then {
	_tempNum = (DS_infoArray select 16) + 1;
	if(_tempNum > 4)then {
		[1] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [16,_tempNum];
	};
};