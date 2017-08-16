/*
	File: fn_craftCfg.sqf
	Description: Crafting System
	Author: EdgeKiller
	Edit: Max "Maxos" Seßler
*/
private["_craft","_return"];
_craft = [_this,0,"",[""]] call BIS_fnc_param;
if(_craft == "") exitWith {closeDialog 0}; //Bad shop type passed.
switch(_craft) do
{
	case "waffen":
	{
		_return = 
			[
				["arifle_MXC_F","bp_mxc",["plastic",1,"iron_refined",5,"titaneisen",1,"carbon",1]],
				["arifle_MX_F","bp_mx",["plastic",1,"iron_refined",5,"titaneisen",1,"carbon",1]],
				["arifle_MXM_F","bp_mxm",["plastic",1,"iron_refined",5,"titaneisen",1,"carbon",1,"aluminium",1]],
				["srifle_DMR_06_camo_F","bp_mk14",["plastic",2,"iron_refined",10,"titaneisen",2,"carbon",2,"aluminium",2]],				
				["srifle_DMR_06_olive_F","bp_mk14",["plastic",2,"iron_refined",10,"titaneisen",2,"carbon",2,"aluminium",2]],				
				["srifle_EBR_F","bp_mk18",["plastic",2,"iron_refined",10,"titaneisen",2,"carbon",2,"aluminium",2]],
				["srifle_DMR_03_multicam_F","bp_mk1",["plastic",2,"iron_refined",10,"titaneisen",2,"carbon",2,"aluminium",2]],
				["srifle_DMR_03_khaki_F","bp_mk1",["plastic",2,"iron_refined",10,"titaneisen",2,"carbon",2,"aluminium",2]],
				["srifle_DMR_03_tan_F","bp_mk1",["plastic",2,"iron_refined",10,"titaneisen",2,"carbon",2,"aluminium",2]],
				["srifle_DMR_03_woodland_F","bp_mk1",["plastic",2,"iron_refined",10,"titaneisen",2,"carbon",2,"aluminium",2]],
				["srifle_DMR_02_sniper_F","bp_mar10",["plastic",2,"iron_refined",10,"titaneisen",3,"carbon",3,"aluminium",3]],
				["srifle_DMR_02_camo_F","bp_mar10",["plastic",2,"iron_refined",10,"titaneisen",3,"carbon",3,"aluminium",3]],
				["LMG_Mk200_F","bp_mk200mg",["plastic",2,"iron_refined",12,"titaneisen",3,"carbon",3,"aluminium",3]],
				["srifle_GM6_F","bp_lynx",["plastic",2,"iron_refined",15,"titaneisen",3,"carbon",3,"aluminium",3]]
			];
	};
	case "magazine":
	{
		_return = 
			[
				["30Rnd_65x39_caseless_mag","",["iron_refined",3]],
				["20Rnd_762x51_Mag","",["iron_refined",4]],
				["10Rnd_338_Mag","",["iron_refined",4]],
				["200Rnd_65x39_cased_Box","",["iron_refined",20]],
				["5Rnd_127x108_Mag","",["iron_refined",10]]
			];
	};
	case "aufsätze":
	{
		_return = 
			[
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],
				["muzzle_snds_L","bp_sln9mm",["plastic",1,"iron_refined",4]],
				["muzzle_snds_M","bp_sln556",["plastic",2,"iron_refined",4]],
				["muzzle_snds_H","bp_sln65",["plastic",2,"iron_refined",4]],
				["muzzle_snds_B","bp_sln762",["plastic",1,"iron_refined",6]],
				["optic_Arco","bp_sniperoptic",["plastic",1,"iron_refined",2]],
				["optic_Hamr","bp_sniperoptic",["plastic",1,"iron_refined",2]],
				["optic_Aco","bp_sniperoptic",["plastic",1,"iron_refined",2]],
				["optic_Holosight","bp_sniperoptic",["plastic",1,"iron_refined",2]],
				["optic_SOS","bp_sniperoptic",["plastic",1,"iron_refined",5]],
				["optic_MRCO","bp_sniperoptic",["iron_refined",1]],
				["optic_DMS","bp_sniperoptic",["plastic",1,"iron_refined",5]],
				["optic_AMS","bp_sniperoptic",["plastic",1,"iron_refined",5]],
				["optic_AMS_snd","bp_sniperoptic",["plastic",1,"iron_refined",5]],
				["optic_AMS_khk","bp_sniperoptic",["plastic",1,"iron_refined",5]],
				["optic_KHS_blk","bp_sniperoptic",["plastic",1,"iron_refined",5]],
				["optic_KHS_old","bp_sniperoptic",["plastic",1,"iron_refined",5]],
				["optic_KHS_tan","bp_sniperoptic",["plastic",1,"iron_refined",5]],
				["optic_KHS_hex","bp_sniperoptic",["plastic",1,"iron_refined",5]],
				["optic_Yorris","bp_sniperoptic",["plastic",1,"iron_refined",1]],
				["optic_MRD","bp_sniperoptic",["plastic",1,"iron_refined",1]],
				["optic_LRPS","bp_sniperoptic",["plastic",1,"iron_refined",5]],
				["optic_AMS","bp_sniperoptic",["plastic",1,"iron_refined",5]],
				["bipod_01_F_blk","bp_bipod",["iron_refined",5]],
				["bipod_01_F_snd","bp_bipod",["iron_refined",5]],
				["bipod_01_F_mtp","bp_bipod",["iron_refined",5]],
				["bipod_02_F_blk","bp_bipod",["iron_refined",5]],
				["bipod_02_F_hex","bp_bipod",["iron_refined",5]],
				["bipod_02_F_tan","bp_bipod",["iron_refined",5]],
				["bipod_03_F_blk","bp_bipod",["iron_refined",5]],
				["bipod_03_F_oli","bp_bipod",["iron_refined",5]]
			];
	};
	case "auto":
	{
		_return = [
		];
	};
	case "eat":
	{
		_return = [
		];
	};
	case "metal":
	{
		_return = [
			["plastic","",["oil_processed",2]],
			["titaneisen","",["iron_refined",10,"copper_refined",5]],
			["carbon","",["diamond_cut",4]]
		];
	};
	case "technik":
	{
		_return = [
		];
	};
	case "kleidung":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],
				["U_B_CombatUniform_mcam_tshirt","",["stoff",10]],
				["U_OG_Guerilla1_1","",["stoff",5]],
				["U_B_survival_uniform","",["stoff",10]],
				["U_I_G_Story_Protagonist_F","",["stoff",12]],
				["U_B_CTRG_1","",["stoff",5]],
				["U_B_CTRG_2","",["stoff",5]],
				["U_O_CombatUniform_oucamo","",["stoff",5]],
				["U_I_CombatUniform_tshirt","",["stoff",5]],
				["U_I_OfficerUniform","",["stoff",5]],
				["U_O_FullGhillie_lsh","",["stoff",30]],
				["U_O_FullGhillie_sard","",["stoff",30]],
				["U_O_FullGhillie_ard","",["stoff",30]]
			];
	};
	case "westen":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],
			];
	};
};
_return; 