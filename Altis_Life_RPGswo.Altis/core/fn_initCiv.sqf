#include "..\macros.hpp"
/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the civilian.
*/
private["_spawnPos","_houses","_dist","_delh"];

_houses = switch (worldName) do
{
	case "Altis": {["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"]};
	case "Tanoa": {["Land_Shed_05_F","Land_House_Small_06_F","Land_House_Big_01_F","Land_Shed_02_F","Land_House_Small_05_F","Land_PierWooden_01_10m_noRails_F","Land_PierWooden_01_16m_F","Land_PierWooden_01_dock_F","Land_PierWooden_01_platform_F","Land_PierWooden_01_hut_F","Land_i_Shed_Ind_F","Land_House_Small_01_F","Land_Slum_01_F","Land_House_Small_04_F","Land_House_Native_02_F","Land_House_Big_02_F","Land_Hotel_02_F","Land_House_Small_03_F","Land_House_Small_02_F","Land_Flush_Light_red_F","Land_NavigLight_3_short_F","Land_Flush_Light_green_F","Land_runway_edgelight","Land_Flush_Light_yellow_F","Land_runway_edgelight_blue_F","Land_Slum_02_F","Land_SY_01_conveyor_end_F","Land_dp_smallTank_F","Land_Warehouse_02_ladder_F","Land_Slum_03_F","Land_Warehouse_02_F","Land_SY_01_shiploader_F","Land_SY_01_shiploader_arm_F","Land_GuardHouse_01_F","Land_House_Big_04_F","Land_Airport_01_hangar_F","Land_Shed_03_F","Land_u_Shed_Ind_F","Land_School_01_F","Land_ContainerCrane_01_F","Land_WarehouseShelter_01_F","Land_GantryCrane_01_F","Land_Warehouse_01_ladder_F","Land_Warehouse_01_F","Land_ContainerLine_02_F","Land_ContainerLine_01_F","Land_SM_01_shelter_narrow_F","Land_ContainerLine_03_F","Land_SM_01_shed_F","Land_Airport_01_controlTower_F","Land_GarageShelter_01_F","Land_Warehouse_03_F","Land_Shop_Town_01_F","Land_Shop_Town_05_F","Land_Airport_02_terminal_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_workshop_F","Land_FuelStation_01_shop_F","Land_FuelStation_01_workshop_F","Land_DPP_01_mainFactory_F","Land_StorageTank_01_small_F","Land_Walkover_01_F","Land_SY_01_reclaimer_F","Land_StorageTank_01_large_F","Land_DryDock_01_end_F","Land_Crane_F","Land_DryDock_01_middle_F","Land_House_Native_01_F","Land_SY_01_crusher_F","Land_Temple_Native_01_F","Land_PierWooden_01_ladder_F","Land_WindmillPump_01_F","Land_FuelStation_02_pump_F","Land_TTowerBig_2_F","Land_TBox_F","Land_Mausoleum_01_F","Land_MobileCrane_01_hook_F","Land_TTowerSmall_2_F","Land_Radar_Small_F","Land_Shop_City_07_F","Land_Shop_Town_03_F","Land_DPP_01_smallFactory_F","Land_MobileCrane_01_F","Land_SCF_01_storageBin_small_F","Land_TTowerBig_1_F","Land_TTowerSmall_1_F","Land_SCF_01_storageBin_medium_F","Land_Supermarket_01_F","Land_House_Big_03_F","Land_Shop_City_06_F","Land_FireEscape_01_short_F","Land_FireEscape_01_tall_F","Land_Shop_City_02_F","Land_Shop_City_01_F","Land_Church_01_F","Land_SM_01_shed_unfinished_F","Land_Hotel_01_F","Land_Offices_01_V1_F","Land_Barracks_01_grey_F","Land_Radar_F","Land_SM_01_shelter_wide_F","Land_Addon_04_F","Land_SM_01_reservoirTower_F","Land_SCF_01_warehouse_F","Land_FuelStation_02_roof_F","Land_PierWooden_02_16m_F","Land_PierWooden_02_ladder_F","Land_Church_02_F","Land_BasaltWall_01_gate_F","Land_SCF_01_heap_bagasse_F","Land_SCF_01_storageBin_big_F","Land_SCF_01_crystallizerTowers_F","Land_SCF_01_condenser_F","Land_SCF_01_clarifier_F","Land_SCF_01_crystallizer_F","Land_SCF_01_chimney_F","Land_SCF_01_generalBuilding_F","Land_SCF_01_boilerBuilding_F","Land_SCF_01_feeder_F","Land_SCF_01_washer_F","Land_SCF_01_diffuser_F","Land_Track_01_bridge_F","Land_PierWooden_02_hut_F","Land_DPP_01_waterCooler_F","Land_DPP_01_waterCooler_ladder_F","Land_PierWooden_02_30deg_F","Land_dp_bigTank_F","Land_MilOffices_V1_F","Land_Cathedral_01_F","Land_PierWooden_02_barrel_F","Land_NavigLight_3_F","Land_Airport_02_controlTower_F","Land_Airport_02_hangar_left_F","Land_Airport_02_hangar_right_F","Land_ReservoirTower_F","Land_Barracks_01_camo_F","Land_Communication_anchor_F","Land_Communication_F","Land_Obstacle_Climb_F","Land_Airport_01_terminal_F","Land_Hangar_F","Land_Church_03_F","Land_LandMark_F"]};
};

