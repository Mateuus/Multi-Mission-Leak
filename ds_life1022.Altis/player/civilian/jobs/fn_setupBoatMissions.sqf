/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Starts boat missions
*/

private ["_player","_maxDropDistance","_maxDistancePickup","_heightFail","_typeOfNpc","_npcGroup","_currentLevel","_typeStr","_payPerKm","_dead","_npc1","_npc2","_npc3","_vipbodyArray","_startPos","_totalPayment","_startPos","_markerArray","_prevMarker","_jet","_dropping","_payment","_counter","_markerLocation","_marker","_markerojb","_action"];

_maxDistancePickup = 0;
_maxDropDistance = 0;
_heightFail = false;
_currentLevel = DS_realEstateArray select 21;

if(!(typeOf (vehicle player) in ["C_Rubberboat","C_Boat_Civil_01_F","C_Scooter_Transport_01_F","O_SDV_01_F","I_C_Boat_Transport_02_F","C_Boat_Transport_02_F"]))exitwith
	{
	hint "To start boat taxi missions, simply get into a boat and press F5";
	};

_action = [
	"Do you want to start this Water Taxi Job? You will need your own boat to complete the mission (Gaining to much elevation will cause the mission to fail)",
	"Water Taxi Basic Information",
	"Continue",
	"No Thanks"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};
_player = format ["%1",player];
switch(_currentLevel)do
	{
	case 0:
		{
		_typeStr = "Pick up 1 civilian passenger and drop him where he wants to go (Short Distance)";
		_vipbodyArray = ["C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_man_sport_1_F_tanoan","C_man_sport_2_F_tanoan","C_man_shorts_4_F","C_Man_casual_6_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan"];
		_payPerKm = 3;
		_maxDistancePickup = 5000;
		_maxDropDistance = 5000;
		};
	case 1:
		{
		_typeStr = "Pick up 1 VIP passenger and drop him where he wants to go (Short Distance)";
		_vipbodyArray = ["C_journalist_F","C_Nikos_aged","C_scientist_F","C_Marshal_F"];
		_payPerKm = 3.5;
		_maxDistancePickup = 5000;
		_maxDropDistance = 5000;
		};
	case 2:
		{
		_typeStr = "Pick up 1 civilian passenger and drop him where he wants to go (Medium Distance)";
		_vipbodyArray = ["C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_man_sport_1_F_tanoan","C_man_sport_2_F_tanoan","C_man_sport_3_F_tanoan","C_Man_casual_6_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan"];
		_payPerKm = 4.5;
		_maxDistancePickup = 10000;
		_maxDropDistance = 10000;
		};
	case 3:
		{
		_typeStr = "Pick up 1 VIP passenger and drop him where he wants to go (Medium Distance)";
		_vipbodyArray = ["C_journalist_F","C_Nikos_aged","C_scientist_F","C_Marshal_F"];
		_payPerKm = 5;
		_maxDistancePickup = 10000;
		_maxDropDistance = 10000;
		};
	case 4:
		{
		_typeStr = "Pick up 2 civilian passengers and drop them where they want to go (Medium Distance)";
		_vipbodyArray = ["C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_man_sport_1_F_tanoan","C_man_sport_2_F_tanoan","C_man_sport_3_F_tanoan","C_Man_casual_6_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan"];
		_payPerKm = 5.5;
		_maxDistancePickup = 10000;
		_maxDropDistance = 10000;
		};
	case 5:
		{
		_typeStr = "Pick up 2 VIP passengers and drop them where they want to go (Medium Distance)";
		_vipbodyArray = ["C_journalist_F","C_Nikos_aged","C_scientist_F","C_Marshal_F"];
		_payPerKm = 6;
		_maxDistancePickup = 10000;
		_maxDropDistance = 10000;
		};
	case 6:
		{
		_typeStr = "Pick up 2 civilian passengers and drop them where they want to go (Long Distance)";
		_vipbodyArray = ["C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_man_sport_1_F_tanoan","C_man_sport_2_F_tanoan","C_man_sport_3_F_tanoan","C_Man_casual_6_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan"];
		_payPerKm = 6.5;
		_maxDistancePickup = 15000;
		_maxDropDistance = 15000;
		};
	case 7:
		{
		_typeStr = "Pick up 2 VIP passengers and drop them where they want to go (Long Distance)";
		_vipbodyArray = ["C_journalist_F","C_Nikos_aged","C_scientist_F","C_Marshal_F"];
		_payPerKm = 7;
		_maxDistancePickup = 15000;
		_maxDropDistance = 15000;
		};
	case 8:
		{
		_typeStr = "Pick up 3 civilian passengers and drop them where they want to go (Long Distance)";
		_vipbodyArray = ["C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_man_sport_1_F_tanoan","C_man_sport_2_F_tanoan","C_man_sport_3_F_tanoan","C_Man_casual_6_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan"];
		_payPerKm = 7.5;
		_maxDistancePickup = 15000;
		_maxDropDistance = 15000;
		};
	case 9:
		{
		_typeStr = "Pick up 3 VIP passengers and drop them where they want to go (Long Distance)";
		_vipbodyArray = ["C_journalist_F","C_Nikos_aged","C_scientist_F","C_Marshal_F"];
		_payPerKm = 8;
		_maxDistancePickup = 15000;
		_maxDropDistance = 15000;
		};
	case 10:
		{
		_typeStr = "Pick up 3 civilian passengers, then take them where each one wants to go (Three drop points)";
		_vipbodyArray = ["C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_man_sport_1_F_tanoan","C_man_sport_2_F_tanoan","C_man_sport_3_F_tanoan","C_Man_casual_6_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan"];
		_payPerKm = 8.5;
		_maxDistancePickup = 15000;
		_maxDropDistance = 5000;
		};
	case 11:
		{
		_typeStr = "Pick up 3 VIP passengers, then take them where each one wants to go (Three drop points)";
		_vipbodyArray = ["C_journalist_F","C_Nikos_aged","C_scientist_F","C_Marshal_F"];
		_payPerKm = 9;
		_maxDistancePickup = 10000;
		_maxDropDistance = 5000;
		};
	};

