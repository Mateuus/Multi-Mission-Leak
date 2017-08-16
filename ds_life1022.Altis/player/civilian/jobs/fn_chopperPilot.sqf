/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Starts chopper pilot missions depending on your current level
*/

/*




STOP PEOPLE FROM PICKING UP LOADS THAT DON'T BELONG TO THEM!@!!!!!



*/

// deleteVehicle DS_veh1;DS_veh1 = "FlexibleTank_01_forest_F" createVehicle getPos player;deleteVehicle DS_veh2;DS_veh2 = "Land_HBarrierTower_F" createVehicle [0,0,0];DS_veh2 attachTo [DS_veh1,[0,0,0]];

private ["_veh1"];

_curLevel = (DS_infoArray select 25);
_lastLoc = (position player);
_distance = 0;

//Fix people who were bugged
if(((DS_infoArray select 25) < 16)&&((DS_infoArray select 26) > 3))then {
	_overAmount = ((DS_infoArray select 26) - 4);
	_newLevel = (DS_infoArray select 25) - _overAmount;
	DS_infoArray set [25,_overAmount];
	_cheat = format ["Exploited off bugged chopper missions, Completed it bugged %1 times to get to level %2 when he should of only been level %3. A lot of money may have been gained because of this",((DS_infoArray select 26) - 4),(DS_infoArray select 25),_overAmount];
	[(getPlayerUID player),"1",_cheat,"19"] remoteExec ["HUNT_fnc_adminNotes",2];
	[] call DS_fnc_compileData;
};

_truckDeliveryArray  =
[
(getMarkerPos "jobMarker1"),(getMarkerPos "jobMarker2"),(getMarkerPos "jobMarker3"),(getMarkerPos "jobMarker4"),(getMarkerPos "jobMarker5"),
(getMarkerPos "jobMarker6"),(getMarkerPos "jobMarker7"),(getMarkerPos "jobMarker8"),(getMarkerPos "jobMarker9"),(getMarkerPos "jobMarker10"),
(getMarkerPos "jobMarker11"),(getMarkerPos "jobMarker12"),(getMarkerPos "jobMarker13"),(getMarkerPos "jobMarker14"),(getMarkerPos "jobMarker15"),
(getMarkerPos "jobMarker16"),(getMarkerPos "jobMarker17"),(getMarkerPos "jobMarker18"),(getMarkerPos "jobMarker19"),(getMarkerPos "jobMarker20"),
(getMarkerPos "jobMarker21"),(getMarkerPos "jobMarker22"),(getMarkerPos "jobMarker23"),(getMarkerPos "jobMarker24"),(getMarkerPos "jobMarker25"),
(getMarkerPos "jobMarker26"),(getMarkerPos "jobMarker27"),(getMarkerPos "jobMarker28"),(getMarkerPos "jobMarker30"),(getMarkerPos "jobMarker31"),
(getMarkerPos "jobMarker32"),(getMarkerPos "jobMarker33")
];

if(isNil "DS_truckDriver")then{DS_truckDriver = false;};
if(DS_truckDriver) exitwith {hint "You already have a mission started, if you have only just completed one please wait 10 seconds before beginning a new one"};
DS_truckDriver = true;

