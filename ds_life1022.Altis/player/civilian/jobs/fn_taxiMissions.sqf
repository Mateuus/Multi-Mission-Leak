/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Starts SUV taxi missions
*/

private ["_curLevel","_taxi","_payPerKm","_fail","_player","_info","_npcArray","_multiplier","_minDistancePickup","_maxDistancePickup","_minDistanceDropoff","_maxDistanceDropoff","_tipMax","_action","_markerArray","_markerLocation","_maxSpawns","_counter","_payment","_marker","_typeOfNpc","_npc1","_npc2","_npc3","_tipChance","_temp"];

_curLevel = DS_realEstateArray select 23;
_taxi = (vehicle player);
_payPerKm = 1.7;
//if((DS_infoArray select ) > 20)then{_payPerKm = (_payPerKm*1.2);};
if(DS_realMode)then{_payPerKm = (_payPerKm*1.5)};
if((DS_infoArray select 13) > 26)then { _payPerKm = (_payPerKm*1.25) };
_fail = false;
_player = format ["%1",player];

_failMission = {
	_fail = true;
	hint (_this select 0);
	player say3D "fail";
	DS_dusting = false;
	DS_currentTask1 = "";
	player removeSimpleTask DS_civJobTask;

	if(!isNil "_npc1")then{deleteVehicle _npc1;};
	if(!isNil "_npc2")then{deleteVehicle _npc2;};
	if(!isNil "_npc3")then{deleteVehicle _npc3;};
};

