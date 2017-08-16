/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Starts chopper pilot missions depending on your current level
*/

private["_vehicle","_veh","_sp","_typeStr2","_fuelDrop","_startCost","_fired","_speedWarning","_test","_curLevel","_typeStr","_type","_markerlocation","_lastLoc","_counter","_expectedTime","_pass","_payment","_sp","_vehArray","_vehicle","_veh","_tempNum","_attachment","_vehAttachmentArray","_maxDistance","_minDistance","_attachment2","_attachment3","_attachment4","_attachment5","_attachment6"];

_curLevel = (DS_realEstateArray select 12);
_distance = 0;
_typeStr = "";
_typeStr2 = "";
_lastLoc = (position player);
_fuelDrop = 0;
_multiplier = 1;
_sp = (DS_spawnPoint select 0);
_truckdeliveryarray  =
[
(getMarkerPos "p1"),(getMarkerPos "p2"),(getMarkerPos "p3"),(getMarkerPos "p4"),(getMarkerPos "p5"),
(getMarkerPos "p6"),(getMarkerPos "p7"),(getMarkerPos "p8"),(getMarkerPos "p9"),(getMarkerPos "p10"),
(getMarkerPos "p11"),(getMarkerPos "p12"),(getMarkerPos "p13"),(getMarkerPos "p14"),(getMarkerPos "p15"),
(getMarkerPos "p16"),(getMarkerPos "p17"),(getMarkerPos "p18"),(getMarkerPos "p19"),(getMarkerPos "p20"),
(getMarkerPos "p21"),(getMarkerPos "p22"),(getMarkerPos "p23"),(getMarkerPos "p24"),(getMarkerPos "p25"),
(getMarkerPos "p26"),(getMarkerPos "p27"),(getMarkerPos "p28"),(getMarkerPos "p29"),(getMarkerPos "p30"),
(getMarkerPos "p31"),(getMarkerPos "p32"),(getMarkerPos "p33"),(getMarkerPos "p34"),(getMarkerPos "p35"),
(getMarkerPos "p37"),(getMarkerPos "p38"),(getMarkerPos "p39"),(getMarkerPos "p40"),(getMarkerPos "p41"),
(getMarkerPos "p42"),(getMarkerPos "p43"),(getMarkerPos "p44"),
(getMarkerPos "carbomb1"),(getMarkerPos "peach2"),(getMarkerPos "bv_1_2_1_1_1"),(getMarkerPos "nCOmbat"),(getMarkerPos "oil2"),
(getMarkerPos "carbomb2"),(getMarkerPos "milzone2"),(getMarkerPos "diamond_1"),(getMarkerPos "carbomb4"),(getMarkerPos "jailQuest1")
];

if(isNil "DS_truckDriver")then{DS_truckDriver = false;};
if(DS_truckDriver) exitwith {hint "You already have a mission started, if you have only just completed one please wait 10 seconds before beginning a new one"};
DS_truckDriver = true;

