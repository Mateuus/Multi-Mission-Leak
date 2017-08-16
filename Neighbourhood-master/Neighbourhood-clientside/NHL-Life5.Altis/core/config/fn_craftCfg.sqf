#include <macro.h>
/*
	File: fn_craftCfg.sqf
	Author: EdgeKiller
	Description:
	Master configuration file for the crafting menu.
*/
private["_craft","_return"];
_craft = [_this,0,"",[""]] call BIS_fnc_param;
if(_craft == "") exitWith {closeDialog 0}; //Bad shop type passed.
switch(_craft) do
{
	case "item":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
				["life_inv_bauschaufel", ["life_inv_ironr",3,"life_inv_copperr",3]],
				["life_inv_presslufthammer", ["life_inv_ironr",3,"life_inv_copperr",3]],
				["life_inv_blastingcharge", ["life_inv_sprengstoffu",5,"life_inv_ironr",5,"life_inv_oilp",1]],
				["life_inv_boltcutter", ["life_inv_ironr",3,"life_inv_copperr",3]],
				["life_inv_usb", ["life_inv_plastik",2,"life_inv_copperr",3]],
				["life_inv_lockpick", ["life_inv_ironr",1,"life_inv_copperr",1]],
				["life_inv_zipties", ["life_inv_ironr",2,"life_inv_copperr",2]],
				["life_inv_zweibein", ["life_inv_ironr",5,"life_inv_plastik",7]],
				["life_inv_handgriff", ["life_inv_ironr",6,"life_inv_plastik",8]],
				["life_inv_lauf", ["life_inv_stahl",15]],
				["life_inv_verschluss", ["life_inv_stahl",15]],
				["life_inv_mantel", ["life_inv_plastik",20,"life_inv_stahl",10]],
				["life_inv_schulterstuetze", ["life_inv_ironr",7,"life_inv_plastik",10]]

		];
	};
	case "uniform":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
				["U_OrestesBody", ["life_inv_baumwolle",12]],
				["U_NikosBody", ["life_inv_baumwolle",12]],
				["U_NikosAgedBody", ["life_inv_baumwolle",12]],
				["U_C_Journalist", ["life_inv_baumwolle",12]],
				["U_IG_Guerilla2_1", ["life_inv_baumwolle",12]],
				["U_IG_Guerilla1_1", ["life_inv_baumwolle",12]],
				["U_IG_Guerilla2_3", ["life_inv_baumwolle",12]],
				["U_IG_Guerilla3_1", ["life_inv_baumwolle",12]],
				["U_IG_Guerilla3_2", ["life_inv_baumwolle",12]],
				["U_BG_Guerilla2_1", ["life_inv_baumwolle",12]],
				["U_BG_Guerilla2_2", ["life_inv_baumwolle",12]],
				["U_IG_Guerrilla_6_1", ["life_inv_baumwolle",12]],
				["U_I_G_Story_Protagonist_F", ["life_inv_baumwolle",12]],
				["U_I_G_resistanceLeader_F", ["life_inv_baumwolle",12]]

			];
	};
	case "vest":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
				
				["V_BandollierB_khk", ["life_inv_baumwolle",15]],
				["V_Chestrig_rgr", ["life_inv_baumwolle",15]],
				["V_HarnessO_brn", ["life_inv_baumwolle",15]]

				
			];
	};

	case "backpack":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
				
				["B_Kitbag_cbr", ["life_inv_baumwolle",20]],
				["B_Bergen_sgg", ["life_inv_baumwolle",20]],
				["B_AssaultPack_cbr", ["life_inv_baumwolle",20]],
				["B_AssaultPack_blk", ["life_inv_baumwolle",20]],
				["B_AssaultPack_sgg", ["life_inv_baumwolle",20]],
				["B_FieldPack_ocamo", ["life_inv_baumwolle",20]],
				["B_FieldPack_oucamo", ["life_inv_baumwolle",20]],
				["B_FieldPack_cbr", ["life_inv_baumwolle",20]],
				["B_Carryall_ocamo", ["life_inv_baumwolle",20]],
				["B_Carryall_oucamo", ["life_inv_baumwolle",20]],
				["B_Carryall_mcamo", ["life_inv_baumwolle",20]],
				["B_OutdoorPack_blk", ["life_inv_baumwolle",20]]

				
			];
	};
	case "weaponvorschau":
	{
	_return = [
	
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
				["srifle_DMR_06_camo_F", ["life_inv_bpmk14",1,"life_inv_lauf",1,"life_inv_mantel",2,"life_inv_verschluss",1,"life_inv_handgriff",1,"life_inv_schulterstuetze",1]],
				["srifle_DMR_03_multicam_F", ["life_inv_bpmk1",1,"life_inv_lauf",1,"life_inv_mantel",2,"life_inv_verschluss",1,"life_inv_handgriff",1,"life_inv_schulterstuetze",1]],
				["srifle_EBR_F", ["life_inv_bpmk18",1,"life_inv_lauf",1,"life_inv_mantel",2,"life_inv_verschluss",1,"life_inv_handgriff",1,"life_inv_schulterstuetze",1]],
				["arifle_SPAR_03_snd_F", ["life_inv_bpspar17",1,"life_inv_lauf",1,"life_inv_mantel",2,"life_inv_verschluss",1,"life_inv_handgriff",1,"life_inv_schulterstuetze",1]],
				["arifle_AK12_F", ["life_inv_bpak12",1,"life_inv_lauf",1,"life_inv_mantel",2,"life_inv_verschluss",2,"life_inv_handgriff",1,"life_inv_schulterstuetze",1]],
				["arifle_AKM_F", ["life_inv_bpakm",1,"life_inv_lauf",1,"life_inv_mantel",2,"life_inv_verschluss",1,"life_inv_handgriff",1,"life_inv_schulterstuetze",1]],
				["LMG_Zafir_F", ["life_inv_bpzafir",1,"life_inv_lauf",2,"life_inv_mantel",1,"life_inv_verschluss",1,"life_inv_zweibein",1,"life_inv_handgriff",1,"life_inv_schulterstuetze",1]],
				["srifle_DMR_02_camo_F", ["life_inv_bpmarten",1,"life_inv_lauf",2,"life_inv_mantel",2,"life_inv_verschluss",1,"life_inv_handgriff",2,"life_inv_schulterstuetze",1]],
				["srifle_GM6_F", ["life_inv_bplynx",1,"life_inv_lauf",2,"life_inv_mantel",3,"life_inv_verschluss",2,"life_inv_zweibein",2,"life_inv_schulterstuetze",3]],
				["srifle_LRR_F", ["life_inv_bplrr",1,"life_inv_lauf",2,"life_inv_mantel",3,"life_inv_verschluss",2,"life_inv_zweibein",2,"life_inv_schulterstuetze",3]]
			];
	
	
	
	
	};
	case "weapon":
	{
	_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
				["20Rnd_762x51_Mag", ["life_inv_ironr",3,"life_inv_copperr",4,"life_inv_sprengstoffu",4]],
				["30Rnd_762x39_Mag_F", ["life_inv_ironr",5,"life_inv_copperr",6,"life_inv_sprengstoffu",6]],
				["150Rnd_762x54_Box_Tracer", ["life_inv_ironr",10,"life_inv_copperr",10,"life_inv_sprengstoffu",9]],
				["10Rnd_338_Mag", ["life_inv_ironr",6,"life_inv_copperr",4,"life_inv_sprengstoffu",4]],
				["5Rnd_127x108_Mag", ["life_inv_ironr",7,"life_inv_copperr",4,"life_inv_sprengstoffu",6]],
				["7Rnd_408_Mag", ["life_inv_ironr",7,"life_inv_copperr",4,"life_inv_sprengstoffu",10]]
			];
		if(license_civ_mk14) then
		{
		_return pushBack
		["srifle_DMR_06_camo_F", ["life_inv_lauf",1,"life_inv_mantel",2,"life_inv_verschluss",1,"life_inv_handgriff",1,"life_inv_schulterstuetze",1]];
		_return pushBack
		["srifle_DMR_06_olive_F", ["life_inv_lauf",1,"life_inv_mantel",2,"life_inv_verschluss",1,"life_inv_handgriff",1,"life_inv_schulterstuetze",1]];
		};
		if(license_civ_mk1) then
		{
		_return pushBack
		["srifle_DMR_03_F", ["life_inv_lauf",1,"life_inv_mantel",2,"life_inv_verschluss",1,"life_inv_handgriff",1,"life_inv_schulterstuetze",1]];
		_return pushBack
		["srifle_DMR_03_khaki_F", ["life_inv_lauf",1,"life_inv_mantel",2,"life_inv_verschluss",1,"life_inv_handgriff",1,"life_inv_schulterstuetze",1]];
		_return pushBack
		["srifle_DMR_03_tan_F", ["life_inv_lauf",1,"life_inv_mantel",2,"life_inv_verschluss",1,"life_inv_handgriff",1,"life_inv_schulterstuetze",1]];
		_return pushBack
		["srifle_DMR_03_multicam_F", ["life_inv_lauf",1,"life_inv_mantel",2,"life_inv_verschluss",1,"life_inv_handgriff",1,"life_inv_schulterstuetze",1]];
		_return pushBack
		["srifle_DMR_03_woodland_F", ["life_inv_lauf",1,"life_inv_mantel",2,"life_inv_verschluss",1,"life_inv_handgriff",1,"life_inv_schulterstuetze",1]];
		};
		if(license_civ_mk18) then
		{
		_return pushBack
		["srifle_EBR_F", ["life_inv_lauf",1,"life_inv_mantel",2,"life_inv_verschluss",1,"life_inv_handgriff",1,"life_inv_schulterstuetze",1]];
		};
		if(license_civ_spar17) then
		{
		_return pushBack
		["arifle_SPAR_03_khk_F", ["life_inv_lauf",1,"life_inv_mantel",2,"life_inv_verschluss",1,"life_inv_handgriff",1,"life_inv_schulterstuetze",1]];
		_return pushBack
		["arifle_SPAR_03_snd_F", ["life_inv_lauf",1,"life_inv_mantel",2,"life_inv_verschluss",1,"life_inv_handgriff",1,"life_inv_schulterstuetze",1]];
		};
		if(license_civ_akm) then
		{
		_return pushBack
		["arifle_AKM_F", ["life_inv_lauf",1,"life_inv_mantel",2,"life_inv_verschluss",1,"life_inv_handgriff",1,"life_inv_schulterstuetze",1]];
		};
		if(license_civ_ak12) then
		{
		_return pushBack
		["arifle_AK12_F", ["life_inv_lauf",1,"life_inv_mantel",2,"life_inv_verschluss",2,"life_inv_handgriff",1,"life_inv_schulterstuetze",1]];
		};
		
		
		if(license_civ_zafir) then
		{
		_return pushBack
		["LMG_Zafir_F", ["life_inv_lauf",1,"life_inv_mantel",2,"life_inv_verschluss",1,"life_inv_zweibein",1,"life_inv_handgriff",1,"life_inv_schulterstuetze",1]];
		};	
		
		if(license_civ_marten) then
		{
		_return pushBack
		["srifle_DMR_02_camo_F", ["life_inv_lauf",2,"life_inv_mantel",2,"life_inv_verschluss",2,"life_inv_handgriff",2,"life_inv_schulterstuetze",1]];
		};
		
		if(license_civ_lynx) then
		{
		_return pushBack
		["srifle_GM6_F", ["life_inv_lauf",2,"life_inv_mantel",3,"life_inv_verschluss",2,"life_inv_zweibein",2,"life_inv_schulterstuetze",3]];
		_return pushBack
		["srifle_GM6_ghex_F", ["life_inv_lauf",2,"life_inv_mantel",3,"life_inv_verschluss",2,"life_inv_zweibein",2,"life_inv_schulterstuetze",3]];
		};
		
		if(license_civ_lrr) then
		{
		_return pushBack
		["srifle_LRR_F", ["life_inv_lauf",2,"life_inv_mantel",3,"life_inv_verschluss",2,"life_inv_zweibein",2,"life_inv_schulterstuetze",3]];
		_return pushBack
		["srifle_LRR_tna_F", ["life_inv_lauf",2,"life_inv_mantel",3,"life_inv_verschluss",2,"life_inv_zweibein",2,"life_inv_schulterstuetze",3]];
		};
		
		
		
		/*if(__GETC__(life_adminlevel) > 0) then
		{
			_return pushBack
			["SMG_01_F", ["life_inv_goldbar",6,"life_inv_copperr",3,"life_inv_ironr",3,"life_inv_diamondr",1]];
		};*/
	};

};
_return; 