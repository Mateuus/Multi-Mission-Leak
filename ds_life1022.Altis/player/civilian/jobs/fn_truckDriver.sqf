/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Starts delivery missions (Formally known as truck driving)
*/

private ["_spawnPoint"];

_currentLevel = (DS_infoArray select 28);
_lastLocation = (position player);
_spawnPoints = DS_spawnPoint;

if(isNil "DS_truckDriver")then{DS_truckDriver = false;};
if(DS_truckDriver)exitwith {hint "You already have a mission started, if you have just finished one, wait 10 seconds before starting a new one"};

_deliveryArray  =
[
getMarkerPos "Gas1_1_1_2_1_1_1_1",getMarkerPos "hospital_3",getMarkerPos "boat_3",
getMarkerPos "Gen_3_1_1_2_1_1",getMarkerPos "Gas1_1_1_2_1_1_1_1_1",getMarkerPos "civ_gar_1_1_1_2_1_4",
getMarkerPos "airshop_5",getMarkerPos "hospital_2",getMarkerPos "Gas1_1_1_1",getMarkerPos "f_1",
getMarkerPos "Gas1_1_1_2_1_1",getMarkerPos "Gen_3_1_1_2_1",getMarkerPos "kavTruck_1_1",getMarkerPos "Gas1_1_1_2_1",
getMarkerPos "airshop",getMarkerPos "Gas1_1_1_2",getMarkerPos "boat_4",getMarkerPos "powerMarker",getMarkerPos "Gas1_1",
getMarkerPos "oilp_1_1",getMarkerPos "iron",getMarkerPos "1_3",getMarkerPos "copper",getMarkerPos "1_1",getMarkerPos "1_2",
getMarkerPos "Gas1",getMarkerPos "oilp_1_3_1_1",getMarkerPos "salt",getMarkerPos "Gas1_1_1",getMarkerPos "airshop_3",
getMarkerPos "oilp_1_3",getMarkerPos "Gas1_2",getMarkerPos "oilp_1_3_1_2",getMarkerPos "civ_gar_1_1_1_2_1_1",
getMarkerPos "hospital_third",getMarkerPos "oilp_1_2",getMarkerPos "Gas1_1_1_2_1_1_1",getMarkerPos "sand",
getMarkerPos "airshop_4",getMarkerPos "1_5",getMarkerPos "Gas1_3",getMarkerPos "dsfdsfsd",getMarkerPos "secSpawn1"
];