switch(_curLevel)do
	{
	case 0:
		{
		_info = "Pick up a nearby passenger and take him to a nearby destination";
		_npcArray = ["C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_man_sport_1_F_tanoan","C_man_sport_2_F_tanoan","C_man_shorts_4_F","C_Man_casual_6_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan"];
		_multiplier = 1;
		_minDistancePickup = 500;
		_maxDistancePickup = 2000;
		_minDistanceDropoff = 500;
		_maxDistanceDropoff = 2000;
		_tipMax = 1000;
		};
	case 1:
		{
		_info = "Pick up a nearby VIP passenger and take him to a nearby destination";
		_npcArray = ["C_journalist_F","C_Nikos_aged","C_scientist_F","C_Marshal_F"];
		_multiplier = 2;
		_minDistancePickup = 500;
		_maxDistancePickup = 2000;
		_minDistanceDropoff = 500;
		_maxDistanceDropoff = 2000;
		_tipMax = 3000;
		};
	case 2:
		{
		_info = "Pick up a nearby passenger and take him to a distant destination";
		_npcArray = ["C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_man_sport_1_F_tanoan","C_man_sport_2_F_tanoan","C_man_shorts_4_F","C_Man_casual_6_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan"];
		_multiplier = 1.1;
		_minDistancePickup = 500;
		_maxDistancePickup = 2000;
		_minDistanceDropoff = 5000;
		_maxDistanceDropoff = 10000;
		_tipMax = 1500;
		};
	case 3:
		{
		_info = "Pick up a nearby VIP passenger and take him to a distant destination";
		_npcArray = ["C_journalist_F","C_Nikos_aged","C_scientist_F","C_Marshal_F"];
		_multiplier = 2.2;
		_minDistancePickup = 500;
		_maxDistancePickup = 2000;
		_minDistanceDropoff = 5000;
		_maxDistanceDropoff = 10000;
		_tipMax = 6000;
		};
	case 4:
		{
		_info = "Pick up a distant passenger and take him to a distant destination";
		_npcArray = ["C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_man_sport_1_F_tanoan","C_man_sport_2_F_tanoan","C_man_shorts_4_F","C_Man_casual_6_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan"];
		_multiplier = 1.4;
		_minDistancePickup = 5000;
		_maxDistancePickup = 8000;
		_minDistanceDropoff = 5000;
		_maxDistanceDropoff = 8000;
		_tipMax = 3000;
		};
	case 5:
		{
		_info = "Pick up a distant VIP passenger and take him to a distant destination";
		_npcArray = ["C_journalist_F","C_Nikos_aged","C_scientist_F","C_Marshal_F"];
		_multiplier = 2.8;
		_minDistancePickup = 5000;
		_maxDistancePickup = 8000;
		_minDistanceDropoff = 5000;
		_maxDistanceDropoff = 8000;
		_tipMax = 12000;
		};
	case 6:
		{
		_info = "Pick up a nearby passenger and take him to a very distant destination";
		_npcArray = ["C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_man_sport_1_F_tanoan","C_man_sport_2_F_tanoan","C_man_shorts_4_F","C_Man_casual_6_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan"];
		_multiplier = 1.5;
		_minDistancePickup = 500;
		_maxDistancePickup = 2000;
		_minDistanceDropoff = 12000;
		_maxDistanceDropoff = 20000;
		_tipMax = 9000;
		};
	case 7:
		{
		_info = "Pick up a distant VIP passenger and take him to a distant destination";
		_npcArray = ["C_journalist_F","C_Nikos_aged","C_scientist_F","C_Marshal_F"];
		_multiplier = 3;
		_minDistancePickup = 500;
		_maxDistancePickup = 2000;
		_minDistanceDropoff = 12000;
		_maxDistanceDropoff = 20000;
		_tipMax = 18000;
		};
	case 8:
		{
		_info = "Pick up two nearby passengers and take them to a nearby destination";
		_npcArray = ["C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_man_sport_1_F_tanoan","C_man_sport_2_F_tanoan","C_man_shorts_4_F","C_Man_casual_6_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan"];
		_multiplier = 1.6;
		_minDistancePickup = 500;
		_maxDistancePickup = 2000;
		_minDistanceDropoff = 500;
		_maxDistanceDropoff = 2000;
		_tipMax = 2000;
		};
	case 9:
		{
		_info = "Pick up two nearby VIP passengers and take them to a nearby destination";
		_npcArray = ["C_journalist_F","C_Nikos_aged","C_scientist_F","C_Marshal_F"];
		_multiplier = 3.2;
		_minDistancePickup = 500;
		_maxDistancePickup = 2000;
		_minDistanceDropoff = 500;
		_maxDistanceDropoff = 2000;
		_tipMax = 6000;
		};
	case 10:
		{
		_info = "Pick up two nearby passengers and take them to a distant destination";
		_npcArray = ["C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_man_sport_1_F_tanoan","C_man_sport_2_F_tanoan","C_man_shorts_4_F","C_Man_casual_6_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan"];
		_multiplier = 1.8;
		_minDistancePickup = 500;
		_maxDistancePickup = 2000;
		_minDistanceDropoff = 5000;
		_maxDistanceDropoff = 10000;
		_tipMax = 3000;
		};
	case 11:
		{
		_info = "Pick up two nearby VIP passengers and take them to a distant destination";
		_npcArray = ["C_journalist_F","C_Nikos_aged","C_scientist_F","C_Marshal_F"];
		_multiplier = 3.6;
		_minDistancePickup = 500;
		_maxDistancePickup = 2000;
		_minDistanceDropoff = 5000;
		_maxDistanceDropoff = 10000;
		_tipMax = 12000;
		};
	case 12:
		{
		_info = "Pick up two distant passengers and take them to a distant destination";
		_npcArray = ["C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_man_sport_1_F_tanoan","C_man_sport_2_F_tanoan","C_man_shorts_4_F","C_Man_casual_6_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan"];
		_multiplier = 2;
		_minDistancePickup = 5000;
		_maxDistancePickup = 8000;
		_minDistanceDropoff = 5000;
		_maxDistanceDropoff = 8000;
		_tipMax = 6000;
		};
	case 13:
		{
		_info = "Pick up two distant VIP passengers and take them to a distant destination";
		_npcArray = ["C_journalist_F","C_Nikos_aged","C_scientist_F","C_Marshal_F"];
		_multiplier = 4;
		_minDistancePickup = 5000;
		_maxDistancePickup = 8000;
		_minDistanceDropoff = 5000;
		_maxDistanceDropoff = 8000;
		_tipMax = 24000;
		};
	case 14:
		{
		_info = "Pick up two nearby passengers and take them to a very distant destination";
		_npcArray = ["C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_man_sport_1_F_tanoan","C_man_sport_2_F_tanoan","C_man_shorts_4_F","C_Man_casual_6_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan"];
		_multiplier = 2.2;
		_minDistancePickup = 500;
		_maxDistancePickup = 2000;
		_minDistanceDropoff = 12000;
		_maxDistanceDropoff = 20000;
		_tipMax = 18000;
		};
	case 15:
		{
		_info = "Pick up two distant VIP passengers and take them to a distant destination";
		_npcArray = ["C_journalist_F","C_Nikos_aged","C_scientist_F","C_Marshal_F"];
		_multiplier = 4.4;
		_minDistancePickup = 500;
		_maxDistancePickup = 2000;
		_minDistanceDropoff = 12000;
		_maxDistanceDropoff = 20000;
		_tipMax = 36000;
		};
	case 16:
		{
		_info = "Pick up three nearby passengers and take them to a nearby destination";
		_npcArray = ["C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_man_sport_1_F_tanoan","C_man_sport_2_F_tanoan","C_man_shorts_4_F","C_Man_casual_6_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan"];
		_multiplier = 2.4;
		_minDistancePickup = 500;
		_maxDistancePickup = 2000;
		_minDistanceDropoff = 500;
		_maxDistanceDropoff = 2000;
		_tipMax = 3000;
		};
	case 17:
		{
		_info = "Pick up three nearby VIP passengers and take them to a nearby destination";
		_npcArray = ["C_journalist_F","C_Nikos_aged","C_scientist_F","C_Marshal_F"];
		_multiplier = 4.8;
		_minDistancePickup = 500;
		_maxDistancePickup = 2000;
		_minDistanceDropoff = 500;
		_maxDistanceDropoff = 2000;
		_tipMax = 9000;
		};
	case 18:
		{
		_info = "Pick up three nearby passengers and take them to a distant destination";
		_npcArray = ["C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_man_sport_1_F_tanoan","C_man_sport_2_F_tanoan","C_man_shorts_4_F","C_Man_casual_6_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan"];
		_multiplier = 2.7;
		_minDistancePickup = 500;
		_maxDistancePickup = 2000;
		_minDistanceDropoff = 5000;
		_maxDistanceDropoff = 10000;
		_tipMax = 4500;
		};
	case 19:
		{
		_info = "Pick up two nearby VIP passengers and take them to a distant destination";
		_npcArray = ["C_journalist_F","C_Nikos_aged","C_scientist_F","C_Marshal_F"];
		_multiplier = 5.4;
		_minDistancePickup = 500;
		_maxDistancePickup = 2000;
		_minDistanceDropoff = 5000;
		_maxDistanceDropoff = 10000;
		_tipMax = 18000;
		};
	case 20:
		{
		_info = "Pick up three distant passengers and take them to a distant destination";
		_npcArray = ["C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_man_sport_1_F_tanoan","C_man_sport_2_F_tanoan","C_man_shorts_4_F","C_Man_casual_6_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan"];
		_multiplier = 3;
		_minDistancePickup = 5000;
		_maxDistancePickup = 8000;
		_minDistanceDropoff = 5000;
		_maxDistanceDropoff = 8000;
		_tipMax = 9000;
		};
	case 21:
		{
		_info = "Pick up three distant VIP passengers and take them to a distant destination";
		_npcArray = ["C_journalist_F","C_Nikos_aged","C_scientist_F","C_Marshal_F"];
		_multiplier = 6;
		_minDistancePickup = 5000;
		_maxDistancePickup = 8000;
		_minDistanceDropoff = 5000;
		_maxDistanceDropoff = 8000;
		_tipMax = 32000;
		};
	case 22:
		{
		_info = "Pick up three nearby passengers and take them to a very distant destination";
		_npcArray = ["C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_man_sport_1_F_tanoan","C_man_sport_2_F_tanoan","C_man_shorts_4_F","C_Man_casual_6_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan"];
		_multiplier = 3.3;
		_minDistancePickup = 500;
		_maxDistancePickup = 2000;
		_minDistanceDropoff = 12000;
		_maxDistanceDropoff = 20000;
		_tipMax = 27000;
		};
	case 23:
		{
		_info = "Pick up three distant VIP passengers and take them to a distant destination";
		_npcArray = ["C_journalist_F","C_Nikos_aged","C_scientist_F","C_Marshal_F"];
		_multiplier = 6.6;
		_minDistancePickup = 500;
		_maxDistancePickup = 2000;
		_minDistanceDropoff = 12000;
		_maxDistanceDropoff = 20000;
		_tipMax = 46000;
		};
	};

