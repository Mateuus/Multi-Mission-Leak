/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Mechanic Missions
*/

private["_payment","_currentJob","_currentMissionText","_sleep","_infoArray","_playerCount","_randomSpawn","_vehArray","_veh","_vehicle","_failed","_markerojb"];

if((DS_infoArray select 23) < 19)exitwith{hint "You have not completed the quest needed to do these missions";};
if(DS_fuelMission)exitwith{hint "You already have a mission active";};
DS_fuelMission = true;

_randomSpawn =
[
getMarkerPos "civ_spawn_3",getMarkerPos "wlJob1",getMarkerPos "wlJob2",getMarkerPos "wlJob3",
getMarkerPos "wlJob4",getMarkerPos "civ_spawn_1",getMarkerPos "wlJob5",getMarkerPos "wlJob6",
getMarkerPos "wlJob7",getMarkerPos "wlJob8",getMarkerPos "wlJob9",getMarkerPos "wlJob10",
getMarkerPos "wlJob11",getMarkerPos "wlJob12",getMarkerPos "wlJob13",getMarkerPos "civ_spawn_2",
getMarkerPos "wlJob14",getMarkerPos "wlJob15",getMarkerPos "wlJob16",getMarkerPos "wlJob17",
getMarkerPos "wlJob23",getMarkerPos "wlJob18",getMarkerPos "wlJob19",getMarkerPos "wlJob20",
getMarkerPos "wlJob21",getMarkerPos "civ_spawn_5"
];

switch(DS_infoArray select 23)do
	{
	case 19:
		{
		_currentJob = "Repair a damaged vehicle nearby that will be marked on your map";
		_vehArray = ["B_Quadbike_01_F","C_Hatchback_01_F","C_Offroad_01_F","C_SUV_01_F","C_Van_01_transport_F"];
		_currentMissionText = "You are nearby your job, simply click repair on the vehicle and wait for the timer to end to receive payment. Remain within 50m of the vehicle";
		_sleep = 0.9;//90 seconds
		};
	case 20:
		{
		_currentJob = "Repair a damaged truck nearby that will be marked on your map";
		_vehArray = ["I_Truck_02_transport_F","B_Truck_01_fuel_F","O_Truck_03_repair_F","B_Truck_01_box_F","I_Truck_02_covered_F"];
		_currentMissionText = "You are nearby your job, simply click repair on the vehicle and wait for the timer to end to receive payment. Remain within 50m of the vehicle";
		_sleep = 1.5;//150 seconds
		};
	case 21:
		{
		_currentJob = "Repair a damaged air vehicle nearby that will be marked on your map";
		_vehArray = ["I_Plane_Fighter_03_AA_F","B_Heli_Transport_03_unarmed_F","I_Heli_light_03_unarmed_F","I_Heli_Transport_02_F","O_Heli_Light_02_unarmed_F"];
		_currentMissionText = "You are nearby your job, simply click repair on the vehicle and wait for the timer to end to receive payment. Remain within 50m of the vehicle";
		_sleep = 3;//300 seconds
		};
	case 22:
		{
		_currentJob = "Repair a damaged military vehicle nearby that will be marked on your map";
		_vehArray = ["Land_UWreck_MV22_F","Land_Wreck_BRDM2_F","Land_Wreck_HMMWV_F","Land_Wreck_Ural_F","Plane_Fighter_03_wreck_F"];
		_currentMissionText = "You are nearby your job, simply click repair on the vehicle and wait for the timer to end to receive payment. Remain within 50m of the vehicle";
		_sleep = 4.5;//450 seconds
		};
	case 23:
		{
		_currentJob = "Repair a damaged vehicle nearby that will be marked on your map";
		_vehArray = ["B_Quadbike_01_F","C_Hatchback_01_F","C_Offroad_01_F","C_SUV_01_F","C_Van_01_transport_F","I_Truck_02_transport_F","B_Truck_01_fuel_F","O_Truck_03_repair_F","B_Truck_01_box_F","I_Truck_02_covered_F","I_Plane_Fighter_03_AA_F","B_Heli_Transport_03_unarmed_F","I_Heli_light_03_unarmed_F","I_Heli_Transport_02_F","O_Heli_Light_02_unarmed_F","Land_UWreck_MV22_F","Land_Wreck_BRDM2_F","Land_Wreck_HMMWV_F","Land_Wreck_Ural_F","Plane_Fighter_03_wreck_F"];
		_currentMissionText = "You are nearby your job, simply click repair on the vehicle and wait for the timer to end to receive payment. Remain within 50m of the vehicle";
		_sleep = 6;//600 seconds
		};
	case 24:
		{
		_currentJob = "Repair a damaged vehicle nearby that will be marked on your map";
		_vehArray = ["B_Quadbike_01_F","C_Hatchback_01_F","C_Offroad_01_F","C_SUV_01_F","C_Van_01_transport_F","I_Truck_02_transport_F","B_Truck_01_fuel_F","O_Truck_03_repair_F","B_Truck_01_box_F","I_Truck_02_covered_F","I_Plane_Fighter_03_AA_F","B_Heli_Transport_03_unarmed_F","I_Heli_light_03_unarmed_F","I_Heli_Transport_02_F","O_Heli_Light_02_unarmed_F","Land_UWreck_MV22_F","Land_Wreck_BRDM2_F","Land_Wreck_HMMWV_F","Land_Wreck_Ural_F","Plane_Fighter_03_wreck_F"];
		_currentMissionText = "You are nearby your job, simply click repair on the vehicle and wait for the timer to end to receive payment. Remain within 50m of the vehicle";
		_sleep = 8;//600 seconds
		};
	};