//(0) Title | (1) Min Distance | (2) Max Distance | (3) Vehicle | (4) Attachment and position array | (5) Pay Per KM
//(4) Attachment and position array [Class,left/right,back/forward,Up/down,dir]
_infoArray = [
["Tiny Load, Short Distance",100,3000,"B_Quadbike_01_F",[["Land_Bench_01_F",0,-0.8,-0.3,180],["Land_BucketNavy_F",0,0.6,-0.3,0],["Land_CampingChair_V1_folded_F",0,-0.9,-0.3,0],["Land_Ground_sheet_folded_khaki_F",0,0.7,-0.5,0],["Land_Tyre_F",0,0.7,-0.45,0],["Land_Basket_F",0,-0.8,-0.15,0],["Land_Sack_F",0,-0.8,0,0]],4000],
["Tiny Load, Medium Distance",2500,6000,"B_Quadbike_01_F",[["Land_Bench_01_F",0,-0.8,-0.3,180],["Land_BucketNavy_F",0,0.6,-0.3,0],["Land_CampingChair_V1_folded_F",0,-0.9,-0.3,0],["Land_Ground_sheet_folded_khaki_F",0,0.7,-0.5,0],["Land_Tyre_F",0,0.7,-0.45,0],["Land_Basket_F",0,-0.8,-0.15,0],["Land_Sack_F",0,-0.8,0,0]],4500],
["Small Load, Short Distance",300,3300,"C_Offroad_01_F",[["Land_Sink_F",0,-1.7,0,90],["Land_Calvary_02_V1_F",0,-1.7,0.7,0],["Land_CampingTable_small_F",0,-2,-0.2,90],["Land_CampingTable_F",0,-1.9,-0.2,90],["Land_FieldToilet_F",0,-1.9,0.4,0],["Land_Bricks_V4_F",0,-1.9,-0.6,0],["Land_Sacks_goods_F",0,-1.9,-0.1,0],["Land_Icebox_F",0,-1.9,-0.1,90],["Land_TableDesk_F",0,-1.9,0.1,90]],5000],
["Small Load, Medium Distance",2800,7000,"C_Offroad_01_F",[["Land_Sink_F",0,-1.7,0,90],["Land_Calvary_02_V1_F",0,-1.7,0.7,0],["Land_CampingTable_small_F",0,-2,-0.2,90],["Land_CampingTable_F",0,-1.9,-0.2,90],["Land_FieldToilet_F",0,-1.9,0.4,0],["Land_Bricks_V4_F",0,-1.9,-0.6,0],["Land_Sacks_goods_F",0,-1.9,-0.1,0],["Land_Icebox_F",0,-1.9,0.1,90],["Land_TableDesk_F",0,-1.9,0.1,90]],5500],
["Medium Load, Short Distance",500,4000,"C_Van_01_transport_F",[["Land_FuelStation_Feed_F",0,-1.9,0.1,0],["Land_PowerGenerator_F",0,-1.9,0.1,0],["Land_WaterTank_F",0,-1.9,0.2,90],["Land_Pallets_stack_F",0,-1.9,-0.2,0],["Land_CashDesk_F",0,-1.9,-0.7,90],["Land_CargoBox_V1_F",0,-1.9,0.2,0],["Land_Wreck_UAZ_F",-0.2,-2,0.3,0],["Land_spp_Mirror_ruins_F",-0.2,-2,1.3,180]],6000],
["Medium Load, Medium Distance",3500,7000,"C_Van_01_transport_F",[["Land_FuelStation_Feed_F",0,-1.9,0.1,0],["Land_PowerGenerator_F",0,-1.9,0.1,0],["Land_WaterTank_F",0,-1.9,0.2,90],["Land_Pallets_stack_F",0,-1.9,-0.2,0],["Land_CashDesk_F",0,-1.9,-0.7,90],["Land_CargoBox_V1_F",0,-1.9,0.2,0],["Land_Wreck_UAZ_F",-0.2,-2,0.3,0],["Land_spp_Mirror_ruins_F",-0.2,-2,1.3,180]],6500],
["Scrap Metal, Medium Distance",4000,10000,"I_Truck_02_transport_F",[["Land_Tank_rust_F",0,-1.5,1.1,90],["Land_ScrapHeap_2_F",0,-1.1,0.8,0],["Land_ScrapHeap_1_F",0.3,-0.8,0.2,0],["Land_Scrap_MRAP_01_F",0.3,-1.1,0.2,0],["Land_Wreck_Skodovka_F",0.3,-1.1,0.2,0],["Land_Wreck_Car2_F",-0.3,-0.6,0.2,0],["Land_Wreck_Hunter_F",-0.3,-0.6,1.5,0]],7000],
["Scrap Metal, Long Distance",8000,20000,"I_Truck_02_transport_F",[["Land_Tank_rust_F",0,-1.5,1.1,90],["Land_ScrapHeap_2_F",0,-1.1,0.8,0],["Land_ScrapHeap_1_F",0.3,-0.8,0.2,0],["Land_Scrap_MRAP_01_F",0.3,-1.1,0.2,0],["Land_Wreck_Skodovka_F",0.3,-1.1,0.2,0],["Land_Wreck_Car2_F",-0.3,-0.6,0.2,0],["Land_Wreck_Hunter_F",-0.3,-0.6,1.5,0]],7500],
["Chilled Goods, Medium Distance",4000,10000,"B_Truck_01_transport_F",[["Land_Cargo20_cyan_F",0,-1.8,1.1,90],["Land_Cargo20_orange_F",0,-1.8,1.1,90],["Land_Cargo20_white_F",0,-1.8,1.1,90],["Land_Cargo20_red_F",0,-1.8,1.1,90]],8000],
["Chilled Goods, Long Distance",8500,20000,"B_Truck_01_transport_F",[["Land_Cargo40_brick_red_F",0,-1.3,1.6,90],["Land_Cargo40_light_blue_F",0,-1.3,1.6,90],["Land_Cargo40_yellow_F",0,-1.3,1.6,90],["Land_Cargo40_sand_F",0,-1.3,1.6,90]],8500],
["Expensive Goods, Medium Distance",4000,10000,"O_Truck_03_transport_F",[["C_Boat_Civil_01_rescue_F",0,-1.9,1.5,0],["C_Offroad_stripped_F",0,-2.9,1.2,180],["C_Truck_02_covered_F",0.05,-1.6,2.1,180],["C_Hatchback_01_sport_white_F",0.05,-2.6,1.2,180],["SUV_01_base_black_F",0.05,-2.8,1.2,180],["C_Van_01_fuel_F",0.05,-3.3,1.2,180],["C_Scooter_Transport_01_F",0.05,-3.3,1.2,180]],9000],
["Expensive Goods, Long Distance",8500,20000,"O_Truck_03_transport_F",[["B_UAV_02_F",0.05,-3.3,1.2,180],["B_Heli_Light_01_stripped_F",0.05,-2.3,1.2,180],["B_UGV_01_F",0.5,-2.3,1.9,180],["B_T_UAV_03_F",0.1,-2.3,1.5,180],["B_CTRG_LSV_01_light_F",0.1,-2.3,1.9,180]],9500],
["Wide Load (Scrap), Medium Distance",4000,10000,"B_Truck_01_mover_F",[["Land_ScrapHeap_2_F",0,-7,3,0],["Land_ScrapHeap_1_F",0,-7,3,0],["Land_Wreck_Ural_F",0,-7,3.3,180],["Land_Wreck_Plane_Transport_01_F",0,-9,1.9,180],["Land_Wreck_Heli_Attack_02_F",0,-9,4.5,180],["Land_UWreck_Heli_Attack_02_F",0,-9,4.5,180],["Land_UWreck_MV22_F",0,-9,6.2,180],["Land_UWreck_FishingBoat_F",2,-6,4.2,180],["Plane_Fighter_03_wreck_F",1,-8,2.2,180]],10000],
["Wide Load (Scrap), Medium Distance",8500,20000,"B_Truck_01_mover_F",[["Land_ScrapHeap_2_F",0,-7,3,0],["Land_ScrapHeap_1_F",0,-7,3,0],["Land_Wreck_Ural_F",0,-7,3.3,180],["Land_Wreck_Plane_Transport_01_F",0,-9,1.9,180],["Land_Wreck_Heli_Attack_02_F",0,-9,4.5,180],["Land_UWreck_Heli_Attack_02_F",0,-9,4.5,180],["Land_UWreck_MV22_F",0,-9,6.2,180],["Land_UWreck_FishingBoat_F",2,-6,4.2,180],["Plane_Fighter_03_wreck_F",1,-8,2.2,180]],10500],
["Wide Load (Heavy), Medium Distance",4000,10000,"B_Truck_01_mover_F",[["Land_dp_smallTank_F",0.5,-7,8,0],["Land_cmp_Tower_F",0.5,-7,12,0],["Land_Airport_Tower_F",0.5,-7,12,0],["Land_Kiosk_gyros_F",0.5,-7,4,0],["Land_Factory_Conv1_End_F",0.5,-7,3,0],["Land_i_Addon_04_V1_F",-1,-7,5,90]],11000],
["Wide Load (Heavy), Long Distance",8500,20000,"B_Truck_01_mover_F",[["Land_dp_smallTank_F",0.5,-7,8,0],["Land_cmp_Tower_F",0.5,-7,12,0],["Land_Airport_Tower_F",0.5,-7,12,0],["Land_Kiosk_gyros_F",0.5,-7,4,0],["Land_Factory_Conv1_End_F",0.5,-7,3,0],["Land_i_Addon_04_V1_F",-1,-7,5,90]],11500],
["Wide Load (Expensive), Medium Distance",4000,10000,"B_Truck_01_mover_F",[["B_Plane_CAS_01_F",1,-8,4.2,0],["B_Heli_Transport_03_unarmed_green_F",1,-8,5.2,0],["B_T_VTOL_01_infantry_blue_F",0,-12,8.7,0],["O_Plane_CAS_02_F",0,-6,4.7,0],["O_T_VTOL_02_vehicle_ghex_F",0,-8,5.2,0]],12000],
["Wide Load (Expensive), Long Distance",8500,20000,"B_Truck_01_mover_F",[["B_Plane_CAS_01_F",1,-8,4.2,0],["B_Heli_Transport_03_unarmed_green_F",1,-8,5.2,0],["B_T_VTOL_01_infantry_blue_F",0,-12,8.7,0],["O_Plane_CAS_02_F",0,-6,4.7,0],["O_T_VTOL_02_vehicle_ghex_F",0,-8,5.2,0]],12500]
];