switch(_curLevel)do
	{
	case 0:
		{
		_typeStr = "Sight Seeing Tour";
		_typeStr2 = "To complete this job you will have to fly over some sights slowly";
		_minDistance = 50000;
		_maxDistance = 6000;
		_vehAttachmentArray = ["Land_MetalBarrel_F","FlexibleTank_01_sand_F","C_Kart_01_Vrana_F","B_G_Quadbike_01_F"];
		_fuelDrop = 0.002;
		_multiplier = 1;
		_veh = "I_Plane_Fighter_03_AA_F";
		};
	case 1:
		{
		_typeStr = "Small load, Medium distance";
		_typeStr2 = "M900, Hummingbird, Orca, Hellcat, Mohawk, Normal Taru, Huron";
		_minDistance = 5000;
		_maxDistance = 16000;
		_vehAttachmentArray = ["Land_MetalBarrel_F","FlexibleTank_01_sand_F","C_Kart_01_Vrana_F","B_G_Quadbike_01_F"];
		_fuelDrop = 0.002;
		_multiplier = 1.2;
		};
	case 2:
		{
		_typeStr = "Small load, Long distance";
		_typeStr2 = "M900, Hummingbird, Orca, Hellcat, Mohawk, Normal Taru, Huron";
		_minDistance = 12000;
		_maxDistance = 30000;
		_vehAttachmentArray = ["Land_MetalBarrel_F","FlexibleTank_01_sand_F","C_Kart_01_Vrana_F","B_G_Quadbike_01_F"];
		_fuelDrop = 0.002;
		_multiplier = 1.3;
		};
	case 3:
		{
		_typeStr = "Medium load, Short distance";
		_typeStr2 = "Orca, Hellcat, Mohawk, Normal Taru, Huron";
		_minDistance = 500;
		_maxDistance = 6000;
		_vehAttachmentArray = ["FlexibleTank_01_forest_F","CargoNet_01_box_F","CargoNet_01_barrels_F","C_Hatchback_01_F","C_Rubberboat"];
		_fuelDrop = 0.003;
		_multiplier = 1.4;
		};
	case 4:
		{
		_typeStr = "Medium load, Medium distance";
		_typeStr2 = "Orca, Hellcat, Mohawk, Normal Taru, Huron";
		_minDistance = 5000;
		_maxDistance = 16000;
		_vehAttachmentArray = ["FlexibleTank_01_forest_F","CargoNet_01_box_F","CargoNet_01_barrels_F","C_Rubberboat"];
		_fuelDrop = 0.003;
		_multiplier = 1.5;
		};
	case 5:
		{
		_typeStr = "Medium load, Long distance";
		_typeStr2 = "Orca, Hellcat, Mohawk, Normal Taru, Huron";
		_minDistance = 12000;
		_maxDistance = 30000;
		_vehAttachmentArray = ["FlexibleTank_01_forest_F","CargoNet_01_box_F","CargoNet_01_barrels_F","C_Hatchback_01_F","C_Rubberboat"];
		_fuelDrop = 0.003;
		_multiplier = 1.6;
		};
	case 6:
		{
		_typeStr = "Medium load (Expensive Cargo), Short distance";
		_typeStr2 = "Normal Taru, Huron";
		_minDistance = 500;
		_maxDistance = 6000;
		_vehAttachmentArray = ["C_Hatchback_01_sport_F","C_Offroad_01_F","C_SUV_01_F","C_Van_01_box_F","C_Van_01_transport_F","B_G_Van_01_transport_F"];
		_fuelDrop = 0.004;
		_multiplier = 1.7;
		};
	case 7:
		{
		_typeStr = "Medium load (Expensive Cargo), Medium distance";
		_typeStr2 = "Normal Taru, Huron";
		_minDistance = 5000;
		_maxDistance = 16000;
		_vehAttachmentArray = ["C_Hatchback_01_sport_F","C_Offroad_01_F","C_SUV_01_F","C_Van_01_box_F","C_Van_01_transport_F","B_G_Van_01_transport_F"];
		_fuelDrop = 0.004;
		_multiplier = 1.8;
		};
	case 8:
		{
		_typeStr = "Medium load (Expensive Cargo), Long distance";
		_typeStr2 = "Normal Taru, Huron";
		_minDistance = 12000;
		_maxDistance = 30000;
		_vehAttachmentArray = ["C_Hatchback_01_sport_F","C_Offroad_01_F","C_SUV_01_F","C_Van_01_box_F","C_Van_01_transport_F","B_G_Van_01_transport_F"];
		_fuelDrop = 0.004;
		_multiplier = 1.8;
		};
	case 9:
		{
		_typeStr = "Heavy load , Short distance";
		_typeStr2 = " Normal Taru, Huron";
		_minDistance = 500;
		_maxDistance = 6000;
		_vehAttachmentArray = ["Land_Cargo10_yellow_F","Land_Cargo10_white_F","Land_Cargo10_military_green_F","I_Truck_02_transport_F","Land_Cargo10_red_F"];
		_fuelDrop = 0.006;
		_multiplier = 1.9;
		};
	case 10:
		{
		_typeStr = "Heavy load , Medium distance";
		_typeStr2 = " Normal Taru, Huron";
		_minDistance = 5000;
		_maxDistance = 16000;
		_vehAttachmentArray = ["Land_Cargo10_yellow_F","Land_Cargo10_white_F","Land_Cargo10_military_green_F","I_Truck_02_transport_F","Land_Cargo10_red_F"];
		_fuelDrop = 0.006;
		_multiplier = 2;
		};
	case 11:
		{
		_typeStr = "Heavy load , Long distance";
		_typeStr2 = " Normal Taru, Huron";
		_minDistance = 12000;
		_maxDistance = 30000;
		_vehAttachmentArray = ["Land_Cargo10_yellow_F","Land_Cargo10_white_F","Land_Cargo10_military_green_F","I_Truck_02_transport_F","Land_Cargo10_red_F"];
		_fuelDrop = 0.006;
		_multiplier = 2.1;
		};
	case 12:
		{
		_typeStr = "(Explosive Load (Carry slowly below 70m)), Short distance";
		_typeStr2 = " Normal Taru, Huron";
		_minDistance = 500;
		_maxDistance = 6000;
		_vehAttachmentArray = ["B_SDV_01_F"];
		_fuelDrop = 0.008;
		_multiplier = 2.3;
		};
	case 13:
		{
		_typeStr = "(Explosive Load (Carry slowly below 70m)), Medium distance";
		_typeStr2 = " Normal Taru, Huron";
		_minDistance = 5000;
		_maxDistance = 16000;
		_vehAttachmentArray = ["B_SDV_01_F"];
		_fuelDrop = 0.008;
		_multiplier = 2.5;
		};
	case 14:
		{
		_typeStr = "(Explosive Load (Carry slowly below 70m)), Long distance";
		_typeStr2 = " Normal Taru, Huron";
		_minDistance = 12000;
		_maxDistance = 30000;
		_vehAttachmentArray = ["B_SDV_01_F"];
		_fuelDrop = 0.008;
		_multiplier = 2.7;
		};
	};