//(0) Title | (1) Min Distance | (2) Max Distance | (3) Main Object | (4) Array of attachables | (5) Pay per M | (6) Fuel drop | (7) Types of allowed choppers | (8) Types of choppers not allowed
_infoArray = [
	["Small Load, Short Distance",500,5000,"Land_MetalBarrel_F",[["Land_FieldToilet_F",0,-0.5,0.2],["Land_Bricks_V1_F",0,0,-1.1],["Land_CinderBlocks_F",0,0,-2],["Land_PowerGenerator_F",0,0,0]],2,0.002,"M900, Hummingbird or larger",[]],
	["Small Load, Medium Distance",4000,10000,"Land_MetalBarrel_F",[["Land_FieldToilet_F",0,-0.5,0.2],["Land_Bricks_V1_F",0,0,-1.1],["Land_CinderBlocks_F",0,0,-2],["Land_PowerGenerator_F",0,0,0]],2.5,0.002,"M900, Hummingbird or larger",[]],
	["Small Load, Long Distance",8500,20000,"Land_MetalBarrel_F",[["Land_FieldToilet_F",0,-0.5,0.2],["Land_Bricks_V1_F",0,0,-1.1],["Land_CinderBlocks_F",0,0,-2],["Land_PowerGenerator_F",0,0,0]],3,0.002,"M900, Hummingbird or larger",[]],
	["Medium Load, Short Distance",500,5000,"Land_MetalBarrel_F",[["Land_Coil_F",0,0,-1.1],["Land_ConcretePipe_F",0,0,-1.4],["Land_Grave_V3_F",0,0,0],["Land_CargoBox_V1_F",0,0,0.3],["Land_GarbageContainer_closed_F",0,0,0.3],["Land_Atm_01_F",0,0,-0.9]],3.5,0.004,"Orca or larger",["C_Heli_Light_01_civil_F","B_Heli_Light_01_F"]],
	["Medium Load, Medium Distance",4000,10000,"Land_MetalBarrel_F",[["Land_Coil_F",0,0,-1.1],["Land_ConcretePipe_F",0,0,-1.4],["Land_Grave_V3_F",0,0,0],["Land_CargoBox_V1_F",0,0,0.3],["Land_GarbageContainer_closed_F",0,0,0.3],["Land_Atm_01_F",0,0,-0.9]],4,0.004,"Orca or larger",["C_Heli_Light_01_civil_F","B_Heli_Light_01_F"]],
	["Medium Load, Long Distance",8500,20000,"Land_MetalBarrel_F",[["Land_Coil_F",0,0,-1.1],["Land_ConcretePipe_F",0,0,-1.4],["Land_Grave_V3_F",0,0,0],["Land_CargoBox_V1_F",0,0,0.3],["Land_GarbageContainer_closed_F",0,0,0.3],["Land_Atm_01_F",0,0,-0.9]],4.4,0.004,"Orca or larger",["C_Heli_Light_01_civil_F","B_Heli_Light_01_F"]],
	["Small Scrap Load, Short Distance",500,5000,"Land_MetalBarrel_F",[["Land_Scrap_MRAP_01_F",0,0,-1.3],["Land_Wreck_Van_F",0,0,-0.1],["Land_Wreck_Ural_F",0,0,-0.1],["Land_Wreck_Car3_F",0,0,-0.1],["Land_Wreck_Truck_F",0,0,-0.1]],5,0.006,"Orca or larger",["C_Heli_Light_01_civil_F","B_Heli_Light_01_F"]],
	["Small Scrap Load, Medium Distance",4000,10000,"Land_MetalBarrel_F",[["Land_Scrap_MRAP_01_F",0,0,-1.3],["Land_Wreck_Van_F",0,0,-0.1],["Land_Wreck_Ural_F",0,0,-0.1],["Land_Wreck_Car3_F",0,0,-0.1],["Land_Wreck_Truck_F",0,0,-0.1]],5.5,0.006,"Orca or larger",["C_Heli_Light_01_civil_F","B_Heli_Light_01_F"]],
	["Small Scrap Load, Long Distance",8500,20000,"Land_MetalBarrel_F",[["Land_Scrap_MRAP_01_F",0,0,-1.3],["Land_Wreck_Van_F",0,0,-0.1],["Land_Wreck_Ural_F",0,0,-0.1],["Land_Wreck_Car3_F",0,0,-0.1],["Land_Wreck_Truck_F",0,0,-0.1]],6,0.006,"Orca or larger",["C_Heli_Light_01_civil_F","B_Heli_Light_01_F"]],
	["Vehicles, Short Distance",500,5000,"Land_MetalBarrel_F",[["C_Heli_light_01_ion_F",0,0,-1.1],["C_Boat_Civil_01_rescue_F",0,0,0.1],["C_Hatchback_01_sport_orange_F",0,0,0.2]],6.5,0.008,"Hellcat or larger",["C_Heli_Light_01_civil_F","B_Heli_Light_01_F","O_Heli_Light_02_unarmed_F"]],
	["Vehicles, Medium Distance",4000,10000,"Land_MetalBarrel_F",[["C_Heli_light_01_ion_F",0,0,-1.1],["C_Boat_Civil_01_rescue_F",0,0,0.1],["C_Hatchback_01_sport_orange_F",0,0,0.2]],7,0.008,"Hellcat or larger",["C_Heli_Light_01_civil_F","B_Heli_Light_01_F","O_Heli_Light_02_unarmed_F"]],
	["Vehicles, Long Distance",8500,20000,"Land_MetalBarrel_F",[["C_Heli_light_01_ion_F",0,0,-1.1],["C_Boat_Civil_01_rescue_F",0,0,0.1],["C_Hatchback_01_sport_orange_F",0,0,0.2]],7.5,0.008,"Hellcat or larger",["C_Heli_Light_01_civil_F","B_Heli_Light_01_F","O_Heli_Light_02_unarmed_F"]],
	["Military Objects, Short Distance",500,5000,"Land_MetalBarrel_F",[["Land_HBarrierTower_F",0,1,-2.2],["Land_Research_house_V1_F",0,-1,-2.6],["Land_Cargo_Patrol_V3_F",0,-0.2,-1.8],["Land_Cargo_HQ_V1_F",-3,4,-2.2],["Land_Cargo_House_V1_F",0,-2,-2.8]],8,0.01,"Mowhawk or larger",["C_Heli_Light_01_civil_F","B_Heli_Light_01_F","O_Heli_Light_02_unarmed_F","I_Heli_light_03_unarmed_F"]],
	["Military Objects, Medium Distance",4000,10000,"Land_MetalBarrel_F",[["Land_HBarrierTower_F",0,1,-2.2],["Land_Research_house_V1_F",0,-1,-2.6],["Land_Cargo_Patrol_V3_F",0,-0.2,-1.8],["Land_Cargo_HQ_V1_F",-3,4,-2.2],["Land_Cargo_House_V1_F",0,-2,-2.8]],8.5,0.01,"Mowhawk or larger",["C_Heli_Light_01_civil_F","B_Heli_Light_01_F","O_Heli_Light_02_unarmed_F","I_Heli_light_03_unarmed_F"]],
	["Military Objects, Long Distance",8500,20000,"Land_MetalBarrel_F",[["Land_HBarrierTower_F",0,1,-2.2],["Land_Research_house_V1_F",0,-1,-2.6],["Land_Cargo_Patrol_V3_F",0,-0.2,-1.8],["Land_Cargo_HQ_V1_F",-3,4,-2.2],["Land_Cargo_House_V1_F",0,-2,-2.8]],9,0.01,"Mowhawk or larger",["C_Heli_Light_01_civil_F","B_Heli_Light_01_F","O_Heli_Light_02_unarmed_F","I_Heli_light_03_unarmed_F"]],
	["Large Scrap Load, Short Distance",500,5000,"Land_MetalBarrel_F",[["Land_Wreck_Plane_Transport_01_F",0,-1.5,-2.8],["Land_Wreck_Heli_Attack_02_F",-1,1.5,0.4],["Land_UWreck_MV22_F",-1.6,1.5,1.9],["Land_UWreck_Heli_Attack_02_F",-0.5,1.5,0.5]],9.5,0.02,"Huron or Taru",["C_Heli_Light_01_civil_F","B_Heli_Light_01_F","O_Heli_Light_02_unarmed_F","I_Heli_light_03_unarmed_F","I_Heli_Transport_02_F"]],
	["Large Scrap Load, Medium Distance",4000,10000,"Land_MetalBarrel_F",[["Land_Wreck_Plane_Transport_01_F",0,-1.5,-2.8],["Land_Wreck_Heli_Attack_02_F",-1,1.5,0.4],["Land_UWreck_MV22_F",-1.6,1.5,1.9],["Land_UWreck_Heli_Attack_02_F",-0.5,1.5,0.5]],10,0.02,"Huron or Taru",["C_Heli_Light_01_civil_F","B_Heli_Light_01_F","O_Heli_Light_02_unarmed_F","I_Heli_light_03_unarmed_F","I_Heli_Transport_02_F"]],
	["Large Scrap Load, Long Distance",8500,20000,"Land_MetalBarrel_F",[["Land_Wreck_Plane_Transport_01_F",0,-1.5,-2.8],["Land_Wreck_Heli_Attack_02_F",-1,1.5,0.4],["Land_UWreck_MV22_F",-1.6,1.5,1.9],["Land_UWreck_Heli_Attack_02_F",-0.5,1.5,0.5]],12,0.02,"Huron or Taru",["C_Heli_Light_01_civil_F","B_Heli_Light_01_F","O_Heli_Light_02_unarmed_F","I_Heli_light_03_unarmed_F","I_Heli_Transport_02_F"]]
];