_missionInfoArray = _infoArray select _currentLevel;
_attachmentArray = selectRandom (_missionInfoArray select 4);
_startPrice = floor((_missionInfoArray select 5)/20);

_action = [
	format ["Warning! VDMing people or damaging stuff with your cargo will result in disciplinary action by the admins. You have to complete %1 more jobs to be promoted",(((DS_infoArray select 27)-4)*-1)],
	"Warning!",
	"Continue",
	"No Thanks"
] call BIS_fnc_guiMessage;
if(!_action)exitWith{};

_action = [
	format ["You are currently at level %1, this means you will be doing %2 deliveries with a starting price of $%3",_currentLevel,_missionInfoArray select 0,[_startPrice] call DS_fnc_numberText],
	"Level Information!",
	"Begin",
	"Exit"
] call BIS_fnc_guiMessage;
if(!_action)exitWith{};

sleep (random 1);
if(DS_truckDriver)exitwith{};

{
	if((isNil "_spawnPoint")&&(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],8]) == 0))then {
		_spawnPoint = _x;
	};
}forEach _spawnPoints;

if(isNil "_spawnPoint")exitwith{hint "There are vehicles blocking the spawn points, message police or mechanics to come and remove them"};
if([_startPrice,true] call DS_fnc_checkMoney)exitwith{hint "You do not have enough money in your bank to begin this mission"};

