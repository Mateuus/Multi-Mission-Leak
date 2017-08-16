#include "..\..\script_macros.hpp"
/*
	File: fn_craftCfg.sqf
	Author: EdgeKiller

	Description:
	Master configuration file for the crafting menu.

*/
private["_craft","_return","_flag","_data"];
_craft = [_this,0,"",[""]] call BIS_fnc_param;
if(_craft == "") exitWith {closeDialog 0}; //Bad shop type passed.
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};
switch(_craft) do
{
	case "weapon":
	{
		_return = 	[
			//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],[proftype,level required]] //NEW SETUP BY FREZ
						["hgun_ACPC2_F", ["barrel",1,"trigger",1,"butt",1],["pGunsmith",1]],
						["hgun_Pistol_heavy_01_F", ["barrel",1,"trigger",1,"butt",1],["pGunsmith",1]],
						["arifle_SDAR_F", ["barrel",2,"trigger",2,"butt",2],["pGunsmith",2]],
						["arifle_TRG21_F", ["barrel",2,"trigger",2,"butt",2],["pGunsmith",3]],
						["srifle_GM6_F", ["barrel",3,"trigger",4,"butt",3,"sight",4],["pGunsmith",7]],
						["srifle_GM6_camo_F", ["barrel",5,"trigger",5,"butt",5,"sight",5],["pGunsmith",7]],
						["srifle_LRR_F", ["barrel",2,"trigger",3,"butt",2,"sight",3],["pGunsmith",4]],
						["srifle_LRR_camo_F", ["barrel",4,"trigger",4,"butt",4,"sight",4],["pGunsmith",5]],
						["srifle_DMR_04_F", ["barrel",5,"trigger",5,"butt",5,"sight",5],["pGunsmith",6]],
						["MMG_01_hex_F", ["barrel",3,"trigger",4,"butt",3,"sight",4],["pGunsmith",8]],
						["MMG_02_camo_F", ["barrel",5,"trigger",5,"butt",4,"sight",4],["pGunsmith",8]]
					];
			
	};

	case "uniform":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
				["U_O_Wetsuit", ["Fabric",4],["metal",1]],
				["U_O_CombatUniform_oucamo", ["leadp",5,"Fabric",4],["metal",2]],
				["U_O_FullGhillie_ard", ["ironRefined",15,"leadp",5,"Fabric",4],["metal",3]],
				["U_O_FullGhillie_sard", ["ironRefined",15,"leadp",5,"Fabric",4],["metal",3]],
				["U_O_FullGhillie_lsh", ["ironRefined",15,"leadp",5,"Fabric",4],["metal",3]]
				
			];
	};

	case "backpack":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
				["B_Carryall_oli", ["fabric",10,"ironRefined",3],["metal",1]],
				["B_Carryall_khk", ["fabric",10,"ironRefined",3],["metal",2]]

			];
	};
	
	case "vest":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
				["V_PlateCarrierH_CTRG", ["Fabric",4,"leadp",10,"ironRefined",5,"aluminium_r",5],["metal",1]],
				["V_PlateCarrierGL_mtp", ["Fabric",4,"leadp",10,"ironRefined",5,"aluminium_r",5],["metal",2]],
				["V_PlateCarrierGL_blk", ["Fabric",4,"leadp",10,"ironRefined",5,"aluminium_r",5],["metal",3]],
				["V_PlateCarrierSpec_rgr", ["Fabric",4,"leadp",10,"ironRefined",5,"aluminium_r",5],["metal",4]]
				
			];
	};
	
	case "misc":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
				["Binocular", ["aluminium_r",3,"diamond_cut",2],["metal",1]],
				["ToolKit", ["aluminium_r",3,"ironRefined",2],["metal",1]],
				["APERSTripMine_Wire_Mag", ["trigger",1,"uranium3",3,"ironRefined",5,"aluminium_r",5],["metal",3]],
				["DemoCharge_Remote_Mag", ["trigger",1,"uranium4",3,"ironRefined",3,"aluminium_r",3],["metal",3]],
				["10Rnd_338_Mag", ["titp",3,"sulfur",3,"saltpetre",2],["metal",4]],
				["5Rnd_127x108_APDS_Mag",["titp",3,"sulfur",3,"saltpetre",2,"uranium3",3],["metal",5]],
				["100Rnd_127x99_mag_Tracer_Green",["titp",5,"sulfur",5,"saltpetre",5,"uranium3",5],["metal",6]],
				["Medikit", ["uranium1",2,"aluminium_r",5,"mercuryp",1],["metal",7]]
				
			];
	};

	case "item":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2,item #3,quantity item #3]],]
				["pickaxe", ["holz",5],["metal",10]],
				["rivet", ["copperRefined",8,"ironRefined",8],["metal",1]],
				["latch", ["copperRefined",9,"ironRefined",9],["metal",1]],
				["lockpick", ["copperRefined",5,"ironRefined",5],["metal",2]],
				["sheet_metal", ["copperRefined",10,"ironRefined",10],["metal",2]],
				["butt", ["gold",8,"ironRefined",8,"aluminium_r",4],["metal",2]],
				["sight", ["diamond_cut",10,"quartzc",5],["metal",2]],
				["barrel", ["holz",5,"ironRefined",10,"diamondUncut",4],["metal",3]],
				["fuelFull", ["oil_processed",5,"ironRefined",5],["metal",3]],
				["trigger", ["leadp",10,"ironRefined",10],["metal",3]],
				["storagebig", ["rivet",2,"latch",2,"sheet_metal",2],["metal",4]],	
				["luck", ["turtle_raw",2,"redgull",2,"tuna_raw",2],["pFood",4]],
				["blastingcharge", ["goldBar",12,"metal",8,"ironRefined",2],["holz",4]]
					
		];
	};
	
	case "vehicle":
	{
		_return = [
				["C_Kart_01_black_F",["engine",1,"oil_processed",1,"plans",1],["pEngineer",1]],
				["C_Quadbike_01_blue_F",["engine",1,"holz",1,"oil_processed",1,"plans",1],["pEngineer",2]],
				["C_Boat_Civil_01_F",["holz",3,"gold",1,"oil_processed",4,"aluminium_r",5,"plans",2],["pEngineer",3]],
				["C_Heli_light_01_wasp_F",["engine",1,"holz",3,"oil_processed",2,"plans",1],["pEngineer",4]],
				["O_SDV_01_F",["engine",2,"ironRefined",5,"oil_processed",2,"plans",1],["pEngineer",5]],
				["O_Heli_Transport_04_covered_F",["engine",1,"holz",6,"oil_processed",5,"plans",2],["pEngineer",5]],
				["O_MRAP_02_F",["engine",2,"ironRefined",5,"oil_processed",2,"plans",1],["pEngineer",6]],
				["B_MRAP_01_F",["engine",1,"ironRefined",4,"oil_processed",1,"plans",1],["pEngineer",6]],
				["O_Heli_Transport_04_bench_F",["engine",1,"holz",6,"oil_processed",5,"plans",2],["pEngineer",7]],
				["O_Heli_Transport_04_black_F",["engine",1,"holz",6,"oil_processed",5,"plans",2],["pEngineer",8]],
				["O_Plane_CAS_02_F",["engine",2,"ironRefined",6,"oil_processed",5,"plans",3],["pEngineer",11]],
				["B_Heli_Attack_01_F",["holz",3,"gold",1,"oil_processed",4,"aluminium_r",5,"plans",2],["pEngineer",12]]
	
		];
	};
};

_return;