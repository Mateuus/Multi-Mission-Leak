/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Gang area ID convoy
*/

private["_tempNum","_startPrice","_counter","_infoArray","_playerCount","_randomSpawn","_vehArray","_veh","_vehicle","_failed","_marker","_copsNeeded"];

if(!([] call DS_civ_myHideout))exitwith{hint "You must own this gang hideout to do this mission"};

_startPrice = 250000;
_copsNeeded = 3;
if((DS_infoArray select 15) > 24)then{_startPrice = (_startPrice*0.5);};
_randomFinish =
[
getMarkerPos "cop_spawn_4",getMarkerPos "cop_spawn_3",getMarkerPos "police_hq_2",getMarkerPos "cop_spawn_5"
];

_markerlocation = (selectRandom _randomFinish);

if(!([_copsNeeded] call DS_fnc_countPlayers))exitWith
	{
	_str = parseText format ["<t color='#FF0000' size='1.5'><br/>There needs to be at least %1 whitelisted police officers on to begin this mission<br/></t>",_copsNeeded];
	hint _str;
	};

_action = [
	format ["This mission requires $%1 to start, you must drive a rigged vehicle to a marked area. If your vehicle remains there for 20 seconds it will explode, rewarding you with an ID hiding item",[_startPrice] call DS_fnc_numberText],
	"ID Convoy",
	"Start",
	"No Thanks"
] call BIS_fnc_guiMessage;
if(!_action )exitwith{};

_action = [
	"Air Lifting your convoy will cause it to blow up, Understand?",
	"Warning",
	"Yes",
	"No"
	] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

if([150000,true] call DS_fnc_checkMoney)exitwith{hint "You need at least $150k in your bank to begin this mission"};
[150000,true,false] call DS_fnc_handleMoney;

if(count(nearestObjects[(getMarkerPos (DS_spawnPoint select 0)),["Car","Ship","Air"],15]) != 0)exitWith{hint "There is a vehicle blocking the spawn point"};
if(DS_convoy)exitwith {hint "You already have a convoy mission active";};
DS_convoy = true;

_markerLocation = (selectRandom _randomFinish);
player removeSimpleTask DS_convoyTask;
DS_convoyTask = player createSimpleTask ["convoyTask"];
DS_convoyTask setSimpleTaskDescription ["Drive your convoy truck to the area marked on yor map","Park Rigged Vehicle Here",""];
DS_convoyTask setSimpleTaskDestination _markerLocation;
DS_convoyTask setTaskState "Assigned";
player setCurrentTask DS_convoyTask;

_vehArray = ["B_Truck_01_box_F","B_Truck_01_covered_F","B_Truck_01_transport_F","I_Truck_02_covered_F","I_Truck_02_transport_F","C_Truck_02_transport_F"];
_veh = (selectRandom _vehArray);
_vehicle = createVehicle [_veh, (getMarkerPos (DS_spawnPoint select 0)), [], 0, "NONE"];
waitUntil {!isNil "_vehicle"};
_vehicle setVariable["vehicle_owners",[[getPlayerUID player,profileName]],true];
_vehicle setVariable ["carBomb",true,true];
_vehicle lock 2;
DS_keyRing pushBack _vehicle;
_vehicle setVariable["boot_open",true,true];
hint "You must travel to the police HQ that is marked on your map";
systemchat "You must travel to the police HQ that is marked on your map";

DS_currentTask1 = "ID Convoy Driver - Final Phase";
DS_currentTask2 = "You must drive your convoy truck to the area marked on your map. Once there a bomb in the truck will trigger, you will have a short amount of time to run from the truck. If you do not die you will rewarded with a fake ID item";

_counter = 0;

while{true}do
	{
	if(_vehicle distance _markerLocation < 10)then{_counter = _counter + 1;hint "Your vehicle is in the area, get out and run before it explodes. Make sure police do not move it";};
	if ((getPos (_vehicle) select 2) > 20) then {_vehicle setDamage 1};
	if(!alive _vehicle)exitwith{_failed = true;};
	sleep 10;
	if(_counter > 2)exitwith{_failed = false;};
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

_sp = getPos _vehicle;
_typeOfVeh = "M_PG_AT";
_explosion = _typeOfVeh createVehicle _sp;
sleep 0.1;
_sp = getPos _vehicle;
_typeOfVeh = "M_PG_AT";
_explosion = _typeOfVeh createVehicle _sp;
sleep 0.1;
_sp = getPos _vehicle;
_typeOfVeh = "M_PG_AT";
_explosion = _typeOfVeh createVehicle _sp;
sleep 0.1;
_vehicle setDamage 1;

sleep 5;
if((!alive player)||(player distance spawnIsland < 500))exitWith
	{
	DS_currentTask1 = "";
	hint "You have died therefore failed your mission";
	DS_convoy = false;
	player removeSimpleTask DS_convoyTask;
	};

player say3D "success";
hint "You have completed your mission and an ID changer has been added to your inventory";
systemchat "You have completed your mission and an ID changer has been added to your inventory";

player removeSimpleTask DS_convoyTask;
DS_convoy = false;
["idChanger",true,1] call DS_fnc_handleInventory;

sleep 5;

DS_currentTask1 = "";

if(DS_tokenMission == 3)then
	{
	DS_tokenMission = -1;
	[70,name player,false] spawn DS_civ_payTokens;
	DS_rebelMissionToken = false;
	};

if((DS_infoArray select 15) == 24)then { [1] call DS_fnc_questCompleted };
if((DS_infoArray select 15) == 37)then {
	_tempNum = (DS_infoArray select 16) + 1;
	if(_tempNum > 2)then {
		[1] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [16,_tempNum];
	};
};