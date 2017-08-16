#include "..\..\script_macros.hpp"
/*
	File: fn_Loadouts.sqf
	Author: RPGforYOU 
	Website: www.outlawed-veterans.com
	
	Description:
	Centralizes all loadouts in 1 file so it's easier to re-use and change.
	If you are copying it, be so kind to leave my name as author in it as I'm the one and only original one - RPGforYOU! :)
	And this took some time to fucking write, check and search for XD
*/

private["_window","_bad","_object","_value","_loadoutName","_yItems","_playerbackpack","_amount","_window","_rebelclothing","_rebelheadgear","_rebelvest","_rebelbackpacks","_ghillieclothing","_rebelgoggles",
"_nvgoggles","_nv","_cqbscopes","_midscopes","_longscopes","_thermalscopes","_nightscopes","_pistolscopes","_smgscopes","_combatscopes","_bipods","_acc","_normalcivclothings","_classycivclothings",
"_normalitems","_bank","_remove","_deluxitems","_wetsuitsclothing","_rebreathers","_divinggoggles","_kitbackpacks","_assaultpackbackpacks","_bergenbackpacks","_fieldpackbackpacks","_carryallbackpacks","_outdoorbackpacks",
"_mk14","_MAR10","_mk1","_ASP1","_Cyrus","_Navid","_SPMG","_policegoggles","_SWATgoggles","_armygoggles","_swatvest","_swatbackpacks","_Lynx","_m320","_militaryclothings","_militaryheadgear",
"_gangclothings","_gangvest","_popup","_sell","_nomoneycheck","_syncgear","_militaryvest","_swatuc"
];

_value = [_this,3,"",[""]] call BIS_fnc_param;
if(_value == "") exitWith {}; //well nothing shouldn't be coming through ...

//////////////
/*
EXAMPLES: 

Rebel
this addAction["Buy Rebel MX Loadout",life_fnc_loadouts,"rebel_mx",6,false,false,"",' license_civ_rebel && playerSide == civilian']; 

Gang
this addAction["Buy Gang machinegun Loadout",life_fnc_loadouts,"gang_machinegun",0,false,false,"",' _b = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0; !isNil {_b getVariable "gangOwner"} && {(_b getVariable "gangOwner") == (group player)} && playerSide == civilian ']; 

cop
this addAction["<img image='\A3\UI_F_Curator\Data\CfgMarkers\kia_ca.paa' size='1'></img> Buy Lethal Police Loadout",life_fnc_loadouts,"cop_lethal",0,false,false,"",' playerSide == west']; 

Swat
this addAction["Buy SWAT Non-Lethal Loadout",life_fnc_loadouts,"swat_nonlethal",0,false,false,"",' playerSide == west && ((player getVariable "swatrank")>0)']; 

Army
this addAction["Buy Military Non Lethal Loadout",life_fnc_loadouts,"military_non_lethal",0,false,false,"",' playerSide == west && ((player getVariable "dearank")>0)']; 

Blackmarket
this addAction["Buy BlackMarket PCML Loadout",life_fnc_loadouts,"blackm_pcml",0,false,false,"",'license_civ_blackmarket && playerSide == civilian && (sunOrMoon >= 0.15)'];
*/

//////////////


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////
//Loadout defining for randomization purposes
/////////////////////

//////////Weapons///////////

_mk14 = ["srifle_DMR_06_camo_F","srifle_DMR_06_olive_F","srifle_DMR_06_camo_khs_F"];
_MAR10 = ["srifle_DMR_02_F","srifle_DMR_02_camo_F","srifle_DMR_02_sniper_F"];
_mk1 = ["srifle_DMR_03_F","srifle_DMR_03_khaki_F","srifle_DMR_03_tan_F","srifle_DMR_03_multicam_F","srifle_DMR_03_woodland_F"];
_ASP1 = ["srifle_DMR_04_F","srifle_DMR_04_Tan_F"];
_Cyrus = ["srifle_DMR_05_hex_F","srifle_DMR_05_blk_F","srifle_DMR_05_tan_f"];
_Navid = ["MMG_01_hex_F","MMG_01_tan_F"];
_SPMG = ["MMG_02_camo_F","MMG_02_black_F","MMG_02_sand_F"];
_Lynx =["srifle_GM6_F","srifle_GM6_camo_F"];
_m320 =["srifle_LRR_F","srifle_LRR_camo_F"];


//////////GEAR///////////

//Clothing array's
_normalcivclothings = ["U_NikosAgedBody","U_C_Poor_2","U_NikosBody","U_OrestesBody"];
_classycivclothings = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Commoner1_1"];
_ghillieclothing = ["U_B_FullGhillie_lsh","U_B_FullGhillie_sard","U_B_FullGhillie_ard","U_O_FullGhillie_lsh","U_O_FullGhillie_sard","U_O_FullGhillie_ard","U_I_FullGhillie_lsh","U_I_FullGhillie_sard","U_I_FullGhillie_ard","U_B_GhillieSuit","U_O_GhillieSuit","U_I_GhillieSuit"];

if(395180 in getDLCs 1) then {
_rebelclothing = ["U_I_C_Soldier_Bandit_3_F","U_I_C_Soldier_Para_2_F","U_I_C_Soldier_Para_3_F","U_I_C_Soldier_Para_5_F","U_I_C_Soldier_Para_4_F","U_I_C_Soldier_Para_1_F","U_I_C_Soldier_Camo_F","U_I_C_Soldier_Bandit_3_F","U_I_C_Soldier_Para_2_F","U_I_C_Soldier_Para_3_F","U_I_C_Soldier_Para_5_F","U_I_C_Soldier_Para_4_F","U_I_C_Soldier_Para_1_F","U_I_C_Soldier_Camo_F","U_OG_leader","U_OG_Guerilla3_2","U_OG_Guerilla3_1","U_OG_Guerilla2_3","U_OG_Guerilla2_1","U_OG_Guerilla1_1","U_B_survival_uniform","U_I_G_Story_Protagonist_F","U_I_G_resistanceLeader_F"];
} else {
_rebelclothing = ["U_OG_leader","U_OG_Guerilla3_2","U_OG_Guerilla3_1","U_OG_Guerilla2_3","U_OG_Guerilla2_1","U_OG_Guerilla1_1","U_B_survival_uniform","U_I_G_Story_Protagonist_F","U_I_G_resistanceLeader_F"];
};

_wetsuitsclothing =["U_B_Wetsuit","U_O_Wetsuit","U_I_Wetsuit"];//U_B_survival_uniform
_militaryclothings = ["U_B_CTRG_1"];
_gangclothings = ["U_B_CombatUniform_mcam","U_B_SpecopsUniform_sgg","U_O_CombatUniform_oucamo"];
_assassinc = ["U_O_V_Soldier_Viper_F","U_O_V_Soldier_Viper_hex_F"];
_swatuc = ["U_I_C_Soldier_Bandit_3_F","U_I_C_Soldier_Bandit_2_F","U_C_Man_casual_1_F","U_C_HunterBody_grn"];


//Headgear array's
_rebelheadgear = ["H_Bandanna_cbr","H_Bandanna_khk_hs","H_Bandanna_camo","H_Watchcap_cbr","H_Booniehat_khk_hs","H_Booniehat_oli","H_Booniehat_tna_F","H_Cap_oli_hs","H_Cap_blk_Raven","H_Cap_tan","H_Hat_camo","H_MilCap_tna_F","H_Shemag_olive_hs","H_ShemagOpen_tan"];
_militaryheadgear = ["H_HelmetSpecB_paint2"];
_gangheadgear = ["H_Bandanna_cbr","H_Bandanna_khk_hs","H_Bandanna_camo","H_Watchcap_cbr","H_Booniehat_khk_hs","H_Booniehat_oli","H_Booniehat_tna_F","H_Cap_oli_hs","H_Cap_blk_Raven","H_Cap_tan","H_Hat_camo","H_MilCap_tna_F","H_Shemag_olive_hs","H_ShemagOpen_tan","H_HelmetB_Enh_tna_F","H_HelmetB_Light_tna_F","H_HelmetB_tna_F"];
_assassinh = ["H_HelmetO_ViperSP_hex_F","H_HelmetO_ViperSP_ghex_F"];
//Vest array's
_rebelvest = ["V_PlateCarrierIA2_dgtl","V_HarnessOGL_ghex_F","V_BandollierB_ghex_F","V_TacChestrig_cbr_F","V_TacVest_camo","V_I_G_resistanceLeader_F"];
_rebreathers = ["V_RebreatherB","V_RebreatherIR","V_RebreatherIA"];
_swatvest = ["V_PlateCarrierSpec_blk"];
_gangvest = ["V_PlateCarrier1_tna_F","V_PlateCarrier2_tna_F"];
_militaryvest = ["V_PlateCarrierSpec_rgr"];
_assassinv = ["V_PlateCarrierSpec_blk","V_PlateCarrierSpec_tna_F"];
//Backpacks array's
if(395180 in getDLCs 1) then {
_rebelbackpacks = ["B_AssaultPack_dgtl","B_FieldPack_ghex_F","B_Kitbag_rgr","B_TacticalPack_oli","B_ViperLightHarness_ghex_F","B_Carryall_ghex_F","B_Bergen_mcamo_F"];
} else {
_rebelbackpacks = ["B_Kitbag_cbr","B_Kitbag_rgr","B_Kitbag_mcamo","B_Kitbag_sgg"];
};
_kitbackpacks = ["B_Kitbag_mcamo","B_Kitbag_sgg","B_Kitbag_cbr"];
_assaultpackbackpacks = ["B_AssaultPack_khk","B_AssaultPack_dgtl","B_AssaultPack_rgr","B_AssaultPack_sgg","B_AssaultPack_blk","B_AssaultPack_cbr","B_AssaultPack_mcamo"];
_bergenbackpacks = ["B_Bergen_sgg","B_Bergen_mcamo","B_Bergen_rgr","B_Bergen_blk"];
_fieldpackbackpacks = ["B_FieldPack_blk","B_FieldPack_ocamo","B_FieldPack_oucamo","B_FieldPack_cbr"];
_carryallbackpacks = ["B_Carryall_ocamo","B_Carryall_oucamo","B_Carryall_mcamo","B_Carryall_oli","B_Carryall_khk","B_Carryall_cbr"];
_outdoorbackpacks = ["B_OutdoorPack_blk","B_OutdoorPack_tan","B_OutdoorPack_blu"];
_swatbackpacks =["B_TacticalPack_blk"];
_militarybackpacks =["B_TacticalPack_oli"];
_assassinb = ["B_ViperHarness_blk_F","B_ViperHarness_ghex_F","B_ViperHarness_khk_F"];

//Goggles array
_rebelgoggles = ["G_Balaclava_oli","G_Bandanna_beast","G_Bandanna_khk","G_Bandanna_tan","G_Combat_Goggles_tna_F","G_Balaclava_combat","G_Balaclava_blk"];
_divinggoggles = ["G_Diving","G_B_Diving","G_O_Diving","G_I_Diving"];
_policegoggles = ["G_Tactical_Clear","G_Tactical_Black","G_Combat"];
_SWATgoggles = ["G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile"];
_armygoggles = ["G_Balaclava_oli"];
////////EQUIPMENT///////

// Nightvision goggles
_nvgoggles = ["NVGoggles_OPFOR","NVGoggles_INDEP","NVGoggles"];
_assassing = ["NVGogglesB_blk_F","NVGogglesB_grn_F","NVGogglesB_gry_F"];

// Scopes
_cqbscopes = ["optic_Holosight","optic_Aco","optic_ACO_grn"];
_midscopes = ["optic_Arco","optic_MRCO","optic_MRCO"];
_combatscopes = ["optic_Holosight","optic_Aco","optic_ACO_grn","optic_Arco","optic_MRCO","optic_MRCO"]; // cqbscopes + midscopes
_longscopes = ["optic_AMS","optic_AMS_khk","optic_AMS_snd","optic_KHS_blk","optic_KHS_hex","optic_KHS_old","optic_KHS_tan","optic_LRPS","optic_DMS"];
_thermalscopes = ["optic_tws","optic_Nightstalker"];
_nightscopes = ["optic_NVS"];
_pistolscopes = ["optic_MRD","optic_Yorris"];
_smgscopes = ["optic_ACO_grn_smg","optic_Aco_smg","optic_Holosight_smg"];

// Bipods
_bipods = ["bipod_03_F_oli","bipod_03_F_blk","bipod_03_F_blk","bipod_02_F_tan","bipod_02_F_blk","bipod_01_F_mtp","bipod_01_F_blk","bipod_01_F_snd"];

// Light or laserpointer
_acc = ["acc_pointer_IR","acc_flashlight"];

//items
_normalitems = ["ItemMap","ItemCompass"];
_deluxitems = ["ItemMap","ItemCompass","ItemGPS","ItemWatch"];


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


_bad = 0;
_bank = 0;
_remove = 0;
_popup = 1;
_sell = 0;
_nomoneycheck = 0;
_syncgear = 0;

