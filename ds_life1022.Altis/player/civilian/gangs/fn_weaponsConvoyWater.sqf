/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Gang area drug convoys
*/

private ["_payment","_infoArray","_playerCount","_randomSpawn","_vehArray","_randomVeh","_veh","_vehicle","_failed","_markerojb","_firstMarker","_secondMarker"];

if(!([] call DS_civ_myHideout))exitWith{hint "You must own this gang hideout to do this mission"};

switch(DS_missionSync)do {
	case 0: {_infoArray = ["jobMarker110","jobMarker103"]};
	case 1: {_infoArray = ["jobMarker105","jobMarker112"]};
	case 2: {_infoArray = ["jobMarker102","jobMarker101"]};
	case 3: {_infoArray = ["jobMarker100","jobMarker108"]};
	case 4: {_infoArray = ["jobMarker108","jobMarker104"]};
	case 5: {_infoArray = ["jobMarker106","jobMarker104"]};
	case 6: {_infoArray = ["jobMarker109","jobMarker107"]};
	case 7: {_infoArray = ["jobMarker107","jobMarker111"]};
	case 8: {_infoArray = ["jobMarker111","jobMarker105"]};
	case 9: {_infoArray = ["jobMarker110","jobMarker107"]};
	case 10: {_infoArray = ["jobMarker100","jobMarker103"]};
	case 11: {_infoArray = ["jobMarker112","jobMarker100"]};
	case 12: {_infoArray = ["jobMarker108","jobMarker106"]};
};

_firstMarker = _infoArray select 0;
_secondMarker = _infoArray select 1;
if(isNil "_firstMarker")then {_infoArray set [0,"jobMarker110"];};
if(isNil "_secondMarker")then {_infoArray set [1,"jobMarker103"];};

switch(DS_perkLevel)do {
	case 1: {_playerCount = 18;};
	case 2: {_playerCount = 16;};
	case 3: {_playerCount = 14;};
	case 4: {_playerCount = 12;};
	case 5: {_playerCount = 10;};
	case 0: {_playerCount = 20;};
};

_failed = false;

if(((playersNumber west)+(playersNumber civilian)+(playersNumber independent)) < _playerCount)exitWith{hint format ["There needs to be at least %1 people online for you do start this mission",_playerCount]};