_dist = switch (worldName) do
{
	case "Altis": {250};
	case "Tanoa": {200};
};

civ_spawn_1 = [];
civ_spawn_2 = [];
civ_spawn_3 = [];
civ_spawn_4 = [];
civ_spawn_5 = [];
civ_spawn_6 = [];

_tempdist = _dist;
while {(count civ_spawn_1) < 5} do
{
	civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", _houses, _tempdist];

	_tempdist = _tempdist + 50;
};

// Entfernen des Spawnpunktes für Civilisten im Polizei HQ Kavalla
_delh = [3308.3,12969.5,-0.162053] nearestObject 1119471;
if (_delh in civ_spawn_1) then
{
	_idc = [_delh,civ_spawn_1] call DWF_fnc_index;
	civ_spawn_1 deleteAt _idc;
};


_tempdist = _dist;
while {(count civ_spawn_2) < 5} do
{
	civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", _houses, _tempdist];
	_tempdist = _tempdist + 50;
};

_tempdist = _dist;
while {(count civ_spawn_3) < 5} do
{
	civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", _houses, _tempdist];
	_tempdist = _tempdist + 50;
};

_tempdist = _dist;
while {(count civ_spawn_4) < 5} do
{
	civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", _houses, _tempdist];
	_tempdist = _tempdist + 50;
};

_tempdist = _dist;
while {(count civ_spawn_5) < 5} do
{
	civ_spawn_5 = nearestObjects[getMarkerPos  "civ_spawn_5", _houses, _tempdist];
	_tempdist = _tempdist + 50;
};

_tempdist = _dist;
while {(count civ_spawn_6) < 5} do
{
	civ_spawn_6 = nearestObjects[getMarkerPos  "civ_spawn_6", _houses, _tempdist];
	_tempdist = _tempdist + 50;
};

waitUntil {sleep 0.1; !(isNull (findDisplay 46))};

if(DWEV_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if (DWEV_check_coplevel > 0 && !(__GETC__(DWEV_adminlevel) > 0)) then //Ab E
{
	if(DWEV_check_coplevel < 3) then // Civ Sperre für Cop Level 1 und 2
	{
		["FreshCop",false,true] call BIS_fnc_endMission;
	}
	else
	{
		if ((round (({side _x == civilian} count playableUnits) / 6 )) > ({side _x == west} count playableUnits) && ((count playableUnits) >= 25)) then
		{
			["lessCops",false,true] call BIS_fnc_endMission;
		};

		if (serverTime < (5 * 60)) then
		{
			["noBalance",false,true] call BIS_fnc_endMission;
		};
	};
};

if (DWEV_check_mediclevel > 0 && !(__GETC__(DWEV_adminlevel) > 0)) then //Ab E
{
		if ((round (({side _x == civilian} count playableUnits) / 20 )) > ({side _x == independent} count playableUnits) && ((count playableUnits) >= 20)) then
		{
			["lessMedics",false,true] call BIS_fnc_endMission;
		};
};


if(DWEV_is_arrested) then
{
	DWEV_is_arrested = false;
	[player,true] spawn DWEV_fnc_jail;
}
else
{
	if (!isNil "DWEV_var_traveler") then // Kein spawnmenü für reisende
	{
		DWEV_var_traveler = nil;
		[] call DWEV_fnc_travelSpawn;
	}
	else
	{
		[] call DWEV_fnc_spawnMenu;

		waitUntil{sleep 0.1; !isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
		waitUntil{sleep 0.1; isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	};
};


[] execVM "core\session\fn_updateVars.sqf";
[] spawn DWEV_fnc_SideChannelWarn;

player addRating 9999999;