_markerArray = [
getMarkerPos "jobMarker52",getMarkerPos "jobMarker53",getMarkerPos "copBoatSpawn11",getMarkerPos "jobMarker54",
getMarkerPos "jobMarker55",getMarkerPos "jobMarker56",getMarkerPos "jobMarker57",getMarkerPos "jobMarker58",
getMarkerPos "jobMarker59",getMarkerPos "jobMarker60",getMarkerPos "jobMarker61",getMarkerPos "jobMarker62",
getMarkerPos "jobMarker63",getMarkerPos "jobMarker64",getMarkerPos "jobMarker65",getMarkerPos "jobMarker66",
getMarkerPos "jobMarker67",getMarkerPos "jobMarker68",getMarkerPos "jobMarker69",getMarkerPos "boat_2_1",
getMarkerPos "copBoatSpawn10",getMarkerPos "jobMarker70",getMarkerPos "boat_4",getMarkerPos "jobMarker71",
getMarkerPos "boat_3",getMarkerPos "jobMarker73",getMarkerPos "jobMarker74",getMarkerPos "jobMarker75",
getMarkerPos "jobMarker76",getMarkerPos "jobMarker77",getMarkerPos "jobMarker72",getMarkerPos "jobMarker78",getMarkerPos "jobMarker79",

getMarkerPos "jobMarker_99",getMarkerPos "jobMarker_100",getMarkerPos "jobMarker_101",getMarkerPos "jobMarker_102",getMarkerPos "jobMarker_103",
getMarkerPos "jobMarker_104",getMarkerPos "jobMarker_105",getMarkerPos "jobMarker_106",getMarkerPos "jobMarker_107",getMarkerPos "jobMarker_108",
getMarkerPos "jobMarker_109",getMarkerPos "jobMarker_110",getMarkerPos "jobMarker_111"
];

//if((DS_infoArray select ) > 26)then{_payPerKm = (_payPerKm*1.2);};
//if((DS_infoArray select ) > 36)then{_payPerKm = (_payPerKm*1.3);};

if(DS_realMode)then
	{
	_payPerKm = (_payPerKm*1.5);
	};

