/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Starts crop dusting missions
*/

private ["_player","_typeOfNpc","_npcGroup","_currentLevel","_typeStr","_payPerKm","_dead","_npc1","_npc2","_npc3","_vipbodyArray","_startPos","_totalPayment","_startPos","_markerArray","_prevMarker","_jet","_dropping","_payment","_counter","_markerLocation","_marker","_markerojb","_action"];
//C_Plane_Civil_01_F
_currentLevel = DS_realEstateArray select 15;
_action = [
	"Do you want to start this Air Taxi Job? You will need your own plane or chopper (Not a jet) to complete the mission",
	"Air Taxi Basic Information",
	"Continue",
	"No Thanks"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};
_action = [
	"Completing this mission in a helicopter is not as exciting for your passengers so they will pay less",
	"Chopper or Plane",
	"Ok",
	"Ok"
] call BIS_fnc_guiMessage;
_player = format ["%1",player];
switch(_currentLevel)do
	{
	case 0:
		{
		_typeStr = "Pick up 1 civilian passenger from one Air Port and Drop him at another";
		_markerArray = [getMarkerPos "air_serv_1",getMarkerPos "air_serv_3",getMarkerPos "air_serv_4",getMarkerPos "air_serv_2",getMarkerPos "air_serv_6",getMarkerPos "air_serv_5"];
		_vipbodyArray = ["C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_man_sport_1_F_tanoan","C_man_sport_2_F_tanoan","C_man_sport_3_F_tanoan","C_Man_casual_6_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan"];
		_payPerKm = 1.6;
		};
	case 1:
		{
		_typeStr = "Pick up 1 VIP passenger from one Air Port and Drop him at another";
		_markerArray = [getMarkerPos "air_serv_1",getMarkerPos "air_serv_3",getMarkerPos "air_serv_4",getMarkerPos "air_serv_2",getMarkerPos "air_serv_6",getMarkerPos "air_serv_5"];
		_vipbodyArray = ["C_journalist_F","C_Nikos_aged","C_scientist_F","C_Marshal_F"];
		_payPerKm = 1.9;
		};
	case 2:
		{
		_typeStr = "Pick up 2 civilian passengers from one Air Port and Drop them at another";
		_markerArray = [getMarkerPos "air_serv_1",getMarkerPos "air_serv_3",getMarkerPos "air_serv_4",getMarkerPos "air_serv_2",getMarkerPos "air_serv_6",getMarkerPos "air_serv_5"];
		_vipbodyArray = ["C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_man_sport_1_F_tanoan","C_man_sport_2_F_tanoan","C_man_sport_3_F_tanoan","C_Man_casual_6_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan"];
		_payPerKm = 2.4;
		};
	case 3:
		{
		_typeStr = "Pick up 2 VIP passengers from one Air Port and Drop them at another";
		_markerArray = [getMarkerPos "air_serv_1",getMarkerPos "air_serv_3",getMarkerPos "air_serv_4",getMarkerPos "air_serv_2",getMarkerPos "air_serv_6",getMarkerPos "air_serv_5"];
		_vipbodyArray = ["C_journalist_F","C_Nikos_aged","C_scientist_F","C_Marshal_F"];
		_payPerKm = 2.7;
		};
	case 4:
		{
		_typeStr = "Pick up 2 civilian passengers from one Air Port and Drop them at another";
		_markerArray = [getMarkerPos "air_serv_1",getMarkerPos "air_serv_3",getMarkerPos "air_serv_4",getMarkerPos "air_serv_2",getMarkerPos "air_serv_6",getMarkerPos "air_serv_5"];
		_vipbodyArray = ["C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_man_sport_1_F_tanoan","C_man_sport_2_F_tanoan","C_man_sport_3_F_tanoan","C_Man_casual_6_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan"];
		_payPerKm = 3;
		};
	case 5:
		{
		_typeStr = "Pick up 2 VIP passengers from one Air Port and Drop them at another";
		_markerArray = [getMarkerPos "air_serv_1",getMarkerPos "air_serv_3",getMarkerPos "air_serv_4",getMarkerPos "air_serv_2",getMarkerPos "air_serv_6",getMarkerPos "air_serv_5"];
		_vipbodyArray = ["C_journalist_F","C_Nikos_aged","C_scientist_F","C_Marshal_F"];
		_payPerKm = 3.5;
		};
	case 6:
		{
		_typeStr = "Pick up 3 civilian passengers from one air port, then take them where they want to go";
		_markerArray = [getMarkerPos "air_serv_1",getMarkerPos "air_serv_3",getMarkerPos "air_serv_4",getMarkerPos "air_serv_2",getMarkerPos "air_serv_6",getMarkerPos "air_serv_5"];
		_vipbodyArray = ["C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_man_sport_1_F_tanoan","C_man_sport_2_F_tanoan","C_man_sport_3_F_tanoan","C_Man_casual_6_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan"];
		_payPerKm = 4;
		};
	case 7:
		{
		_typeStr = "Pick up 3 VIP passengers from one air port, then take them where they want to go";
		_markerArray = [getMarkerPos "air_serv_1",getMarkerPos "air_serv_3",getMarkerPos "air_serv_4",getMarkerPos "air_serv_2",getMarkerPos "air_serv_6",getMarkerPos "air_serv_5"];
		_vipbodyArray = ["C_journalist_F","C_Nikos_aged","C_scientist_F","C_Marshal_F"];
		_payPerKm = 4.5;
		};
	case 8:
		{
		_typeStr = "Pick up 3 civilian passengers from one air port, then take them where each one wants to go (Three drop points)";
		_markerArray = [getMarkerPos "air_serv_1",getMarkerPos "air_serv_3",getMarkerPos "air_serv_4",getMarkerPos "air_serv_2",getMarkerPos "air_serv_6",getMarkerPos "air_serv_5"];
		_vipbodyArray = ["C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_man_sport_1_F_tanoan","C_man_sport_2_F_tanoan","C_man_sport_3_F_tanoan","C_Man_casual_6_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan"];
		_payPerKm = 5;
		};
	case 9:
		{
		_typeStr = "Pick up 3 VIP passengers from one air port, then take them where each one wants to go (Three drop points)";
		_markerArray = [getMarkerPos "air_serv_1",getMarkerPos "air_serv_3",getMarkerPos "air_serv_4",getMarkerPos "air_serv_2",getMarkerPos "air_serv_6",getMarkerPos "air_serv_5"];
		_vipbodyArray = ["C_journalist_F","C_Nikos_aged","C_scientist_F","C_Marshal_F"];
		_payPerKm = 5.5;
		};
	case 10:
		{
		_typeStr = "Pick up 3 random passengers from one air port, then take them where each one wants to go (Three drop points)";
		_markerArray = [getMarkerPos "air_serv_1",getMarkerPos "air_serv_3",getMarkerPos "air_serv_4",getMarkerPos "air_serv_2",getMarkerPos "air_serv_6",getMarkerPos "air_serv_5"];
		_vipbodyArray = ["C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_man_sport_1_F_tanoan","C_man_sport_2_F_tanoan","C_man_sport_3_F_tanoan","C_Man_casual_6_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan",
		"C_journalist_F","C_Nikos_aged","C_scientist_F","C_Marshal_F"];
		_payPerKm = 6;
		};
	};