DS_truckDriver = true;
DS_currentTask1 = "Delivery Driver - Phase One";
DS_currentTask2 = "You must (In the provided vehicle) drive to your cargo delivery marker on the map and remain there until your load is delivered";
[_startPrice,true,false] call DS_fnc_handleMoney;

_vehicle = createVehicle [(_missionInfoArray select 3), getMarkerPos _spawnPoint, [], 0, "NONE"];
_vehicle setDir (markerDir _spawnPoint);
waitUntil {!isNil "_vehicle"};
_vehicle setVariable ["vehicle_owners",[[getPlayerUID player,"Jobs Depot"]],true];
_vehicle setVariable ["truckMission",true,true];
_vehicle lock 2;
clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
DS_keyRing pushBack _vehicle;
_vehicle setVariable ["boot_open",true,true];
[_vehicle,60] remoteExec ["HUNT_fnc_clearAfkMission",2];
_vehPos = (getPos _vehicle);

if((_currentLevel > 11)&&(_currentLevel < 18))then {
	_specAttach1 = "Land_Cargo40_white_F" createVehicle [0,0,0];_specAttach1 attachTo[_vehicle,[2.5,-7.7,0.8]];_specAttach1 setDir 90;
	_specAttach2 = "Land_Cargo40_white_F" createVehicle [0,0,0];_specAttach2 attachTo[_vehicle,[-2.5,-7.7,0.8]];_specAttach2 setDir 90;
	_specAttach3 = "Land_Cargo40_white_F" createVehicle [0,0,0];_specAttach3 attachTo[_vehicle,[0,-7.7,0.8]];_specAttach3 setDir 90;
	_specAttach4 = "B_UGV_01_F" createVehicle [0,0,0];_specAttach4 attachTo[_vehicle,[2.0,-10.7,0.2]];
	_specAttach5 = "B_UGV_01_F" createVehicle [0,0,0];_specAttach5 attachTo[_vehicle,[-2.5,-10.7,0.2]];
};

_attachment = createSimpleObject [(_attachmentArray select 0),[0,0,0]];
_attachment attachTo [_vehicle,[(_attachmentArray select 1),(_attachmentArray select 2),(_attachmentArray select 3)]];
_attachment setDir (_attachmentArray select 4);

{
	_x setVariable ["noChop",true,true];
} forEach attachedObjects _vehicle;

_dropPoint = selectRandom _deliveryArray;
while{((_dropPoint distance (position player) > (_missionInfoArray select 2))||(_dropPoint distance (position player) < (_missionInfoArray select 1)))}do {
	_dropPoint = selectRandom _deliveryArray;
};

_payment = ((player distance _dropPoint)/1000);
_payment = round(_payment*(_missionInfoArray select 5));

player removeSimpleTask DS_civJobTask;
DS_civJobTask = player createSimpleTask ["civJobTask"];
DS_civJobTask setSimpleTaskDescription ["Drive your cargo to the marked point and stay there until the cargo is unloaded. Once done return to a jobs depot for payment","Cargo Delivery","Drop Cargo Here"];
DS_civJobTask setSimpleTaskDestination _dropPoint;
DS_civJobTask setTaskState "Assigned";
player setCurrentTask DS_civJobTask;

systemchat "Your delivery point has been marked on your map, the speed in which you deliver will not affect your payment";
hint "Your delivery point has been marked on your map, the speed in which you deliver will not affect your payment";

[_vehicle,_vehPos,_attachment] spawn {
	sleep 10;
	if((_this select 0) distance (_this select 1) < 20)then {
		hint "Warning! If your vehicle remains too close to the spawn point it will delete in 50 seconds time";
	};
};

