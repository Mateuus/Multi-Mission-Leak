/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Gang area drug convoys
*/

private["_tempNum","_payment","_infoArray","_playerCount","_randomSpawn","_vehArray","_veh","_vehicle","_failed","_markerojb","_firstMarker","_secondMarker"];

if(!([] call DS_civ_myHideout))exitwith{hint "You must own this gang hideout to do this mission"};

_payment = 250000;//WIll soon get changing price
_copScore = [] call DS_fnc_getCopScore;
if(_copScore > 25)then
	{
	_payment = (_payment*1.5);
	};
if(_copScore > 45)then
	{
	_payment = (_payment*2);
	};

if(DS_realMode)then{_payment = (_payment*1.5);};

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
				_infoArray = ["oilp_1_1","g_2_1"];
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

/*
switch(true)do
	{
	case (player distance (getMarkerPos "gang_area_2") < 100): {_infoArray = ["gang_area_2_1","gang_area_3_1"]};
	case (player distance (getMarkerPos "gang_area_3_1") < 100): {_infoArray = ["gang_area_2","gang_area_2_1"]};
	case (player distance (getMarkerPos "gang_area_2_1") < 100): {_infoArray = ["gang_area_3_1","gang_area_2"]};
	};
*/
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
		format ["This mission requires $15k to begin and pays $%1 upon completion. It involves picking up drugs from one location and dropping them at another, Are you sure you wish to continue?",_payment],
		"Drugs Convoy",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;
if(!_action )exitwith{};
_action = [
		"Air Lifting your convoy or jumping it high will cause it to blow up, Understand?",
		"Warning",
		"Yes",
		"No"
		] call BIS_fnc_guiMessage;
		if(!_action)exitwith{};
if(count(nearestObjects[(getMarkerPos (DS_spawnPoint select 0)),["Car","Ship","Air"],15]) != 0)exitWith{hint "There is a vehicle blocking the spawn point"};
if(DS_convoy)exitwith {hint "You already have a convoy mission active";};
if([15000,true] call DS_fnc_checkMoney)exitwith{hint "You need at least $15k in your bank to begin this mission"};
[15000,true,false] call DS_fnc_handleMoney;
DS_convoy = true;

_markerLocation = (getMarkerPos (_infoArray select 1));
player removeSimpleTask DS_convoyTask;
DS_convoyTask = player createSimpleTask ["convoyTask"];
DS_convoyTask setSimpleTaskDescription ["Travel to the drug pick up point on your map","Drug Pickup Point",""];
DS_convoyTask setSimpleTaskDestination _markerLocation;
DS_convoyTask setTaskState "Assigned";
player setCurrentTask DS_convoyTask;

[] spawn
	{
	sleep (random 600) + 900;
	["483"] spawn DS_fnc_addCharge;
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
hint "You must travel to the drug pick up point at a location marked on your map";
systemchat "You must travel to the drug pick up point at a location marked on your map";

DS_currentTask1 = "Drug Convoy Driver - Phase One";
DS_currentTask2 = "You must drive your convoy truck to the point marked on your map, once there remain in place while your truck is filled with drugs";

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
DS_convoyTask setTaskState "Succeeded";
player say3D "dingDong";
hint "You have filled your truck with drugs, you must now drop them off at the location marked on your map";
systemchat "You have filled your truck with drugs, you must now drop them off at the location marked on your map";

DS_currentTask1 = "Drug Convoy Driver - Final Phase";
DS_currentTask2 = "You must drive your convoy truck to the marked location to deliver your drugs and receive payment.";

_markerLocation = (getMarkerPos (_infoArray select 0));
player removeSimpleTask DS_convoyTask;
DS_convoyTask = player createSimpleTask ["convoyTask"];
DS_convoyTask setSimpleTaskDescription ["Drive your convoy truck to the drop off point on your map to deliver your drugs and receive payment","Drug Drop Off Point",""];
DS_convoyTask setSimpleTaskDestination _markerLocation;
DS_convoyTask setTaskState "Assigned";
player setCurrentTask DS_convoyTask;

while{true}do
	{
	sleep 10;
	if(_vehicle distance _markerLocation < 50)exitwith{_failed = false;};
	if ((getPos (_vehicle) select 2) > 20) then {_vehicle setDamage 1};
	if(!alive _vehicle)exitwith{_failed = true;};
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

hint format ["You have dropped of the drugs at this location and been paid $%1. Warning - The truck will despawn in 15 minutes",_payment];
systemchat format ["You have dropped of the drugs at this location and been paid $%1. Warning - The truck will despawn in 15 minutes",_payment];
[_payment,false,true] call DS_fnc_handleMoney;
//[] call DS_fnc_compileData;

player removeSimpleTask DS_convoyTask;
[25,false] spawn DS_fnc_moralAlter;
sleep 3;

_amount = [] call DS_fnc_getCopScore;
_amount = (_amount*10000);
[_amount] spawn DS_civ_payGangAccount;

[_vehicle,900] remoteExec ["HUNT_fnc_clearVehicle",2];
DS_convoy = false;
DS_currentTask1 = "";

if(DS_tokenMission == 10)then
	{
	DS_tokenMission = -1;
	[80,name player,false] spawn DS_civ_payTokens;
	DS_rebelMissionToken = false;
	};

if((DS_infoArray select 15) == 4)then { [1] call DS_fnc_questCompleted };

if((DS_infoArray select 15) == 21)then {
	_tempNum = (DS_infoArray select 16) + 1;
	if(_tempNum > 2)then {
		[1] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [16,_tempNum];
	};
};