_action = [
	"Warning! Using your job vehicle in anyway that is not job related could result in disciplinary action by the admins",
	"Warning!",
	"Continue",
	"No Thanks"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{DS_truckDriver = false;};
_action = [
	format ["%1, This mission cost $%2 to begin: %1. You must complete %3 more jobs to be promoted",_typeStr2,[_minDistance] call DS_fnc_moneyText,(((DS_realEstateArray select 12) + 3) - (DS_infoArray select 12))],
	"Warning!",
	"Continue",
	"No Thanks"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{DS_truckDriver = false;};

if(count(nearestObjects[(getMarkerPos _sp),["Car","Ship","Air"],15]) != 0) exitWith {hint "There is a vehicle blocking the spawn point";DS_truckDriver = false;};
if([_minDistance,true] call DS_fnc_checkMoney)exitwith{hint "You do not have enough money in your bank to begin this mission";DS_truckDriver = false;};
[_minDistance,true,false] call DS_fnc_handleMoney;
_vehicle = createVehicle [_veh, (getMarkerPos _sp), [], 0, "NONE"];
waitUntil {!isNil "_vehicle"};
_vehicle setVariable["vehicle_owners",[[getPlayerUID player,profileName]],true];
_vehicle lock 2;
clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
DS_keyRing pushBack _vehicle;
_vehicle setVariable["boot_open",true,true];
[_vehicle] call DS_fnc_clearVehAmmo;

//Create pickup point marker
_markerlocation = (selectRandom _truckdeliveryarray);
//Pick a new marker if it is too far away for this level
while{((_lastLoc distance _markerlocation > _maxDistance)||(_lastLoc distance _markerlocation < _minDistance))} do
	{
	_markerlocation = (selectRandom _truckdeliveryarray);
	};
player removeSimpleTask DS_civJobTask;
DS_civJobTask = player createSimpleTask ["civJobTask"];
DS_civJobTask setSimpleTaskDescription ["Drive to the marked location to collect the cargo","Cargo Pickup",""];
DS_civJobTask setSimpleTaskDestination _markerLocation;
DS_civJobTask setTaskState "Assigned";
player setCurrentTask DS_civJobTask;

_distance = (player distance _markerlocation);
_lastLoc = (position player);
sleep 5;
systemchat format ["Your Mission type is %1. Your Cargo is waiting to be picked up, fly to the pick up marker and search for your cargo",_typeStr];
hint format ["Your Mission type is %1. Your Cargo is waiting to be picked up, fly to the pick up marker and search for your cargo",_typeStr];

while{true}do
	{
	if(player distance _markerlocation < 50) exitwith {_pass = true};
	sleep 10;
	};

_veh = (selectRandom _vehAttachmentArray);
_attachment = _veh createVehicle [0,0,0];
_attachment setPos _markerlocation;
_attachment setVectorUp (surfaceNormal _markerlocation);
_attachment setPos [getPos _attachment select 0, getPos _attachment select 1, (getPos _attachment select 2)+0.3];
_attachment allowDamage false;
_attachment lock 2;
_attachment setVariable ["chopperMission",true,true];
_attachment allowDamage false;

player say3D "dingDong";
systemchat "Your Cargo is waiting at the marker point for you to lift, lift it and gain elevation to receive the drop point";
hint "Your Cargo is waiting at the marker point for you to lift, lift it and gain elevation to receive the drop point";

while{true}do
	{
	if((getPos (_attachment) select 2) > 20)exitwith{_pass = true};
	sleep 2;
	};
_attachment allowDamage true;
_lastLoc = (position player);

//Create drop off point marker
_markerlocation = (selectRandom _truckdeliveryarray);
//Pick a new marker if it is too far away for this level
while{((_lastLoc distance _markerlocation > _maxDistance)||(_lastLoc distance _markerlocation < _minDistance))} do
	{
	_markerlocation = (selectRandom _truckdeliveryarray);
	};
player removeSimpleTask DS_civJobTask;
DS_civJobTask = player createSimpleTask ["civJobTask"];
DS_civJobTask setSimpleTaskDescription ["Drive to the marked location to deliver the cargo","Cargo Pickup",""];
DS_civJobTask setSimpleTaskDestination _markerlocation;
DS_civJobTask setTaskState "Assigned";
player setCurrentTask DS_civJobTask;

_distance = _distance + (player distance _markerlocation);

player say3D "dingDong";
systemchat "Your Drop point has been marked on your map, fly there to drop your Cargo";
hint "Your Drop point has been marked on your map, fly there to drop your Cargo";

while{true}do
	{
	if(!alive player)exitwith{_pass = false};
	if(_attachment distance _markerlocation < 100) exitwith {_pass = true};
	if(((player distance _attachment) < 100)&&((vehicle player) isKindOf "Air"))then
		{
		(vehicle player) setfuel ((fuel vehicle player) - _fuelDrop);
		};
	if(((_curLevel > 11)&&((player distance _attachment) < 40)&&((vehicle player) isKindOf "Air")&&((getPos (player) select 2) > 70))||(!alive _attachment))exitwith{_pass = false};
	sleep 10;
	};
if(!alive player)exitWith
	{
	player removeSimpleTask DS_civJobTask;
	deleteVehicle _attachment;
	DS_truckDriver = false;
	hint "You have failed this delivery because you died";
	systemchat "You have failed this delivery because you died";
	};
if(!_pass)exitWith
	{
	if(!alive _attachment)then
		{
		player removeSimpleTask DS_civJobTask;
		deleteVehicle _attachment;
		DS_truckDriver = false;
		hint "You have failed this delivery because your cargo was destroyed";
		systemchat "You have failed this delivery because your cargo was destroyed";
		}
		else
		{
		player removeSimpleTask DS_civJobTask;
		deleteVehicle _attachment;
		DS_truckDriver = false;
		(vehicle player) setDamage 1;
		hint "You have failed this delivery because you flew too high";
		systemchat "You have failed this delivery because you flew too high";
		};
	};

player say3D "dingDong";
systemchat "You're here, safely drop your cargo on the marker to complete this mission";
hint "You're here, safely drop your cargo on the marker to complete this mission";

while{true}do
	{
	if(_attachment distance _markerlocation < 30) exitwith {_pass = true};
	sleep 2;
	};

player removeSimpleTask DS_civJobTask;
deleteVehicle _attachment;

player say3D "dingDong";
systemchat "Delivery complete, return to the depot for payment";
hint "Delivery complete, return to the Jobs depot for payment";

while{true}do
	{
	if(player distance (getMarkerPos "jobs1_3") < 20)exitwith{_pass = true;};
	if(player distance (getMarkerPos "jobs1_2") < 20)exitwith{_pass = true;};
	if(player distance (getMarkerPos "jobs1") < 20)exitwith{_pass = true;};
	if(player distance (getMarkerPos "jobs1_1") < 20)exitwith{_pass = true;};
	sleep 10;
	};

[100,true] spawn DS_fnc_moralAlter;
systemchat format ["you have completed your cargo mission. A payment of $%1 has been deposited into your bank account - Continue this levels missions to get promoted",[(round((_distance*2)*_multiplier))] call DS_fnc_numberText];
hint format ["you have completed your cargo mission. A payment of $%1 has been deposited into your bank account - Continue this levels missions to get promoted",[(round((_distance*2)*_multiplier))] call DS_fnc_numberText];
_tempNum = (DS_infoArray select 26) + 1;
DS_infoArray set [26,_tempNum];
[(round((_distance*2)*_multiplier)),true,true] call DS_fnc_handleMoney;

sleep 10;
if((DS_infoArray select 26) > (5 + (DS_infoArray select 25)))then
	{
	_tempNum = (DS_infoArray select 25) + 1;
	if(_tempNum > 14)exitWith
		{
		hint "Good job, you have reached the current max level for this job, you can continue to do this level until new levels are created";
		systemchat "Good job, you have reached the current max level for this job, you can continue to do this level until new levels are created";
		//[] call DS_fnc_compileData;
		DS_truckDriver = false;
		};
	player say3D "success";
	DS_infoArray set [25,_tempNum];
	DS_infoArray set [26,0];
	hint format ["You have been promoted to a level %1 Cargo Pilot, you have also received a bonus of $%2 for all of your hard work",(DS_infoArray select 25),[((DS_infoArray select 25)*25000)] call DS_fnc_numberText];
	systemchat format ["You have been promoted to a level %1 Cargo Pilot, you have also received a bonus of $%2 for all of your hard work",(DS_infoArray select 25),[((DS_infoArray select 25)*25000)] call DS_fnc_numberText];
	_tempNum = ((DS_infoArray select 25)*25000);
	[_tempNum,true,true] call DS_fnc_handleMoney;
	};

//[] call DS_fnc_compileData;
DS_truckDriver = false;