_counter = 0;
while{true}do {
	if(_counter > 3)exitwith{hint "Cargo delivered, return to a jobs depot for payment";player say3D "dingDong"};
	if(_vehicle distance _dropPoint < 20)then{hint "Remain here for 30 seconds while the cargo is unloaded";_counter = _counter + 1;};
	if((getPos (_vehicle) select 2) > 10)then{_vehicle setDamage 1;};
	if(!alive _vehicle)exitwith{};
	sleep 10;
};

{
	deleteVehicle _x;
}forEach attachedObjects _vehicle;

if(!alive _vehicle)exitwith {
	player say3D "fail";
	hint "Mission failed because the work vehicle was destroyed";
	deleteVehicle _vehicle;
	_tempNum = (DS_infoArray select 27);
	if(_tempNum > 0)then{_tempNum = _tempNum - 1;};
	DS_infoArray set [27,_tempNum];
	//[] call DS_fnc_compileData;
	DS_currentTask1 = "";
	DS_truckDriver = false;
	DS_civJobTask setTaskState "Failed";
};

DS_civJobTask setTaskState "Succeeded";

while{true}do {
	if(_vehicle distance (getMarkerPos "jobs1_3") < 20)exitwith{;};
	if(_vehicle distance (getMarkerPos "jobs1_2") < 20)exitwith{};
	if(_vehicle distance (getMarkerPos "jobs1") < 20)exitwith{};
	if(_vehicle distance (getMarkerPos "jobs1_1") < 20)exitwith{};
	if(_vehicle distance (getMarkerPos "jobs1_5") < 20)exitwith{};
	if(!alive _vehicle)exitwith{};
	sleep 10;
};

if(!alive _vehicle)exitwith {
	player say3D "fail";
	hint "Mission failed because the work vehicle was destroyed";
	deleteVehicle _vehicle;
	_tempNum = (DS_infoArray select 27);
	if(_tempNum > 0)then{_tempNum = _tempNum - 1;};
	DS_infoArray set [27,_tempNum];
	//[] call DS_fnc_compileData;
	DS_currentTask1 = "";
	DS_truckDriver = false;
};
if(DS_realMode)then {_payment = (_payment*1.5);};
if((DS_infoArray select 13) > 23)then {_payment = (_payment*1.2);};
[100,true] spawn DS_fnc_moralAlter;
player say3D "success";
[_payment,true,true] call DS_fnc_handleMoney;
hint format ["Congratulation, you have finished your delivery and been paid $%1 - Your vehicle will delete shortly",[_payment] call DS_fnc_numberText];
systemChat format ["Congratulation, you have finished your delivery and been paid $%1 - Your vehicle will delete shortly",[_payment] call DS_fnc_numberText];
sleep 10;
deleteVehicle _vehicle;
DS_truckDriver = false;

_tempNum = (DS_infoArray select 27) + 1;
DS_infoArray set [27,_tempNum];

if((DS_infoArray select 13) == 1)then {
	[] spawn {
		sleep 10;
		[0] call DS_fnc_questCompleted;
	};
};

if(((DS_infoArray select 13) == 38)&&(_currentLevel > 11))then {
	[] spawn {
		sleep 10;
		[0] call DS_fnc_questCompleted;
	};
};

if(((DS_infoArray select 13) == 48)&&(_currentLevel > 13))then {
	[] spawn {
		sleep 10;
		[0] call DS_fnc_questCompleted;
	};
};

_tempNum = (DS_infoArray select 28) + 1;
if(_tempNum > 17)exitWith {
	[1] spawn DS_civ_improve;
	if((DS_infoArray select 13) == 23)then {
		[] spawn {
			sleep 10;
			[0] call DS_fnc_questCompleted;
		};
	};
};

_tempNum = (DS_infoArray select 27);
if(_tempNum > 3)then {
	player say3D "success";
	_tempNum = (DS_infoArray select 28) + 1;
	DS_infoArray set [28,_tempNum];
	hint format ["You have been promoted to a level %1, you have also received a bonus of $%2 for all of your hard work",(DS_infoArray select 28),[((DS_infoArray select 28)*18000)] call DS_fnc_numberText];
	systemchat format ["You have been promoted to a level %1, you have also received a bonus of $%2 for all of your hard work",(DS_infoArray select 28),[((DS_infoArray select 28)*18000)] call DS_fnc_numberText];
	DS_infoArray set [27,0];
	_tempNum = ((DS_infoArray select 28)*18000);
	[_tempNum,true,true] call DS_fnc_handleMoney;
	if((DS_infoArray select 13) == 23)then {
		[] spawn {
			sleep 10;
			[0] call DS_fnc_questCompleted;
		};
	};
};

//[] call DS_fnc_compileData;
[1] spawn DS_civ_improve;
[50,true] spawn DS_fnc_moralAlter;