_action = [
	format ["You are a level %3 Air Taxi Pilot. You job is to %1. You must complete another %2 missions to be promoted to the next level",_typeStr,(((DS_realEstateArray select 16)-4)*-1),_currentLevel],
	"Air Taxi Job!",
	"Start Job",
	"Cancel"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

if((DS_infoArray select 13) > 40)then{ _payPerKm = (_payPerKm*1.3) };
//if((DS_infoArray select ) > 31)then{_payPerKm = (_payPerKm*1.5);};

if(DS_realMode)then
	{
	_payPerKm = (_payPerKm*1.5);
	};
if((DS_infoArray select 13) > 31)then { _payPerKm = (_payPerKm*1.25) };

if(DS_dusting)exitwith{hint 'You already have an air mission running'};
DS_dusting = true;

_startPos = (position player);
_dead = false;

systemchat "Hey there, flying a plane or chopper, fly over to the marker on your map named (Passenger(s) waiting) and stop near them so they get into your plane";
hint "Hey there, flying a plane or chopper, fly over to the marker on your map named (Passenger(s) waiting) and stop near them so they get into your plane";

DS_currentTask1 = "Air Taxi - Phase One";
DS_currentTask2 = "Hey there, flying a plane or chopper, fly over to the marker on your map named (Passenger(s) waiting) and stop near them so they get into your plane";

_jet = vehicle player;
sleep 0.5;

_totalPayment = 0;

_prevMarker = (position player);

_markerLocation = (selectRandom _markerArray);
while{_prevMarker distance _markerLocation < 1000} do
	{
	_markerLocation = (selectRandom _markerArray);
	};

DS_civJobTask = player createSimpleTask ["civJobTask"];
DS_civJobTask setSimpleTaskDescription ["Flying a plane or chopper, fly to the marker and pick up the waiting passenger(s)","Passenger Pickup",""];
DS_civJobTask setSimpleTaskDestination _markerLocation;
DS_civJobTask setTaskState "Assigned";
player setCurrentTask DS_civJobTask;

_payment = round ((player distance _markerLocation)*_payPerKm);
_sp = _markerLocation;

if(_currentLevel < 2)then
	{

	while{true}do
		{
		if((isNil "_npc1")&&(player distance _markerLocation < 200)&&(driver (vehicle player) isEqualTo player)&&((vehicle player) isKindOf "AIR"))exitwith
			{
			hint "Your passenger is awaiting pick up, drive near them and they will enter your air vehicle";
			systemchat "Your passenger is awaiting pick up, drive near them and they will enter your air vehicle";
			DS_currentTask1 = "Air Taxi - Phase Two";
			DS_currentTask2 = "Your passenger is awaiting pick up, drive near them and they will enter your air vehicle";
			_typeOfNpc = (selectRandom _vipbodyArray);
			_npc1 = DS_civGroup createUnit [_typeOfNpc, _markerLocation, [], 0, "NONE"];
			_npc1 allowDamage false;
			_npc1 disableAI "MOVE";
			};
		sleep 5;
		};

	while{true}do
		{
		if((player distance _npc1 < 25)&&(driver (vehicle player) isEqualTo player)&&((vehicle player) isKindOf "AIR")&&(isTouchingGround (vehicle player)))exitwith
			{
			_npc1 moveInCargo (vehicle player);
			hint "Great, this passenger would like to be dropped off at the marker shown on your map";
			systemchat "Great, this passenger would like to be dropped off at the marker shown on your map";
			DS_currentTask1 = "Air Taxi - Final Phase";
			DS_currentTask2 = "Fly your passenger to the passenger drop point marked on your map";
			};
		sleep 5;
		};

	_totalPayment = _payment;
	_prevMarker = (position player);
	DS_civJobTask setTaskState "Succeeded";
	_markerLocation = (selectRandom _markerArray);
	while{_prevMarker distance _markerLocation < 1000} do
		{
		_markerLocation = (selectRandom _markerArray);
		};

	DS_civJobTask setTaskState "Succeeded";

	DS_civJobTask = player createSimpleTask ["civJobTask"];
	DS_civJobTask setSimpleTaskDescription ["Drop your passenger(s) off here","Passenger Drop Point",""];
	DS_civJobTask setSimpleTaskDestination _markerLocation;
	DS_civJobTask setTaskState "Assigned";
	player setCurrentTask DS_civJobTask;

	_payment = round ((player distance _markerLocation)*_payPerKm);
	_totalPayment = _totalPayment + _payment;
	if(typeOf (vehicle player) != "C_Plane_Civil_01_F")then
		{
		_totalPayment = round(_totalPayment*0.4);
		};

	while{true}do
		{
		if((player distance _markerLocation < 25)&&(driver (vehicle player) isEqualTo player)&&((vehicle player) isKindOf "AIR")&&(isTouchingGround (vehicle player)))exitwith
			{
			_npc1 allowDamage false;
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
		if(!alive _npc1)exitwith{_dead = true};
		};

	if(_dead)exitwith{hint "You have failed this mission because your passenger has been killed";DS_currentTask1 = "";};
	[_totalPayment,true,true] call DS_fnc_handleMoney;

	};

if((_currentLevel > 1)&&(_currentLevel < 6))then
	{

	while{true}do
		{
		if((isNil "_npc1")&&(isNil "_npc2")&&(player distance _markerLocation < 200)&&(driver (vehicle player) isEqualTo player)&&((vehicle player) isKindOf "AIR"))exitwith
			{
			hint "Your passengers are awaiting pick up, drive near them and they will enter your air vehicle";
			systemchat "Your passenger is awaiting pick up, drive near them and they will enter your air vehicle";
			DS_currentTask1 = "Air Taxi - Phase Two";
			DS_currentTask2 = "Your passengers are awaiting pick up, drive near them and they will enter your air vehicle";
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
		};

	while{true}do
		{
		if((player distance _npc1 < 25)&&(driver (vehicle player) isEqualTo player)&&((vehicle player) isKindOf "AIR")&&(isTouchingGround (vehicle player)))exitwith
			{
			_npc1 moveInCargo (vehicle player);
			_npc2 moveInCargo (vehicle player);
			hint "Great, the passengers would like to be dropped off at the marker shown on your map";
			systemchat "Great, the passengers would like to be dropped off at the marker shown on your map";
			DS_currentTask1 = "Air Taxi - Final Phase";
			DS_currentTask2 = "Fly your passengers to the passenger drop point marked on your map";
			};
		sleep 5;
		};

	_totalPayment = _payment;
	_prevMarker = (position player);
	DS_civJobTask setTaskState "Succeeded";
	_markerLocation = (selectRandom _markerArray);
	while{_prevMarker distance _markerLocation < 1000} do
		{
		_markerLocation = (selectRandom _markerArray);
		};

	DS_civJobTask = player createSimpleTask ["civJobTask"];
	DS_civJobTask setSimpleTaskDescription ["Drop your passenger(s) off here","Passenger Drop Point",""];
	DS_civJobTask setSimpleTaskDestination _markerLocation;
	DS_civJobTask setTaskState "Assigned";
	player setCurrentTask DS_civJobTask;

	_payment = round ((player distance _markerLocation)*_payPerKm);
	_totalPayment = _totalPayment + _payment;
	if(typeOf (vehicle player) != "C_Plane_Civil_01_F")then
		{
		_totalPayment = round(_totalPayment*0.4);
		};

	while{true}do
		{
		if((player distance _markerLocation < 25)&&(driver (vehicle player) isEqualTo player)&&((vehicle player) isKindOf "AIR")&&(isTouchingGround (vehicle player)))exitwith
			{
			_npc1 allowDamage false;
			_npc2 allowDamage false;
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
		if((!alive _npc1)||(!alive _npc2))exitwith{_dead = true};
		};

	if(_dead)exitwith{hint "You have failed this mission because one of your passengers has been killed";DS_currentTask1 = "";};
	[_totalPayment,true,true] call DS_fnc_handleMoney;

	};

if((_currentLevel > 5)&&(_currentLevel < 8))then
	{

	while{true}do
		{
		if((isNil "_npc1")&&(isNil "_npc2")&&(isNil "_npc3")&&(player distance _markerLocation < 200)&&(driver (vehicle player) isEqualTo player)&&((vehicle player) isKindOf "AIR"))exitwith
			{
			hint "Your passengers are awaiting pick up, drive near them and they will enter your air vehicle";
			systemchat "Your passenger is awaiting pick up, drive near them and they will enter your air vehicle";
			DS_currentTask1 = "Air Taxi - Phase Two";
			DS_currentTask2 = "Your passengers are awaiting pick up, drive near them and they will enter your air vehicle";
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
		};

	while{true}do
		{
		if((player distance _npc1 < 25)&&(driver (vehicle player) isEqualTo player)&&((vehicle player) isKindOf "AIR")&&(isTouchingGround (vehicle player)))exitwith
			{
			_npc1 moveInAny (vehicle player);
			_npc2 moveInAny (vehicle player);
			_npc3 moveInAny (vehicle player);
			hint "Great, the passengers would like to be dropped off at the marker shown on your map";
			systemchat "Great, the passengers would like to be dropped off at the marker shown on your map";
			DS_currentTask1 = "Air Taxi - Final Phase";
			DS_currentTask2 = "Fly your passengers to the passenger drop point marked on your map";
			};
		sleep 5;
		};

	_totalPayment = _payment;
	_prevMarker = (position player);
	DS_civJobTask setTaskState "Succeeded";
	_markerLocation = (selectRandom _markerArray);
	while{_prevMarker distance _markerLocation < 1000} do
		{
		_markerLocation = (selectRandom _markerArray);
		};

	DS_civJobTask = player createSimpleTask ["civJobTask"];
	DS_civJobTask setSimpleTaskDescription ["Drop your passenger(s) off here","Passenger Drop Point",""];
	DS_civJobTask setSimpleTaskDestination _markerLocation;
	DS_civJobTask setTaskState "Assigned";
	player setCurrentTask DS_civJobTask;

	_payment = round ((player distance _markerLocation)*_payPerKm);
	_totalPayment = _totalPayment + _payment;
	if(typeOf (vehicle player) != "C_Plane_Civil_01_F")then
		{
		_totalPayment = round(_totalPayment*0.4);
		};

	while{true}do
		{
		if((player distance _markerLocation < 25)&&(driver (vehicle player) isEqualTo player)&&((vehicle player) isKindOf "AIR")&&(isTouchingGround (vehicle player)))exitwith
			{
			_npc1 allowDamage false;
			_npc2 allowDamage false;
			_npc3 allowDamage false;
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
		if((!alive _npc1)||(!alive _npc2)||(!alive _npc3))exitwith{_dead = true};
		};


	if(_dead)exitwith{hint "You have failed this mission because one of your passengers has been killed";DS_currentTask1 = "";};
	[_totalPayment,true,true] call DS_fnc_handleMoney;

	};

if(_currentLevel > 7)then
	{

	while{true}do
		{
		if((isNil "_npc1")&&(isNil "_npc2")&&(isNil "_npc3")&&(player distance _markerLocation < 200)&&(driver (vehicle player) isEqualTo player)&&((vehicle player) isKindOf "AIR"))exitwith
			{
			hint "Your passengers are awaiting pick up, drive near them and they will enter your air vehicle";
			systemchat "Your passenger is awaiting pick up, drive near them and they will enter your air vehicle";
			DS_currentTask1 = "Air Taxi - Phase Two";
			DS_currentTask2 = "Your passengers are awaiting pick up, drive near them and they will enter your air vehicle";
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
		};

	while{true}do
		{
		if((player distance _npc1 < 25)&&(driver (vehicle player) isEqualTo player)&&((vehicle player) isKindOf "AIR")&&(isTouchingGround (vehicle player)))exitwith
			{
			_npc1 moveInAny (vehicle player);
			_npc2 moveInAny (vehicle player);
			_npc3 moveInAny (vehicle player);
			hint "Great, the first passenger would like to be dropped off at the marker shown on your map";
			systemchat "Great, the first passenger would like to be dropped off at the marker shown on your map";
			DS_currentTask1 = "Air Taxi - Final Phase";
			DS_currentTask2 = "Fly your passengers to the passenger drop point marked on your map - Each passenger will have their own drop point";
			};
		sleep 5;
		};

	_totalPayment = _payment;
	_prevMarker = (position player);
	DS_civJobTask setTaskState "Succeeded";
	_markerLocation = (selectRandom _markerArray);
	while{_prevMarker distance _markerLocation < 1000} do
		{
		_markerLocation = (selectRandom _markerArray);
		};

	DS_civJobTask = player createSimpleTask ["civJobTask"];
	DS_civJobTask setSimpleTaskDescription ["Drop your passenger(s) off here","Passenger Drop Point",""];
	DS_civJobTask setSimpleTaskDestination _markerLocation;
	DS_civJobTask setTaskState "Assigned";
	player setCurrentTask DS_civJobTask;

	_payment = round ((player distance _markerLocation)*_payPerKm);
	_totalPayment = _totalPayment + _payment;
	if(typeOf (vehicle player) != "C_Plane_Civil_01_F")then
		{
		_totalPayment = round(_totalPayment*0.4);
		};

	while{true}do
		{
		if((player distance _markerLocation < 25)&&(driver (vehicle player) isEqualTo player)&&((vehicle player) isKindOf "AIR")&&(isTouchingGround (vehicle player)))exitwith
			{
			_npc3 action["Eject", vehicle _npc3];
			sleep 1;
			deleteVehicle _npc3;
			hint "Thanks for the lift!";
			systemchat "Thanks for the lift!";
			sleep 5;
			hint "Your next passengers drop point has been marked on your map";
			systemchat "Your next passengers drop point has been marked on your map";
			//player say3D "success";
			//hint format ["You have been paid $%1 for your taxi services",[_totalPayment] call DS_fnc_numberText];
			//systemchat format ["You have been paid $%1 for your taxi services",[_totalPayment] call DS_fnc_numberText];
			//DS_currentTask1 = "";
			};
		sleep 5;
		if((!alive _npc1)||(!alive _npc2)||(!alive _npc3))exitwith{_dead = true};
		};

	if(_dead)exitwith{hint "You have failed this mission because one of your passengers has been killed";DS_currentTask1 = "";DS_civJobTask setTaskState "Succeeded";};
	_prevMarker = (position player);
	DS_civJobTask setTaskState "Succeeded";
	_markerLocation = (selectRandom _markerArray);
	while{_prevMarker distance _markerLocation < 1000} do
		{
		_markerLocation = (selectRandom _markerArray);
		};

	DS_civJobTask = player createSimpleTask ["civJobTask"];
	DS_civJobTask setSimpleTaskDescription ["Drop your passenger(s) off here","Passenger Drop Point",""];
	DS_civJobTask setSimpleTaskDestination _markerLocation;
	DS_civJobTask setTaskState "Assigned";
	player setCurrentTask DS_civJobTask;

	_payment = round ((player distance _markerLocation)*_payPerKm);
	_totalPayment = _totalPayment + _payment;

	while{true}do
		{
		if((player distance _markerLocation < 25)&&(driver (vehicle player) isEqualTo player)&&((vehicle player) isKindOf "AIR")&&(isTouchingGround (vehicle player)))exitwith
			{
			_npc2 action["Eject", vehicle _npc2];
			sleep 1;
			deleteVehicle _npc2;
			hint "Thanks for the lift!";
			systemchat "Thanks for the lift!";
			sleep 5;
			hint "Your next passengers drop point has been marked on your map";
			systemchat "Your next passengers drop point has been marked on your map";
			//player say3D "success";
			//hint format ["You have been paid $%1 for your taxi services",[_totalPayment] call DS_fnc_numberText];
			//systemchat format ["You have been paid $%1 for your taxi services",[_totalPayment] call DS_fnc_numberText];
			//DS_currentTask1 = "";
			};
		sleep 5;
		if((!alive _npc1)||(!alive _npc2))exitwith{_dead = true};
		};

	if(_dead)exitwith{hint "You have failed this mission because one of your passengers has been killed";DS_currentTask1 = "";DS_civJobTask setTaskState "Succeeded";};
	_prevMarker = (position player);
	DS_civJobTask setTaskState "Succeeded";
	_markerLocation = (selectRandom _markerArray);
	while{_prevMarker distance _markerLocation < 1000} do
		{
		_markerLocation = (selectRandom _markerArray);
		};

	DS_civJobTask = player createSimpleTask ["civJobTask"];
	DS_civJobTask setSimpleTaskDescription ["Drop your passenger(s) off here","Passenger Drop Point",""];
	DS_civJobTask setSimpleTaskDestination _markerLocation;
	DS_civJobTask setTaskState "Assigned";
	player setCurrentTask DS_civJobTask;

	_payment = round ((player distance _markerLocation)*_payPerKm);
	_totalPayment = _totalPayment + _payment;
	if(typeOf (vehicle player) != "C_Plane_Civil_01_F")then
		{
		_totalPayment = round(_totalPayment*0.4);
		};

	while{true}do
		{
		if((player distance _markerLocation < 25)&&(driver (vehicle player) isEqualTo player)&&((vehicle player) isKindOf "AIR")&&(isTouchingGround (vehicle player)))exitwith
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
		if(!alive _npc1)exitwith{_dead = true};
		};

	if(_dead)exitwith{hint "You have failed this mission because one of your passengers has been killed";DS_currentTask1 = "";DS_civJobTask setTaskState "Succeeded";};
	[_totalPayment,true,true] call DS_fnc_handleMoney;

	};

if(_dead)exitwith{DS_dusting = false;};
[100,true] spawn DS_fnc_moralAlter;
DS_civJobTask setTaskState "Succeeded";
if((DS_infoArray select 13) == 31)then { [0] call DS_fnc_questCompleted };
if((_currentLevel == 10)&&((DS_infoArray select 13) == 47))then { [0] call DS_fnc_questCompleted };
if((DS_realEstateArray select 15) == 10)exitWith
	{
	sleep 5;
	hint "You are at the max level for these missions - You can not be promoted but you can continue doing this mission for profit";
	systemchat "You are at the max level for these missions - You can not be promoted but you can continue doing this mission for profit";
	//[] call DS_fnc_compileData;
	sleep 5;
	DS_dusting = false;
	if((DS_infoArray select 13) == 40)then { [0] call DS_fnc_questCompleted };
	};

_tempNum = (DS_realEstateArray select 16) + 1;
DS_realEstateArray set [16,_tempNum];
if(_tempNum > 3)then
	{
	sleep 5;
	_tempNum = (DS_realEstateArray select 15);//4
	_tempNum = _tempNum + 1;//5
	DS_realEstateArray set [15,_tempNum];//5
	_bonus = ((DS_realEstateArray select 15)*18000);
	DS_realEstateArray set [16,0];
	player say3D "success";
	hint format ["You have been promoted to a level %1 Air Taxi Pilot, you have also received a bonus of $%2 for all of your hard work",(DS_realEstateArray select 15),[_bonus] call DS_fnc_numberText];
	systemchat format ["You have been promoted to a level %1 Air Taxi Pilot, you have also received a bonus of $%2 for all of your hard work",(DS_realEstateArray select 15),[_bonus] call DS_fnc_numberText];
	[_bonus,true,true] call DS_fnc_handleMoney;
	sleep 5;
	if((DS_infoArray select 13) == 40)then { [0] call DS_fnc_questCompleted };
	};
//[] call DS_fnc_compileData;
sleep 5;
DS_dusting = false;
[2] spawn DS_civ_improve;

if(!isNil "_npc1")then{sleep 3;deleteVehicle _npc1;};
if(!isNil "_npc2")then{sleep 3;deleteVehicle _npc2;};
if(!isNil "_npc3")then{sleep 3;deleteVehicle _npc3;};