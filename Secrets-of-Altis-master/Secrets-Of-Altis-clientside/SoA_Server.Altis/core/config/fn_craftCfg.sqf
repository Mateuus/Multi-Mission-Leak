#include <macro.h>
/*
	File: fn_craftCfg.sqf
	Author: EdgeKiller
	Modification: G00golplexian

	Description:
	Master configuration file for the crafting menu.

*/
private["_craft","_return"];
_craft = [_this,0,"",[""]] call BIS_fnc_param;
if(_craft == "") exitWith {closeDialog 0}; //Bad shop type passed.
_return = [];

switch(_craft) do
{
	case "uniform":
	{
		_return = [
				["U_NikosBody", ["life_inv_baumwolle",20,"life_inv_indigo",15,"life_inv_nadel",1]],
				["U_I_GhillieSuit", ["life_inv_baumwolle",25,"life_inv_indigo",5,"life_inv_seide",10,"life_inv_nadel",2]],
				["U_B_GhillieSuit", ["life_inv_baumwolle",30,"life_inv_indigo",10,"life_inv_seide",15,"life_inv_nadel",2]],
				["U_C_Scientist", ["life_inv_baumwolle",100,"life_inv_plastik",15,"life_inv_nadel",2]]
			];
	};

	case "backpack":
	{
		_return = [
				["B_ViperHarness_oli_F", ["life_inv_seide",5,"life_inv_baumwolle",35,"life_inv_nadel",1]],
				["B_ViperHarness_khk_F", ["life_inv_seide",5,"life_inv_baumwolle",38,"life_inv_nadel",1]],
				["B_ViperHarness_hex_F", ["life_inv_seide",5,"life_inv_baumwolle",42,"life_inv_nadel",1,"life_inv_indigo",3]],
				["B_ViperHarness_ghex_F", ["life_inv_seide",5,"life_inv_baumwolle",45,"life_inv_nadel",1,"life_inv_indigo",10]],
				["B_Carryall_cbr", ["life_inv_seide",15,"life_inv_baumwolle",40,"life_inv_nadel",1]],
				["B_Carryall_khk", ["life_inv_seide",15,"life_inv_baumwolle",45,"life_inv_nadel",1]],
				["B_Carryall_mcamo",["life_inv_seide",15,"life_inv_baumwolle",50,"life_inv_nadel",1]],
				["B_Carryall_ocamo",["life_inv_seide",15,"life_inv_baumwolle",55,"life_inv_nadel",1,"life_inv_indigo",2]],
				["B_Carryall_oli",["life_inv_seide",15,"life_inv_baumwolle",60,"life_inv_nadel",1,"life_inv_indigo",5]],
				["B_Carryall_oucamo",["life_inv_seide",15,"life_inv_baumwolle",65,"life_inv_nadel",1,"life_inv_indigo",10]]
			];
	};
	
	case "elektro": 
	{
		_return = [
			["life_inv_battery",["life_inv_cable",1,"life_inv_plastik",1]]
		];
	};
	
	case "werkzeuge":
	{
		_return = [
			["life_inv_lupe",["life_inv_holz",1,"life_inv_glass",2]],
			["life_inv_pickaxe", ["life_inv_holz",2,"life_inv_ironr",1]],
			["life_inv_axt", ["life_inv_holz",2,"life_inv_ironr",1]],
			["life_inv_schaufel", ["life_inv_holz",2,"life_inv_ironr",1]],
			["life_inv_pumpe", ["life_inv_schrauben",3,"life_inv_plastik",2]],
			["life_inv_lockpick", ["life_inv_ironr",2]],
			["life_inv_jagdmesser", ["life_inv_holz",1,"life_inv_ironr",1]]
		];
	
		if(life_level >= 11) then {
			_return pushBack
			["life_inv_pressluft", ["life_inv_plutonium",2,"life_inv_aluminium",5,"life_inv_plastik",15,"life_inv_fuelE",1,"life_inv_cable",10]];
		};
	};
	
	case "materials": 
	{
		_return = [
			["life_inv_schmuck", ["life_inv_perlenp",2,"life_inv_diamondr",1]],
			["life_inv_bottles", ["life_inv_glass",1]],
			["life_inv_mash", ["life_inv_water",1,"life_inv_cornmeal",1]],
			["life_inv_laminat", ["life_inv_holz",2]],
			["life_inv_mahagoni", ["life_inv_holz",3]],
			["life_inv_seide",["life_inv_baumwolle",50]],
			["life_inv_zschachtel_leer",["life_inv_papier",8]],
			["life_inv_papier",["life_inv_holz",1,"life_inv_water",1]],
			["life_inv_zschachtel_voll",["life_inv_zschachtel_leer",1,"life_inv_zigarette",20]],
			["life_inv_aluminium",["life_inv_ironr",1,"life_inv_copperr",1]],
			["life_inv_stahl",["life_inv_ironr",3,"life_inv_aluminium",3]],
			["life_inv_reifen",["life_inv_plastik",25,"life_inv_aluminium",5]]
		];
	};
	
	case "spezial":
	{
		_return = [
			["life_inv_storagesmall",["life_inv_mahagoni",10,"life_inv_plastik",5,"life_inv_ironr",2,"life_inv_copperr",4]],
			["life_inv_storagebig",["life_inv_mahagoni",13,"life_inv_plastik",6,"life_inv_ironr",4,"life_inv_copperr",5]],
			["life_inv_feuer", ["life_inv_holz",9,"life_inv_rock",13]],
			["life_inv_netz", ["life_inv_seide",15,"life_inv_copperr",10]],
			["life_inv_klappstuhl", ["life_inv_seide",5,"life_inv_copperr",10,"life_inv_plastik",5]],
			["life_inv_protestschild", ["life_inv_laminat",2,"life_inv_indigo",1]],
			["life_inv_joint",["life_inv_papier",1,"life_inv_marijuana",3]],
			["life_inv_zigarette",["life_inv_tabakblatt",3,"life_inv_papier",1]],
			["life_inv_zigarre",["life_inv_tabakblatt",15,"life_inv_papier",10]],
			["life_inv_verband",["life_inv_baumwolle",5]]
			//["life_inv_volleyball",["life_inv_seide",20,"life_inv_indigo",5,"life_inv_plastik",10]]
		];
	};

	case "archo":
	{
		_return = [
			["life_inv_goetzi",["life_inv_goetzikopf",1,"life_inv_goetzitorso",1,"life_inv_goetziglied",1,"life_inv_lupe",1]],
			["life_inv_bertram",["life_inv_bertramkopf",1,"life_inv_bertramtorso",1,"life_inv_bertramglied",1,"life_inv_lupe",1]],
			["life_inv_momphred", ["life_inv_momphredkopf",1,"life_inv_momphredtorso",1,"life_inv_momphredglied",1,"life_inv_lupe",1]],
			["life_inv_ron", ["life_inv_ronkopf",1,"life_inv_rontorso",1,"life_inv_ronglied",1,"life_inv_lupe",1]],
			["life_inv_john", ["life_inv_johnkopf",1,"life_inv_johntorso",1,"life_inv_johnglied",1,"life_inv_lupe",1]]
		];
	};

	case "fahrzeuge": 
	{
		_return = [
			["O_MRAP_02_F",["life_inv_blueprintifrit",1,"life_inv_reifen",4,"life_inv_aluminium",50,"life_inv_stahl",25,"life_inv_schrauben",30,"life_inv_cable",35]],
			["O_T_LSV_02_unarmed_F",["life_inv_blueprintqilin",1,"life_inv_reifen",4,"life_inv_aluminium",40,"life_inv_stahl",10,"life_inv_schrauben",20,"life_inv_cable",15]],
			["B_T_LSV_01_unarmed_F",["life_inv_blueprintprowler",1,"life_inv_reifen",4,"life_inv_aluminium",30,"life_inv_stahl",5,"life_inv_schrauben",25,"life_inv_cable",15]],
			["C_Scooter_Transport_01_F",["life_inv_blueprintscooter",1,"life_inv_aluminium",10,"life_inv_schrauben",10,"life_inv_cable",5]],
			["C_Plane_Civil_01_racing_F",["life_inv_blueprintcaesar",1,"life_inv_reifen",3,"life_inv_aluminium",70,"life_inv_schrauben",30,"life_inv_cable",45,"life_inv_indigo",40]],
			["C_Hatchback_01_sport_F",["life_inv_blueprintsport",1,"life_inv_reifen",4,"life_inv_aluminium",25,"life_inv_schrauben",10,"life_inv_cable",10]],
			["O_Heli_Light_02_unarmed_F",["life_inv_blueprintorca",1,"life_inv_reifen",3,"life_inv_aluminium",50,"life_inv_stahl",5,"life_inv_schrauben",35,"life_inv_cable",10]]
		];
	};
};

_return; 