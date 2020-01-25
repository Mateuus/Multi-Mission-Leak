/*
	File: fn_clothing_reb.sqf
	
	
	Description:
	Master configuration file for Reb shop.
*/
private["_filter"];
_filter = param [0,0,[0]];
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Sklep z ubraniami rebelii"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
/*
			["I_FEM_AAF_long","Female Long",5000],
			["B_FEM_AAF_Rolled","Female Rolled",5000],
			["B_FEM_NATO_Rolled","Female Rolled 3",5000],


			["U_I_pilotCoveralls",nil,5000],
			["U_IG_Guerilla1_1",nil,5000],
			["U_I_G_Story_Protagonist_F",nil,7500],
			["U_I_G_resistanceLeader_F",nil,11500],
			["U_IG_leader","Guerilla Leader",15340],
			["U_I_GhillieSuit",nil,70000],
			["U_I_FullGhillie_lsh",nil,70000],
			["U_B_FullGhillie_lsh",nil,70000],


			//TRYK


			["TRYK_B_USMC_R_ROLL","Green Top, MARPAT Pants",25000],
			["TRYK_U_B_NATO_OCP_BLK_R_CombatUniform","Black Top, ACU Pants",25000],
			["TRYK_U_B_AOR2_GRY_CombatUniform","Grey Top, DigiGreen Pants",25000],	
			["TRYK_U_B_ARO1_CBR_CombatUniform","Desert Camo",25000],
			["TRYK_U_B_Snow_CombatUniform","Snow Camo",25000],

			["TRYK_U_B_AOR2_OD_CombatUniform","Green Top, DigiGreen Pants",30000],
			["TRYK_U_B_AOR2_BLK_CombatUniform","Black Top, DigiGreen Pants",30000],
			["TRYK_DMARPAT_T","Brown Top, DigiTan Pants",25000],
			["TRYK_U_B_ARO1_BLK_CombatUniform","Black Top, DigiTan Pants",25000],
			["TRYK_U_B_ARO1_CombatUniform","DigiTan Full",40000],
			["TRYK_U_B_NATO_OCP_R_CombatUniform","DigiGreen Full",40000],
			["TRYK_U_B_MARPAT_Wood","MARPAT Full",40000],
			["TRYK_U_B_NATO_OCP_R_CombatUniform","OCP Full",40000]
*/


		];
	};
	
	//Hats
	case 1:
	{
		[
			["TRYK_H_Booniehat_AOR2",nil,105],
			["TRYK_H_Booniehat_MARPAT_WOOD",nil,105],
			["TRYK_H_Booniehat_AOR1",nil,105],
			["TRYK_H_Booniehat_JSDF",nil,105],
			["H_Bandanna_camo",nil,65],
			["jokermask","Joker Mask",500],
			["TRYK_Kio_Balaclava","Ghost Balaclava",500],
			["A3L_Halloween_JigSaw","JigSaw Mask",500],
			["kio_skl_msk","Black Skull Mask",500],
			["kio_skl_msk_grn","Green Skull Mask",500],
			["kio_skl_msk_red","Red Skull Mask",500],
			["kio_skl_msk_fire",nil,500],
			["kio_skl_msk_weed",nil,500],
			["kio_skl_msk_frost",nil,500],
			["kio_skl_msk_pun",nil,500],
			["kio_skl_msk_adc",nil,500],
			["kio_skl_msk_blood",nil,500],
			["kio_skl_msk_redranger",nil,500],
			["kio_skl_msk_UK",nil,500],
			["kio_skl_msk_US",nil,500],
			["kio_skl_msk_black",nil,500],
			["kio_skl_msk_can",nil,500],
			["kio_skl_msk_german",nil,500],
			["kio_skl_msk_GOW",nil,500],
			["kio_skl_msk_grey",nil,500],
			["kio_skl_msk_irish",nil,500],
			["kio_skl_msk_nirish",nil,500],
			["kio_skl_msk_o",nil,500],
			["kio_skl_msk_p",nil,500],
			["kio_skl_msk_scot",nil,500],
			["kio_skl_msk_fran",nil,500]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,2],
			["G_Shades_Blue",nil,2],
			["G_Sport_Blackred",nil,2],
			["G_Sport_Checkered",nil,2],
			["G_Sport_Blackyellow",nil,2],
			["G_Sport_BlackWhite",nil,2],
			["G_Squares",nil,1],
			["G_Lowprofile",nil,3],
			["G_Combat",nil,5],
			["G_Balaclava_blk",nil,137],
			["G_Balaclava_combat",nil,137],
			["G_Balaclava_lowprofile",nil,137],
			["A3L_Balaclava",nil,137]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["k_rebel_1",nil,3000],
			["k_rebel_2",nil,3000],
			["k_rebel_3",nil,3000],
			["k_rebel_4",nil,3000],
			["k_rebel_5",nil,3000],
			["k_hrebel_1",nil,5000],
			["k_hrebel_2",nil,5000],
			["k_hrebel_3",nil,5000],
			["k_hrebel_4",nil,5000],
			["k_hrebel_5",nil,5000],
			["k_hrebel_6",nil,5000],
			["k_hrebel_7",nil,5000],
			["k_hrebel_8",nil,5000],
			["k_hrebel_9",nil,5000],
			["k_hrebel_10",nil,5000],	
			["k_nhrebel_3",nil,5000],
			["k_nhrebel_5",nil,5000],
			["k_nhrebel_6",nil,5000],
			["k_nhrebel_7",nil,5000],
			["k_nhrebel_8",nil,5000],
			["k_nhrebel_9",nil,5000],
			["k_nhrebel_10",nil,5000],
			["hk_rebel_1",nil,9000],
			["hk_rebel_2",nil,9000],
			["hk_rebel_5",nil,9000],
			["hk_rebel_7",nil,9000],
			["hk_rebel_9",nil,9000],
			["hk_rebel_11",nil,9000], 
			["hk_rebel_12",nil,9000],
			["hk_rebel_13",nil,9000], 
			["hk_rebel_14",nil,9000],
			["hk_rebel_15",nil,9000],
			["hk_rebel_16",nil,9000],
			["hk_rebel_17",nil,9000],
			["hk_rebel_18",nil,9000],
			["hk_rebel_19",nil,9000],
			["hk_rebel_20",nil,9000]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_cbr",nil,250],
			["B_FieldPack_ocamo",nil,300],
			["B_TacticalPack_oli","Olive Bergen",350],
			["B_Bergen_sgg","Sage Bergen",450],
			["B_Carryall_oli","Olive Carryall",500],
			["B_Carryall_khk","Khaki Carryall",500],
			//Camo Packs
			["B_AssaultPack_mcamo","MTP Assault Pack",400],
			["TRYK_B_AssaultPack_MARPAT_Wood","MARPAT Assault Pack",550],
			["TRYK_B_AssaultPack_Type2camo","Jungle Assault Pack",550],
			["TRYK_B_Kitbag_Base_JSDF","Jungle Kitbag",550],
			["B_Kitbag_mcamo","MTP Kitbag",550],
			//Belts
			["TRYK_B_Belt_AOR2",nil,300],
			["TRYK_B_Belt_CYT",nil,300],
			["TRYK_B_Belt_GR",nil,300]

		];
	};
};