_action = [
	"This mission requires $15k to begin and has rear gear put into it upon completion. It involves picking up weapons from a boat at sea and dropping it to another. Are you sure you wish to continue?",
	"Water Weapons Convoy",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;
if(!_action )exitWith{};

_action = [
	"If you at any point gain too much elevation during this mission (Such as flying) the mission will fail, you must only drive land vehicles and boats. Understand that any vehicle you enter while this mission is active can be destroyed by police",
	"Warning",
	"Yes",
	"No"
	] call BIS_fnc_guiMessage;
if(!_action)exitWith{};

_action = [
	"You can not be inside of a vehicle with anybody else also doing a water convoy mission, you must have your own boat to continue",
	"Warning",
	"Yes",
	"No"
	] call BIS_fnc_guiMessage;
if(!_action)exitWith{};

if(DS_convoy)exitWith{hint "You already have a convoy mission active";};
if((DS_infoArray select 15) < 35)then {
	if([15000,true] call DS_fnc_checkMoney)exitWith{hint "You need at least $15k in your bank to begin this mission";_failed = true;};
	[15000,true,false] call DS_fnc_handleMoney;
};
if(_failed)exitWith{};
DS_convoy = true;

player setVariable ["doingConvoy",true,true];

_markerLocation = (getMarkerPos (_infoArray select 0));
player removeSimpleTask DS_convoyTask;
DS_convoyTask = player createSimpleTask ["convoyTask"];
DS_convoyTask setSimpleTaskDescription ["Drive to your weapons pick up point to collect the weapons","Weapons Pickup Point",""];
DS_convoyTask setSimpleTaskDestination _markerLocation;
DS_convoyTask setTaskState "Assigned";
player setCurrentTask DS_convoyTask;

[] spawn {
	sleep (random 600) + 900;
	["519"] spawn DS_fnc_addCharge;
};

hint "You must travel to the weapons pick up point in the ocean to collect the goods - Remember no flying!";
systemChat "You must travel to the weapons pick up point in the ocean to collect the goods - Remember no flying!";

DS_currentTask1 = "Weapons Convoy Captain - Phase One";
DS_currentTask2 = "You must drive (Land vehicles and Boats) to your marked pickup point in the ocean, once there remain in place while your boat is filled with weapons";

_failCounter = 0;
_warn = false;

while{true}do {
	_crew = (crew (vehicle player));
	{
		if((_x != player)&&(_x getVariable ["doingConvoy",false]))then {
			_warn = true;
		};
	} forEach _crew;
	if(_warn)then {
		player say3D "fail";
		hint "You have someone else in your vehicle doing a convoy, they must exit otherwise you will fail your mission";
		systemChat "You have someone else in your vehicle doing a convoy, they must exit otherwise you will fail your mission";
		_failCounter = _failCounter + 1;
	};
	if(_failCounter > 5)exitWith{_failed = true;};
	if(player distance _markerLocation < 25)exitWith{_failed = false;};
	if ((getPos (player) select 2) > 20)exitWith{_failed = true};
	if((!alive player)||(player distance spawnIsland < 250))exitWith{_failed = true;};
	sleep 10;
};

if(_failed)exitWith {
	player setVariable ["doingConvoy",false,true];
	DS_currentTask1 = "";
	DS_convoy = false;
	player say3D "fail";
	player removeSimpleTask DS_convoyTask;
	hint "You have failed this mission";
	systemChat "You have failed this mission";
};

player say3D "dingDong";
hint "You have filled your boat with weapons, you must now drop them off at the drop point marked on your map and some will be left in your boat";
systemChat "You have filled your boat with weapons, you must now drop them off at the drop point marked on your map and some will be left in your boat";

DS_currentTask1 = "Drug Convoy Captain - Final Phase";
DS_currentTask2 = "You must drive your (Land vehicles and Boats) to the marked area in the ocean to deliver your drugs and receive payment.";

_markerLocation = (getMarkerPos (_infoArray select 1));
player removeSimpleTask DS_convoyTask;
DS_convoyTask = player createSimpleTask ["convoyTask"];
DS_convoyTask setSimpleTaskDescription ["Drive to your weapons drop off point to deliver the weapons","Weapons Drop Off Point",""];
DS_convoyTask setSimpleTaskDestination _markerLocation;
DS_convoyTask setTaskState "Assigned";
player setCurrentTask DS_convoyTask;

_failCounter = 0;
_warn = false;

while{true}do {
	_crew = (crew (vehicle player));
	{
		if((_x != player)&&(_x getVariable ["doingConvoy",false]))then {
			_warn = true;
		};
	} forEach _crew;
	if(_warn)then {
		player say3D "fail";
		hint "You have someone else in your vehicle doing a convoy, they must exit otherwise you will fail your mission";
		systemChat "You have someone else in your vehicle doing a convoy, they must exit otherwise you will fail your mission";
		_failCounter = _failCounter + 1;
	};
	if(_failCounter > 5)exitWith{_failed = true;};
	sleep 10;
	if(player distance _markerLocation < 25)exitWith{_failed = false;};
	if ((getPos (player) select 2) > 20)then {_failed = true;};
	if((vehicle player) isKindOf "Ship")then {(vehicle player) setVariable ["convoy_truck",true,true];};
};

if(_failed)exitWith {
	player setVariable ["doingConvoy",false,true];
	DS_currentTask1 = "";
	DS_convoy = false;
	player say3D "fail";
	player removeSimpleTask DS_convoyTask;
	hint "You have failed this mission";
	systemChat "You have failed this mission";
};
player say3D "success";

hint "You are in the area - The weapons will be placed into your boat in 30 seconds time, make sure you are in your boat at this time";
systemChat "You are in the area - The weapons will be placed into your boat in 30 seconds time, make sure you are in your boat at this time";

sleep 30;

_randNum = round random 5;
_vehicle = (vehicle player);

switch(_randNum)do {
	case 0: {
		//AK GL + Stealth Tee
		_vehicle addItemCargoGlobal ["O_NVGoggles_ghex_F",3];
		_vehicle addMagazineCargoGlobal ["MiniGrenade",5];
		_vehicle addWeaponCargoGlobal ["arifle_AK12_GL_F",2];
		_vehicle addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",20];
		_vehicle addMagazineCargoGlobal ["30Rnd_762x39_Mag_F",30];
		_vehicle addItemCargoGlobal ["U_B_CTRG_Soldier_urb_2_F",2];
	};
	case 1: {
		//Lynx - Combat Helmet + Stealth Rolled up
		_vehicle addItemCargoGlobal ["O_NVGoggles_ghex_F",3];
		_vehicle addWeaponCargoGlobal ["srifle_GM6_camo_F",2];
		_vehicle addMagazineCargoGlobal ["5Rnd_127x108_APDS_Mag",40];
		_vehicle addItemCargoGlobal ["H_HelmetB_TI_tna_F",2];
		_vehicle addItemCargoGlobal ["U_B_CTRG_Soldier_urb_3_F",2];
	};
	case 2: {
		//RPG 7 + Stealth Uniform
		_vehicle addItemCargoGlobal ["O_NVGoggles_ghex_F",3];
		_vehicle addWeaponCargoGlobal ["launch_RPG7_F",1];
		_vehicle addMagazineCargoGlobal ["RPG7_F",10];
		_vehicle addMagazineCargoGlobal ["MiniGrenade",6];
		_vehicle addItemCargoGlobal ["U_B_CTRG_Soldier_F",2];
	};
	case 3: {
		//Navid
		_vehicle addItemCargoGlobal ["O_NVGoggles_ghex_F",3];
		_vehicle addWeaponCargoGlobal ["MMG_01_hex_F",2];
		_vehicle addMagazineCargoGlobal ["150Rnd_93x64_Mag",50];
		_vehicle addMagazineCargoGlobal ["MiniGrenade",6];
		_vehicle addItemCargoGlobal ["H_HelmetLeaderO_ghex_F",2];
	};
	case 4: {
		//OLD RPG
		_vehicle addWeaponCargoGlobal ["O_NVGoggles_ghex_F",3];
		_vehicle addWeaponCargoGlobal ["MMG_02_camo_F",2];
		_vehicle addMagazineCargoGlobal ["130Rnd_338_Mag",15];
		_vehicle addItemCargoGlobal ["U_B_CTRG_Soldier_3_F",2];
	};
	case 5: {
		//SPMG
		_vehicle addItemCargoGlobal ["O_NVGoggles_ghex_F",3];
		_vehicle addMagazineCargoGlobal ["MiniGrenade",5];
		_vehicle addWeaponCargoGlobal ["MMG_02_camo_F",2];
		_vehicle addMagazineCargoGlobal ["130Rnd_338_Mag",30];
		_vehicle addItemCargoGlobal ["optic_Nightstalker",1];
		_vehicle addItemCargoGlobal ["U_B_CTRG_Soldier_F",2];
		DS_item_battery = DS_item_battery + 1;
	};
};

if((DS_infoArray select 15) > 34)then {
	_vehicle addItemCargoGlobal ["H_CrewHelmetHeli_I",1];
};

hint "The weapons have been left in your boat for you";
systemChat "The weapons have been left in your boat for you";

player removeSimpleTask DS_convoyTask;
[25,false] spawn DS_fnc_moralAlter;
DS_convoy = false;
DS_currentTask1 = "";

sleep 5;

_amount = [] call DS_fnc_getCopScore;
_amount = (_amount*10000);
[_amount] spawn DS_civ_payGangAccount;

