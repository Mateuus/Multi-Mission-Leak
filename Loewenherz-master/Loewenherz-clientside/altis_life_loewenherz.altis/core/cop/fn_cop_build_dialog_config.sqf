/*
Filename: fn_cop_build_dialog_config.sqf

Author: Barney

Description: No Description for u!

	You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/

private ["_select","_return"];
_select = param[0,"",[""]];
if(_select =="") exitWith {};
switch(_select) do {
case "Verteidigung": {
	_return = [
		"Land_BagBunker_Large_F",
		"Land_BagBunker_Small_F",
		"Land_BagBunker_Tower_F",
		"Land_Cargo_Patrol_V1_F",
		"Land_HBarrierTower_F"
	];
};

case "Gebaeude": {
	_return = [
		"Land_Cargo_HQ_V1_F",
		"Land_Cargo_House_V1_F"
	];
};

case "Netze": {
	_return = [
		"CamoNet_BLUFOR_F",
		"CamoNet_OPFOR_F",
		"CamoNet_INDP_F",
		"CamoNet_BLUFOR_open_F",
		"CamoNet_OPFOR_open_F",
		"CamoNet_INDP_open_F",
		"CamoNet_BLUFOR_big_F",
		"CamoNet_OPFOR_big_F",
		"CamoNet_INDP_big_F"
	];
};


case "Mauern": {
	_return = [
		"Land_BagFence_Corner_F",
		"Land_BagFence_End_F",
		"Land_BagFence_Long_F",
		"Land_BagFence_Round_F",
		"Land_BagFence_Short_F",
		"Land_HBarrier_1_F",
		"Land_HBarrier_3_F",
		"Land_HBarrier_5_F",
		"Land_HBarrierBig_F",
		"Land_HBarrier_Big_F",
		"Land_HBarrierWall_corner_F",
		"Land_HBarrierWall4_F",
		"Land_HBarrierWall6_F",
		"Land_CncBarrier_F",
		"Land_CncBarrier_stripes_F",
		"Land_CncBarrierMedium_F",
		"Land_CncBarrierMedium4_F",
		"Land_CncWall1_F",
		"Land_CncWall4_F",
		"Land_Concrete_SmallWall_4m_F",
		"Land_Concrete_SmallWall_8m_F",
		"Land_Mil_ConcreteWall_F",
		"Land_Mil_WallBig_4m_F",
		"Land_Mil_WallBig_Corner_F",
		"Land_Mil_WiredFence_F",
		"Land_Net_Fence_4m_F",
		"Land_Net_Fence_8m_F",
		"Land_Pipe_fence_4m_F",
		"Land_Pipe_fence_4mNoLC_F",
		"Land_PipeWall_concretel_8m_F"
	];
};


case "Lampen": {
	_return = [
		"Land_LampAirport_F",
		"Land_LampDecor_F",
		"Land_LampHalogen_F",
		"Land_LampHarbour_F",
		"Land_LampShabby_F",
		"Land_LampSolar_F",
		"Land_LampStreet_F",
		"Land_LampStreet_small_F"
		//"Land_PortableLight_single_F",
		//"Land_PortableLight_double_F"
	];
};


};


_return;