#include <macro.h>
/*
	File: fn_getDPMission.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Selects a random DP point for a delivery mission.
	Needs to be revised.
*/
private["_dp","_target","_obj","_objArray","_objArrays","_objects","_point","_time"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(str(_target) in LIFE_SETTINGS(getArray,"delivery_points")) then {
	private "_point";
	_point = LIFE_SETTINGS(getArray,"delivery_points");
	_point deleteAt (_point find (str(_target)));
	_dp = _point call BIS_fnc_selectRandom;
} else {
	_dp = LIFE_SETTINGS(getArray,"delivery_points") call BIS_fnc_selectRandom;
};

life_dp_start = _target;

_time = time + 500;
if(vehicle player == player) then {
	["Bitte steige in dein Fahrzeug", -1, 0.42, 5, 0, 0, 11126] spawn BIS_fnc_dynamicText;
	waitUntil{time > _time || vehicle player != player};
};

if (time > _time) exitWith {hint "Mission abgebrochen! Wolltest du zum Ziel laufen?";};

if((typeOf (vehicle player) in ["I_Truck_02_transport_F","I_Truck_02_covered_F","O_Truck_03_transport_F","O_Truck_03_covered_F","B_Truck_01_transport_F","B_Truck_01_covered_F"]) && (vehicle player getVariable["dp_objects",[]] isEqualTo [])) then {
	_objArrays = switch (typeOf (vehicle player)) do {
		case "I_Truck_02_transport_F": {
			[
			[["Land_ToiletBox_F",[0.05,-0.2,0.4]],["Land_ToiletBox_F",[0.05,-1.9,0.4]],["Land_WaterBarrel_F",[0.05,-2.8,-0.2]]],
			[["Land_WaterTank_F",[0,-0.6,-0.05],90],["Land_WaterBarrel_F",[0.05,-2.8,-0.2]]],
			[["Land_Bricks_V1_F",[0.05,0.3,-0.8]],["Land_Bricks_V1_F",[0.05,-0.9,-0.8]],["Land_Bricks_V3_F",[0.05,-2.1,-0.8]]],
			[["Land_CinderBlocks_F",[0.05,0.3,-0.8]],["Land_CinderBlocks_F",[0.05,-0.9,-0.8]],["Land_CinderBlocks_F",[0.05,-2.1,-0.8]]],
			[["Land_Pipes_small_F",[0.3,-1,-0.8],90],["Land_Pipes_small_F",[-0.2,-1,-0.8],90],["Land_Pipes_small_F",[0.05,-1,-0.3],90,[0,0,-1]],["Land_Pipes_small_F",[0.05,-1,-0.3],90]],
			[["Land_Pipes_large_F",[0.65,-1.25,-0.8],-90],["Land_Pipes_large_F",[-0.4,-1.25,-0.8],-90],["Land_Pipes_large_F",[0.05,-1.25,-0.023],-90,[0,0,-1]],["Land_Pipes_large_F",[0.05,-1.25,-0.035],-90]],
			[["CargoNet_01_barrels_F",[0.05,0.3,-0.25]],["CargoNet_01_barrels_F",[0.05,-1.2,-0.25]],["CargoNet_01_barrels_F",[0.05,-2.7,-0.25]]],
			[["Land_Sacks_goods_F",[0.05,0,-0.3]],["Land_Sacks_goods_F",[0.05,-1.3,-0.3],180],["Land_Sacks_goods_F",[0.05,-2.6,-0.3]]],
			[["Land_PaperBox_closed_F",[0.05,0.3,-0.25]],["Land_PaperBox_closed_F",[0.05,-1.2,-0.25],90],["Land_PaperBox_open_full_F",[0.05,-2.7,-0.25]]]
			];
		};
		case "I_Truck_02_covered_F": {
			[
			[["Land_WaterTank_F",[0,-0.6,-0.05],90],["Land_WaterBarrel_F",[0.05,-2.8,-0.2]]],
			[["Land_Bricks_V1_F",[0.05,0.3,-0.8]],["Land_Bricks_V1_F",[0.05,-0.9,-0.8]],["Land_Bricks_V3_F",[0.05,-2.1,-0.8]]],
			[["Land_Pipes_small_F",[0.3,-1,-0.8],90],["Land_Pipes_small_F",[-0.2,-1,-0.8],90],["Land_Pipes_small_F",[0.05,-1,-0.3],90,[0,0,-1]],["Land_Pipes_small_F",[0.05,-1,-0.3],90]],
			[["Land_Pipes_large_F",[0.65,-1.25,-0.8],-90],["Land_Pipes_large_F",[-0.4,-1.25,-0.8],-90],["Land_Pipes_large_F",[0.05,-1.25,-0.023],-90,[0,0,-1]],["Land_Pipes_large_F",[0.05,-1.25,-0.035],-90]],
			[["CargoNet_01_barrels_F",[0.05,0.3,-0.25]],["CargoNet_01_barrels_F",[0.05,-1.2,-0.25]],["CargoNet_01_barrels_F",[0.05,-2.7,-0.25]]],
			[["Land_Sacks_goods_F",[0.05,0,-0.3]],["Land_Sacks_goods_F",[0.05,-1.3,-0.3],180],["Land_Sacks_goods_F",[0.05,-2.6,-0.3]]],
			[["Land_PaperBox_closed_F",[0.05,0.3,-0.25]],["Land_PaperBox_closed_F",[0.05,-1.2,-0.25],90],["Land_PaperBox_open_full_F",[0.05,-2.7,-0.25]]]
			];
		};
		case "O_Truck_03_transport_F": {
			[
			[["Land_ToiletBox_F",[0.05,-1.5,0.7]],["Land_ToiletBox_F",[0.05,-2.9,0.7]],["Land_WaterBarrel_F",[0.05,-3.9,0.1]]],
			[["Land_WaterTank_F",[0.05,-1.6,-0.05],90],["Land_WaterBarrel_F",[0.05,-3.8,-0.2]]],
			[["Land_Bricks_V1_F",[0.05,-0.7,-0.5]],["Land_Bricks_V1_F",[0.05,-1.9,-0.5]],["Land_Bricks_V3_F",[0.05,-3.1,-0.5]],["Land_Bricks_V4_F",[0.05,-4.3,-0.5]]],
			[["Land_CinderBlocks_F",[0.05,-0.7,-0.5]],["Land_CinderBlocks_F",[0.05,-1.9,-0.5]],["Land_CinderBlocks_F",[0.05,-3.1,-0.5]],["Land_CinderBlocks_F",[0.05,-4.3,-0.5]]],
			[["Land_Pipes_large_F",[0.65,-2.4,-0.5],-90],["Land_Pipes_large_F",[-0.4,-2.4,-0.5],-90],["Land_Pipes_large_F",[0.05,-2.4,-0.023+0.3],-90,[0,0,-1]],["Land_Pipes_large_F",[0.05,-2.4,-0.035+0.3],-90]],
			[["CargoNet_01_barrels_F",[0.05,-0.9,0.5]],["CargoNet_01_barrels_F",[0.05,-2.4,0.5]],["CargoNet_01_barrels_F",[0.05,-3.9,0.5]]],
			[["Land_Sacks_goods_F",[0.05,-1.2,0]],["Land_Sacks_goods_F",[0.05,-2.5,0],180],["Land_Sacks_goods_F",[0.05,-3.8,0]]],
			[["Land_PaperBox_closed_F",[0.05,-0.9,0.1]],["Land_PaperBox_closed_F",[0.05,-2.4,0.1],90],["Land_PaperBox_open_full_F",[0.05,-3.9,0.1]]]
			];
		};
		case "O_Truck_03_covered_F": {
			[
			[["Land_WaterTank_F",[0.05,-1.6,-0.05],90],["Land_WaterBarrel_F",[0.05,-3.8,-0.2]]],
			[["Land_Bricks_V1_F",[0.05,-0.7,-0.5]],["Land_Bricks_V1_F",[0.05,-1.9,-0.5]],["Land_Bricks_V3_F",[0.05,-3.1,-0.5]],["Land_Bricks_V4_F",[0.05,-4.3,-0.5]]],
			[["Land_Pipes_large_F",[0.65,-2.4,-0.5],-90],["Land_Pipes_large_F",[-0.4,-2.4,-0.5],-90],["Land_Pipes_large_F",[0.05,-2.4,-0.023+0.3],-90,[0,0,-1]],["Land_Pipes_large_F",[0.05,-2.4,-0.035+0.3],-90]],
			[["CargoNet_01_barrels_F",[0.05,-0.9,0.5]],["CargoNet_01_barrels_F",[0.05,-2.4,0.5]],["CargoNet_01_barrels_F",[0.05,-3.9,0.5]]],
			[["Land_Sacks_goods_F",[0.05,-1.2,0]],["Land_Sacks_goods_F",[0.05,-2.5,0],180],["Land_Sacks_goods_F",[0.05,-3.8,0]]],
			[["Land_PaperBox_closed_F",[0.05,-0.9,0.1]],["Land_PaperBox_closed_F",[0.05,-2.4,0.1],90],["Land_PaperBox_open_full_F",[0.05,-3.9,0.1]]]
			];
		};
		case "B_Truck_01_transport_F": {
			[
			[["Land_ToiletBox_F",[0.05,-0.5,0.4]],["Land_ToiletBox_F",[0.05,-0.9,0.4],180],["Land_ToiletBox_F",[0.05,-3.3,0.4]],["Land_WaterBarrel_F",[0.05,-4.2,-0.2]]],
			[["Land_WaterTank_F",[0.05,-0.8,0.2],90],["Land_WaterTank_F",[0.05,-3.5,0.2],90]],
			[["Land_Bricks_V1_F",[0.05,-0.2,-0.5]],["Land_Bricks_V1_F",[0.05,-1.5,-0.5]],["Land_Bricks_V3_F",[0.05,-2.9,-0.5]],["Land_Bricks_V2_F",[0.05,-4.31,-0.5]]],
			[["Land_CinderBlocks_F",[0.05,-0.2,-0.5]],["Land_CinderBlocks_F",[0.05,-1.5,-0.5]],["Land_CinderBlocks_F",[0.05,-2.9,-0.5]],["Land_CinderBlocks_F",[0.05,-4.31,-0.5]]],
			[["Land_IronPipes_F",[0,-1.87,0.2],-90]],
			[["Land_Pipes_large_F",[0.65,-2.4,-0.5],-90],["Land_Pipes_large_F",[-0.4,-2.4,-0.5],-90],["Land_Pipes_large_F",[0.05,-2.4,-0.023+0.3],-90,[0,0,-1]],["Land_Pipes_large_F",[0.05,-2.4,-0.035+0.3],-90]],
			[["CargoNet_01_barrels_F",[0.05,-0.9,-0.05]],["CargoNet_01_barrels_F",[0.05,-2.4,-0.05]],["CargoNet_01_barrels_F",[0.05,-3.9,-0.05]]],
			[["Land_Wreck_Truck_F",[0.085,-2.2,0.6]]],
			[["Land_CratesPlastic_F",[0.05,-0,-0.3]],["Land_Sacks_goods_F",[0.05,-1.4,-0.1]],["Land_Sacks_goods_F",[0.05,-2.7,-0.1],180],["Land_Sacks_goods_F",[0.05,-4,-0.1]]],
			[["Land_PaperBox_closed_F",[0.05,-0.5,-0.05]],["Land_PaperBox_closed_F",[0.05,-2,-0.05],90],["Land_PaperBox_open_full_F",[0.05,-3.5,-0.05]]]
			];
		};
		case "B_Truck_01_covered_F": {
			[
			[["Land_WaterTank_F",[0.05,-0.8,0.2],90],["Land_WaterTank_F",[0.05,-3.5,0.2],90]],
			[["Land_Bricks_V1_F",[0.05,-0.2,-0.5]],["Land_Bricks_V1_F",[0.05,-1.5,-0.5]],["Land_Bricks_V3_F",[0.05,-2.9,-0.5]],["Land_Bricks_V2_F",[0.05,-4.31,-0.5]]],
			[["Land_IronPipes_F",[0,-1.87,0.2],-90]],
			[["Land_Pipes_large_F",[0.65,-2.4,-0.5],-90],["Land_Pipes_large_F",[-0.4,-2.4,-0.5],-90],["Land_Pipes_large_F",[0.05,-2.4,-0.023+0.3],-90,[0,0,-1]],["Land_Pipes_large_F",[0.05,-2.4,-0.035+0.3],-90]],
			[["CargoNet_01_barrels_F",[0.05,-0.9,-0.05]],["CargoNet_01_barrels_F",[0.05,-2.4,-0.05]],["CargoNet_01_barrels_F",[0.05,-3.9,-0.05]]],
			[["Land_CratesPlastic_F",[0.05,-0,-0.3]],["Land_Sacks_goods_F",[0.05,-1.4,-0.1]],["Land_Sacks_goods_F",[0.05,-2.7,-0.1],180],["Land_Sacks_goods_F",[0.05,-4,-0.1]]],
			[["Land_PaperBox_closed_F",[0.05,-0.5,-0.05]],["Land_PaperBox_closed_F",[0.05,-2,-0.05],90],["Land_PaperBox_open_full_F",[0.05,-3.5,-0.05]]]
			];
		};
	};
	
	_objArray = _objArrays call BIS_fnc_selectRandom;
	PG_dpTruck = vehicle player;
	_objects = [];
	{_obj = (_x select 0) createVehicle position player; _obj attachTo[PG_dpTruck,_x select 1];if(count _x > 2) then {_obj setDir (_x select 2)}; if(count _x > 3) then {_obj setVectorUp (_x select 3)};  _objects pushback _obj;} forEach _objArray;
	PG_dpTruck setVariable["dp_objects",_objects,true];
} else {
	["Tipp: Es gibt mehr Geld, wenn du mit einem (offnen oder abgedeckten) LKW fährst ;)", -1, 0.42, 5, 0, 0, 11126] spawn BIS_fnc_dynamicText; 
};

life_delivery_in_progress = true;
life_dp_point = call compile format["%1",_dp];

_dp = [_dp,"_"," "] call KRON_Replace;
life_cur_task = player createSimpleTask [format["Delivery_%1",life_dp_point]];
life_cur_task setSimpleTaskDescription [format[localize "STR_NOTF_DPStart",toUpper _dp],"Delivery Job",""];
life_cur_task setTaskState "Assigned";
player setCurrentTask life_cur_task;

["DeliveryAssigned",[format[localize "STR_NOTF_DPTask",toUpper _dp]]] call bis_fnc_showNotification;

[] spawn {
	waitUntil {sleep 1; !life_delivery_in_progress OR !alive player};
	if(!alive player) then {
		life_cur_task setTaskState "Failed";
		player removeSimpleTask life_cur_task;
		["DeliveryFailed",[localize "STR_NOTF_DPFailed"]] call BIS_fnc_showNotification;
		life_delivery_in_progress = false;
		life_dp_point = nil;
	};
	if(!isNull PG_dpTruck) then {{deleteVehicle _x} forEach (PG_dpTruck getVariable["dp_objects",[]]); PG_dpTruck setVariable["dp_objects",[],true]};
};