_infoArray = (_infoArray select _curLevel);

_action = [
	format ["You are on %1 chopper missions. For these missions you need a %2. You must complete %3 more jobs to be promoted",(_infoArray select 0),(_infoArray select 7),(((DS_infoArray select 26)-4)*-1)],
	"Warning!",
	"Continue",
	"Cancel"
] call BIS_fnc_guiMessage;
if(!_action)exitWith{DS_truckDriver = false;};

_dropPoint = selectRandom _truckDeliveryArray;

while{ ((player distance _dropPoint > (_infoArray select 2))||(player distance _dropPoint < (_infoArray select 1))) }do {
	_dropPoint = selectRandom _truckDeliveryArray;
};

systemchat "Your job is to fly to the marker and lift the cargo that is waiting for you";
hint "Your job is to fly to the marker and lift the cargo that is waiting for you";

player removeSimpleTask DS_civJobTask;
DS_civJobTask = player createSimpleTask ["civJobTask"];
DS_civJobTask setSimpleTaskDescription [format ["Fly to the marker and lift the waiting cargo with a %1",(_infoArray select 7)],"Cargo Pickup","Pickup Cargo Here"];
DS_civJobTask setSimpleTaskDestination _dropPoint;
DS_civJobTask setTaskState "Assigned";
player setCurrentTask DS_civJobTask;