_payment = (_sleep*25000);
if((DS_infoArray select 23) > 23)then{_payment = (_payment*2)};

_action = [
		format ["You current job will be to %1",_currentJob],
		"Accept Job",
		"Accept",
		"Decline"
	] call BIS_fnc_guiMessage;
if(!_action )exitwith{DS_fuelMission = false;};

hint "Your job has been marked on your map";
systemchat "Your job has been marked on your map";

_markerLocation = (selectRandom _randomSpawn);
while{(player distance _markerLocation > 7000)}do
	{
	_markerLocation = (selectRandom _randomSpawn);
	};

player removeSimpleTask DS_patrolTask;
DS_patrolTask = player createSimpleTask ["patrolTask"];
DS_patrolTask setSimpleTaskDescription ["Go to the marked position on your map to start completing your mission","Current Mechanic Mission",""];
DS_patrolTask setSimpleTaskDestination _markerLocation;
DS_patrolTask setTaskState "Assigned";
player setCurrentTask DS_patrolTask;

while{true}do
	{
	if(player distance _markerLocation < 300)exitwith{};
	sleep 5;
	};

while{true}do
	{
	if(count(nearestObjects[_markerLocation,["Car","Ship","Air"],20]) != 0)then{hint "There is a vehicle blocking your missions vehicle from spawning, remove it to continue this mission"};
	if(count(nearestObjects[_markerLocation,["Car","Ship","Air"],20]) == 0)exitwith{};
	sleep 5;
	};

_veh = (selectRandom _vehArray);
_vehicle = createVehicle [_veh, _markerLocation, [], 0, "NONE"];
waitUntil {!isNil "_vehicle"};
_vehicle setVariable["vehicle_owners",[[getPlayerUID player,profileName]],true];
_vehicle setVariable["mechanicMission",true,true];
_vehicle lock 2;
[_vehicle] spawn DS_fnc_clearVehAmmo;
DS_keyRing pushBack _vehicle;
_vehicle setVariable["boot_open",true,true];
if(!((typeOf _vehicle) in ["Land_UWreck_MV22_F","Land_Wreck_BRDM2_F","Land_Wreck_HMMWV_F","Land_Wreck_Ural_F","Plane_Fighter_03_wreck_F"]))then
	{
	_vehicle setVectorUp [0,0,-30];
	_vehicle setDamage 0.9;
	_vehicle setHitPointDamage["HitLFWheel",1];
	_vehicle setHitPointDamage["HitLF2Wheel",1];
	_vehicle setHitPointDamage["HitRFWheel",1];
	_vehicle allowDamage false;
	clearWeaponCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	clearItemCargoGlobal _vehicle;
	};

player say3D "dingDong";
hint format ["%1",_currentMissionText];
systemchat format ["%1",_currentMissionText];

waitUntil{DS_mechanicMission};

_position = (position _vehicle);

disableSerialization;
_title = "Working On Vehicle";
"progressBar" cutRsc ["DS_progress","PLAIN"];
_ui = uiNamespace getVariable "DS_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cpRate = 0.01;
_cP = 0.01;
_fail = false;
while {true} do
	{

	sleep _sleep;
	if(isNull _ui) then {
		"progressBar" cutRsc ["DS_progress","PLAIN"];
		_ui = uiNamespace getVariable "DS_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(player distance _vehicle > 70) exitwith {};
	if(_cP >= 1 OR !alive player) exitWith {};
	if(!alive _vehicle)exitwith{};
	if(_vehicle distance _position > 20)exitwith{};
	};

"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player)exitwith{_fail = true;};
if(player distance _vehicle > 70) then {hint "You moved too far from the vehicle so your mission was cancelled";_fail = true;};
if(!alive _vehicle) then {hint "The vehicle you were meant to fix has been destroyed, therefore you have failed your job";_fail = true;};
if(_vehicle distance _position > 20) then {hint "The vehicle you were meant to fix has been moved further damaging it, therefore you have failed your job";_fail = true;};

if(!_fail)then
	{
	player say3D "success";
	hint format ["You job has been completed, you have been paid $%1. The vehicle will be impounded shortly",[_payment] call DS_fnc_numberText];
	systemchat format ["You job has been completed, you have been paid $%1. The vehicle will be impounded shortly",[_payment] call DS_fnc_numberText];
	[_payment,true,true] call DS_fnc_handleMoney;
	if((DS_infoArray select 23) == 19)then {
		_tempNum = (DS_infoArray select 24) + 1;
		if(_tempNum > 9)then {
			[3] call DS_fnc_questCompleted;
		} else {
			DS_infoArray set [24,_tempNum];
		};
	};
	if((DS_infoArray select 23) == 20)then {
		_tempNum = (DS_infoArray select 24) + 1;
		if(_tempNum > 9)then {
			[3] call DS_fnc_questCompleted;
		} else {
			DS_infoArray set [24,_tempNum];
		};
	};
	if((DS_infoArray select 23) == 21)then {
		_tempNum = (DS_infoArray select 24) + 1;
		if(_tempNum > 9)then {
			[3] call DS_fnc_questCompleted;
		} else {
			DS_infoArray set [24,_tempNum];
		};
	};
	if((DS_infoArray select 23) == 22)then {
		_tempNum = (DS_infoArray select 24) + 1;
		if(_tempNum > 9)then {
			[3] call DS_fnc_questCompleted;
		} else {
			DS_infoArray set [24,_tempNum];
		};
	};
	};

sleep 5;
deleteVehicle _vehicle;
player removeSimpleTask DS_patrolTask;
DS_mechanicMission = false;
DS_fuelMission = false;