switch (_value) do {
	case "rebel_AKS74U": {
	/////////////////////
	//AKS74U Rebel loadout
	/////////////////////
	_loadoutName = "AKS74U Loadout";
	_amount = 90000;
	};
	case "rebel_CMR76": {
	/////////////////////
	//Rebel CMR76
	/////////////////////
	_loadoutName = "CMR76 Loadout";
	_amount = 110000;
	};
	case "rebel_AKM": {
	/////////////////////
	//Rebel EBR
	/////////////////////
	_loadoutName = "AKM Loadout";
	_amount = 150000;
	};
	case "underwater_normal": {
	/////////////////////
	//Underwater loadout
	/////////////////////
	_loadoutName = "Diving Loadout";
	_amount = 50000;
	};
	case "underwater_cop": {
	/////////////////////
	//Underwater loadout
	/////////////////////
	_loadoutName = "Diving Loadout";
	_amount = 50000;
	_bank = 1;
	};
	case "underwater_military": {
	/////////////////////
	//Underwater loadout
	/////////////////////
	_loadoutName = "Diving Loadout";
	_amount = 50000;
	_bank = 1;
	};
	case "federalbank": {
	/////////////////////
	//Federal Bank loadout
	/////////////////////
	_loadoutName = "Federal bank Item Loadout";
	_amount = 110000;
	_remove = 1;
	};
	case "PMC_machinegunner": {
	_loadoutName = "PMC SPMG .338 Gunner";
	_amount = 250000;
	};
	case "PMC_rifleman": {
	_loadoutName = "PMC MK20 Rifleman";
	_amount = 175000;
	};
	case "PMC_marksman": {
	_loadoutName = "PMC Cyrus Marksman";
	_amount = 230000;
	};
	case "rebel_mk14": {
	/////////////////////
	//Rebel M14 loadout
	/////////////////////
	_loadoutName = "Rebel MK14 Loadout";
	_amount = 125000;
	};
	case "rebel_mk200": {
	/////////////////////
	//MK 200 Rebel loadout
	/////////////////////
	_loadoutName = "MK 200 Loadout";
	_amount = 150000;
	};
	case "rebel_MX_SW": {
	/////////////////////
	//Rebel MX_SW
	/////////////////////
	_loadoutName = "MX SW Loadout";
	_amount = 120000;
	};
	case "rebel_rahim": {
	/////////////////////
	//Rebel Rahim
	/////////////////////
	_loadoutName = "Rahim Loadout";
	_amount = 125000;
	};
	case "rebel_ebr": {
	/////////////////////
	//Rebel EBR
	/////////////////////
	_loadoutName = "EBR Loadout";
	_amount = 125000;
	};
	case "rebel_AKS74U": {
	/////////////////////
	//AKS74U Rebel loadout
	/////////////////////
	_loadoutName = "AKS74U Loadout";
	_amount = 75000;
	};
	case "rebel_mx": {
	/////////////////////
	//Rebel MX
	/////////////////////
	_loadoutName = "MX Loadout";
	_amount = 80000;
	};
	case "rebel_CMR76": {
	/////////////////////
	//Rebel CMR76
	/////////////////////
	_loadoutName = "CMR76 Loadout";
	_amount = 90000;
	};
	case "rebel_AKM": {
	/////////////////////
	//Rebel EBR
	/////////////////////
	_loadoutName = "AKM Loadout";
	_amount = 95000;
	};
	case "assassin": {
	/////////////////////
	//assassin loadout
	/////////////////////
	_loadoutName = "Assassin Loadout";
	_amount = 1500000;
	};
	case "cop_lethal": {
	/////////////////////
	//Cop lethal Loadout
	/////////////////////
	_loadoutName = "Lethal Officer Loadout";
	if(FETCH_CONST(life_coplevel) > 6) then {
	_amount = 75000;
	} else {
		if(FETCH_CONST(life_coplevel) > 4) then {
		_amount = 65000;
			} else {
			if(FETCH_CONST(life_coplevel) > 2) then {
			_amount = 60000;
					} else {
					_amount = 55000;
					};
			};
	};
	_bank = 1;
	}; 
	case "cop_uav": {
	/////////////////////
	//UAV loadout
	/////////////////////
	_loadoutName = "UAV Backpack Loadout";
	_amount = 25000;
	_remove = 1;
	_bank = 1;
	};
	case "cop_titan_launcher": {
	/////////////////////
	//Titan launcher loadout
	/////////////////////
	_loadoutName = "Titan Launcher Loadout";
	if(FETCH_CONST(life_coplevel) isEqualTo 8) then {
	_amount = 140000;
	} else {
		if(FETCH_CONST(life_coplevel) isEqualTo 7) then {
		_amount = 150000;
			} else {
			if(FETCH_CONST(life_coplevel) isEqualTo 6) then {
			_amount = 160000;
					} else {
					if(FETCH_CONST(life_coplevel) isEqualTo 5) then {
					_amount = 170000;
						} else {
						if(FETCH_CONST(life_coplevel) isEqualTo 4) then {
						_amount = 180000;
								} else {
								if(FETCH_CONST(life_coplevel) isEqualTo 3) then {
								_amount = 190000;
									} else {
									if(FETCH_CONST(life_coplevel) isEqualTo 2) then {
									_amount = 200000;
										} else {
										if(FETCH_CONST(life_coplevel) isEqualTo 1) then {
										_amount = 210000;
											} else {
											_amount = 220000;
											};
										};
									};
								};
						};
					};
			};
	};
	_remove = 1;
	_bank = 1;
	};
	case "cop_titan_missiles": {
	/////////////////////
	//Titan missiles loadout
	/////////////////////
	_loadoutName = "Titan missiles Loadout";
	_amount = 30000;
	_remove = 1;
	_bank = 1;
	};
	case "cop_rpg_launcher": {
	/////////////////////
	//Titan launcher loadout
	/////////////////////
	_loadoutName = "RPG Launcher Loadout";
	if(FETCH_CONST(life_coplevel) isEqualTo 8) then {
	_amount = 140000;
	} else {
		if(FETCH_CONST(life_coplevel) isEqualTo 7) then {
		_amount = 150000;
			} else {
			if(FETCH_CONST(life_coplevel) isEqualTo 6) then {
			_amount = 160000;
					} else {
					if(FETCH_CONST(life_coplevel) isEqualTo 5) then {
					_amount = 170000;
						} else {
						if(FETCH_CONST(life_coplevel) isEqualTo 4) then {
						_amount = 180000;
								} else {
								if(FETCH_CONST(life_coplevel) isEqualTo 3) then {
								_amount = 190000;
									} else {
									if(FETCH_CONST(life_coplevel) isEqualTo 2) then {
									_amount = 200000;
										} else {
										if(FETCH_CONST(life_coplevel) isEqualTo 1) then {
										_amount = 210000;
											} else {
											_amount = 220000;
											};
										};
									};
								};
						};
					};
			};
	};
	_remove = 1;
	_bank = 1;
	};
	case "cop_rpg_missiles": {
	/////////////////////
	//Titan missiles loadout
	/////////////////////
	_loadoutName = "RPG missiles Loadout";
	_amount = 25000;
	_remove = 1;
	_bank = 1;
	};
	case "cop_basic": {
	/////////////////////
	//Cop basic loadout
	/////////////////////
	_loadoutName = "Cop basic Loadout";
	_amount = 0;
	_bank = 1;
	};
	case "cop_basic_spawn": {
	/////////////////////
	//Cop basic loadout
	/////////////////////
	_loadoutName = "Cop basic Loadout";
	_amount = 0;
	_bank = 1;
	_popup = 0;
	};
	case "swat_uc": {
	/////////////////////
	//Swat Non Lethal loadout
	/////////////////////
	_loadoutName = "Swat Undercover Loadout";
	_amount = 70000;
	_bank = 1;
	};
	case "swat_nonlethal": {
	/////////////////////
	//Swat Non Lethal loadout
	/////////////////////
	_loadoutName = "Swat Non Lethal Loadout";
	_amount = 90000;
	_bank = 1;
	};
	case "staff": {
	/////////////////////
	//staff loadout
	/////////////////////
	_loadoutName = "Community Team Loadout";
	_amount = 200000;
	_bank = 1;
	};
	case "swat_rifleman": {
	/////////////////////
	//Swat Non Lethal loadout
	/////////////////////
	_loadoutName = "Swat Pointman Loadout";
	_amount = 115000;
	_bank = 1;
	};
	case "swat_heavy": {
	/////////////////////
	//Swat Non Lethal loadout
	/////////////////////
	_loadoutName = "Swat Heavy Machinegun Loadout";
	_amount = 145000;
	_bank = 1;
	};
	case "swat_engineer": {
	/////////////////////
	//Swat Engineer(RPG) loadout
	/////////////////////
	_loadoutName = "Swat Assault Loadout";
	_amount = 130000;
	_bank = 1;
	};
	case "swat_sniper": {
	/////////////////////
	//Swat Sniper loadout
	/////////////////////
	_loadoutName = "Swat Sniper MAR 10 Loadout";
	_amount = 160000;
	_bank = 1;
	};
	case "swat_bomb": {
	/////////////////////
	//Swat bomb squad loadout
	/////////////////////
	_loadoutName = "Swat BOMB Squad Loadout";
	_amount = 80000;
	_bank = 1;
	};
	case "military_rifleman": {
	/////////////////////
	//Military Rifleman loadout
	/////////////////////
	_loadoutName = "Military Rifleman Loadout";
	_amount = 100000;
	_bank = 1;
	};
	case "military_machinegun": {
	/////////////////////
	//Military Machinegun loadout
	/////////////////////
	_loadoutName = "Military Machinegun Loadout";
	_amount = 125000;
	_bank = 1;
	};
	case "military_demolition": {
	/////////////////////
	//Military Demolition loadout
	/////////////////////
	_loadoutName = "Military Demolition Loadout";
	_amount = 275000;
	_bank = 1;
	};
	case "military_sniper": {
	/////////////////////
	//Military sniper loadout
	/////////////////////
	_loadoutName = "Military sniper(M320) Loadout";
	_amount = 220000;
	_bank = 1;
	};
	case "military_specop": {
	/////////////////////
	//Military sniper loadout
	/////////////////////
	_loadoutName = "Military Spec Op Loadout";
	_amount = 250000;
	_bank = 1;
	};

	case "gang_rpg": {
	/////////////////////
	//Gang rpg loadout
	/////////////////////
	_loadoutName = "Gang RPG-7 Loadout";
	_amount = 225000;
	_remove = 1;
	};
	case "gang_rpg_missiles": {
	/////////////////////
	//Gang rpg missiles loadout
	/////////////////////
	_loadoutName = "Gang RPG-7 Missiles Loadout";
	_amount = 60000;
	_remove = 1;
	};	
	case "gang_rpg32": {
	/////////////////////
	//Gang rpg loadout
	/////////////////////
	_loadoutName = "Gang RPG-32 Loadout";
	_amount = 260000;
	_remove = 1;
	};
	case "gang_rpg32_missiles": {
	/////////////////////
	//Gang rpg missiles loadout
	/////////////////////
	_loadoutName = "Gang RPG-32 Missiles Loadout";
	_amount = 75000;
	_remove = 1;
	};	
	case "gang_AK12": {
	/////////////////////
	//Gang AK12 loadout
	/////////////////////
	_loadoutName = "Gang AK12 Loadout";
	_amount = 130000;
	};
	case "gang_merc": {
	/////////////////////
	//Gang Merc loadout
	/////////////////////
	_loadoutName = "Gang Mercenary Loadout";
	_amount = 400000;
	};
	case "gang_gas": {
	/////////////////////
	//Gang AK12 loadout
	/////////////////////
	_loadoutName = "Gang Teargas Loadout";
	_amount = 250000;
	};
	case "gang_LMG": {
	/////////////////////
	//Gang lmgut
	/////////////////////
	_loadoutName = "Gang M249 MINI Loadout";
	_amount = 140000;
	};
	case "gang_mk14": {
	/////////////////////
	//Gang marksman loadout
	/////////////////////
	_loadoutName = "Gang MK14 Loadout";
	_amount = 150000;
	};
	case "gang_machinegun": {
	/////////////////////
	//Gang Machine gun loadout
	/////////////////////
	_loadoutName = "Gang machinegun(Zafir) Loadout";
	_amount = 175000;
	};
	case "gang_sniper": {
	/////////////////////
	//Gang sniperloadout
	/////////////////////
	_loadoutName = "Gang sniper(M320) Loadout";
	_amount = 220000;
	};
	case "gang_marksman": {
	/////////////////////
	//Gang marksman loadout
	/////////////////////
	_loadoutName = "Gang marksman(Cyrus) Loadout";
	_amount = 175000;
	};
	case "underwater_treasure": {
	/////////////////////
	//Diving Treasure Hunter loadout
	/////////////////////
	_loadoutName = "Diving Treasure Hunter Loadout";
	_amount = 150000;
	};
	case "civ_licensed_pistol": {
	/////////////////////
	//Pistol loadout
	/////////////////////
	_loadoutName = "Licensed Pistol(ACP-C2 .45) Loadout";
	_amount = 27500;
	_remove = 1;
	};
	case "civ_licensed_revolver": {
	/////////////////////
	//Revolver loadout
	/////////////////////
	_loadoutName = "Licensed Revolver(Zubr .45) Loadout";
	_amount = 30000;
	_remove = 1;
	};
	case "blackm_pcml": {
	/////////////////////
	//Blackmarket PCML loadout
	/////////////////////
	_loadoutName = "BlackMarket PCML Loadout";
	_amount = 400000;
	_remove = 1;
	};
	case "med_basic": {
	/////////////////////
	//Medical basic loadout
	/////////////////////
	_loadoutName = "Medical basic Loadout";
	_amount = 0;
	_bank = 1;
	};
	case "med_basic_spawn": {
	/////////////////////
	//Medical basic loadout
	/////////////////////
	_loadoutName = "Medical basic Loadout";
	_amount = 0;
	_bank = 1;
	_popup = 0;
	};
	
	
	//Refund
	case "rf_swat_Non_lethal": {
	/////////////////////
	//Refund Swat Non Lethal
	/////////////////////
	_amount = 40000;
	_sell = 1;
	_nomoneycheck = 1;
	_syncgear = 1;
	};
	case "rf_swat_rifleman": {
	/////////////////////
	//Refund Swat Rifleman
	/////////////////////
	_amount = 60000;
	_sell = 1;
	_nomoneycheck = 1;
	_syncgear = 1;
	};
	case "rf_swat_heavy": {
	/////////////////////
	//Refund Swat heavy
	/////////////////////
	_amount = 80000;
	_sell = 1;
	_nomoneycheck = 1;
	_syncgear = 1;
	};
	case "rf_swat_engineer": {
	/////////////////////
	//Refund Swat engineer
	/////////////////////
	_amount = 70000;
	_sell = 1;
	_nomoneycheck = 1;
	_syncgear = 1;
	};
	case "rf_swat_sniper": {
	/////////////////////
	//Refund Swat sniper
	/////////////////////
	_amount = 80000;
	_sell = 1;
	_nomoneycheck = 1;
	_syncgear = 1;
	};
	case "rf_swat_bomb": {
	/////////////////////
	//Refund Swat Bomb Loadout
	/////////////////////
	_amount = 48000;
	_sell = 1;
	_nomoneycheck = 1;
	_syncgear = 1;
	};
	
	case "rf_military_rifleman": {
	/////////////////////
	//Refund military rifleman Loadout
	/////////////////////
	_amount = 60000;
	_sell = 1;
	_nomoneycheck = 1;
	_syncgear = 1;
	};
	case "rf_military_machinegun": {
	/////////////////////
	//Refund military machinegun Loadout
	/////////////////////
	_amount = 75000;
	_sell = 1;
	_nomoneycheck = 1;
	_syncgear = 1;
	};
	case "rf_military_underwater": {
	/////////////////////
	//Refund military machinegun Loadout
	/////////////////////
	_amount = 30000;
	_sell = 1;
	_nomoneycheck = 1;
	_syncgear = 1;
	};
	case "rf_military_demolition": {
	/////////////////////
	//Refund military demolition Loadout
	/////////////////////
	_amount = 150000;
	_sell = 1;
	_nomoneycheck = 1;
	_syncgear = 1;
	};
	case "rf_military_spec_op": {
	/////////////////////
	//Refund military non_lethal Loadout
	/////////////////////
	_amount = 108000;
	_sell = 1;
	_nomoneycheck = 1;
	_syncgear = 1;
	};
	case "rf_military_sniper": {
	/////////////////////
	//Refund military sniper Loadout
	/////////////////////
	_amount = 120000;
	_sell = 1;
	_nomoneycheck = 1;
	_syncgear = 1;
	};
	case "rf_titan_launcher": {
	/////////////////////
	//Titan launcher loadout
	/////////////////////
	if(FETCH_CONST(life_coplevel) isEqualTo 8) then {
	_amount = 70000;
	} else {
		if(FETCH_CONST(life_coplevel) isEqualTo 7) then {
		_amount = 75000;
			} else {
			if(FETCH_CONST(life_coplevel) isEqualTo 6) then {
			_amount = 80000;
					} else {
					if(FETCH_CONST(life_coplevel) isEqualTo 5) then {
					_amount = 85000;
						} else {
						if(FETCH_CONST(life_coplevel) isEqualTo 4) then {
						_amount = 90000;
								} else {
								if(FETCH_CONST(life_coplevel) isEqualTo 3) then {
								_amount = 95000;
									} else {
									if(FETCH_CONST(life_coplevel) isEqualTo 2) then {
									_amount = 100000;
										} else {
										if(FETCH_CONST(life_coplevel) isEqualTo 1) then {
										_amount = 105000;
											} else {
											_amount = 110000;
											};
										};
									};
								};
						};
					};
			};
	};
	_sell = 1;
	_nomoneycheck = 1;
	_syncgear = 1;
	_remove = 1;
	};
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if(_popup == 1) then {
if(_sell == 0) then {
_window = [
			format["Are you sure you wish to clear and purchase this :%1:? <br/><br/>It will cost you <t color='#8cff9b'>$%2</t> cash.",_loadoutName,[_amount] call life_fnc_numberText],
			"Purchase Loadout",
			"Purchase",
			"No"
		] call BIS_fnc_guiMessage;
} else {
_window = [
			format["Are you sure you wish to refund a portion of your current gear?<br/><br/>You will get 60 procent cash refunded. <br/><t color='#8cff9b'>$%1</t> ",[_amount] call life_fnc_numberText],
			"Refund Loadout",
			"Refund",
			"No"
		] call BIS_fnc_guiMessage;
};

if(_window) then {
//Dead and vehicle check
if (vehicle player != player) exitWith { hint "Get out of your vehicle, you can't fit clothes like that!";_bad = 1;};
if(!alive player) exitWith {hint"You are dead so doesn't matter what decision you make";_bad = 1;};
if((player getVariable "restrained")) exitWith {hint"You are restrained therefore you can't interact";_bad = 1;};
if(life_istazed) exitWith {hint"You are tazed you can't interact";_bad = 1;};
if((animationState player) == "Incapacitated") exitWith {hint"You are down on the ground, you can't interact!";_bad = 1;};

//Check if the player has money in his hand or bank if it applies to him

if(_nomoneycheck isEqualTo 0) then {
if(_bank isEqualTo 0) then {
//Check cash
if(CASH <_amount) exitWith {hint "You do not have enough Cash!";_bad = 1;};
} else {
//Check bank
if(BANK <_amount) exitWith {hint "You do not have enough Bank Balance!";_bad = 1;};
};
} else {
};

if(_bad isEqualTo 1) exitWith {};
uiSleep 0.1;

//Do the necessary money stuff
if(_sell isEqualTo 0) then {
	if(_bank isEqualTo 0) then {
	life_cash = life_cash - _amount;
	[0] call SOCK_fnc_updatePartial;
	} else {
		life_atmbank = life_atmbank - _amount;
		[1] call SOCK_fnc_updatePartial;
		};
			} else {
			life_atmbank = life_atmbank + _amount;
			[1] call SOCK_fnc_updatePartial;
};

if(_sell == 0) then {
hint parseText format["<t color='#00ff00'><t align='center'><t size='1'>COMPLETED<br/><br/></t><t color='#FFFFFF'>You bought the %1 for:</t> <br/><t color='#8cff9b'>$%2</t>",_loadoutName,[_amount] call life_fnc_numberText];
titleText [format["Your money got deducted with $ %2 for the following loadout: %1 ",_loadoutName,[_amount] call life_fnc_numberText],"PLAIN"];
player say3D "register";
} else {
hint parseText format["<t color='#00ff00'><t align='center'><t size='1'>COMPLETED<br/><br/></t><t color='#FFFFFF'>You got: </t><t color='#8cff9b'>$%1</t> refunded",[_amount] call life_fnc_numberText];
titleText [format["Your bank account increased with $ %1.",[_amount] call life_fnc_numberText],"PLAIN"];
player say3D "register";
};

if(_remove isEqualTo 0) then {
//Remove all current weapons, gears and other bullshit...
RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
{
	player unassignItem _x;
	player removeItem _x;
} foreach (assignedItems player);
} else {
};

Uisleep 0.1;

if(_syncgear isEqualTo 1) then {
[3] call SOCK_fnc_updatePartial;
};

switch (_value) do {
	case "PMC_marksman": {
	/////////////////////
	//PMC Marksman loudout
	/////////////////////
	
	_yItems = ["waterBottle","waterBottle","rabbit","rabbit","ziptie"];
		
		
	//GEAR	
	player addHeadgear "H_ShemagOpen_tan";
	player addUniform "U_I_HeliPilotCoveralls";
	player addVest "V_PlateCarrierH_CTRG";
	player addBackpack "B_FieldPack_cbr";
	player addGoggles "G_Bandanna_tan";
	player addItem "NVGoggles";
	player assignItem "NVGoggles";
	
	//To have 1mag loaded
	player addMagazine "10Rnd_93x64_DMR_05_Mag";
	player addMagazine "30Rnd_9x21_Mag";
	
	//Weaponary
	player addWeapon "srifle_DMR_05_tan_f";
	player addWeapon "hgun_Rook40_snds_F";
	player addPrimaryWeaponItem "optic_AMS_snd";
	player addPrimaryWeaponItem "bipod_01_F_snd";
	player addPrimaryWeaponItem "muzzle_snds_93mmg_tan";
	
	
	//Rangefinder
	player addWeapon "Laserdesignator_02";
	
	//PMC gear
	player addMagazine "MiniGrenade";
	player addMagazine "SmokeShellOrange";
	
	//Magazines
	player addMagazines ["10Rnd_93x64_DMR_05_Mag",3];
	player addMagazines ["30Rnd_9x21_Mag",2];
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["FirstAidKit", 2];
	_playerbackpack addMagazineCargoGlobal ["10Rnd_93x64_DMR_05_Mag", 6];

	//Assign Y-Items
	{[true,_x,1] call life_fnc_handleInv;} foreach (_yItems);
	
	//ITEMS
	{
    if (_x != "") then {
        player linkItem _x;
    };
	} foreach (_deluxitems);
	};
	case "PMC_rifleman": {
	/////////////////////
	//PMC Rifleman loudout
	/////////////////////
	
	_yItems = ["waterBottle","waterBottle","rabbit","rabbit","ziptie"];
		
		
	//GEAR	
	player addHeadgear "H_ShemagOpen_tan";
	player addUniform "U_I_HeliPilotCoveralls";
	player addVest "V_PlateCarrierH_CTRG";
	player addBackpack "B_FieldPack_cbr";
	player addGoggles "G_Bandanna_tan";
	player linkItem "NVGoggles";
	
	//To have 1mag loaded
	player addMagazine "30Rnd_556x45_Stanag_Tracer_Yellow";
	player addMagazine "30Rnd_9x21_Mag";
	player addMagazine "1Rnd_HE_Grenade_shell";
	player addMagazine "1Rnd_SmokeOrange_Grenade_shell";
	
	//Weaponary
	player addWeapon "arifle_Mk20_GL_plain_F";
	player addWeapon "hgun_Rook40_snds_F";
	player addPrimaryWeaponItem "optic_Arco";
	player addPrimaryWeaponItem "bipod_01_F_snd";
	player addPrimaryWeaponItem "muzzle_snds_M";

	//Rangefinder
	player addWeapon "Rangefinder";
	
	//PMC gear
	player addMagazine "MiniGrenade";
	player addMagazine "SmokeShellOrange";
	
	//Magazines
	player addMagazines ["30Rnd_556x45_Stanag_Tracer_Yellow",2];
	player addMagazines ["30Rnd_9x21_Mag",1];
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["FirstAidKit", 2];
	_playerbackpack addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Yellow", 9];
	_playerbackpack addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 1];

	//Assign Y-Items
	{[true,_x,1] call life_fnc_handleInv;} foreach (_yItems);
	
	//ITEMS
	{
    if (_x != "") then {
        player LinkItem _x;
    };
	} foreach (_deluxitems);
	};
	case "PMC_machinegunner": {
	/////////////////////
	//PMC Machinegunner loudout
	/////////////////////
	
	_yItems = ["waterBottle","waterBottle","rabbit","rabbit","ziptie"];
		
		
	//GEAR	
	player addHeadgear "H_ShemagOpen_tan";
	player addUniform "U_I_HeliPilotCoveralls";
	player addVest "V_PlateCarrierH_CTRG";
	player addBackpack "B_FieldPack_cbr";
	player addGoggles "G_Bandanna_tan";
	player linkItem "NVGoggles";
	
	//To have 1mag loaded
	player addMagazine "130Rnd_338_Mag";
	player addMagazine "30Rnd_9x21_Mag";
	
	//Weaponary
	player addWeapon "MMG_02_sand_F";
	player addWeapon "hgun_Rook40_snds_F";
	player addPrimaryWeaponItem "optic_Arco";
	player addPrimaryWeaponItem "bipod_01_F_snd";
	player addPrimaryWeaponItem "muzzle_snds_338_sand";

	//Rangefinder
	player addWeapon "Rangefinder";
	
	//PMC gear
	player addMagazine "MiniGrenade";
	player addMagazine "MiniGrenade";
	player addMagazine "SmokeShellOrange";
	
	//Magazines
	player addMagazines ["130Rnd_338_Mag",2];
	player addMagazines ["30Rnd_9x21_Mag",2];
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["FirstAidKit", 2];
	_playerbackpack addMagazineCargoGlobal ["130Rnd_338_Mag", 5];

	//Assign Y-Items
	{[true,_x,1] call life_fnc_handleInv;} foreach (_yItems);
	
	//ITEMS
	{
    if (_x != "") then {
        player addItem _x;
    };
	} foreach (_deluxitems);
	
	//Assign items
	{
    if (_x != "") then {
        player assignItem _x;
    };
	} foreach (_deluxitems);
	};
	case "rebel_AKS74U": {
	/////////////////////
	//Rebel AKS74U loadout
	/////////////////////
	
	//GEAR	
	player addHeadgear (_rebelheadgear select (floor(random (count _rebelheadgear))));
	player addUniform (_rebelclothing select (floor(random (count _rebelclothing))));
	player addVest (_rebelvest select (floor(random (count _rebelvest))));
	player addBackpack (_rebelbackpacks select (floor(random (count _rebelbackpacks))));
	player addGoggles (_rebelgoggles select (floor(random (count _rebelgoggles))));
	player linkItem "NVGoggles_tna_F";
	
	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "30Rnd_545x39_Mag_F";
	player addWeapon "arifle_AKS_F";
	
	
	//Adding Magazines
	player addMagazines ["30Rnd_545x39_Mag_F",4];
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];

	
	//ITEMS
	{
    if (_x != "") then {
        player linkItem _x;
    };
	} foreach (_normalitems);
	};
	case "assassin": {
	/////////////////////
	//assassin loadout
	/////////////////////
	
	//GEAR	
	player addHeadgear "H_HelmetO_ViperSP_hex_F";
	player addUniform (_assassinc select (floor(random (count _assassinc))));
	player addVest (_assassinv select (floor(random (count _assassinv))));
	player addBackpack (_assassinb select (floor(random (count _assassinb))));
	
	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "30Rnd_65x39_caseless_green";
	player addWeapon "arifle_ARX_blk_F";
	
	
	//Adding Magazines
	player addMagazines ["30Rnd_65x39_caseless_green",9];
	player addMagazines ["10Rnd_50BW_Mag_F",3];
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];

	
	//ITEMS
	{
    if (_x != "") then {
        player linkItem _x;
    };
	} foreach (_normalitems);
	};
	case "rebel_AKM": {
	/////////////////////
	//Rebel AKM Loadout
	/////////////////////
	
	//GEAR	
	player addHeadgear (_rebelheadgear select (floor(random (count _rebelheadgear))));
	player addUniform (_rebelclothing select (floor(random (count _rebelclothing))));
	player addVest (_rebelvest select (floor(random (count _rebelvest))));
	player addBackpack (_rebelbackpacks select (floor(random (count _rebelbackpacks))));
	player addGoggles (_rebelgoggles select (floor(random (count _rebelgoggles))));
	player linkItem "NVGoggles_tna_F";
	
	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "30Rnd_762x39_Mag_F";
	player addWeapon "arifle_AKM_F";
	
	//Adding Magazines
	player addMagazines ["30Rnd_762x39_Mag_F",4];
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];

	
	//ITEMS
	{
    if (_x != "") then {
        player linkItem _x;
    };
	} foreach (_normalitems);
	};
	case "rebel_CMR76": {
	/////////////////////
	//Rebel Rahim Loadout
	/////////////////////
	
	//GEAR	
	player addHeadgear (_rebelheadgear select (floor(random (count _rebelheadgear))));
	player addUniform (_ghillieclothing select (floor(random (count _ghillieclothing))));
	player addVest (_rebelvest select (floor(random (count _rebelvest))));
	player addBackpack (_rebelbackpacks select (floor(random (count _rebelbackpacks))));
	player addGoggles (_rebelgoggles select (floor(random (count _rebelgoggles))));
	player linkItem "NVGoggles_tna_F";
	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "20Rnd_650x39_Cased_Mag_F";
	player addWeapon "srifle_DMR_07_ghex_F";
	
	//Rangefinder
	player addWeapon "Rangefinder";
	
	//Adding Magazines
	player addMagazines ["20Rnd_650x39_Cased_Mag_F",4];
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];

	
	//ITEMS
	{
    if (_x != "") then {
        player linkItem _x;
    };
	} foreach (_normalitems);
	};
		case "rebel_AKM": {
	/////////////////////
	//Rebel AKM Loadout
	/////////////////////
	
	//GEAR	
	player addHeadgear (_rebelheadgear select (floor(random (count _rebelheadgear))));
	player addUniform (_rebelclothing select (floor(random (count _rebelclothing))));
	player addVest (_rebelvest select (floor(random (count _rebelvest))));
	player addBackpack (_rebelbackpacks select (floor(random (count _rebelbackpacks))));
	player addGoggles (_rebelgoggles select (floor(random (count _rebelgoggles))));
	player linkItem "NVGoggles_tna_F";
	
	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "30Rnd_762x39_Mag_F";
	player addWeapon "arifle_AKM_F";
	
	//Adding Magazines
	player addMagazines ["30Rnd_762x39_Mag_F",4];
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];

	
	//ITEMS
	{
    if (_x != "") then {
        player linkItem _x;
    };
	} foreach (_normalitems);
	};
	case "rebel_mk200": {
	/////////////////////
	//Rebel Rahim Loadout
	/////////////////////
	
	//GEAR	
	player addHeadgear (_rebelheadgear select (floor(random (count _rebelheadgear))));
	player addUniform (_ghillieclothing select (floor(random (count _ghillieclothing))));
	player addVest (_rebelvest select (floor(random (count _rebelvest))));
	player addBackpack (_rebelbackpacks select (floor(random (count _rebelbackpacks))));
	player addGoggles (_rebelgoggles select (floor(random (count _rebelgoggles))));
	player linkItem "NVGoggles_tna_F";
	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "200Rnd_65x39_cased_Box";
	player addWeapon "LMG_Mk200_F";
	
	//Rangefinder
	player addWeapon "Rangefinder";
	
	//Adding Magazines
	player addMagazines ["200Rnd_65x39_cased_Box",3];
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];

	
	//ITEMS
	{
    if (_x != "") then {
        player linkItem _x;
    };
	} foreach (_normalitems);
	};
	case "underwater_normal": {
	/////////////////////
	//Underwater loadout
	/////////////////////
	
	//GEAR	
	//player addHeadgear (_rebelheadgear select (floor(random (count _rebelheadgear))));
	player forceAddUniform (_wetsuitsclothing select (floor(random (count _wetsuitsclothing))));
	player addVest (_rebreathers select (floor(random (count _rebreathers))));
	player addBackpack (_assaultpackbackpacks select (floor(random (count _assaultpackbackpacks))));
	player addGoggles (_divinggoggles select (floor(random (count _divinggoggles))));
	_nv = (_nvgoggles select (floor(random (count _nvgoggles))));
	player linkItem _nv;
	
	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "20Rnd_556x45_UW_mag";
	player addWeapon "arifle_SDAR_F";
	//Add a scope
	player addPrimaryWeaponItem (_cqbscopes select (floor(random (count _cqbscopes))));
	//Add a laser or light
	player addPrimaryWeaponItem (_acc select (floor(random (count _acc))));

	//Adding Magazines
	player addMagazines ["20Rnd_556x45_UW_mag",4];
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];

	//ITEMS
	{
    if (_x != "") then {
        player linkItem _x;
    };
	} foreach (_deluxitems);
	};
	case "underwater_cop": {
	/////////////////////
	//Underwater loadout
	/////////////////////
	
	//GEAR	
	//player addHeadgear (_rebelheadgear select (floor(random (count _rebelheadgear))));
	player forceAddUniform (_wetsuitsclothing select (floor(random (count _wetsuitsclothing))));
	player addVest (_rebreathers select (floor(random (count _rebreathers))));
	player addBackpack (_assaultpackbackpacks select (floor(random (count _assaultpackbackpacks))));
	player addGoggles (_divinggoggles select (floor(random (count _divinggoggles))));
	_nv = (_nvgoggles select (floor(random (count _nvgoggles))));
	player linkItem _nv;
	
	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "20Rnd_556x45_UW_mag";
	player addWeapon "arifle_SDAR_F";
	player addMagazine "30Rnd_9x21_Mag";
	player addWeapon "hgun_P07_snds_F";
	
	//Add a scope
	player addPrimaryWeaponItem (_cqbscopes select (floor(random (count _cqbscopes))));
	//Add a laser or light
	player addPrimaryWeaponItem (_acc select (floor(random (count _acc))));
	
	//vest adding
	player addItemToVest "20Rnd_556x45_UW_mag";
	player addItemToVest "20Rnd_556x45_UW_mag";
	
	//Adding Magazines
	player addMagazines ["20Rnd_556x45_UW_mag",4];
	player addMagazines ["30Rnd_9x21_Mag",2];
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];

	//ITEMS
	{
    if (_x != "") then {
        player linkItem _x;
    };
	} foreach (_deluxitems);
	};
	case "underwater_military": {
	/////////////////////
	//Underwater loadout
	/////////////////////
	
	//GEAR	
	player addHeadgear "H_HelmetB_TI_tna_F";
	player forceAddUniform "U_B_survival_uniform";
	player addVest "V_RebreatherIR";
	player addBackpack "B_Parachute";
	player addGoggles "G_O_Diving";
	player linkItem "NVGoggles";
	
	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "20Rnd_556x45_UW_mag";
	player addWeapon "arifle_SDAR_F";
	player addMagazine "30Rnd_9x21_Mag";
	player addWeapon "hgun_Pistol_heavy_01_F";
	player addHandgunItem "optic_MRD";
	player addHandgunItem "muzzle_snds_acp";
	
	//vest adding
	player addItemToVest "20Rnd_556x45_UW_mag";
	player addItemToVest "20Rnd_556x45_UW_mag";
	player addItemToVest "20Rnd_556x45_UW_mag";
	player addItemToVest "20Rnd_556x45_UW_mag";
	
	//Adding Magazines
	player addMagazines ["20Rnd_556x45_UW_mag",2];
	player addMagazines ["11Rnd_45ACP_Mag",2];

	//ITEMS
	{
    if (_x != "") then {
        player linkItem _x;
    };
	} foreach (_deluxitems);
	};
	case "rebel_AKS74U": {
	/////////////////////
	//Rebel AKS74U loadout
	/////////////////////
	
	//GEAR	
	player addHeadgear (_rebelheadgear select (floor(random (count _rebelheadgear))));
	player addUniform (_rebelclothing select (floor(random (count _rebelclothing))));
	player addVest (_rebelvest select (floor(random (count _rebelvest))));
	player addBackpack (_rebelbackpacks select (floor(random (count _rebelbackpacks))));
	player addGoggles (_rebelgoggles select (floor(random (count _rebelgoggles))));
	player linkItem "NVGoggles_tna_F";
	
	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "30Rnd_545x39_Mag_F";
	player addWeapon "arifle_AKS_F";
	
	
	//Adding Magazines
	player addMagazines ["30Rnd_545x39_Mag_F",4];
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];

	
	//ITEMS
	{
    if (_x != "") then {
        player linkItem _x;
    };
	} foreach (_normalitems);
	};
	case "rebel_mk14": {
	/////////////////////
	//Rebel MK14 loadout
	/////////////////////
	
	//GEAR	
	player addHeadgear (_rebelheadgear select (floor(random (count _rebelheadgear))));
	player addUniform (_rebelclothing select (floor(random (count _rebelclothing))));
	player addVest (_rebelvest select (floor(random (count _rebelvest))));
	player addBackpack (_rebelbackpacks select (floor(random (count _rebelbackpacks))));
	player addGoggles (_rebelgoggles select (floor(random (count _rebelgoggles))));
	_nv = (_nvgoggles select (floor(random (count _nvgoggles))));
	player linkItem _nv;
	
	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "20Rnd_762x51_Mag";
	player addWeapon (_mk14 select (floor(random (count _mk14))));
	
	//Add a scope
	player addPrimaryWeaponItem (_longscopes select (floor(random (count _longscopes))));
	//Add a laser or light
	player addPrimaryWeaponItem (_acc select (floor(random (count _acc))));
	//Add Bipod
	player addPrimaryWeaponItem (_bipods select (floor(random (count _bipods))));
	
	//Adding Magazines
	player addMagazines ["20Rnd_762x51_Mag",6];
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];

	
	//ITEMS
	{
    if (_x != "") then {
        player linkItem _x;
    };
	} foreach (_normalitems);
	};
	case "federalbank": {
	/////////////////////
	//Federal Bank loadout
	/////////////////////
	
	//Y-items
	//_yItems = ["life_inv_redgull","life_inv_redgull","life_inv_tbacon","life_inv_tbacon","life_inv_blastingcharge","life_inv_boltcutter","life_inv_boltcutter","life_inv_boltcutter","life_inv_lockpick","life_inv_lockpick","life_inv_lockpick","life_inv_ziptie","life_inv_ziptie"];
	_yItems = ["blastingcharge","lockpick","ziptie","ziptie","water","water","burger","burger","boltcutter"];
	
	//GEAR	
	removeBackpack player;
	uiSleep 0.1;
	player addBackpack "B_Bergen_mcamo_F";

	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];
	_playerbackpack addItemCargoGlobal ["FirstAidKit", 2];
	
	//Assign Y-Items
	{[true,_x,1] call life_fnc_handleInv;} foreach (_yItems);
	
	//ITEMS
	{
    if (_x != "") then {
        player linkItem _x;
    };
	} foreach (_deluxitems);
	};
	case "rebel_mx": {
	/////////////////////
	//Rebel MX loadout
	/////////////////////
	
	//GEAR	
	player addHeadgear (_rebelheadgear select (floor(random (count _rebelheadgear))));
	player addUniform (_rebelclothing select (floor(random (count _rebelclothing))));
	player addVest (_rebelvest select (floor(random (count _rebelvest))));
	player addBackpack (_rebelbackpacks select (floor(random (count _rebelbackpacks))));
	player addGoggles (_rebelgoggles select (floor(random (count _rebelgoggles))));
	_nv = (_nvgoggles select (floor(random (count _nvgoggles))));
	player linkItem _nv;
	
	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "30Rnd_65x39_caseless_mag";
	player addWeapon "arifle_MX_F";
	//Add a scope
	player addPrimaryWeaponItem (_combatscopes select (floor(random (count _combatscopes))));
	//Add a laser or light
	player addPrimaryWeaponItem (_acc select (floor(random (count _acc))));
	
	//Adding Magazines
	player addMagazines ["30Rnd_65x39_caseless_mag",4];
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];

	
	//ITEMS
	//ADD items
	{
    if (_x != "") then {
        player linkItem _x;
    };
	} foreach (_normalitems);
	};
	case "rebel_MX_SW": {
	/////////////////////
	//Rebel MX_SW Loadout
	/////////////////////
	
	//GEAR	
	player addHeadgear (_rebelheadgear select (floor(random (count _rebelheadgear))));
	player addUniform (_rebelclothing select (floor(random (count _rebelclothing))));
	player addVest (_rebelvest select (floor(random (count _rebelvest))));
	player addBackpack (_rebelbackpacks select (floor(random (count _rebelbackpacks))));
	player addGoggles (_rebelgoggles select (floor(random (count _rebelgoggles))));
	_nv = (_nvgoggles select (floor(random (count _nvgoggles))));
	player linkItem _nv;
	
	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "100Rnd_65x39_caseless_mag_Tracer";
	player addWeapon "arifle_MX_SW_F";
	
	//Add a scope
	player addPrimaryWeaponItem (_combatscopes select (floor(random (count _combatscopes))));
	//Add a laser or light
	player addPrimaryWeaponItem (_acc select (floor(random (count _acc))));
	//Add Bipod
	player addPrimaryWeaponItem (_bipods select (floor(random (count _bipods))));
	
	//Adding Magazines
	player addMagazines ["100Rnd_65x39_caseless_mag_Tracer",3];
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];

	
	//ITEMS
	{
    if (_x != "") then {
        player linkItem _x;
    };
	} foreach (_normalitems);
	};
	case "rebel_rahim": {
	/////////////////////
	//Rebel Rahim Loadout
	/////////////////////
	
	//GEAR	
	player addHeadgear (_rebelheadgear select (floor(random (count _rebelheadgear))));
	player addUniform (_ghillieclothing select (floor(random (count _ghillieclothing))));
	player addVest (_rebelvest select (floor(random (count _rebelvest))));
	player addBackpack (_rebelbackpacks select (floor(random (count _rebelbackpacks))));
	player addGoggles (_rebelgoggles select (floor(random (count _rebelgoggles))));
	_nv = (_nvgoggles select (floor(random (count _nvgoggles))));
	player linkItem _nv;

	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "10Rnd_762x54_Mag";
	player addWeapon "srifle_DMR_01_F";
	
	//Rangefinder
	player addWeapon "Rangefinder";
	
	//Add a scope
	player addPrimaryWeaponItem (_longscopes select (floor(random (count _longscopes))));
	//Add a laser or light
	player addPrimaryWeaponItem (_acc select (floor(random (count _acc))));
	//Add Bipod
	player addPrimaryWeaponItem (_bipods select (floor(random (count _bipods))));
	
	//Adding Magazines
	player addMagazines ["10Rnd_762x54_Mag",6];
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];

	
	//ITEMS
	{
    if (_x != "") then {
        player addItem _x;
    };
	} foreach (_normalitems);
	
	//Assign items
	{
    if (_x != "") then {
        player assignItem _x;
    };
	} foreach (_normalitems);
	};
	case "rebel_ebr": {
	/////////////////////
	//Rebel EBR Loadout
	/////////////////////
	
	//GEAR	
	player addHeadgear (_rebelheadgear select (floor(random (count _rebelheadgear))));
	player addUniform (_ghillieclothing select (floor(random (count _ghillieclothing))));
	player addVest (_rebelvest select (floor(random (count _rebelvest))));
	player addBackpack (_rebelbackpacks select (floor(random (count _rebelbackpacks))));
	player addGoggles (_rebelgoggles select (floor(random (count _rebelgoggles))));
	_nv = (_nvgoggles select (floor(random (count _nvgoggles))));
	player addItem _nv;
	player assignItem _nv;

	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "20Rnd_762x51_Mag";
	player addWeapon "srifle_EBR_F";
	
	//Rangefinder
	player addWeapon "Rangefinder";
	
	//Add a scope
	player addPrimaryWeaponItem (_longscopes select (floor(random (count _longscopes))));
	//Add a laser or light
	player addPrimaryWeaponItem (_acc select (floor(random (count _acc))));
	//Add Bipod
	player addPrimaryWeaponItem (_bipods select (floor(random (count _bipods))));
	
	//Adding Magazines
	player addMagazines ["20Rnd_762x51_Mag",4];
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];

	
	//ITEMS
	{
    if (_x != "") then {
        player addItem _x;
    };
	} foreach (_normalitems);
	
	//Assign items
	{
    if (_x != "") then {
        player assignItem _x;
    };
	} foreach (_normalitems);
	};
	case "rebel_AKM": {
	/////////////////////
	//Rebel AKM Loadout
	/////////////////////
	
	//GEAR	
	player addHeadgear (_rebelheadgear select (floor(random (count _rebelheadgear))));
	player addUniform (_rebelclothing select (floor(random (count _rebelclothing))));
	player addVest (_rebelvest select (floor(random (count _rebelvest))));
	player addBackpack (_rebelbackpacks select (floor(random (count _rebelbackpacks))));
	player addGoggles (_rebelgoggles select (floor(random (count _rebelgoggles))));
	player linkItem "NVGoggles_tna_F";
	
	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "30Rnd_762x39_Mag_F";
	player addWeapon "arifle_AKM_F";
	
	//Adding Magazines
	player addMagazines ["30Rnd_762x39_Mag_F",4];
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];

	
	//ITEMS
	{
    if (_x != "") then {
        player addItem _x;
    };
	} foreach (_normalitems);
	
	//Assign items
	{
    if (_x != "") then {
        player assignItem _x;
    };
	} foreach (_normalitems);
	};
	case "rebel_MX": {
	/////////////////////
	//Rebel MX Loadout
	/////////////////////
	
	//GEAR	
	player addHeadgear (_rebelheadgear select (floor(random (count _rebelheadgear))));
	player addUniform (_rebelclothing select (floor(random (count _rebelclothing))));
	player addVest (_rebelvest select (floor(random (count _rebelvest))));
	player addBackpack (_rebelbackpacks select (floor(random (count _rebelbackpacks))));
	player addGoggles (_rebelgoggles select (floor(random (count _rebelgoggles))));
	player linkItem "NVGoggles_tna_F";
	
	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "30Rnd_65x39_caseless_green_mag_Tracer";
	player addWeapon "arifle_MX_khk_F";
	
	//Adding Magazines
	player addMagazines ["30Rnd_65x39_caseless_green_mag_Tracer",4];
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];

	
	//ITEMS
	{
    if (_x != "") then {
        player addItem _x;
    };
	} foreach (_normalitems);
	
	//Assign items
	{
    if (_x != "") then {
        player assignItem _x;
    };
	} foreach (_normalitems);
	};
	case "rebel_CMR76": {
	/////////////////////
	//Rebel Rahim Loadout
	/////////////////////
	
	//GEAR	
	player addHeadgear (_rebelheadgear select (floor(random (count _rebelheadgear))));
	player addUniform (_ghillieclothing select (floor(random (count _ghillieclothing))));
	player addVest (_rebelvest select (floor(random (count _rebelvest))));
	player addBackpack (_rebelbackpacks select (floor(random (count _rebelbackpacks))));
	player addGoggles (_rebelgoggles select (floor(random (count _rebelgoggles))));
	player linkItem "NVGoggles_tna_F";
	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "20Rnd_650x39_Cased_Mag_F";
	player addWeapon "srifle_DMR_07_ghex_F";
	
	//Rangefinder
	player addWeapon "Rangefinder";
	
	//Adding Magazines
	player addMagazines ["20Rnd_650x39_Cased_Mag_F",4];
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];

	
	//ITEMS
	{
    if (_x != "") then {
        player addItem _x;
    };
	} foreach (_normalitems);
	
	//Assign items
	{
    if (_x != "") then {
        player assignItem _x;
    };
	} foreach (_normalitems);
	};
	case "cop_lethal": {
	/////////////////////
	//Cop Lethal Loadout
	/////////////////////
	if(playerSide != west) exitWith { hint "You are not in the police force!"};
	
	_yItems = ["defusekit"];
	
	//GEAR	
	player addHeadgear "H_HelmetB_light_black";
	player addGoggles "G_Balaclava_combat";
	if(395180 in getDLCs 1) then {player addUniform "U_B_GEN_Soldier_F";}else{player addUniform "U_Rangemaster";};
	player addVest "V_PlateCarrier1_blk";
	if(395180 in getDLCs 1) then {player addBackpack "B_ViperLightHarness_blk_F";}else{player addBackpack "B_TacticalPack_blk"};
	player linkItem "NVGoggles_OPFOR";	
	
	
	if(FETCH_CONST(life_coplevel) > 6) then {
	if(395180 in getDLCs 1) then {player addWeapon "arifle_SPAR_03_blk_F";}else{player addWeapon "srifle_EBR_F";};
	if(395180 in getDLCs 1) then {player addMagazine "20Rnd_762x51_Mag";}else{player addMagazine "20Rnd_762x51_Mag";};
	player addPrimaryWeaponItem "acc_pointer_IR";
	player addPrimaryWeaponItem "optic_MRCO";
	if(395180 in getDLCs 1) then {player addMagazines ["20Rnd_762x51_Mag",5];}else{player addMagazines ["20Rnd_762x51_Mag",5];};
	} else {
			if(FETCH_CONST(life_coplevel) > 4) then {
							player addMagazine "30Rnd_65x39_caseless_mag";
							player addWeapon "arifle_MXM_Black_F";
							player addPrimaryWeaponItem "acc_pointer_IR";
							player addPrimaryWeaponItem "optic_MRCO";
							_playerbackpack = unitBackpack player;
							_playerbackpack addItemCargoGlobal ["Toolkit", 1];
							_playerbackpack addItemCargoGlobal ["FirstAidKit", 1];
							player addMagazines ["30Rnd_65x39_caseless_mag",5];	
								} else {
								if(FETCH_CONST(life_coplevel) > 2) then {
									player addMagazine "30Rnd_65x39_caseless_mag";
									player addWeapon "arifle_MXC_Black_F";
									player addPrimaryWeaponItem "acc_pointer_IR";
									player addPrimaryWeaponItem "optic_Holosight_blk_F";
									_playerbackpack = unitBackpack player;
									_playerbackpack addItemCargoGlobal ["Toolkit", 1];
									_playerbackpack addItemCargoGlobal ["FirstAidKit", 1];
									player addMagazines ["30Rnd_65x39_caseless_mag",5];	
									} else {
												if(395180 in getDLCs 1) then {player addWeapon "arifle_CTAR_blk_F";}else{player addWeapon "arifle_Mk20C_plain_F";};
												if(395180 in getDLCs 1) then {player addMagazine "30Rnd_580x42_Mag_F";}else{player addMagazine "30Rnd_556x45_Stanag";};
												player addPrimaryWeaponItem "acc_pointer_IR";
												player addPrimaryWeaponItem "optic_Aco";
												
												_playerbackpack = unitBackpack player;
												_playerbackpack addItemCargoGlobal ["Toolkit", 1];
												_playerbackpack addItemCargoGlobal ["FirstAidKit", 1];
												if(395180 in getDLCs 1) then {player addMagazines ["30Rnd_580x42_Mag_F",5];}else{player addMagazines ["30Rnd_556x45_Stanag",5];};
											};
					};
	};

	player addWeapon "hgun_P07_snds_F";
	player addWeapon "Rangefinder";
	player addMagazines ["30Rnd_9x21_Mag",2];
	
	//Assign Y-Items
	{[true,_x,1] call life_fnc_handleInv;} foreach (_yItems);
	
	
	//ITEMS
	{
    if (_x != "") then {
        player addItem _x;
    };
	} foreach (_deluxitems);
	
	//Assign items
	{
    if (_x != "") then {
        player assignItem _x;
    };
	} foreach (_deluxitems);
	};
	case "cop_titan_launcher": {
	/////////////////////
	//Cop Titan Launcher
	/////////////////////
	if(playerSide != west) exitWith { hint "You are not in the police force!"};
	
	//GEAR	

	removeBackpack player;
	uiSleep 0.1;
	player addBackpack "B_Bergen_mcamo_F";

	//Weaponary
	player addMagazine "Titan_AA";
	player addWeapon "launch_O_Titan_F";
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addMagazineCargoGlobal ["Titan_AA",4];
	};	
	case "cop_titan_missiles": {
	/////////////////////
	//Cop Titan missiles
	/////////////////////
	 if(playerSide != west) exitWith { hint "You are not in the police force!"};
	
	//Extra check
	if(secondaryWeapon player != "launch_O_Titan_F") exitWith {hint "You do not have a Titan Launcher";};
	
	//GEAR	
	removeBackpack player;
	uiSleep 0.1;
	player addBackpack "B_Bergen_mcamo_F";


	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addMagazineCargoGlobal ["Titan_AA",4];
	};
	case "cop_rpg_launcher": {
	/////////////////////
	//Cop Titan Launcher
	/////////////////////
	if(playerSide != west) exitWith { hint "You are not in the police force!"};
	
	//GEAR	

	removeBackpack player;
	uiSleep 0.1;
	player addBackpack "B_Bergen_mcamo_F";

	//Weaponary
	player addMagazine "RPG32_F";
	player addWeapon "launch_RPG32_F";
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addMagazineCargoGlobal ["RPG32_F",8];
	};	
	case "cop_rpg_missiles": {
	/////////////////////
	//Cop Titan missiles
	/////////////////////
	 if(playerSide != west) exitWith { hint "You are not in the police force!"};
	
	//Extra check
	if(secondaryWeapon player != "launch_RPG32_F") exitWith {hint "You do not have a RPG Launcher";};
	
	//GEAR	
	removeBackpack player;
	uiSleep 0.1;
	player addBackpack "B_Bergen_mcamo_F";
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addMagazineCargoGlobal ["RPG32_F",8];
	};
	case "cop_uav": {
	/////////////////////
	//Cop uav
	/////////////////////
	if(playerSide != west) exitWith { hint "You are not in the police force!"};
	
	//GEAR	

	removeBackpack player;
	uiSleep 0.1;
	player addHeadgear "H_HelmetSpecO_blk";
	player addBackpack "B_UAV_01_backpack_F";
	player addItem "B_UavTerminal";
	player assignItem "B_UavTerminal";

	};
	case "swat_uc": {
	/////////////////////
	//Swat Non Lethal Loadout
	/////////////////////
	if(playerSide != west) exitWith { hint "You are not in the police force!"};
	if(FETCH_CONST(life_swatlevel) < 1) exitWith { hint "You are not in SWAT!"};
	
	_yItems = ["ram","spikeStrip","defusekit"];
		
		
	//GEAR	
	player addHeadgear "H_Cap_police";
	player forceAddUniform  (_swatuc select (floor(random (count _swatuc))));
	player addVest "V_PlateCarrier2_blk";
	player addBackpack "B_ViperHarness_blk_F";
	player addGoggles "G_Balaclava_TI_G_blk_F";
	
	//Weaponary
	//To have 1mag loaded
	player addMagazine "30Rnd_556x45_Stanag";
	player addWeapon "arifle_SPAR_01_GL_blk_F";
	player addMagazine "30Rnd_9x21_Mag";
	player addWeapon "hgun_P07_snds_F";
	
	//Rangefinder
	player addWeapon "Rangefinder";
	
	//Add a laser or light
	player addPrimaryWeaponItem "acc_flashlight";
	player addPrimaryWeaponItem "optic_Hamr";
	
	//Magazines
	player addMagazines ["30Rnd_556x45_Stanag",5];
	player addMagazines ["30Rnd_9x21_Mag",2];
	player addItem "HandGrenade_Stone";
	player addItem "HandGrenade_Stone";
	player addItem "HandGrenade_Stone";
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];
	_playerbackpack addItemCargoGlobal ["FirstAidKit", 2];

	//Assign Y-Items
	{[true,_x,1] call life_fnc_handleInv;} foreach (_yItems);
	
	//ITEMS
	{
    if (_x != "") then {
        player addItem _x;
    };
	} foreach (_deluxitems);
	
	//Assign items
	{
    if (_x != "") then {
        player assignItem _x;
    };
	} foreach (_deluxitems);
	[player,"TFAegis"] call BIS_fnc_setUnitInsignia;
	};
	case "swat_nonlethal": {
	/////////////////////
	//Swat Non Lethal Loadout
	/////////////////////
	if(playerSide != west) exitWith { hint "You are not in the police force!"};
	if(FETCH_CONST(life_swatlevel) < 1) exitWith { hint "You are not in SWAT!"};
	
	player forceAddUniform "U_B_CombatUniform_mcam";
	for "_i" from 1 to 4 do {player addItemToUniform "11Rnd_45ACP_Mag";};
	player addVest "V_PlateCarrierGL_blk";
	for "_i" from 1 to 8 do {player addItemToVest "30Rnd_45ACP_Mag_SMG_01";};
	player addBackpack "B_ViperHarness_blk_F";
	player addItemToBackpack "ToolKit";
	player addItemToBackpack "FirstAidKit";
	for "_i" from 1 to 2 do {player addItemToBackpack "30Rnd_45ACP_Mag_SMG_01";};
	player addHeadgear "H_HelmetSpecB_blk";
	player addGoggles "G_Balaclava_combat";


	player addWeapon "SMG_01_F";
	player addPrimaryWeaponItem "optic_Aco_smg";
	player addWeapon "hgun_Pistol_heavy_01_F";
	player addWeapon "Rangefinder";
	player addHandgunItem "muzzle_snds_acp";
    player addHandgunItem "optic_MRD";


	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
	player linkItem "ItemRadio";
	player linkItem "ItemGPS";
	player linkItem "NVGoggles_OPFOR";

	_yItems = ["ram","spikeStrip","defusekit"];
	//Assign Y-Items
	{[true,_x,1] call life_fnc_handleInv;} foreach (_yItems);

	[player,"TFAegis"] call BIS_fnc_setUnitInsignia;
	};
	case "swat_rifleman": {
	/////////////////////
	//Swat Rifleman Loadout
	/////////////////////
	if(playerSide != west) exitWith { hint "You are not in the police force!"};
	if(FETCH_CONST(life_swatlevel) < 1) exitWith { hint "You are not in SWAT!"};
	
	
	player forceAddUniform "U_B_CombatUniform_mcam";
	for "_i" from 1 to 4 do {player addItemToUniform "30Rnd_9x21_Mag";};
	player addVest "V_PlateCarrierSpec_blk";
	for "_i" from 1 to 8 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
	player addBackpack "B_ViperHarness_blk_F";
	player addItemToBackpack "ToolKit";
	player addItemToBackpack "FirstAidKit";
	for "_i" from 1 to 2 do {player addItemToBackpack "30Rnd_65x39_caseless_mag";};
	player addHeadgear "H_HelmetSpecB_blk";
	player addGoggles "G_Balaclava_combat";


	player addWeapon "arifle_MXM_Black_F";
	player addPrimaryWeaponItem "optic_MRCO";
	player addWeapon "hgun_P07_snds_F";
	player addWeapon "Rangefinder";


	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
	player linkItem "ItemRadio";
	player linkItem "ItemGPS";
	player linkItem "NVGoggles_OPFOR";

	_yItems = ["ram","spikeStrip","defusekit"];
	//Assign Y-Items
	{[true,_x,1] call life_fnc_handleInv;} foreach (_yItems);

	[player,"TFAegis"] call BIS_fnc_setUnitInsignia;
	};
	case "swat_heavy": {
	/////////////////////
	//Swat Heavy loudout
	/////////////////////
	if(playerSide != west) exitWith { hint "You are not in the police force!"};
	if(FETCH_CONST(life_swatlevel) < 1) exitWith { hint "You are not in SWAT!"};

	player forceAddUniform "U_B_CombatUniform_mcam";
	for "_i" from 1 to 4 do {player addItemToUniform "30Rnd_9x21_Mag";};
	player addVest "V_PlateCarrier2_blk";
	for "_i" from 1 to 4 do {player addItemToVest "200Rnd_65x39_cased_Box_Tracer";};
	player addBackpack "B_ViperHarness_blk_F";
	player addItemToBackpack "ToolKit";
	player addItemToBackpack "FirstAidKit";
	for "_i" from 1 to 3 do {player addItemToBackpack "200Rnd_65x39_cased_Box_Tracer";};
	player addHeadgear "H_HelmetB_black";
	player addGoggles "G_Balaclava_combat";

	player addWeapon "LMG_Mk200_F";
	player addPrimaryWeaponItem "acc_pointer_IR";
	player addPrimaryWeaponItem "optic_Arco_blk_F";
	player addWeapon "hgun_P07_snds_F";
	player addWeapon "Rangefinder";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
	player linkItem "ItemGPS";
	player linkItem "NVGoggles_OPFOR";

	//Assign Y-Items
	_yItems = ["ram","spikeStrip","defusekit"];
	{[true,_x,1] call life_fnc_handleInv;} foreach (_yItems);

	[player,"TFAegis"] call BIS_fnc_setUnitInsignia;
	};
	case "swat_engineer": {
	/////////////////////
	//Swat Engineer RPG loadout
	/////////////////////
	if(playerSide != west) exitWith { hint "You are not in the police force!"};
	if(FETCH_CONST(life_swatlevel) < 1) exitWith { hint "You are not in SWAT!"};
	
	player forceAddUniform "U_B_CombatUniform_mcam";
	for "_i" from 1 to 4 do {player addItemToUniform "30Rnd_9x21_Mag";};
	player addVest "V_PlateCarrier2_blk";
	for "_i" from 1 to 9 do {player addItemToVest "20Rnd_762x51_Mag";};
	player addBackpack "B_ViperHarness_blk_F";
	player addItemToBackpack "ToolKit";
	player addItemToBackpack "FirstAidKit";
	for "_i" from 1 to 2 do {player addItemToBackpack "20Rnd_762x51_Mag";};
	player addItemToBackpack "MiniGrenade";
	player addHeadgear "H_HelmetB_black";
	player addGoggles "G_Balaclava_combat";

	player addWeapon "arifle_SPAR_03_blk_F";
	player addPrimaryWeaponItem "acc_pointer_IR";
	player addPrimaryWeaponItem "optic_MRCO";
	player addWeapon "hgun_P07_snds_F";
	player addWeapon "Rangefinder";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
	player linkItem "ItemGPS";
	player linkItem "NVGoggles_OPFOR";
	
	_yItems = ["ram","spikeStrip","defusekit"];
	{[true,_x,1] call life_fnc_handleInv;} foreach (_yItems);
	
	[player,"TFAegis"] call BIS_fnc_setUnitInsignia;
	};
	case "swat_sniper": {
	/////////////////////
	//Swat Sniper loadout
	/////////////////////
	if(playerSide != west) exitWith { hint "You are not in the police force!"};
	if(FETCH_CONST(life_swatlevel) < 1) exitWith { hint "You are not in SWAT!"};
	
	player forceAddUniform "U_O_GhillieSuit";
	for "_i" from 1 to 4 do {player addItemToUniform "30Rnd_9x21_Mag";};
	player addItemToUniform "10Rnd_338_Mag";
	player addVest "V_PlateCarrier2_blk";
	for "_i" from 1 to 9 do {player addItemToVest "10Rnd_338_Mag";};
	player addBackpack "B_ViperHarness_blk_F";
	player addItemToBackpack "ToolKit";
	player addItemToBackpack "FirstAidKit";
	player addHeadgear "H_HelmetB_black";
	player addGoggles "G_Balaclava_combat";

	player addWeapon "srifle_DMR_02_F";
	player addPrimaryWeaponItem "optic_AMS";
	player addPrimaryWeaponItem "bipod_02_F_blk";
	player addWeapon "hgun_P07_snds_F";
	player addWeapon "Rangefinder";


	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
	player linkItem "ItemGPS";
	player linkItem "O_NVGoggles_ghex_F";

	_yItems = ["ram","spikeStrip","defusekit"];
	//Assign Y-Items
	{[true,_x,1] call life_fnc_handleInv;} foreach (_yItems);
	

	[player,"TFAegis"] call BIS_fnc_setUnitInsignia;
	};
	case "swat_bomb": {
	/////////////////////
	//Swat BOMB squadloadout
	/////////////////////
	if(playerSide != west) exitWith { hint "You are not in the police force!"};
	if(FETCH_CONST(life_swatlevel) < 1) exitWith { hint "You are not in SWAT!"};
	
	_yItems = ["ram","spikeStrip","defusekit"];
		
	//GEAR	
	player addHeadgear "H_CrewHelmetHeli_B";
	player forceAddUniform "U_B_CombatUniform_mcam_worn";
	player addVest "V_PlateCarrierGL_blk";
	player addBackpack "B_ViperHarness_blk_F";
	player addGoggles "G_Balaclava_TI_G_blk_F";
	player linkItem "NVGoggles_OPFOR";

	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "30Rnd_556x45_Stanag_Tracer_Red";
	player addWeapon "arifle_SPAR_01_GL_blk_F";
	player addMagazine "30Rnd_9x21_Mag";
	player addWeapon "hgun_P07_snds_F";
	
	//Rangefinder
	player addWeapon "Rangefinder";
	
	player addPrimaryWeaponItem "muzzle_snds_M";
	player addPrimaryWeaponItem "acc_pointer_IR";
	player addPrimaryWeaponItem "optic_Arco_blk_F";
	
	//Magazines
	player addMagazines ["30Rnd_65x39_caseless_mag",5];
	player addMagazines ["30Rnd_9x21_Mag",2];
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];
	_playerbackpack addItemCargoGlobal ["FirstAidKit", 2];
	_playerbackpack addItemCargoGlobal ["MineDetector", 1];

	//Assign Y-Items
	{[true,_x,1] call life_fnc_handleInv;} foreach (_yItems);
	
	//ITEMS
	{
    if (_x != "") then {
        player addItem _x;
    };
	} foreach (_deluxitems);
	
	//Assign items
	{
    if (_x != "") then {
        player assignItem _x;
    };
	} foreach (_deluxitems);
	[player,"TFAegis"] call BIS_fnc_setUnitInsignia;
	};
	case "military_rifleman": {
	/////////////////////
	//Military Rifleman loadout
	/////////////////////
	if(playerSide != west) exitWith { hint "You are not in the police force!"};
	if(FETCH_CONST(life_armylevel) < 1) exitWith { hint "You are not in the Army!"};
	
	_yItems = ["ram","spikeStrip","defusekit"];
		
		
	//GEAR
	player addHeadgear "H_HelmetB_Enh_tna_F";
	player forceAddUniform "U_O_T_Soldier_F";
	player addVest "V_PlateCarrierSpec_tna_F";
	player addBackpack "B_ViperHarness_ghex_F";
	player addGoggles "G_Balaclava_TI_G_tna_F";
	player linkItem "O_NVGoggles_ghex_F";

	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "20Rnd_762x51_Mag";
	player addWeapon "srifle_DMR_03_woodland_F";
	player addMagazine "30Rnd_9x21_Green_Mag";
	player addWeapon "hgun_P07_khk_F";

	
	//Rangefinder
	player addWeapon "Rangefinder";
	
	//Silencer
	player addPrimaryWeaponItem "muzzle_snds_B_khk_F";
	player addPrimaryWeaponItem "optic_MRCO";
	player addPrimaryWeaponItem "bipod_01_F_mtp";
	
	//Backpack adding
	player addItemToVest "FirstAidKit";
	player addItemToBackpack "ToolKit";
	for "_i" from 1 to 2 do {player addItemToUniform "30Rnd_9x21_Green_Mag";};
	for "_i" from 1 to 2 do {player addItemToUniform "HandGrenade";};
	for "_i" from 1 to 2 do {player addItemToVest "30Rnd_9x21_Green_Mag";};
	for "_i" from 1 to 6 do {player addItemToVest "20Rnd_762x51_Mag";};
	for "_i" from 1 to 5 do {player addItemToBackpack "FirstAidKit";};
	for "_i" from 1 to 5 do {player addItemToBackpack "SmokeShellGreen";};
	for "_i" from 1 to 5 do {player addItemToBackpack "20Rnd_762x51_Mag";};

	//Assign Y-Items
	{[true,_x,1] call life_fnc_handleInv;} foreach (_yItems);
	
	//ITEMS
	{
    if (_x != "") then {
        player addItem _x;
    };
	} foreach (_deluxitems);
	
	//Assign items
	{
    if (_x != "") then {
        player assignItem _x;
    };
	} foreach (_deluxitems);
	
	};
	case "military_machinegun": {
	/////////////////////
	//Military Machinegun loadout
	/////////////////////
	if(playerSide != west) exitWith { hint "You are not in the police force!"};
	if(FETCH_CONST(life_armylevel) < 1) exitWith { hint "You are not in the Army!"};
	
	_yItems = ["ram","spikeStrip","defusekit"];
		
		
	//GEAR
	player addHeadgear "H_HelmetB_Enh_tna_F";
	player forceAddUniform "U_O_T_Soldier_F";
	player addVest "V_PlateCarrierSpec_tna_F";
	player addBackpack "B_ViperHarness_ghex_F";
	player addGoggles "G_Balaclava_TI_G_tna_F";
	player linkItem "O_NVGoggles_ghex_F";

	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "200Rnd_556x45_Box_F";
	player addWeapon "LMG_03_F";
	player addMagazine "30Rnd_9x21_Green_Mag";
	player addWeapon "hgun_P07_khk_F";

	player addPrimaryWeaponItem "optic_MRCO";
	
	//Rangefinder
	player addWeapon "Rangefinder";
	
	//Magazines
	player addMagazines ["200Rnd_556x45_Box_F",3];
	player addMagazines ["30Rnd_9x21_Green_Mag",2];
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];
	_playerbackpack addItemCargoGlobal ["SmokeShellGreen",1];
	_playerbackpack addItemCargoGlobal ["FirstAidKit",1];
	_playerbackpack addMagazineCargoGlobal ["200Rnd_556x45_Box_F",4];

	//Assign Y-Items
	{[true,_x,1] call life_fnc_handleInv;} foreach (_yItems);
	
	//ITEMS
	{
    if (_x != "") then {
        player addItem _x;
    };
	} foreach (_deluxitems);
	
	//Assign items
	{
    if (_x != "") then {
        player assignItem _x;
    };
	} foreach (_deluxitems);

	};
	case "military_demolition": {
	/////////////////////
	//Military Demolition loadout
	/////////////////////
	if(playerSide != west) exitWith { hint "You are not in the police force!"};
	if(FETCH_CONST(life_armylevel) < 1) exitWith { hint "You are not in the Army!"};
	
	_yItems = ["ram","spikeStrip","defusekit"];
		
		
	//GEAR
	player addHeadgear "H_HelmetB_Enh_tna_F";
	player forceAddUniform "U_O_T_Soldier_F";
	player addVest "V_PlateCarrierSpec_tna_F";
	player addBackpack "B_ViperHarness_ghex_F";
	player addGoggles "G_Balaclava_TI_G_tna_F";
	player linkItem "O_NVGoggles_ghex_F";

	//Weaponary
	player addMagazine "NLAW_F";
	player addWeapon "launch_NLAW_F";
	player addMagazine "30Rnd_580x42_Mag_F";
	player addWeapon "arifle_CTAR_GL_ghex_F";
	player addMagazine "30Rnd_9x21_Green_Mag";
	player addWeapon "hgun_P07_khk_F";

	
	//Rangefinder
	player addWeapon "Rangefinder";
	
	player addPrimaryWeaponItem "optic_MRCO";
	
	//Magazines
	for "_i" from 1 to 2 do {player addItemToUniform "30Rnd_9x21_Green_Mag";};
	for "_i" from 1 to 2 do {player addItemToUniform "HandGrenade";};
	for "_i" from 1 to 2 do {player addItemToVest "30Rnd_9x21_Green_Mag";};
	for "_i" from 1 to 6 do {player addItemToVest "30Rnd_580x42_Mag_F";};
	for "_i" from 1 to 2 do {player addItemToVest "30Rnd_9x21_Mag";};
	for "_i" from 1 to 3 do {player addItemToBackpack "1Rnd_HE_Grenade_shell";};
	for "_i" from 1 to 3 do {player addItemToBackpack "NLAW_F";};
	for "_i" from 1 to 6 do {player addItemToBackpack "30Rnd_580x42_Mag_F";};

	//Assign Y-Items
	{[true,_x,1] call life_fnc_handleInv;} foreach (_yItems);
	
	//ITEMS
	{
    if (_x != "") then {
        player addItem _x;
    };
	} foreach (_deluxitems);
	
	//Assign items
	{
    if (_x != "") then {
        player assignItem _x;
    };
	} foreach (_deluxitems);
	};
	case "military_sniper": {
	/////////////////////
	//Military sniper loadout
	/////////////////////
	if(playerSide != west) exitWith { hint "You are not in the police force!"};
	if(FETCH_CONST(life_armylevel) < 1) exitWith { hint "You are not in the Army!"};
	
	_yItems = ["ram","spikeStrip","defusekit"];
		
		
	//GEAR
	player addHeadgear "H_HelmetB_Enh_tna_F";
	player forceAddUniform "U_O_FullGhillie_ard";
	player addVest "V_PlateCarrierSpec_tna_F";
	player addBackpack "B_ViperHarness_ghex_F";
	player addGoggles "G_Balaclava_TI_G_tna_F";
	player linkItem "O_NVGoggles_ghex_F";

	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "7Rnd_408_Mag";
	player addWeapon "srifle_LRR_camo_F";
	player addMagazine "30Rnd_9x21_Green_Mag";
	player addWeapon "hgun_P07_khk_F";
	
	//Rangefinder
	player addWeapon "Rangefinder";
	
	player addPrimaryWeaponItem "optic_LRPS";

	//Magazines
	for "_i" from 1 to 2 do {player addItemToUniform "30Rnd_9x21_Green_Mag";};
	for "_i" from 1 to 2 do {player addItemToVest "30Rnd_9x21_Green_Mag";};
	for "_i" from 1 to 5 do {player addItemToVest "7Rnd_408_Mag";};
	for "_i" from 1 to 5 do {player addItemToBackpack "FirstAidKit";};
	for "_i" from 1 to 5 do {player addItemToBackpack "SmokeShellGreen";};
	for "_i" from 1 to 10 do {player addItemToBackpack "7Rnd_408_Mag";};

	//Assign Y-Items
	{[true,_x,1] call life_fnc_handleInv;} foreach (_yItems);
	
	//ITEMS
	{
    if (_x != "") then {
        player addItem _x;
    };
	} foreach (_deluxitems);
	
	//Assign items
	{
    if (_x != "") then {
        player assignItem _x;
    };
	} foreach (_deluxitems);
	
	};
	case "military_specop": {
	/////////////////////
	//Military sniper loadout
	/////////////////////
	if(playerSide != west) exitWith { hint "You are not in the police force!"};
	if(FETCH_CONST(life_armylevel) < 1) exitWith { hint "You are not in the Army!"};
	
	_yItems = ["ram","spikeStrip","defusekit"];	
		
	//GEAR
	player addHeadgear "H_HelmetB_Enh_tna_F";
	player forceAddUniform "U_O_T_Soldier_F";
	player addVest "V_PlateCarrierSpec_tna_F";
	player addBackpack "B_ViperHarness_ghex_F";
	player addGoggles "G_Balaclava_TI_G_tna_F";
	player linkItem "O_NVGoggles_ghex_F";

	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "30Rnd_65x39_caseless_green";
	player addWeapon "arifle_ARX_ghex_F";
	player addMagazine "30Rnd_9x21_Green_Mag";
	player addWeapon "hgun_P07_khk_F";

	
	//Rangefinder
	player addWeapon "Rangefinder";
	
	//Silencer
	player addPrimaryWeaponItem "muzzle_snds_B_khk_F";
	player addPrimaryWeaponItem "optic_MRCO";
	player addPrimaryWeaponItem "bipod_01_F_mtp";
	
	//Backpack adding
	player addItemToVest "FirstAidKit";
	player addItemToBackpack "ToolKit";
	for "_i" from 1 to 2 do {player addItemToUniform "30Rnd_9x21_Green_Mag";};
	for "_i" from 1 to 2 do {player addItemToUniform "HandGrenade";};
	for "_i" from 1 to 3 do {player addItemToVest "10Rnd_50BW_Mag_F";};
	for "_i" from 1 to 2 do {player addItemToVest "30Rnd_65x39_caseless_green";};
	for "_i" from 1 to 5 do {player addItemToBackpack "FirstAidKit";};
	for "_i" from 1 to 5 do {player addItemToBackpack "SmokeShellGreen";};
	for "_i" from 1 to 7 do {player addItemToBackpack "30Rnd_65x39_caseless_green";};

	//Assign Y-Items
	{[true,_x,1] call life_fnc_handleInv;} foreach (_yItems);
	
	//ITEMS
	{
    if (_x != "") then {
        player addItem _x;
    };
	} foreach (_deluxitems);
	
	//Assign items
	{
    if (_x != "") then {
        player assignItem _x;
    };
	} foreach (_deluxitems);
	
	};
	case "staff": {
	/////////////////////
	//Staff loadout
	/////////////////////
	if(playerSide != civilian) exitWith { hint "You are not a rebel!"};
	if(FETCH_CONST(life_adminlevel) < 2) exitWith { hint "You are not part of the Community Team!"};
	
	_yItems = ["waterbottle","rabbit","rabbit"];
		
		
	//GEAR
	player addHeadgear "H_HelmetB_Enh_tna_F";
	player forceAddUniform "U_O_T_Soldier_F";
	player addVest "V_PlateCarrierSpec_tna_F";
	player addBackpack "B_ViperHarness_ghex_F";
	player addGoggles "G_Balaclava_TI_G_tna_F";
	player linkItem "O_NVGoggles_ghex_F";

	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "20Rnd_762x51_Mag";
	player addWeapon "srifle_DMR_03_woodland_F";
	player addMagazine "30Rnd_9x21_Green_Mag";
	player addWeapon "hgun_P07_khk_F";

	
	//Rangefinder
	player addWeapon "Rangefinder";
	
	//Silencer
	player addPrimaryWeaponItem "muzzle_snds_B_khk_F";
	player addPrimaryWeaponItem "optic_MRCO";
	player addPrimaryWeaponItem "bipod_01_F_mtp";
	
	//Backpack adding
	player addItemToVest "FirstAidKit";
	player addItemToBackpack "ToolKit";
	for "_i" from 1 to 2 do {player addItemToUniform "30Rnd_9x21_Green_Mag";};
	for "_i" from 1 to 2 do {player addItemToUniform "HandGrenade";};
	for "_i" from 1 to 2 do {player addItemToVest "30Rnd_9x21_Green_Mag";};
	for "_i" from 1 to 6 do {player addItemToVest "20Rnd_762x51_Mag";};
	for "_i" from 1 to 5 do {player addItemToBackpack "FirstAidKit";};
	for "_i" from 1 to 5 do {player addItemToBackpack "SmokeShellGreen";};
	for "_i" from 1 to 5 do {player addItemToBackpack "20Rnd_762x51_Mag";};

	//Assign Y-Items
	{[true,_x,1] call life_fnc_handleInv;} foreach (_yItems);
	
	//ITEMS
	{
    if (_x != "") then {
        player addItem _x;
    };
	} foreach (_deluxitems);
	
	//Assign items
	{
    if (_x != "") then {
        player assignItem _x;
    };
	} foreach (_deluxitems);
	
	};
	case "gang_AK12": {
	/////////////////////
	//Gang Machine gun loadout
	/////////////////////
		
	//GEAR	
	player addHeadgear (_gangheadgear select (floor(random (count _gangheadgear))));
	player addUniform (_rebelclothing select (floor(random (count _rebelclothing))));
	player addVest (_gangvest select (floor(random (count _gangvest))));
	player addBackpack "B_ViperHarness_ghex_F";
	player addGoggles (_rebelgoggles select (floor(random (count _rebelgoggles))));
	player linkItem "O_NVGoggles_ghex_F";

	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "30Rnd_762x39_Mag_F";
	player addWeapon "arifle_AK12_F";

	//Magazines
	player addMagazines ["30Rnd_762x39_Mag_F",2];
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];
	_playerbackpack addMagazineCargoGlobal ["30Rnd_762x39_Mag_F", 3];
	_playerbackpack addItemCargoGlobal ["FirstAidKit",2];
	
	//ITEMS
	{
    if (_x != "") then {
        player addItem _x;
    };
	} foreach (_deluxitems);
	
	//Assign items
	{
    if (_x != "") then {
        player assignItem _x;
    };
	} foreach (_deluxitems);
	
	};
	case "gang_merc": {
	/////////////////////
	//Gang Mercenary gun loadout
	/////////////////////
		
	//GEAR	
	player addHeadgear "H_Beret_blk";
	player addUniform "U_I_G_Story_Protagonist_F";
	player addVest "V_PlateCarrier2_blk";
	player addBackpack "B_ViperLightHarness_blk_F";
	player addGoggles "G_Balaclava_TI_G_blk_F";
	player linkItem "NVGoggles_OPFOR";
	player addItemToUniform "FirstAidKit";
	player addItemToVest "FirstAidKit";
	player addItemToVest "10Rnd_50BW_Mag_F";
	player addMagazine "10Rnd_50BW_Mag_F";
	player addMagazine "30Rnd_65x39_caseless_green";
	for "_i" from 1 to 4 do {player addItemToUniform "11Rnd_45ACP_Mag";};
	for "_i" from 1 to 11 do {player addItemToVest "30Rnd_65x39_caseless_green";};
	for "_i" from 1 to 2 do {player addItemToBackpack "FirstAidKit";};
	for "_i" from 1 to 3 do {player addItemToBackpack "RPG7_F";};
	for "_i" from 1 to 2 do {player addItemToBackpack "HandGrenade";};
	//Weaponary
	
	//To have 1mag loaded
	player addWeapon "Rangefinder";
	player addWeapon "arifle_ARX_blk_F";
	player addPrimaryWeaponItem "acc_pointer_IR";
	player addPrimaryWeaponItem "optic_Hamr";
	player addWeapon "launch_RPG7_F";
	player addWeapon "hgun_Pistol_heavy_01_F";
	player addHandgunItem "muzzle_snds_acp";
	player addHandgunItem "optic_MRD";
	
	//ITEMS
	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
	player linkItem "ItemGPS";
	};
	case "gang_gas": {
	/////////////////////
	//Gang Anti teargas loadout
	/////////////////////
		
	//GEAR	
	player addHeadgear "H_CrewHelmetHeli_B";
	player addUniform (_rebelclothing select (floor(random (count _rebelclothing))));
	player addVest (_gangvest select (floor(random (count _gangvest))));
	player addBackpack "B_ViperHarness_ghex_F";
	player addGoggles (_rebelgoggles select (floor(random (count _rebelgoggles))));
	player linkItem "O_NVGoggles_ghex_F";

	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "30Rnd_762x39_Mag_F";
	player addWeapon "arifle_AK12_F";

	//Magazines
	player addMagazines ["30Rnd_762x39_Mag_F",2];
	player addMagazines ["SmokeShellBlue",2];
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];
	_playerbackpack addMagazineCargoGlobal ["30Rnd_762x39_Mag_F", 3];
	_playerbackpack addItemCargoGlobal ["FirstAidKit",2];
	
	//ITEMS
	{
    if (_x != "") then {
        player addItem _x;
    };
	} foreach (_deluxitems);
	
	//Assign items
	{
    if (_x != "") then {
        player assignItem _x;
    };
	} foreach (_deluxitems);
	
	};
	case "gang_LMG": {
	/////////////////////
	//Gang sniperloadout
	/////////////////////
			
		
	//GEAR	
	player addHeadgear (_gangheadgear select (floor(random (count _gangheadgear))));
	player addUniform (_rebelclothing select (floor(random (count _rebelclothing))));
	player addVest (_gangvest select (floor(random (count _gangvest))));
	player addBackpack "B_ViperHarness_ghex_F";
	player addGoggles (_rebelgoggles select (floor(random (count _rebelgoggles))));
	player linkItem "O_NVGoggles_ghex_F";

	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "200Rnd_556x45_Box_F";
	player addWeapon "LMG_03_F";

	//Magazines
	player addMagazines ["200Rnd_556x45_Box_F",2];
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];
	_playerbackpack addMagazineCargoGlobal ["200Rnd_556x45_Box_F", 3];
	_playerbackpack addItemCargoGlobal ["FirstAidKit",2];
	
	//ITEMS
	{
    if (_x != "") then {
        player addItem _x;
    };
	} foreach (_deluxitems);
	
	//Assign items
	{
    if (_x != "") then {
        player assignItem _x;
    };
	} foreach (_deluxitems);
	};
	
	case "gang_mk14": {
	/////////////////////
	//Gang marksman loadout
	/////////////////////

	//GEAR	
	player addHeadgear (_gangheadgear select (floor(random (count _gangheadgear))));
	player addUniform (_ghillieclothing select (floor(random (count _ghillieclothing))));
	player addVest (_gangvest select (floor(random (count _gangvestt))));
	player addBackpack "B_ViperHarness_ghex_F";
	player addGoggles (_rebelgoggles select (floor(random (count _rebelgoggles))));
	player linkItem "O_NVGoggles_ghex_F";
	
	//Rangefinder
	player addWeapon "Rangefinder";

	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "20Rnd_762x51_Mag";
	player addWeapon "srifle_DMR_06_camo_F";

	//Magazines
	player addMagazines ["20Rnd_762x51_Mag",2];
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];
	_playerbackpack addMagazineCargoGlobal ["20Rnd_762x51_Mag", 3];
	_playerbackpack addItemCargoGlobal ["FirstAidKit",2];
	
	//ITEMS
	{
    if (_x != "") then {
        player addItem _x;
    };
	} foreach (_deluxitems);
	
	//Assign items
	{
    if (_x != "") then {
        player assignItem _x;
    };
	} foreach (_deluxitems);
	};
	case "gang_machinegun": {
	/////////////////////
	//Gang Machine gun loadout
	/////////////////////
		
	//GEAR	
	player addHeadgear (_gangheadgear  select (floor(random (count _gangheadgear))));
	player forceAddUniform (_gangclothings   select (floor(random (count _gangclothings))));
	player addVest (_gangvest   select (floor(random (count _gangvest))));
	player addBackpack (_carryallbackpacks   select (floor(random (count _carryallbackpacks))));
	player addGoggles (_rebelgoggles select (floor(random (count _rebelgoggles))));
	_nv = (_nvgoggles select (floor(random (count _nvgoggles))));
	player addItem _nv;
	player assignItem _nv;

	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "150Rnd_762x54_Box";
	player addWeapon "LMG_Zafir_F";

	//Add a scope
	player addPrimaryWeaponItem (_cqbcopes select (floor(random (count _cqbscopes))));
	//Add a laser or light
	player addPrimaryWeaponItem (_acc select (floor(random (count _acc))));


	//Magazines
	player addMagazines ["150Rnd_762x54_Box",2];
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];
	_playerbackpack addItemCargoGlobal ["FirstAidKit",2];
	
	//ITEMS
	{
    if (_x != "") then {
        player addItem _x;
    };
	} foreach (_deluxitems);
	
	//Assign items
	{
    if (_x != "") then {
        player assignItem _x;
    };
	} foreach (_deluxitems);
	
	};
	
	case "gang_sniper": {
	/////////////////////
	//Gang sniperloadout
	/////////////////////
			
		
	//GEAR	
	player addHeadgear (_gangheadgear  select (floor(random (count _gangheadgear))));
	player forceAddUniform (_ghillieclothing  select (floor(random (count _ghillieclothing))));
	player addVest (_gangvest  select (floor(random (count _gangvest))));
	player addBackpack (_carryallbackpacks   select (floor(random (count _carryallbackpacks))));
	player addGoggles (_rebelgoggles select (floor(random (count _rebelgoggles))));
	_nv = (_nvgoggles select (floor(random (count _nvgoggles))));
	player addItem _nv;
	player assignItem _nv;
	
	//Rangefinder
	player addWeapon "Rangefinder";

	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "7Rnd_408_Mag";
	player addWeapon (_m320 select (floor(random (count _m320))));

	
	//Add a scope
	player addPrimaryWeaponItem (_longscopes select (floor(random (count _longscopes))));
	
	//Add a laser or light
	player addPrimaryWeaponItem (_acc select (floor(random (count _acc))));

	//Magazines
	player addMagazines ["7Rnd_408_Mag",6];
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];
	_playerbackpack addItemCargoGlobal ["FirstAidKit",2];
	
	//ITEMS
	{
    if (_x != "") then {
        player addItem _x;
    };
	} foreach (_deluxitems);
	
	//Assign items
	{
    if (_x != "") then {
        player assignItem _x;
    };
	} foreach (_deluxitems);
	};
	
	case "gang_marksman": {
	/////////////////////
	//Gang marksman loadout
	/////////////////////

	//GEAR	
	player addHeadgear (_gangheadgear  select (floor(random (count _gangheadgear))));
	player forceAddUniform (_ghillieclothing  select (floor(random (count _ghillieclothing))));
	player addVest (_gangvest  select (floor(random (count _gangvest))));
	player addBackpack (_carryallbackpacks   select (floor(random (count _carryallbackpacks))));
	player addGoggles (_rebelgoggles select (floor(random (count _rebelgoggles))));
	_nv = (_nvgoggles select (floor(random (count _nvgoggles))));
	player addItem _nv;
	player assignItem _nv;
	
	//Rangefinder
	player addWeapon "Rangefinder";

	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "10Rnd_93x64_DMR_05_Mag";
	player addWeapon (_Cyrus select (floor(random (count _Cyrus))));

	
	//Add a scope
	player addPrimaryWeaponItem (_longscopes select (floor(random (count _longscopes))));
	
	//Add a laser or light
	player addPrimaryWeaponItem (_acc select (floor(random (count _acc))));
	
	//Add Bipod
	player addPrimaryWeaponItem (_bipods select (floor(random (count _bipods))));

	//Magazines
	player addMagazines ["10Rnd_93x64_DMR_05_Mag",6];
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];
	_playerbackpack addItemCargoGlobal ["FirstAidKit",2];
	
	//ITEMS
	{
    if (_x != "") then {
        player addItem _x;
    };
	} foreach (_deluxitems);
	
	//Assign items
	{
    if (_x != "") then {
        player assignItem _x;
    };
	} foreach (_deluxitems);
	};
	case "underwater_treasure": {
	/////////////////////
	//Diving Treasure Hunter loadout
	/////////////////////
	
	_yItems = ["lance","weldingtool","weldingtool","weldingtool","weldingtool","water","burger"];
	
	//GEAR	
	//player addHeadgear (_rebelheadgear select (floor(random (count _rebelheadgear))));
	player forceAddUniform (_wetsuitsclothing select (floor(random (count _wetsuitsclothing))));
	player addVest (_rebreathers select (floor(random (count _rebreathers))));
	player addBackpack (_carryallbackpacks select (floor(random (count _carryallbackpacks))));
	player addGoggles (_divinggoggles select (floor(random (count _divinggoggles))));
	_nv = (_nvgoggles select (floor(random (count _nvgoggles))));
	player addItem _nv;
	player assignItem _nv;
	
	//Weaponary
	
	//To have 1mag loaded
	player addMagazine "20Rnd_556x45_UW_mag";
	player addWeapon "arifle_SDAR_F";
	player addMagazine "11Rnd_45ACP_Mag";
	player addWeapon "hgun_Pistol_heavy_01_F";
	
	//Add a scope
	player addPrimaryWeaponItem (_cqbscopes select (floor(random (count _cqbscopes))));
	//Add a laser or light
	player addPrimaryWeaponItem (_acc select (floor(random (count _acc))));
	
	//Magazines
	player addMagazines ["20Rnd_556x45_UW_mag",5];
	player addMagazines ["11Rnd_45ACP_Mag",2];
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];
	_playerbackpack addMagazineCargoGlobal ["Chemlight_yellow",5]; 

	//Assign Y-Items
	{[true,_x,1] call life_fnc_handleInv;} foreach (_yItems);
	
	//ITEMS
	{
    if (_x != "") then {
        player addItem _x;
    };
	} foreach (_deluxitems);
	
	//Assign items
	{
    if (_x != "") then {
        player assignItem _x;
    };
	} foreach (_deluxitems);
	};
	case "gang_rpg": {
	/////////////////////
	//Gang rpg loadout
	/////////////////////
	//GEAR	
	removeBackpack player;
	uiSleep 0.1;
	player addBackpack "B_Bergen_mcamo_F";

	//Weaponary
	player addMagazine "RPG7_F";
	player addWeapon "launch_RPG7_F";
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addMagazineCargoGlobal ["RPG7_F",5];
	};
	case "gang_rpg32": {
	/////////////////////
	//Gang rpg loadout
	/////////////////////
	//GEAR	
	removeBackpack player;
	uiSleep 0.1;
	player addBackpack "B_Bergen_mcamo_F";

	//Weaponary
	player addMagazine "RPG32_F";
	player addWeapon "launch_RPG32_F";
	
	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addMagazineCargoGlobal ["RPG32_F",5];
	};
	
	case "gang_rpg_missiles": {
	/////////////////////
	//Gang rpg missiles loadout
	/////////////////////
	removeBackpack player;
	uiSleep 0.1;
	player addBackpack (_carryallbackpacks select (floor(random (count _carryallbackpacks))));

	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addMagazineCargoGlobal ["RPG7_F",5];
	};
	
	case "gang_rpg32_missiles": {
	/////////////////////
	//Gang rpg missiles loadout
	/////////////////////
	removeBackpack player;
	uiSleep 0.1;
	player addBackpack (_carryallbackpacks select (floor(random (count _carryallbackpacks))));

	//Backpack adding
	_playerbackpack = unitBackpack player;
	_playerbackpack addMagazineCargoGlobal ["RPG32_F",5];
	};
	case "civ_licensed_pistol": {
	/////////////////////
	//Pistol loadout
	/////////////////////
	
	removeVest player;
	UiSleep 0.1;
	player addVest "V_Rangemaster_belt";
	
	//To have 1mag loaded
	player addMagazine "9Rnd_45ACP_Mag";
	player addWeapon "hgun_ACPC2_F";

	//Magazines
	player addMagazines ["9Rnd_45ACP_Mag",4];
	
	};
	case "civ_licensed_revolver": {
	/////////////////////
	//Revolver loadout
	/////////////////////
	
	removeVest player;
	UiSleep 0.1;
	player addVest "V_Rangemaster_belt";
	
	//To have 1mag loaded
	player addMagazine "6Rnd_45ACP_Cylinder";
	player addWeapon "hgun_Pistol_heavy_02_F";

	//Magazines
	player addMagazines ["6Rnd_45ACP_Cylinder",4];
	
	};
	case "blackm_pcml": {
	/////////////////////
	//Blackmarket PCML loadout
	/////////////////////
	
	//GEAR	
	removeBackpack player;
	uiSleep 0.1;
	player addBackpack (_carryallbackpacks select (floor(random (count _carryallbackpacks))));

	//Weaponary
	player addMagazine "NLAW_F";
	player addWeapon "launch_NLAW_F";
	
	//Backpack adding
	
	player addMagazines ["NLAW_F",5];
	};
		case "cop_basic": {
	/////////////////////
	//Cop basic loadout
	/////////////////////
	
	_yItems = [];
	
	
	if(395180 in getDLCs 1) then {player addUniform "U_B_GEN_Soldier_F";}else{player addUniform "U_Rangemaster";};
	player linkItem "NVGoggles_OPFOR";
	
	if(FETCH_CONST(life_coplevel) isEqualTo 5) then {
	player addHeadgear "H_Beret_blk_POLICE";
	} else {
		if(FETCH_CONST(life_coplevel) isEqualTo 6) then {
		} else {
		player addHeadgear "H_Beret_02";
			if(FETCH_CONST(life_coplevel) isEqualTo 7) then {
			player addHeadgear "H_Beret_02";
			} else {
				if(FETCH_CONST(life_coplevel) isEqualTo 8) then {
				player addHeadgear "H_Beret_Colonel";
				} else {
					if(395180 in getDLCs 1) then {player addHeadgear "H_MilCap_gen_F";}else{player addHeadgear "H_Cap_police";};
				};	
			};
		};
	};
	
	if(FETCH_CONST(life_coplevel) > 0) then {
	if(395180 in getDLCs 1) then {player addVest "V_TacVest_gen_F";}else{player addVest "V_TacVest_blk_POLICE"};
	if(395180 in getDLCs 1) then {player addBackpack "B_ViperLightHarness_blk_F";}else{player addBackpack "B_TacticalPack_blk"};
	} else {
	player addVest "V_Rangemaster_belt";
	if(395180 in getDLCs 1) then {player addBackpack "B_ViperLightHarness_blk_F";}else{player addBackpack "B_TacticalPack_blk"};
	};
	
	player addWeapon "Rangefinder";
	
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];
	
	//To have 1mag loaded
	player addMagazine "30Rnd_9x21_Mag";
	player addWeapon "hgun_P07_snds_F";
	if(395180 in getDLCs 1) then {
	player addMagazine "30Rnd_9x21_Mag_SMG_02";
	player addWeapon "SMG_05_F";
	player addPrimaryWeaponItem "muzzle_snds_L";
	player addPrimaryWeaponItem "optic_Aco_smg";
	player addMagazines ["30Rnd_9x21_Mag_SMG_02",4];
	} else {
	player addMagazine "30Rnd_9x21_Mag";
	player addWeapon "hgun_PDW2000_F";
	player addPrimaryWeaponItem "muzzle_snds_L";
	player addPrimaryWeaponItem "optic_Aco_smg";
	player addMagazines ["30Rnd_9x21_Mag",4];
	};
	
	//Assign Y-Items
	//{[true,_x,1] call life_fnc_handleInv;} foreach (_yItems);
	
	//ITEMS
	{
    if (_x != "") then {
        player addItem _x;
    };
	} foreach (_deluxitems);
	
	//Assign items
	{
    if (_x != "") then {
        player assignItem _x;
    };
	} foreach (_deluxitems);
	};
	case "med_basic": {
	/////////////////////
	//Medical basic loadout
	/////////////////////
	
	//GEAR	
	player addHeadgear "H_Cap_grn";
	player forceAddUniform "U_B_CombatUniform_mcam_worn"; 
	player addVest "V_TacVestIR_blk";
	player addBackpack "B_Carryall_oli";
	player addGoggles "G_Shades_Green";
	_nv = (_nvgoggles select (floor(random (count _nvgoggles))));
	player addItem _nv;
	player assignItem _nv;
	
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];
	_playerbackpack addItemCargoGlobal ["FirstAidKit", 2];
	_playerbackpack addItemCargoGlobal ["Medikit", 1];
	
	//ITEMS
	{
    if (_x != "") then {
        player addItem _x;
    };
	} foreach (_deluxitems);
	
	//Assign items
	{
    if (_x != "") then {
        player assignItem _x;
    };
	} foreach (_deluxitems);
	};
	

};
} else {
hint parseText format["<t color='#ff0000'><t align='center'><t size='1'>CANCELLED<br/><br/></t>"];
titleText [format["Cancelled"],"PLAIN"];
};
} else {
switch (_value) do {
	case "cop_basic_spawn": {
	/////////////////////
	//Cop basic loadout
	/////////////////////
	
	_yItems = [];
	
	
	if(395180 in getDLCs 1) then {player addUniform "U_B_GEN_Soldier_F";}else{player addUniform "U_Rangemaster";};
	player linkItem "NVGoggles_OPFOR";
	
	if(FETCH_CONST(life_coplevel) isEqualTo 5) then {
	player addHeadgear "H_Beret_blk_POLICE";
	} else {
		if(FETCH_CONST(life_coplevel) isEqualTo 6) then {
		} else {
		player addHeadgear "H_Beret_02";
			if(FETCH_CONST(life_coplevel) isEqualTo 7) then {
			player addHeadgear "H_Beret_02";
			} else {
				if(FETCH_CONST(life_coplevel) isEqualTo 8) then {
				player addHeadgear "H_Beret_Colonel";
				} else {
					if(395180 in getDLCs 1) then {player addHeadgear "H_MilCap_gen_F";}else{player addHeadgear "H_Cap_police";};
				};	
			};
		};
	};
	
	if(FETCH_CONST(life_coplevel) > 0) then {
	if(395180 in getDLCs 1) then {player addVest "V_TacVest_gen_F";}else{player addVest "V_TacVest_blk_POLICE"};
	if(395180 in getDLCs 1) then {player addBackpack "B_ViperLightHarness_blk_F";}else{player addBackpack "B_TacticalPack_blk"};
	} else {
	player addVest "V_Rangemaster_belt";
	if(395180 in getDLCs 1) then {player addBackpack "B_ViperLightHarness_blk_F";}else{player addBackpack "B_TacticalPack_blk"};
	};
	
	player addWeapon "Rangefinder";
	
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];
	
	//To have 1mag loaded
	player addMagazine "30Rnd_9x21_Mag";
	player addWeapon "hgun_P07_snds_F";
	if(395180 in getDLCs 1) then {
	player addMagazine "30Rnd_9x21_Mag_SMG_02";
	player addWeapon "SMG_05_F";
	player addPrimaryWeaponItem "muzzle_snds_L";
	player addPrimaryWeaponItem "optic_Aco_smg";
	player addMagazines ["30Rnd_9x21_Mag_SMG_02",4];
	} else {
	player addMagazine "30Rnd_9x21_Mag";
	player addWeapon "hgun_PDW2000_F";
	player addPrimaryWeaponItem "muzzle_snds_L";
	player addPrimaryWeaponItem "optic_Aco_smg";
	player addMagazines ["30Rnd_9x21_Mag",4];
	};
	
	//Assign Y-Items
	//{[true,_x,1] call life_fnc_handleInv;} foreach (_yItems);
	
	//ITEMS
	{
    if (_x != "") then {
        player addItem _x;
    };
	} foreach (_deluxitems);
	
	//Assign items
	{
    if (_x != "") then {
        player assignItem _x;
    };
	} foreach (_deluxitems);
	};
	case "med_basic_spawn": {
	/////////////////////
	//Medical basic loadout
	/////////////////////
	
	//GEAR	
	player addHeadgear "H_Cap_grn";
	player forceAddUniform "U_B_CombatUniform_mcam_worn"; 
	player addVest "V_TacVestIR_blk";
	player addBackpack "B_Carryall_oli";
	player addGoggles "G_Shades_Green";
	_nv = (_nvgoggles select (floor(random (count _nvgoggles))));
	player addItem _nv;
	player assignItem _nv;
	
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];
	_playerbackpack addItemCargoGlobal ["FirstAidKit", 2];
	_playerbackpack addItemCargoGlobal ["Medikit", 1];
	
	//ITEMS
	{
    if (_x != "") then {
        player addItem _x;
    };
	} foreach (_deluxitems);
	
	//Assign items
	{
    if (_x != "") then {
        player assignItem _x;
    };
	} foreach (_deluxitems);
	};
};
};
reload player;
[] call life_fnc_playerSkins;