_distance = (player distance _dropPoint);

while{true}do {
	if(player distance _dropPoint < 60) exitwith {};
	sleep 10;
};

_attachTypeArray = (selectRandom (_infoArray select 4));

_veh1 = (_infoArray select 3) createVehicle _dropPoint;
_veh1 setVectorUp (surfaceNormal _dropPoint);
_veh2 = (_attachTypeArray select 0) createVehicle [0,0,0];
_veh2 attachTo [_veh1,[(_attachTypeArray select 1),(_attachTypeArray select 2),(_attachTypeArray select 3)]];

_veh1 setVariable ["noChop",true,true];
_veh1 allowDamage false;
_veh2 setVariable ["noChop",true,true];
_veh2 allowDamage false;

player say3D "dingDong";
systemchat "Your Cargo is waiting at the marker point for you to lift, lift it and gain elevation to receive the drop point";
hint "Your Cargo is waiting at the marker point for you to lift, lift it and gain elevation to receive the drop point";

sleep 20;
systemchat "The cargo drop point has been added to your map";
hint "The cargo drop point has been added to your map";

[_veh1] spawn {
	while{true}do {
		sleep 7;
		if(!alive (_this select 0))exitwith{};
		if((player distance (_this select 0)) > 30)then {
			hint "You are not currently carrying the load that you must drop off, if you are carrying a load, it may not be yours";
		};
	};
};
		

DS_civJobTask setTaskState "Succeeded";

_dropPoint = selectRandom _truckDeliveryArray;

while{ ((player distance _dropPoint > (_infoArray select 2))||(player distance _dropPoint < (_infoArray select 1))) }do {
	_dropPoint = selectRandom _truckDeliveryArray;
};

_distance = _distance + (player distance _dropPoint);

systemchat "Your Cargo drop point has been marked on the map, fly your cargo there and carefully land it on the marker";
hint "Your Cargo drop point has been marked on the map, fly your cargo there and carefully land it on the marker";