_action = [
	format ["You are a level %3 Water Taxi Captain. You job is to %1. You must complete another %2 missions to be promoted to the next level",_typeStr,(((DS_realEstateArray select 22)-3)*-1),_currentLevel],
	"Air Taxi Job!",
	"Start Job",
	"Cancel"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

if(DS_dusting)exitwith{hint 'You already have a mission running'};
DS_dusting = true;

_startPos = (position player);
_dead = false;

systemchat "Hey there, while driving a boat, drive over to the marker on your map named (Passenger(s) waiting) and stop near them so they get into your boat";
hint "Hey there, while driving a boat, drive over to the marker on your map named (Passenger(s) waiting) and stop near them so they get into your boat";

DS_currentTask1 = "Water Taxi - Phase One";
DS_currentTask2 = "Hey there, while driving a boat, drive over to the marker on your map named (Passenger(s) waiting) and stop near them so they get into your boat";

_jet = vehicle player;
sleep 0.5;

_totalPayment = 0;

_prevMarker = (position player);
_markerLocation = (selectRandom _markerArray);
_counter = 0;
while{((player distance _markerLocation < 1000)||(player distance _markerLocation > _maxDistancePickup))} do
	{
	_markerLocation = (selectRandom _markerArray);
	_counter = _counter + 1;
	if(_counter > (count _markerArray))exitwith{_heightFail = true};
	};
if(_heightFail)then
	{
	hint "There is no passengers nearby to pickup, move to another area and try again";
	DS_currentTask1 = "";
	DS_dusting = false;
	};
player removeSimpleTask DS_civJobTask;
DS_civJobTask = player createSimpleTask ["civJobTask"];
DS_civJobTask setSimpleTaskDescription ["Drive to the marked location to pickup your passengers","Passengers Waiting",""];
DS_civJobTask setSimpleTaskDestination _markerLocation;
DS_civJobTask setTaskState "Assigned";
player setCurrentTask DS_civJobTask;

_payment = round ((player distance _markerLocation)*_payPerKm);
_sp = _markerLocation;

if(_currentLevel < 4)then
	{

	while{true}do
		{
		if((isNil "_npc1")&&(player distance _markerLocation < 200)&&(driver (vehicle player) isEqualTo player)&&(typeOf (vehicle player) in ["C_Rubberboat","C_Boat_Civil_01_F","C_Scooter_Transport_01_F","O_SDV_01_F","I_C_Boat_Transport_02_F","C_Boat_Transport_02_F"]))exitwith
			{
			hint "Your passenger is awaiting pick up, drive near them and they will enter your boat";
			systemchat "Your passenger is awaiting pick up, drive near them and they will enter your boat";
			DS_currentTask1 = "Water Taxi - Phase Two";
			DS_currentTask2 = "Your passenger is awaiting pick up, drive near them and they will enter your boat";
			_typeOfNpc = (selectRandom _vipbodyArray);
			_npc1 = DS_civGroup createUnit [_typeOfNpc, _markerLocation, [], 0, "NONE"];
			_npc1 allowDamage false;
			_npc1 disableAI "MOVE";
			};
		sleep 5;
		if((getPos (player) select 2) > 15)exitwith{_heightFail = true};
		};
	if(_heightFail)exitwith{_dead = true;hint "You failed your mission because you gained elevation (Anti-exploit script)";player say3D "fail";};

	while{true}do
		{
		if((player distance _npc1 < 45)&&(driver (vehicle player) isEqualTo player)&&(typeOf (vehicle player) in ["C_Rubberboat","C_Boat_Civil_01_F","C_Scooter_Transport_01_F","O_SDV_01_F","I_C_Boat_Transport_02_F","C_Boat_Transport_02_F"]))exitwith
			{
			_npc1 moveInCargo (vehicle player);
			sleep 1;
			_npc1 allowDamage true;
			hint "Great, this passenger would like to be dropped off at the marker shown on your map";
			systemchat "Great, this passenger would like to be dropped off at the marker shown on your map";
			DS_currentTask1 = "Water Taxi - Final Phase";
			DS_currentTask2 = "Drive your passenger to the passenger drop point marked on your map";
			};
		sleep 5;
		};

	_totalPayment = _payment;
	_prevMarker = (position player);
	_markerLocation = (selectRandom _markerArray);
	while{((player distance _markerLocation < 1000)||(player distance _markerLocation > _maxDropDistance))} do
		{
		_markerLocation = (selectRandom _markerArray);
		};

	player removeSimpleTask DS_civJobTask;
	DS_civJobTask = player createSimpleTask ["civJobTask"];
	DS_civJobTask setSimpleTaskDescription ["Drive to the marked location to drop off your passengers","Passengers Drop Point",""];
	DS_civJobTask setSimpleTaskDestination _markerLocation;
	DS_civJobTask setTaskState "Assigned";
	player setCurrentTask DS_civJobTask;

	_payment = round ((player distance _markerLocation)*_payPerKm);
	_totalPayment = _totalPayment + _payment;

	while{true}do
		{
		if((player distance _markerLocation < 45)&&(driver (vehicle player) isEqualTo player)&&(typeOf (vehicle player) in ["C_Rubberboat","C_Boat_Civil_01_F","C_Scooter_Transport_01_F","O_SDV_01_F","I_C_Boat_Transport_02_F","C_Boat_Transport_02_F"]))exitwith
			{
			_npc1 action["Eject", vehicle _npc1];
			sleep 1;
			deleteVehicle _npc1;
			hint "Thanks for the lift!";
			systemchat "Thanks for the lift!";
			sleep 5;
			player say3D "success";
			hint format ["You have been paid $%1 for your taxi services",[_totalPayment] call DS_fnc_numberText];
			systemchat format ["You have been paid $%1 for your taxi services",[_totalPayment] call DS_fnc_numberText];
			DS_currentTask1 = "";
			};
		sleep 5;
		if((getPos (player) select 2) > 15)then{_npc1 setDamage 1};
		if(!alive _npc1)exitwith{_dead = true};
		};
	if(_heightFail)exitwith{_dead = true;hint "You failed your mission because you gained elevation (Anti-exploit script)";player say3D "fail";};
	if(_dead)exitwith{hint "You have failed this mission because your passenger has been killed";DS_currentTask1 = "";};
	[_totalPayment,true,true] call DS_fnc_handleMoney;

	};

if((_currentLevel > 3)&&(_currentLevel < 8))then
	{

	while{true}do
		{
		if((isNil "_npc1")&&(isNil "_npc2")&&(player distance _markerLocation < 200)&&(driver (vehicle player) isEqualTo player)&&(typeOf (vehicle player) in ["C_Rubberboat","C_Boat_Civil_01_F","C_Scooter_Transport_01_F","O_SDV_01_F","I_C_Boat_Transport_02_F","C_Boat_Transport_02_F"]))exitwith
			{
			hint "Your passengers are awaiting pick up, drive near them and they will enter your boat";
			systemchat "Your passenger is awaiting pick up, drive near them and they will enter your boat";
			DS_currentTask1 = "Water Taxi - Phase Two";
			DS_currentTask2 = "Your passengers are awaiting pick up, drive near them and they will enter your boat";
			_typeOfNpc = (selectRandom _vipbodyArray);
			_npc1 = DS_civGroup createUnit [_typeOfNpc, _markerLocation, [], 0, "NONE"];
			_npc1 allowDamage false;
			_npc1 disableAI "MOVE";

			_typeOfNpc = (selectRandom _vipbodyArray);
			_npc2 = DS_civGroup createUnit [_typeOfNpc, _markerLocation, [], 0, "NONE"];
			_npc2 allowDamage false;
			_npc2 disableAI "MOVE";
			};
		sleep 5;
		if((getPos (player) select 2) > 15)exitwith{_npc1 setDamage 1};
		};

	while{true}do
		{
		if((player distance _npc1 < 45)&&(driver (vehicle player) isEqualTo player)&&(typeOf (vehicle player) in ["C_Rubberboat","C_Boat_Civil_01_F","C_Scooter_Transport_01_F","O_SDV_01_F","I_C_Boat_Transport_02_F","C_Boat_Transport_02_F"]))exitwith
			{
			_npc1 moveInCargo (vehicle player);
			_npc2 moveInCargo (vehicle player);
			sleep 1;
			_npc1 allowDamage true;
			_npc2 allowDamage true;
			hint "Great, the passengers would like to be dropped off at the marker shown on your map";
			systemchat "Great, the passengers would like to be dropped off at the marker shown on your map";
			DS_currentTask1 = "Water Taxi - Final Phase";
			DS_currentTask2 = "Drive your passengers to the passenger drop point marked on your map";
			};
		sleep 5;
		if((getPos (player) select 2) > 15)exitwith{_npc1 setDamage 1};
		};

	_totalPayment = _payment;
	_prevMarker = (position player);
	player removeSimpleTask DS_civJobTask;
	_markerLocation = (selectRandom _markerArray);
	while{((player distance _markerLocation < 1000)||(player distance _markerLocation > _maxDropDistance))} do
		{
		_markerLocation = (selectRandom _markerArray);
		};

	DS_civJobTask = player createSimpleTask ["civJobTask"];
	DS_civJobTask setSimpleTaskDescription ["Drive to the marked location to drop off your passengers","Passengers Drop Point",""];
	DS_civJobTask setSimpleTaskDestination _markerLocation;
	DS_civJobTask setTaskState "Assigned";
	player setCurrentTask DS_civJobTask;

	_payment = round ((player distance _markerLocation)*_payPerKm);
	_totalPayment = _totalPayment + _payment;

	while{true}do
		{
		if((player distance _markerLocation < 45)&&(driver (vehicle player) isEqualTo player)&&(typeOf (vehicle player) in ["C_Rubberboat","C_Boat_Civil_01_F","C_Scooter_Transport_01_F","O_SDV_01_F","I_C_Boat_Transport_02_F","C_Boat_Transport_02_F"]))exitwith
			{
			_npc1 action["Eject", vehicle _npc1];
			_npc2 action["Eject", vehicle _npc2];
			sleep 1;
			deleteVehicle _npc1;
			deleteVehicle _npc2;
			hint "Thanks for the lift!";
			systemchat "Thanks for the lift!";
			sleep 5;
			player say3D "success";
			hint format ["You have been paid $%1 for your taxi services",[_totalPayment] call DS_fnc_numberText];
			systemchat format ["You have been paid $%1 for your taxi services",[_totalPayment] call DS_fnc_numberText];
			DS_currentTask1 = "";
			};
		sleep 5;
		if((getPos (player) select 2) > 15)then{_npc1 setDamage 1};
		if((!alive _npc1)||(!alive _npc2))exitwith{_dead = true};
		};

	if(_dead)exitwith{hint "You have failed this mission because one of your passengers has been killed";DS_currentTask1 = "";};
	[_totalPayment,true,true] call DS_fnc_handleMoney;

	};

if((_currentLevel > 7)&&(_currentLevel < 10))then
	{

	while{true}do
		{
		if((isNil "_npc1")&&(isNil "_npc2")&&(isNil "_npc3")&&(player distance _markerLocation < 220)&&(driver (vehicle player) isEqualTo player)&&(typeOf (vehicle player) in ["C_Rubberboat","C_Boat_Civil_01_F","C_Scooter_Transport_01_F","O_SDV_01_F","I_C_Boat_Transport_02_F","C_Boat_Transport_02_F"]))exitwith
			{
			hint "Your passengers are awaiting pick up, drive near them and they will enter your boat";
			systemchat "Your passenger is awaiting pick up, drive near them and they will enter your boat";
			DS_currentTask1 = "Water Taxi - Phase Two";
			DS_currentTask2 = "Your passengers are awaiting pick up, drive near them and they will enter your boat";
			_typeOfNpc = (selectRandom _vipbodyArray);
			_npc1 = DS_civGroup createUnit [_typeOfNpc, _markerLocation, [], 0, "NONE"];
			_npc1 allowDamage false;
			_npc1 disableAI "MOVE";

			_typeOfNpc = (selectRandom _vipbodyArray);
			_npc2 = DS_civGroup createUnit [_typeOfNpc, _markerLocation, [], 0, "NONE"];
			_npc2 allowDamage false;
			_npc2 disableAI "MOVE";

			_typeOfNpc = (selectRandom _vipbodyArray);
			_npc3 = DS_civGroup createUnit [_typeOfNpc, _markerLocation, [], 0, "NONE"];
			_npc3 allowDamage false;
			_npc3 disableAI "MOVE";
			};
		sleep 5;
		if((getPos (player) select 2) > 15)exitwith{_npc1 setDamage 1};
		};

	while{true}do
		{
		if((player distance _npc1 < 45)&&(driver (vehicle player) isEqualTo player)&&(typeOf (vehicle player) in ["C_Rubberboat","C_Boat_Civil_01_F","C_Scooter_Transport_01_F","O_SDV_01_F","I_C_Boat_Transport_02_F","C_Boat_Transport_02_F"]))exitwith
			{
			_npc1 moveInAny (vehicle player);
			_npc2 moveInAny (vehicle player);
			_npc3 moveInAny (vehicle player);
			sleep 1;
			_npc1 allowDamage true;
			_npc2 allowDamage true;
			_npc3 allowDamage true;
			hint "Great, the passengers would like to be dropped off at the marker shown on your map";
			systemchat "Great, the passengers would like to be dropped off at the marker shown on your map";
			DS_currentTask1 = "Water Taxi - Final Phase";
			DS_currentTask2 = "Drive your passengers to the passenger drop point marked on your map";
			};
		sleep 5;
		if((getPos (player) select 2) > 15)exitwith{_npc1 setDamage 1};
		};

	_totalPayment = _payment;
	_prevMarker = (position player);
	_markerLocation = (selectRandom _markerArray);
	while{player distance _markerLocation < 1000} do
		{
		_markerLocation = (selectRandom _markerArray);
		};

	player removeSimpleTask DS_civJobTask;
	DS_civJobTask = player createSimpleTask ["civJobTask"];
	DS_civJobTask setSimpleTaskDescription ["Drive to the marked location to drop off your passengers","Passengers Drop Point",""];
	DS_civJobTask setSimpleTaskDestination _markerLocation;
	DS_civJobTask setTaskState "Assigned";
	player setCurrentTask DS_civJobTask;

	_payment = round ((player distance _markerLocation)*_payPerKm);
	_totalPayment = _totalPayment + _payment;

	while{true}do
		{
		if((player distance _markerLocation < 45)&&(driver (vehicle player) isEqualTo player)&&(typeOf (vehicle player) in ["C_Rubberboat","C_Boat_Civil_01_F","C_Scooter_Transport_01_F","O_SDV_01_F","I_C_Boat_Transport_02_F","C_Boat_Transport_02_F"]))exitwith
			{
			_npc1 action["Eject", vehicle _npc1];
			_npc2 action["Eject", vehicle _npc2];
			_npc3 action["Eject", vehicle _npc3];
			sleep 1;
			deleteVehicle _npc1;
			deleteVehicle _npc2;
			deleteVehicle _npc3;
			hint "Thanks for the lift!";
			systemchat "Thanks for the lift!";
			sleep 5;
			player say3D "success";
			hint format ["You have been paid $%1 for your taxi services",[_totalPayment] call DS_fnc_numberText];
			systemchat format ["You have been paid $%1 for your taxi services",[_totalPayment] call DS_fnc_numberText];
			DS_currentTask1 = "";
			};
		sleep 5;
		if((getPos (player) select 2) > 15)then{_npc1 setDamage 1};
		if((!alive _npc1)||(!alive _npc2)||(!alive _npc3))exitwith{_dead = true};
		};


	if(_dead)exitwith{hint "You have failed this mission because one of your passengers has been killed";DS_currentTask1 = "";};
	[_totalPayment,true,true] call DS_fnc_handleMoney;

	};

if(_currentLevel > 9)then
	{

	while{true}do
		{
		if((isNil "_npc1")&&(isNil "_npc2")&&(isNil "_npc3")&&(player distance _markerLocation < 250)&&(driver (vehicle player) isEqualTo player)&&(typeOf (vehicle player) in ["C_Rubberboat","C_Boat_Civil_01_F","C_Scooter_Transport_01_F","O_SDV_01_F","I_C_Boat_Transport_02_F","C_Boat_Transport_02_F"]))exitwith
			{
			hint "Your passengers are awaiting pick up, drive near them and they will enter your boat";
			systemchat "Your passenger is awaiting pick up, drive near them and they will enter your boat";
			DS_currentTask1 = "Water Taxi - Phase Two";
			DS_currentTask2 = "Your passengers are awaiting pick up, drive near them and they will enter your boat";
			_typeOfNpc = (selectRandom _vipbodyArray);
			_npc1 = DS_civGroup createUnit [_typeOfNpc, _markerLocation, [], 0, "NONE"];
			_npc1 allowDamage false;
			_npc1 disableAI "MOVE";

			_typeOfNpc = (selectRandom _vipbodyArray);
			_npc2 = DS_civGroup createUnit [_typeOfNpc, _markerLocation, [], 0, "NONE"];
			_npc2 allowDamage false;
			_npc2 disableAI "MOVE";

			_typeOfNpc = (selectRandom _vipbodyArray);
			_npc3 = DS_civGroup createUnit [_typeOfNpc, _markerLocation, [], 0, "NONE"];
			_npc3 allowDamage false;
			_npc3 disableAI "MOVE";

			_npc1 setVariable ["taxiMan",true,true];
			_npc2 setVariable ["taxiMan",true,true];
			_npc3 setVariable ["taxiMan",true,true];
			_npc1 setVariable ["taxiOwner",_player,true];
			_npc2 setVariable ["taxiOwner",_player,true];
			_npc3 setVariable ["taxiOwner",_player,true];
			};
		sleep 5;
		if((getPos (player) select 2) > 15)exitwith{_npc1 setDamage 1};
		};

	while{true}do
		{
		if((player distance _npc1 < 45)&&(driver (vehicle player) isEqualTo player)&&(typeOf (vehicle player) in ["C_Rubberboat","C_Boat_Civil_01_F","C_Scooter_Transport_01_F","O_SDV_01_F","I_C_Boat_Transport_02_F","C_Boat_Transport_02_F"]))exitwith
			{
			_jet = (vehicle player);
			_npc1 moveInCargo _jet;
			_npc1 allowDamage true;
			_npc2 moveInCargo _jet;
			_npc2 allowDamage true;
			_npc3 moveInAny _jet;
			_npc3 allowDamage true;
			hint "Great, the first passenger would like to be dropped off at the marker shown on your map";
			systemchat "Great, the first passenger would like to be dropped off at the marker shown on your map";
			DS_currentTask1 = "Water Taxi - Final Phase";
			DS_currentTask2 = "Drive your passengers to the passenger drop point marked on your map - Each passenger will have their own drop point";
			};
		sleep 5;
		if((getPos (player) select 2) > 15)exitwith{_npc1 setDamage 1};
		};

	_totalPayment = _payment;
	_prevMarker = (position player);
	_markerLocation = (selectRandom _markerArray);
	while{player distance _markerLocation < 1000} do
		{
		_markerLocation = (selectRandom _markerArray);
		};

	player removeSimpleTask DS_civJobTask;
	DS_civJobTask = player createSimpleTask ["civJobTask"];
	DS_civJobTask setSimpleTaskDescription ["Drive to the marked location to drop off your passengers","Passengers Drop Point",""];
	DS_civJobTask setSimpleTaskDestination _markerLocation;
	DS_civJobTask setTaskState "Assigned";
	player setCurrentTask DS_civJobTask;

	_payment = round ((player distance _markerLocation)*_payPerKm);
	_totalPayment = _totalPayment + _payment;

	while{true}do
		{
		if((player distance _markerLocation < 45)&&(driver (vehicle player) isEqualTo player)&&(typeOf (vehicle player) in ["C_Rubberboat","C_Boat_Civil_01_F","C_Scooter_Transport_01_F","O_SDV_01_F","I_C_Boat_Transport_02_F","C_Boat_Transport_02_F"]))exitwith
			{
			_npc3 action["Eject", vehicle _npc3];
			sleep 1;
			deleteVehicle _npc3;
			hint "Thanks for the lift!";
			systemchat "Thanks for the lift!";
			sleep 5;
			hint "Your next passengers drop point has been marked on your map";
			systemchat "Your next passengers drop point has been marked on your map";
			};
		sleep 5;
		if((getPos (player) select 2) > 15)then{_npc1 setDamage 1};
		if((!alive _npc1)||(!alive _npc2)||(!alive _npc3))exitwith{_dead = true};
		};

	_prevMarker = (position player);
	_markerLocation = (selectRandom _markerArray);
	while{player distance _markerLocation < 1000} do
		{
		_markerLocation = (selectRandom _markerArray);
		};

	player removeSimpleTask DS_civJobTask;
	DS_civJobTask = player createSimpleTask ["civJobTask"];
	DS_civJobTask setSimpleTaskDescription ["Drive to the marked location to drop off your passengers","Passengers Drop Point",""];
	DS_civJobTask setSimpleTaskDestination _markerLocation;
	DS_civJobTask setTaskState "Assigned";
	player setCurrentTask DS_civJobTask;

	_payment = round ((player distance _markerLocation)*_payPerKm);
	_totalPayment = _totalPayment + _payment;

	while{true}do
		{
		if((player distance _markerLocation < 45)&&(driver (vehicle player) isEqualTo player)&&(typeOf (vehicle player) in ["C_Rubberboat","C_Boat_Civil_01_F","C_Scooter_Transport_01_F","O_SDV_01_F","I_C_Boat_Transport_02_F","C_Boat_Transport_02_F"]))exitwith
			{
			_npc2 action["Eject", vehicle _npc2];
			sleep 1;
			deleteVehicle _npc2;
			hint "Thanks for the lift!";
			systemchat "Thanks for the lift!";
			sleep 5;
			hint "Your next passengers drop point has been marked on your map";
			systemchat "Your next passengers drop point has been marked on your map";
			};
		sleep 5;
		if((getPos (player) select 2) > 15)then{_npc1 setDamage 1};
		if((!alive _npc1)||(!alive _npc2))exitwith{_dead = true};
		};

	_prevMarker = (position player);
	_markerLocation = (selectRandom _markerArray);
	while{player distance _markerLocation < 1000} do
		{
		_markerLocation = (selectRandom _markerArray);
		};

	player removeSimpleTask DS_civJobTask;
	DS_civJobTask = player createSimpleTask ["civJobTask"];
	DS_civJobTask setSimpleTaskDescription ["Drive to the marked location to drop off your passengers","Passengers Drop Point",""];
	DS_civJobTask setSimpleTaskDestination _markerLocation;
	DS_civJobTask setTaskState "Assigned";
	player setCurrentTask DS_civJobTask;

	_payment = round ((player distance _markerLocation)*_payPerKm);
	_totalPayment = _totalPayment + _payment;

	while{true}do
		{
		if((player distance _markerLocation < 45)&&(driver (vehicle player) isEqualTo player)&&(typeOf (vehicle player) in ["C_Rubberboat","C_Boat_Civil_01_F","C_Scooter_Transport_01_F","O_SDV_01_F","I_C_Boat_Transport_02_F","C_Boat_Transport_02_F"]))exitwith
			{
			_npc1 action["Eject", vehicle _npc1];
			sleep 1;
			deleteVehicle _npc1;
			hint "Thanks for the lift!";
			systemchat "Thanks for the lift!";
			sleep 5;
			player say3D "success";
			hint format ["You have been paid $%1 for your taxi services",[_totalPayment] call DS_fnc_numberText];
			systemchat format ["You have been paid $%1 for your taxi services",[_totalPayment] call DS_fnc_numberText];
			DS_currentTask1 = "";
			};
		sleep 5;
		if((getPos (player) select 2) > 15)exitwith{_npc1 setDamage 1};
		if(!alive _npc1)exitwith{_dead = true};
		};

	if(_dead)exitwith{hint "You have failed this mission because one of your passengers has been killed";DS_currentTask1 = "";player removeSimpleTask DS_civJobTask;};
	[_totalPayment,true,true] call DS_fnc_handleMoney;

	};

if(_dead)exitwith{DS_dusting = false;};
[100,true] spawn DS_fnc_moralAlter;
player removeSimpleTask DS_civJobTask;
if((DS_realEstateArray select 21) == 11)exitWith
	{
	sleep 5;
	hint "You are at the max level for these missions - You can not be promoted but you can continue doing this mission for profit";
	systemchat "You are at the max level for these missions - You can not be promoted but you can continue doing this mission for profit";
	//[] call DS_fnc_compileData;
	sleep 5;
	DS_dusting = false;
	};

_tempNum = (DS_realEstateArray select 22);
_tempNum = _tempNum + 1;
DS_realEstateArray set [22,_tempNum];
if(_tempNum > 2)then
	{
	sleep 5;
	_tempNum = (DS_realEstateArray select 21);
	_tempNum = _tempNum + 1;
	DS_realEstateArray set [21,_tempNum];
	_bonus = ((DS_realEstateArray select 21)*27000);
	DS_realEstateArray set [22,0];
	player say3D "success";
	hint format ["You have been promoted to a level %1 Water Taxi Captain, you have also received a bonus of $%2 for all of your hard work",(DS_realEstateArray select 21),[_bonus] call DS_fnc_numberText];
	systemchat format ["You have been promoted to a level %1 Water Taxi Captain, you have also received a bonus of $%2 for all of your hard work",(DS_realEstateArray select 21),[_bonus] call DS_fnc_numberText];
	[_bonus,true,true] call DS_fnc_handleMoney;
	};
//[] call DS_fnc_compileData;
sleep 5;
DS_dusting = false;
[3] spawn DS_civ_improve;

if(!isNil "_npc1")then{sleep 3;deleteVehicle _npc1;};
if(!isNil "_npc2")then{sleep 3;deleteVehicle _npc2;};
if(!isNil "_npc3")then{sleep 3;deleteVehicle _npc3;};