_action = [
	format ["You are a level %1 Taxi Driver. You job is to %2. You must complete another %3 missions to be promoted to the next level",_curLevel,_info,(((DS_realEstateArray select 24)-4)*-1)],
	"Taxi Driver!",
	"Start Job",
	"Cancel"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

if(DS_dusting)exitwith{hint "You already have a mission running"};
DS_dusting = true;

hint "Standby for mission\n\nYou will get a call out shortly...";
player say3D "dingDong";

DS_currentTask1 = "Taxi Mission - Phase One";
DS_currentTask2 = "Standby for mission. You will get a call out shortly...";

_markerArray = [getMarkerPos "busKav",getMarkerPos "jobs1_1",getMarkerPos "cop_air_2_1_1_1_1",getMarkerPos "oilp_1",getMarkerPos "f",getMarkerPos "Gas1_1_1_2_1_1_1_1",getMarkerPos "auctionHouse",getMarkerPos "boat_5",
getMarkerPos "1_5",getMarkerPos "bv_1_2_1_1_1_5",getMarkerPos "civ_gar_1_1_1_2_1_1",getMarkerPos "wlJob2",getMarkerPos "Gen_3_1_2",getMarkerPos "0_1",getMarkerPos "Gas1_2",getMarkerPos "boat_2_2",
getMarkerPos "hospital_third",getMarkerPos "civ_spawn_1",getMarkerPos "0",getMarkerPos "busKavTruck",getMarkerPos "civ_gar_1",getMarkerPos "bv_1_2_1_1_1_1",getMarkerPos "apple2",getMarkerPos "oilp_1_2",
getMarkerPos "g_1",getMarkerPos "Gas1",getMarkerPos "policeMissionMarker1",getMarkerPos "wlJob16",getMarkerPos "1_2",getMarkerPos "oilp_1_3_1_1",getMarkerPos "jobMarker4",getMarkerPos "jobMarker52",
getMarkerPos "1_2",getMarkerPos "gt_1",getMarkerPos "oilp_1_4",getMarkerPos "air_serv_2",getMarkerPos "airshop_4",getMarkerPos "gun_store_1",getMarkerPos "jobs1_5",
getMarkerPos "air_serv_3",getMarkerPos "busMolosAir",getMarkerPos "boat_9",getMarkerPos "bv_1_2_1_1_1_3",getMarkerPos "wood",getMarkerPos "Gas1_1_1_2_1_1_1",getMarkerPos "jobMarker79",getMarkerPos "copper",
getMarkerPos "peach2",getMarkerPos "oilp",getMarkerPos "jobMarker58",getMarkerPos "air_serv_1",getMarkerPos "skydiving_2",getMarkerPos "airshop_1",getMarkerPos "powerMarker",getMarkerPos "apple4",
getMarkerPos "busAthira",getMarkerPos "jobs1",getMarkerPos "car1_2_1_1",getMarkerPos "h1_1",getMarkerPos "oilp_1_3",getMarkerPos "boat_2_1",getMarkerPos "boat_4",getMarkerPos "hospital_3",
getMarkerPos "v_1_2_2",getMarkerPos "Gas1_1_1_2_1",getMarkerPos "oilp_1_3_1",getMarkerPos "g_2_1",getMarkerPos "1_3",getMarkerPos "car_g_777",getMarkerPos "jobs1_2",getMarkerPos "peach3",
getMarkerPos "v_1_2_1",getMarkerPos "v_1_2_1",getMarkerPos "jobMarker72",getMarkerPos "Gas1_1",getMarkerPos "f_1_1",getMarkerPos "bv_1_2_1_1_1_6",getMarkerPos "oilp_1_1",getMarkerPos "boat_3",
getMarkerPos "air_serv_5",getMarkerPos "jobMarker64",getMarkerPos "v_1_9",getMarkerPos "busAir",getMarkerPos "jobMarker16",getMarkerPos "jobMarker63",getMarkerPos "jobMarker66",getMarkerPos "jobMarker20",
getMarkerPos "Gas1_1_1_1",getMarkerPos "bv_1_2_3",getMarkerPos "1_1",getMarkerPos "jobMarker73",getMarkerPos "salt",getMarkerPos "air_serv_6",getMarkerPos "jobMarker33",getMarkerPos "f_1",
getMarkerPos "jobMarker26",getMarkerPos "gun_store_1_1",getMarkerPos "boat_2",getMarkerPos "jobMarker21",getMarkerPos "boat_6",getMarkerPos "busSofia",getMarkerPos "peach4",getMarkerPos "bv_1_2_1",
getMarkerPos "hospital_2",getMarkerPos "g_2",getMarkerPos "jobs1_3",getMarkerPos "bv_1_2_1_1_1_4",getMarkerPos "air_serv_4",getMarkerPos "bv_1_1_2",getMarkerPos "jobMarker23"];

_maxSpawns = (count _markerArray);
_counter = 0;

if(!((vehicle player) isEqualTo _taxi))exitwith{["Mission failed because you are no longer in a taxi"] call _failMission;};

sleep 10;

player say3D "phoneCall";

//First 8 levels are 1 NPC
if(_curLevel < 8)then
	{
	hint "Your passenger is awaiting pickup (Marked on your map)";
	systemchat "Your passenger is awaiting pickup (Marked on your map)";

	_markerLocation = (selectRandom _markerArray);
	while{((player distance _markerLocation < _minDistancePickup)||(player distance _markerLocation > _maxDistancePickup))} do
		{
		_markerLocation = (selectRandom _markerArray);
		if(_counter >= _maxSpawns)then
			{
			_minDistancePickup = _minDistancePickup + 2000;
			_maxDistancePickup = _maxDistancePickup + 5000;
			while{((player distance _markerLocation < _minDistancePickup)||(player distance _markerLocation > _maxDistancePickup))} do
				{
				_markerLocation = (selectRandom _markerArray);
				};
			};
		_counter = _counter + 1;
		};

	player removeSimpleTask DS_civJobTask;
	DS_civJobTask = player createSimpleTask ["civJobTask"];
	DS_civJobTask setSimpleTaskDescription ["Passenger Pick up point","Passenger Pickup Point",""];
	DS_civJobTask setSimpleTaskDestination _markerLocation;
	DS_civJobTask setTaskState "Assigned";
	player setCurrentTask DS_civJobTask;

	_payment = round ((player distance _markerLocation)*_payPerKm);

	while{true}do
		{
		sleep 10;
		if((isNull _taxi)||(!alive _taxi))exitwith{["Mission failed because your taxi was destroyed"] call _failMission;};
		if(((getPos player) select 2) > 15)exitwith{["Mission failed because your vehicle is not allowed to gain elevation during this mission"] call _failMission;};
		if(((vehicle player) isEqualTo _taxi)&&(_taxi distance _markerLocation < 300))exitwith{};
		};

	if(_fail)exitwith{};

	_typeOfNpc = (selectRandom _npcArray);
	_npc1 = DS_civGroup createUnit [_typeOfNpc, _markerLocation, [], 0, "NONE"];
	waitUntil{!isNil "_npc1"};
	_npc1 addEventHandler ["HandleDamage",{false}];
	_npc1 allowDamage false;
	_npc1 disableAI "MOVE";

	while{true}do
		{
		if((isNull _taxi)||(!alive _taxi))exitwith{["Mission failed because your taxi was destroyed"] call _failMission;};
		if(((vehicle player) isEqualTo _taxi)&&(_taxi distance _npc1 < 35))exitwith
			{
			_npc1 moveInCargo _taxi;
			hint "Great, this passenger would like to be dropped off at the marker shown on your map";
			systemchat "Great, this passenger would like to be dropped off at the marker shown on your map";
			DS_currentTask1 = "Taxi Mission - Final Phase";
			DS_currentTask2 = "Drive your passenger to the passenger drop point marked on your map";
			};
		sleep 10;
		};

	if(_fail)exitwith{};

	_markerLocation = (selectRandom _markerArray);
	while{((player distance _markerLocation < _minDistanceDropoff)||(player distance _markerLocation > _maxDistanceDropoff))} do
		{
		_markerLocation = (selectRandom _markerArray);
		if(_counter >= _maxSpawns)then
			{
			_minDistanceDropoff = _minDistanceDropoff + 2000;
			_maxDistanceDropoff = _maxDistanceDropoff + 5000;
			while{((player distance _markerLocation < _minDistanceDropoff)||(player distance _markerLocation > _maxDistanceDropoff))} do
				{
				_markerLocation = (selectRandom _markerArray);
				};
			};
		_counter = _counter + 1;
		};

	player removeSimpleTask DS_civJobTask;
	DS_civJobTask = player createSimpleTask ["civJobTask"];
	DS_civJobTask setSimpleTaskDescription ["Drop your passenger(s) off here","Passenger Drop Point",""];
	DS_civJobTask setSimpleTaskDestination _markerLocation;
	DS_civJobTask setTaskState "Assigned";
	player setCurrentTask DS_civJobTask;

	_payment = _payment + round ((player distance _markerLocation)*_payPerKm);
	_payment = _payment*_multiplier;

	while{true}do
		{
		sleep 10;
		if((isNull _taxi)||(!alive _taxi))exitwith{["Mission failed because your taxi was destroyed"] call _failMission;};
		if(!(_npc1 in (crew _taxi)))then{_npc1 moveInCargo _taxi;};
		if(((getPos player) select 2) > 15)exitwith{["Mission failed because your vehicle is not allowed to gain elevation during this mission"] call _failMission;};
		if(!alive _npc1)exitwith{["Mission failed because your passenger(s) was killed"] call _failMission;};
		if(((vehicle player) isEqualTo _taxi)&&(_taxi distance _markerLocation < 20))exitwith{};
		};

	if(_fail)exitwith{};

	_tipChance = (random 10);
	if(_tipChance > 6)then
		{
		_tipChance = random _tipMax;
		hint format ["Thanks for the lift, you have been paid $%1 plus a tip of $%2",[_payment] call DS_fnc_numberText,[_tipChance] call DS_fnc_numberText];
		systemchat format ["Thanks for the lift, you have been paid $%1 plus a tip of $%2",[_payment] call DS_fnc_numberText,[_tipChance] call DS_fnc_numberText];
		[_payment,true,true] call DS_fnc_handleMoney;
		[_tipChance,false,true] call DS_fnc_handleMoney;
		}
		else
		{
		hint format ["Thanks for the lift, you have been paid $%1",[_payment] call DS_fnc_numberText];
		systemchat format ["Thanks for the lift, you have been paid $%1",[_payment] call DS_fnc_numberText];
		[_payment,true,true] call DS_fnc_handleMoney;
		};

	_npc1 action["Eject",_taxi];
	sleep 1;
	deleteVehicle _npc1;
	};

//if(_fail)exitwith{_temp = DS_realEstateArray select 24;_temp = _temp - 1;if(_temp < 1)then{_temp = 0};DS_realEstateArray set [24,_temp];};
if(_fail)exitwith{};

//Next 8 levels are 2 NPCs
if((_curLevel > 7)&&(_curLevel < 16))then
	{
	hint "Your passengers are awaiting pickup (Marked on your map)";
	systemchat "Your passengers are awaiting pickup (Marked on your map)";

	_markerLocation = (selectRandom _markerArray);
	while{((player distance _markerLocation < _minDistancePickup)||(player distance _markerLocation > _maxDistancePickup))} do
		{
		_markerLocation = (selectRandom _markerArray);
		if(_counter >= _maxSpawns)then
			{
			_minDistancePickup = _minDistancePickup + 2000;
			_maxDistancePickup = _maxDistancePickup + 5000;
			while{((player distance _markerLocation < _minDistancePickup)||(player distance _markerLocation > _maxDistancePickup))} do
				{
				_markerLocation = (selectRandom _markerArray);
				};
			};
		_counter = _counter + 1;
		};

	player removeSimpleTask DS_civJobTask;
	DS_civJobTask = player createSimpleTask ["civJobTask"];
	DS_civJobTask setSimpleTaskDescription ["Pick you passengers up here","Passenger Pickup Point",""];
	DS_civJobTask setSimpleTaskDestination _markerLocation;
	DS_civJobTask setTaskState "Assigned";
	player setCurrentTask DS_civJobTask;

	_payment = round ((player distance _markerLocation)*_payPerKm);

	while{true}do
		{
		sleep 10;
		if((isNull _taxi)||(!alive _taxi))exitwith{["Mission failed because your taxi was destroyed"] call _failMission;};
		if(((getPos player) select 2) > 15)exitwith{["Mission failed because your vehicle is not allowed to gain elevation during this mission"] call _failMission;};
		if(((vehicle player) isEqualTo _taxi)&&(_taxi distance _markerLocation < 300))exitwith{};
		};

	if(_fail)exitwith{};

	_typeOfNpc = (selectRandom _npcArray);
	_npc1 = DS_civGroup createUnit [_typeOfNpc, _markerLocation, [], 0, "NONE"];
	waitUntil{!isNil "_npc1"};
	_npc1 addEventHandler ["HandleDamage",{false}];
	_npc1 allowDamage false;
	_npc1 disableAI "MOVE";

	_typeOfNpc = (selectRandom _npcArray);
	_npc2 = DS_civGroup createUnit [_typeOfNpc, _markerLocation, [], 0, "NONE"];
	waitUntil{!isNil "_npc2"};
	_npc2 addEventHandler ["HandleDamage",{false}];
	_npc2 allowDamage false;
	_npc2 disableAI "MOVE";

	while{true}do
		{
		if((isNull _taxi)||(!alive _taxi))exitwith{["Mission failed because your taxi was destroyed"] call _failMission;};
		if(((vehicle player) isEqualTo _taxi)&&(_taxi distance _npc1 < 35))exitwith
			{
			_npc1 moveInCargo _taxi;
			_npc2 moveInCargo _taxi;
			hint "Great, these passengers would like to be dropped off at the marker shown on your map";
			systemchat "Great, these passengers would like to be dropped off at the marker shown on your map";
			DS_currentTask1 = "Taxi Mission - Final Phase";
			DS_currentTask2 = "Drive your passengers to the passenger drop point marked on your map";
			};
		sleep 10;
		};

	if(_fail)exitwith{};

	_markerLocation = (selectRandom _markerArray);
	while{((player distance _markerLocation < _minDistanceDropoff)||(player distance _markerLocation > _maxDistanceDropoff))} do
		{
		_markerLocation = (selectRandom _markerArray);
		if(_counter >= _maxSpawns)then
			{
			_minDistanceDropoff = _minDistanceDropoff + 2000;
			_maxDistanceDropoff = _maxDistanceDropoff + 5000;
			while{((player distance _markerLocation < _minDistanceDropoff)||(player distance _markerLocation > _maxDistanceDropoff))} do
				{
				_markerLocation = (selectRandom _markerArray);
				};
			};
		_counter = _counter + 1;
		};

	player removeSimpleTask DS_civJobTask;
	DS_civJobTask = player createSimpleTask ["civJobTask"];
	DS_civJobTask setSimpleTaskDescription ["Drop your passenger(s) off here","Passenger Drop Point",""];
	DS_civJobTask setSimpleTaskDestination _markerLocation;
	DS_civJobTask setTaskState "Assigned";
	player setCurrentTask DS_civJobTask;

	_payment = _payment + round ((player distance _markerLocation)*_payPerKm);
	_payment = _payment*_multiplier;

	while{true}do
		{
		sleep 10;
		if((isNull _taxi)||(!alive _taxi))exitwith{["Mission failed because your taxi was destroyed"] call _failMission;};
		if(!(_npc1 in (crew _taxi)))then{_npc1 moveInCargo _taxi;};
		if(!(_npc2 in (crew _taxi)))then{_npc2 moveInCargo _taxi;};
		if(((getPos player) select 2) > 15)exitwith{["Mission failed because your vehicle is not allowed to gain elevation during this mission"] call _failMission;};
		if((!alive _npc1)||(!alive _npc2))exitwith{["Mission failed because your passenger(s) was killed"] call _failMission;};
		if(((vehicle player) isEqualTo _taxi)&&(_taxi distance _markerLocation < 20))exitwith{};
		};

	if(_fail)exitwith{};

	_tipChance = (random 10);
	if(_tipChance > 6)then
		{
		_tipChance = random _tipMax;
		hint format ["Thanks for the lift, you have been paid $%1 plus a tip of $%2",[_payment] call DS_fnc_numberText,[_tipChance] call DS_fnc_numberText];
		systemchat format ["Thanks for the lift, you have been paid $%1 plus a tip of $%2",[_payment] call DS_fnc_numberText,[_tipChance] call DS_fnc_numberText];
		[_payment,true,true] call DS_fnc_handleMoney;
		[_tipChance,false,true] call DS_fnc_handleMoney;
		}
		else
		{
		hint format ["Thanks for the lift, you have been paid $%1",[_payment] call DS_fnc_numberText];
		systemchat format ["Thanks for the lift, you have been paid $%1",[_payment] call DS_fnc_numberText];
		[_payment,true,true] call DS_fnc_handleMoney;
		};

	_npc1 action["Eject",_taxi];
	_npc2 action["Eject",_taxi];
	sleep 1;
	deleteVehicle _npc1;
	deleteVehicle _npc2;
	};

//if(_fail)exitwith{_temp = DS_realEstateArray select 24;_temp = _temp - 1;if(_temp < 1)then{_temp = 0};DS_realEstateArray set [24,_temp];};
if(_fail)exitwith{};

//Next 8 levels are 3 NPCs
if(_curLevel > 15)then
	{
	hint "Your passengers are awaiting pickup (Marked on your map)";
	systemchat "Your passengers are awaiting pickup (Marked on your map)";

	_markerLocation = (selectRandom _markerArray);
	while{((player distance _markerLocation < _minDistancePickup)||(player distance _markerLocation > _maxDistancePickup))} do
		{
		_markerLocation = (selectRandom _markerArray);
		if(_counter >= _maxSpawns)then
			{
			_minDistancePickup = _minDistancePickup + 2000;
			_maxDistancePickup = _maxDistancePickup + 5000;
			while{((player distance _markerLocation < _minDistancePickup)||(player distance _markerLocation > _maxDistancePickup))} do
				{
				_markerLocation = (selectRandom _markerArray);
				};
			};
		_counter = _counter + 1;
		};

	player removeSimpleTask DS_civJobTask;
	DS_civJobTask = player createSimpleTask ["civJobTask"];
	DS_civJobTask setSimpleTaskDescription ["Pickup your passengers here","Passenger Pickup Point",""];
	DS_civJobTask setSimpleTaskDestination _markerLocation;
	DS_civJobTask setTaskState "Assigned";
	player setCurrentTask DS_civJobTask;

	_payment = round ((player distance _markerLocation)*_payPerKm);

	while{true}do
		{
		sleep 10;
		if((isNull _taxi)||(!alive _taxi))exitwith{["Mission failed because your taxi was destroyed"] call _failMission;};
		if((getPos (player) select 2) > 15)exitwith{["Mission failed"] call _failMission;};
		if(((vehicle player) isEqualTo _taxi)&&(_taxi distance _markerLocation < 300))exitwith{};
		};

	if(_fail)exitwith{};

	_typeOfNpc = (selectRandom _npcArray);
	_npc1 = DS_civGroup createUnit [_typeOfNpc, _markerLocation, [], 0, "NONE"];
	waitUntil{!isNil "_npc1"};
	_npc1 addEventHandler ["HandleDamage",{false}];
	_npc1 allowDamage false;
	_npc1 disableAI "MOVE";

	_typeOfNpc = (selectRandom _npcArray);
	_npc2 = DS_civGroup createUnit [_typeOfNpc, _markerLocation, [], 0, "NONE"];
	waitUntil{!isNil "_npc2"};
	_npc2 addEventHandler ["HandleDamage",{false}];
	_npc2 allowDamage false;
	_npc2 disableAI "MOVE";

	_typeOfNpc = (selectRandom _npcArray);
	_npc3 = DS_civGroup  createUnit [_typeOfNpc, _markerLocation, [], 0, "NONE"];
	waitUntil{!isNil "_npc3"};
	_npc3 addEventHandler ["HandleDamage",{false}];
	_npc3 allowDamage false;
	_npc3 disableAI "MOVE";

	while{true}do
		{
		if((isNull _taxi)||(!alive _taxi))exitwith{["Mission failed because your taxi was destroyed"] call _failMission;};
		if(((vehicle player) isEqualTo _taxi)&&(_taxi distance _npc1 < 35))exitwith
			{
			_npc1 moveInCargo _taxi;
			_npc2 moveInCargo _taxi;
			_npc3 moveInCargo _taxi;
			hint "Great, these passengers would like to be dropped off at the marker shown on your map";
			systemchat "Great, these passengers would like to be dropped off at the marker shown on your map";
			DS_currentTask1 = "Taxi Mission - Final Phase";
			DS_currentTask2 = "Drive your passengers to the passenger drop point marked on your map";
			};
		sleep 10;
		};

	if(_fail)exitwith{};

	_markerLocation = (selectRandom _markerArray);
	while{((player distance _markerLocation < _minDistanceDropoff)||(player distance _markerLocation > _maxDistanceDropoff))} do
		{
		_markerLocation = (selectRandom _markerArray);
		if(_counter >= _maxSpawns)then
			{
			_minDistanceDropoff = _minDistanceDropoff + 2000;
			_maxDistanceDropoff = _maxDistanceDropoff + 5000;
			while{((player distance _markerLocation < _minDistanceDropoff)||(player distance _markerLocation > _maxDistanceDropoff))} do
				{
				_markerLocation = (selectRandom _markerArray);
				};
			};
		_counter = _counter + 1;
		};

	player removeSimpleTask DS_civJobTask;
	DS_civJobTask = player createSimpleTask ["civJobTask"];
	DS_civJobTask setSimpleTaskDescription ["Drop your passenger(s) off here","Passenger Drop Point",""];
	DS_civJobTask setSimpleTaskDestination _markerLocation;
	DS_civJobTask setTaskState "Assigned";
	player setCurrentTask DS_civJobTask;

	_payment = _payment + round ((player distance _markerLocation)*_payPerKm);
	_payment = _payment*_multiplier;

	while{true}do
		{
		sleep 10;
		if((isNull _taxi)||(!alive _taxi))exitwith{["Mission failed because your taxi was destroyed"] call _failMission;};
		if(!(_npc1 in (crew _taxi)))then{_npc1 moveInCargo _taxi;};
		if(!(_npc2 in (crew _taxi)))then{_npc2 moveInCargo _taxi;};
		if(!(_npc3 in (crew _taxi)))then{_npc3 moveInCargo _taxi;};
		if(((getPos player) select 2) > 15)exitwith{["Mission failed because your vehicle is not allowed to gain elevation during this mission"] call _failMission;};
		if((!alive _npc1)||(!alive _npc2)||(!alive _npc3))exitwith{["Mission failed because your passenger(s) was killed"] call _failMission;};
		if(((vehicle player) isEqualTo _taxi)&&(_taxi distance _markerLocation < 20))exitwith{};
		};

	if(_fail)exitwith{};

	_tipChance = (random 10);
	if(_tipChance > 6)then
		{
		_tipChance = random _tipMax;
		hint format ["Thanks for the lift, you have been paid $%1 plus a tip of $%2",[_payment] call DS_fnc_numberText,[_tipChance] call DS_fnc_numberText];
		systemchat format ["Thanks for the lift, you have been paid $%1 plus a tip of $%2",[_payment] call DS_fnc_numberText,[_tipChance] call DS_fnc_numberText];
		[_payment,true,true] call DS_fnc_handleMoney;
		[_tipChance,false,true] call DS_fnc_handleMoney;
		}
		else
		{
		hint format ["Thanks for the lift, you have been paid $%1",[_payment] call DS_fnc_numberText];
		systemchat format ["Thanks for the lift, you have been paid $%1",[_payment] call DS_fnc_numberText];
		[_payment,true,true] call DS_fnc_handleMoney;
		};

	_npc1 action["Eject",_taxi];
	_npc2 action["Eject",_taxi];
	_npc3 action["Eject",_taxi];
	sleep 1;
	deleteVehicle _npc1;
	deleteVehicle _npc2;
	deleteVehicle _npc3;
	};

//if(_fail)exitwith{_temp = DS_realEstateArray select 24;_temp = _temp - 1;if(_temp < 1)then{_temp = 0};DS_realEstateArray set [24,_temp];};
if(_fail)exitwith{};

if((DS_infoArray select 13) == 7)then {
	[] spawn {
		sleep 10;
		[0] call DS_fnc_questCompleted;
	};
};

if((_curLevel > 17)&&((DS_infoArray select 13) == 26))then{ [0] call DS_fnc_questCompleted };
if((_curLevel > 17)&&((DS_infoArray select 13) == 44))then{ [0] call DS_fnc_questCompleted };

if(_curLevel > 22)exitWith
	{
	hint "You are at the maximum level for these missions";
	sleep 5;
	DS_civJobTask setTaskState "Succeeded";
	DS_currentTask1 = "";
	hint "You can now begin another taxi mission by pressing F5";
	DS_dusting = false;
	if((DS_infoArray select 13) == 26)then{ [0] call DS_fnc_questCompleted };
	};

_progress = DS_realEstateArray select 24;
_progress = _progress + 1;
DS_realEstateArray set [24,_progress];
if((DS_realEstateArray select 24) > 3)then
	{
	sleep 5;
	player say3D "success";
	_curLevel = _curLevel + 1;
	DS_realEstateArray set [23,_curLevel];
	DS_realEstateArray set [24,0];
	_payment = _curLevel * 12000;
	hint format ["Congratulations, you have been promoted to a level %1 taxi driver. You have been paid a bonus of $%2",_curLevel,[_payment] call DS_fnc_numberText];
	systemchat format ["Congratulations, you have been promoted to a level %1 taxi driver. You have been paid a bonus of $%2",_curLevel,[_payment] call DS_fnc_numberText];
	[_payment,true,true] call DS_fnc_handleMoney;
	if((DS_infoArray select 13) == 26)then{ [0] call DS_fnc_questCompleted };
	};

[0] spawn DS_civ_improve;
sleep 5;
DS_civJobTask setTaskState "Succeeded";
DS_currentTask1 = "";
hint "You can now begin another taxi mission by pressing F5";
DS_dusting = false;
[40,true] spawn DS_fnc_moralAlter;

if(!isNil "_npc1")then{sleep 3;deleteVehicle _npc1;};
if(!isNil "_npc2")then{sleep 3;deleteVehicle _npc2;};
if(!isNil "_npc3")then{sleep 3;deleteVehicle _npc3;};