player removeSimpleTask DS_civJobTask;
DS_civJobTask = player createSimpleTask ["civJobTask"];
DS_civJobTask setSimpleTaskDescription ["Fly to the marker and drop your cargo","Cargo Drop Point","Drop Cargo Here"];
DS_civJobTask setSimpleTaskDestination _dropPoint;
DS_civJobTask setTaskState "Assigned";
player setCurrentTask DS_civJobTask;

while{true}do {
	if(_veh1 distance _dropPoint < 20) exitwith {};
	if(((player distance _veh1) < 100)&&((vehicle player) isKindOf "Air"))then {
		(vehicle player) setfuel ((fuel vehicle player) - (_infoArray select 6));
		if(typeOf (vehicle player) in (_infoArray select 8))then {
			(vehicle player) setfuel ((fuel vehicle player) - 0.1);
			hint "Your chopper is losing fuel because the load is too heavy for it";
		};
	};
	sleep 10;
};

deleteVehicle _veh1;
deleteVehicle _veh2;

_payment = round(_distance*(_infoArray select 5));

if(DS_realMode)then {
	_payment = (_payment*1.5);
};
if((DS_infoArray select 13) > 34)then { _payment = (_payment*1.2) };

systemchat format ["Your cargo has been successfully delivered, return to any jobs depot for your payment of $%1",[_payment] call DS_fnc_numberText];
hint format ["Your cargo has been successfully delivered, return to any jobs depot for your payment of $%1",[_payment] call DS_fnc_numberText];

DS_civJobTask setTaskState "Succeeded";

while{true}do {
	if(player distance (getMarkerPos "jobs1_3") < 20)exitwith{};
	if(player distance (getMarkerPos "jobs1_2") < 20)exitwith{};
	if(player distance (getMarkerPos "jobs1") < 20)exitwith{};
	if(player distance (getMarkerPos "jobs1_1") < 20)exitwith{};
	if(player distance (getMarkerPos "jobs1_5") < 20)exitwith{};
	sleep 10;
};

systemchat format ["Your cargo mission is completed, $%1 has been deposited into your bank account",[_payment] call DS_fnc_numberText];
hint format ["Your cargo mission is completed, $%1 has been deposited into your bank account",[_payment] call DS_fnc_numberText];
[_payment,true,true] call DS_fnc_handleMoney;

[75,true] spawn DS_fnc_moralAlter;
_tempNum = (DS_infoArray select 26);
_tempNum = _tempNum + 1;
DS_infoArray set [26,_tempNum];

if((_curLevel > 16)&&((DS_infoArray select 13) == 49))then {
	[] spawn {
		sleep 10;
		[0] call DS_fnc_questCompleted;
	};
};

if((DS_infoArray select 26) > 3)then {
	if((DS_infoArray select 13) == 34)then {
		[] spawn {
			sleep 10;
			[0] call DS_fnc_questCompleted;
		};
	};
	if(_curLevel == 17)then {
		systemchat "You are on the Max level for this job, you can continue doing this job at this level for money";
		hint "You are on the Max level for this job, you can continue doing this job at this level for money";
	} else {
		DS_infoArray set [26,0];
		_tempNum = ((DS_infoArray select 25) + 1);
		DS_infoArray set [25,_tempNum];
		sleep 5;
		_payment = (25000*(DS_infoArray select 25));
		systemchat format ["You have been promoted to level %1 pilot, as a reward $%2 has been deposited into your bank",(DS_infoArray select 25),[_payment] call DS_fnc_numberText];
		hint format ["You have been promoted to level %1 pilot, as a reward $%2 has been deposited into your bank",(DS_infoArray select 25),[_payment] call DS_fnc_numberText];
		[_payment,true,true] call DS_fnc_handleMoney;
	};
};

sleep 5;
DS_truckDriver = false;
[2] spawn DS_civ_improve;
//[] call DS_fnc_compileData;

sleep 5;
if((DS_infoArray select 13) == 17)then {
	[0] call DS_fnc_questCompleted;
};