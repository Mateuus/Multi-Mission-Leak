#define VITEMMACRO(NAME,DISPLAYNAME,VARNAME,WEIGHT,BUYPRICE,SELLPRICE,ILLEGAL,EDIBLE,ICON) class NAME { \
		variable = VARNAME; \
		weight = WEIGHT; \
		displayName = DISPLAYNAME; \
		buyPrice = BUYPRICE; \
		sellPrice = SELLPRICE; \
		illegal = ILLEGAL; \
		edible = EDIBLE; \
		icon = ICON; \
	};
	
#define SAFEMACRO(NAME,VARNAME,GEAR) class NAME { \
		variable = VARNAME; \
		loadout[] = GEAR; \
	};
	
#define LICENSEMACRO(NAME,DISPLAYNAME,VARNAME,PRICE,ILLEGAL,SIDE) class NAME { \
		variable = VARNAME; \
		displayName = DISPLAYNAME; \
		price = PRICE; \
		illegal = ILLEGAL; \
		side = SIDE; \
	};


class SafekeepingLoadouts {
	class polis {
		loadout[] = {"U_Rangemaster","","B_Kitbag_cbr","","H_Cap_police",{"ItemCompass","ItemGPS","NVGoggles_OPFOR","Binocular"},"SMG_02_F","hgun_P07_snds_F",{"FirstAidKit","FirstAidKit"},{"30Rnd_9x21_Mag"},{"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"},{"HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02"},{},{},{"","","optic_ACO_grn",""},{"muzzle_snds_L","","",""},{{"redgull",25},{"waterBottle",5},{"tbacon",9},{"bandage",9}}};
	};
	
	class polis_blue {
		loadout[] = {"U_B_CombatUniform_mcam","V_PlateCarrier1_blk","B_Kitbag_cbr","","H_Beret_blk",{"ItemCompass","ItemGPS","NVGoggles_OPFOR","Binocular"},"arifle_MXM_Black_F","hgun_P07_snds_F",{},{"30Rnd_65x39_caseless_mag","30Rnd_9x21_Mag"},{},{"30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag"},{"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"},{"HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag"},{"","","optic_DMS",""},{"muzzle_snds_L","","",""},{{"redgull",25},{"waterBottle",5},{"tbacon",9},{"bandage",9}}};
	};
	
	class polis_black {
		loadout[] = {"U_B_CombatUniform_mcam","V_PlateCarrier1_blk","B_Kitbag_cbr","","H_Beret_blk",{"ItemCompass","ItemGPS","NVGoggles_OPFOR","Binocular"},"arifle_MXM_Black_F","hgun_P07_snds_F",{},{"30Rnd_65x39_caseless_mag","30Rnd_9x21_Mag"},{},{"30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag"},{"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"},{"HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag"},{"","","optic_DMS",""},{"muzzle_snds_L","","",""},{{"redgull",25},{"waterBottle",5},{"tbacon",9},{"bandage",9}}};
	};
	
	class polis_camo {
		loadout[] = {"U_B_CombatUniform_mcam","V_PlateCarrier1_blk","B_Kitbag_cbr","","H_Beret_blk",{"ItemCompass","ItemGPS","NVGoggles_OPFOR","Binocular"},"arifle_MXM_Black_F","hgun_P07_snds_F",{},{"30Rnd_65x39_caseless_mag","30Rnd_9x21_Mag"},{},{"30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag"},{"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"},{"HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag"},{"","","optic_DMS",""},{"muzzle_snds_L","","",""},{{"redgull",25},{"waterBottle",5},{"tbacon",9},{"bandage",9}}};
	};
	
	class rebel {
		loadout[] = {"U_O_CombatUniform_ocamo","V_TacVest_brn","B_Carryall_ocamo","G_Balaclava_combat","H_ShemagOpen_tan",{"ItemMap","ItemCompass","ItemWatch","ItemGPS","NVGoggles_OPFOR","Binocular"},"arifle_Katiba_F","hgun_Rook40_F",{"FirstAidKit","FirstAidKit"},{},{"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","ToolKit","ToolKit"},{"30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green"},{"FirstAidKit","FirstAidKit"},{"30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_65x39_caseless_green","30Rnd_9x21_Mag","30Rnd_65x39_caseless_green","30Rnd_9x21_Mag"},{"","","optic_MRCO",""},{"","","",""},{{"redgull",58},{"waterBottle",15},{"tbacon",28},{"bandage",20}}};
	};
	
	class rebel_mk14 {
		loadout[] = {"U_O_SpecopsUniform_ocamo","V_TacVest_khk","B_Carryall_khk","G_Combat","H_ShemagOpen_tan",{"ItemMap","ItemCompass","ItemWatch","ItemGPS","NVGoggles_INDEP","Binocular"},"srifle_DMR_06_camo_F","hgun_Rook40_F",{"FirstAidKit","optic_DMS"},{"30Rnd_9x21_Mag","30Rnd_9x21_Mag"},{"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","ToolKit","ToolKit"},{"20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag"},{},{"20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","30Rnd_9x21_Mag","20Rnd_762x51_Mag","30Rnd_9x21_Mag"},{"","","optic_MRCO",""},{"","","",""},{{"redgull",25},{"waterBottle",5},{"tbacon",9},{"bandage",10}}};
	};
	
	class rebel_cmr {
		loadout[] = {"U_O_CombatUniform_ocamo","V_TacVest_brn","B_Carryall_ocamo","G_Balaclava_combat","H_ShemagOpen_tan",{"ItemMap","ItemCompass","ItemWatch","ItemGPS","NVGoggles_OPFOR","Binocular"},"srifle_DMR_07_hex_F","hgun_Rook40_F",{},{},{"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","ToolKit","ToolKit"},{"20Rnd_650x39_Cased_Mag_F","20Rnd_650x39_Cased_Mag_F","20Rnd_650x39_Cased_Mag_F","20Rnd_650x39_Cased_Mag_F","20Rnd_650x39_Cased_Mag_F","20Rnd_650x39_Cased_Mag_F","20Rnd_650x39_Cased_Mag_F"},{"FirstAidKit"},{"20Rnd_650x39_Cased_Mag_F","20Rnd_650x39_Cased_Mag_F","20Rnd_650x39_Cased_Mag_F","30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag","20Rnd_650x39_Cased_Mag_F","30Rnd_9x21_Mag"},{"","","optic_SOS",""},{"","","",""},{{"redgull",33},{"waterBottle",10},{"tbacon",19},{"bandage",10}}};
	};
	
	class neo_polis {
		loadout[] = {"U_B_CombatUniform_mcam","V_TacVest_blk","B_Kitbag_mcamo","","H_Beret_Colonel",{"ItemMap","ItemCompass","ItemWatch","ItemGPS","NVGoggles_OPFOR","Binocular"},"arifle_MX_Black_F","hgun_ACPC2_F",{"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"},{"9Rnd_45ACP_Mag"},{"optic_MRCO","optic_Arco_blk_F","optic_DMS","optic_Hamr","optic_ERCO_blk_F"},{"30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","9Rnd_45ACP_Mag","9Rnd_45ACP_Mag","9Rnd_45ACP_Mag","9Rnd_45ACP_Mag","9Rnd_45ACP_Mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag"},{},{"30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag"},{"","","optic_SOS",""},{"","","",""},{{"redgull",25},{"waterBottle",5},{"tbacon",10},{"bandage",10}},""};
	};
	
	class neo_rebell {
		loadout[] = {"U_B_CTRG_2","V_TacVest_khk","B_Kitbag_rgr","","H_ShemagOpen_tan",{"ItemMap","ItemCompass","ItemWatch","ItemGPS","NVGoggles_OPFOR","Binocular"},"arifle_Katiba_F","hgun_ACPC2_F",{"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"},{"9Rnd_45ACP_Mag"},{"optic_MRCO","optic_Arco_blk_F","optic_DMS","optic_Hamr","optic_ERCO_blk_F"},{"9Rnd_45ACP_Mag","9Rnd_45ACP_Mag","9Rnd_45ACP_Mag","9Rnd_45ACP_Mag","9Rnd_45ACP_Mag","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green"},{},{"30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green"},{"","","optic_SOS",""},{"","","",""},{{"redgull",25},{"waterBottle",5},{"tbacon",10},{"bandage",10}},""};
	};
	
	class green {
		loadout[] = {"U_O_V_Soldier_Viper_F","V_PlateCarrierSpec_tna_F","B_Bergen_dgtl_F","","H_HelmetO_ViperSP_ghex_F",{"ItemMap","ItemCompass","ItemWatch","Binocular"},"arifle_SPAR_03_khk_F","",{},{},{"ToolKit"},{"20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag"},{},{"20Rnd_762x51_Mag","20Rnd_762x51_Mag"},{"muzzle_snds_B_khk_F","acc_flashlight","optic_AMS_khk","bipod_01_F_khk"},{"","","",""},{{"redgull",8},{"waterBottle",5},{"tbacon",10}}};
	};
	
	class green_katiba {
		loadout[] = {"U_I_CombatUniform","V_TacVest_oli","B_Carryall_oli","G_Balaclava_combat","H_Shemag_olive",{"ItemMap","ItemCompass","ItemWatch","ItemGPS","NVGoggles_OPFOR","Binocular"},"arifle_Katiba_F","hgun_Rook40_F",{"FirstAidKit","FirstAidKit"},{"30Rnd_65x39_caseless_green","30Rnd_9x21_Mag"},{"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","ToolKit","ToolKit"},{"30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_9x21_Mag"},{"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"},{"30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_9x21_Mag","30Rnd_9x21_Mag"},{"","","optic_MRCO",""},{"","","",""},{{"redgull",25},{"waterBottle",5},{"tbacon",9},{"bandage",10}}};
	};
	
	class green_cmr {
		loadout[] = {"U_I_CombatUniform","V_TacVest_oli","B_Carryall_oli","G_Balaclava_combat","H_Shemag_olive",{"ItemMap","ItemCompass","ItemWatch","ItemGPS","NVGoggles_OPFOR","Binocular"},"srifle_DMR_07_ghex_F","hgun_Rook40_F",{},{},{"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","ToolKit","ToolKit"},{"20Rnd_650x39_Cased_Mag_F","20Rnd_650x39_Cased_Mag_F","20Rnd_650x39_Cased_Mag_F","20Rnd_650x39_Cased_Mag_F","20Rnd_650x39_Cased_Mag_F","20Rnd_650x39_Cased_Mag_F","20Rnd_650x39_Cased_Mag_F","30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag"},{"FirstAidKit"},{"20Rnd_650x39_Cased_Mag_F","20Rnd_650x39_Cased_Mag_F","20Rnd_650x39_Cased_Mag_F","20Rnd_650x39_Cased_Mag_F","30Rnd_9x21_Mag"},{"","","optic_SOS",""},{"","","",""},{{"redgull",25},{"waterBottle",5},{"tbacon",9},{"bandage",9}}};
	};
	
	class mxc {
		loadout[] = {"U_O_PilotCoveralls","V_TacVest_brn","B_Carryall_cbr","G_Combat","H_MilCap_oucamo",{"ItemMap","ItemCompass","ItemWatch","ItemGPS","NVGoggles_INDEP","Binocular"},"arifle_MXC_Holo_F","",{},{"30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag"},{"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","ToolKit"},{"30Rnd_65x39_caseless_mag"},{},{"30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag"},{"","","optic_Arco",""},{"","","",""},{{"redgull",25},{"waterBottle",5},{"tbacon",9}}};
	};
	
	class mk20 {
		loadout[] = {"U_B_survival_uniform","V_TacVest_oli","B_Carryall_oli","G_Balaclava_oli","H_Bandanna_camo",{"ItemMap","ItemCompass","ItemWatch","ItemGPS","NVGoggles_INDEP","Binocular"},"arifle_Mk20_F","",{"FirstAidKit"},{"30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag"},{"ToolKit","ToolKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"},{"30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag"},{},{"30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag"},{"","","optic_MRCO",""},{"","","",""},{{"redgull",25},{"waterBottle",5},{"rabbit_grilled",5}}};
	};
	
	class ak12 {
		cloadout[] = {"U_B_CTRG_Soldier_F","V_TacVest_blk_POLICE","B_Carryall_khk","G_Bandanna_aviator","H_HelmetSpecB",{"ItemMap","ItemCompass","ItemWatch","ItemRadio","ItemGPS","NVGoggles_INDEP","Rangefinder"},"arifle_AK12_F","",{},{"30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F"},{"Medikit","Medikit"},{"SatchelCharge_Remote_Mag","HandGrenade","HandGrenade"},{},{"30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","HandGrenade","HandGrenade","HandGrenade","30Rnd_762x39_Mag_F"},{"","","optic_Hamr","bipod_01_F_blk"},{"","","",""},{{"redgull",8},{"waterBottle",5},{"tbacon",10},{"bandage",12}},"launch_RPG32_F"};
	};
	
	class mk200 {
		loadout[] = {"U_O_PilotCoveralls","V_PlateCarrierSpec_mtp","B_Carryall_cbr","G_Combat","H_MilCap_oucamo",{"ItemMap","ItemCompass","ItemWatch","ItemGPS","NVGoggles_INDEP","Binocular"},"LMG_Mk200_LP_BI_F","",{},{"200Rnd_65x39_cased_Box"},{"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","ToolKit"},{"200Rnd_65x39_cased_Box","200Rnd_65x39_cased_Box","200Rnd_65x39_cased_Box"},{},{"200Rnd_65x39_cased_Box"},{"","acc_pointer_IR","optic_ACO_grn","bipod_03_F_blk"},{"","","",""},{{"redgull",25},{"waterBottle",5},{"tbacon",9}}};
	};
	
	class sting {
		loadout[] = {"U_BG_Guerilla1_1","","B_Carryall_ocamo","","H_Bandanna_khk",{"ItemMap","ItemCompass","ItemGPS","ItemWatch","NVGoggles","Binocular"},"SMG_02_F","",{},{"30Rnd_9x21_Mag","30Rnd_9x21_Mag"},{"ToolKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"},{"30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag"},{},{},{"","","optic_Aco",""},{"","","",""},{{"redgull",25},{"waterBottle",5},{"tbacon",9}}};
	};
	
	class pdw {
		loadout[] = {"U_BG_Guerilla1_1","","B_Carryall_ocamo","","H_Bandanna_khk",{"ItemMap","ItemCompass","ItemGPS","ItemWatch","NVGoggles","Binocular"},"hgun_PDW2000_F","",{},{"30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag"},{"ToolKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"},{"30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag"},{},{},{"","","optic_Aco",""},{"","","",""},{{"redgull",25},{"waterBottle",5},{"tbacon",9}}};
	};
	
	class rook {
		loadout[] = {"U_C_HunterBody_grn","","B_Carryall_ocamo","","H_Hat_tan",{"ItemMap","ItemCompass","ItemGPS","ItemWatch","NVGoggles","Binocular"},"","hgun_Rook40_F",{},{"30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag"},{"ToolKit","ToolKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"},{"30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag"},{},{},{"","","",""},{"","","",""},{{"waterBottle",5},{"tbacon",9},{"redgull",25}}};
	};
	
	class zubr {
		loadout[] = {"U_C_HunterBody_grn","","B_Carryall_ocamo","","H_Hat_tan",{"ItemMap","ItemCompass","ItemGPS","ItemWatch","NVGoggles","Binocular"},"","hgun_Pistol_heavy_02_F",{},{"6Rnd_45ACP_Cylinder","6Rnd_45ACP_Cylinder","6Rnd_45ACP_Cylinder","6Rnd_45ACP_Cylinder","6Rnd_45ACP_Cylinder","6Rnd_45ACP_Cylinder","6Rnd_45ACP_Cylinder"},{"ToolKit","ToolKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"},{"6Rnd_45ACP_Cylinder","6Rnd_45ACP_Cylinder","6Rnd_45ACP_Cylinder"},{},{},{"","","",""},{"","","",""},{{"waterBottle",5},{"tbacon",9},{"redgull",25}}};
	};
	
	class four_five {
		loadout[] = {"U_C_HunterBody_grn","","B_Carryall_ocamo","","H_Hat_tan",{"ItemMap","ItemCompass","ItemGPS","ItemWatch","NVGoggles","Binocular"},"","hgun_Pistol_heavy_01_MRD_F",{},{"11Rnd_45ACP_Mag","11Rnd_45ACP_Mag","11Rnd_45ACP_Mag","11Rnd_45ACP_Mag","11Rnd_45ACP_Mag"},{"ToolKit","ToolKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"},{"11Rnd_45ACP_Mag","11Rnd_45ACP_Mag","11Rnd_45ACP_Mag","11Rnd_45ACP_Mag","11Rnd_45ACP_Mag"},{},{},{"","","",""},{"","","optic_MRD",""},{{"redgull",27},{"waterBottle",5},{"tbacon",9},{"redgull",25}}};
	};
	
	class rpg {
		loadout[] = {"U_O_PilotCoveralls","V_TacVest_brn","B_Carryall_cbr","G_Combat","H_MilCap_oucamo",{"ItemMap","ItemCompass","ItemWatch","ItemGPS","NVGoggles_INDEP","Binocular"},"arifle_MXC_Holo_F","",{},{"30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag"},{"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"},{"RPG32_F","RPG32_HE_F","RPG32_HE_F","RPG32_HE_F","RPG32_F"},{},{"30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag"},{"","","optic_Arco",""},{"","","",""},{{"redgull",40},{"waterBottle",10},{"tbacon",18}}};
	};
	
	class pilot {
		loadout[] = {"U_B_HeliPilotCoveralls","V_TacVest_oli","B_Carryall_oli","G_Combat","H_PilotHelmetHeli_O",{"ItemMap","ItemCompass","ItemWatch","ItemGPS","NVGoggles_INDEP","Binocular"},"SMG_01_Holo_pointer_snds_F","",{},{"30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01"},{"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","ToolKit","ToolKit","ToolKit"},{"30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01"},{},{"30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01"},{"","","optic_Holosight_smg",""},{"","","",""},{{"redgull",20},{"waterBottle",5},{"tbacon",9}}};
	};
	
	class carbine {
		loadout[] = {"U_B_CTRG_1","V_TacVest_oli","B_Parachute","G_Squares_Tinted","H_MilCap_dgtl",{"ItemMap","ItemCompass","ItemWatch","ItemGPS","NVGoggles_OPFOR","Binocular"},"arifle_Katiba_C_F","",{"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"},{},{},{},{},{"30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green"},{"muzzle_snds_H","","optic_ACO_grn_smg",""},{"","","",""},{{"redgull",8},{"waterBottle",6},{"tbacon",10}}};
	};
	
	class rahim {
		loadout[] = {"U_O_PilotCoveralls","V_TacVest_brn","B_Carryall_cbr","G_Combat","H_MilCap_oucamo",{"ItemMap","ItemCompass","ItemWatch","ItemGPS","NVGoggles_INDEP","Binocular"},"srifle_DMR_01_F","",{},{"10Rnd_762x54_Mag","10Rnd_762x54_Mag","10Rnd_762x54_Mag","10Rnd_762x54_Mag","10Rnd_762x54_Mag","10Rnd_762x54_Mag","10Rnd_762x54_Mag"},{"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","ToolKit","ToolKit"},{},{},{"10Rnd_762x54_Mag","10Rnd_762x54_Mag","10Rnd_762x54_Mag","10Rnd_762x54_Mag","10Rnd_762x54_Mag","10Rnd_762x54_Mag","10Rnd_762x54_Mag","10Rnd_762x54_Mag","10Rnd_762x54_Mag"},{"","","",""},{"","","",""},{{"redgull",25},{"waterBottle",5},{"tbacon",9}}};
	};
	
	class mk18 {
		loadout[] = {"U_B_CombatUniform_mcam","V_TacVest_blk_POLICE","B_Carryall_cbr","","H_HelmetB",{"ItemCompass","ItemGPS","NVGoggles_OPFOR","Binocular"},"srifle_EBR_ARCO_pointer_F","hgun_P07_snds_F",{},{"20Rnd_762x51_Mag","30Rnd_9x21_Mag"},{"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","optic_Arco","optic_LRPS"},{"30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag"},{"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"},{"HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone"},{"","acc_pointer_IR","optic_Arco","bipod_03_F_blk"},{"","","",""},{{"redgull",25},{"waterBottle",5},{"tbacon",9}}};
	};
	
	class mk18_silencer {
		loadout[] = {"U_B_CombatUniform_mcam","V_TacVest_blk_POLICE","B_Carryall_cbr","","H_HelmetB",{"ItemCompass","ItemGPS","NVGoggles_OPFOR","Binocular"},"srifle_EBR_ARCO_pointer_F","hgun_P07_snds_F",{},{"20Rnd_762x51_Mag","30Rnd_9x21_Mag"},{"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","optic_Arco","optic_LRPS"},{"30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag"},{"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"},{"HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone"},{"","acc_pointer_IR","optic_Arco","bipod_03_F_blk"},{"","","",""},{{"redgull",25},{"waterBottle",5},{"tbacon",9}}};
	};
	
	class insats {
		loadout[] = {"U_B_CombatUniform_mcam","V_PlateCarrierH_CTRG","B_Kitbag_cbr","","H_HelmetSpecB_sand",{"ItemMap","ItemCompass","ItemWatch","ItemGPS","NVGoggles","Binocular"},"LMG_Zafir_F","hgun_P07_snds_F",{},{"30Rnd_9x21_Mag"},{"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"},{"30Rnd_9x21_Mag","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","150Rnd_762x54_Box"},{},{"150Rnd_762x54_Box","150Rnd_762x54_Box"},{"","","optic_DMS",""},{"","","",""},{{"spikeStrip",1},{"redgull",25},{"waterBottle",5},{"rabbit_grilled",10}}};
	};
	
	class insats_mar {
		loadout[] = {"U_B_CombatUniform_mcam","V_PlateCarrierH_CTRG","B_Kitbag_cbr","","H_HelmetSpecB_sand",{"ItemMap","ItemCompass","ItemWatch","ItemGPS","NVGoggles","Binocular"},"srifle_DMR_02_sniper_F","hgun_P07_snds_F",{},{"10Rnd_338_Mag","10Rnd_338_Mag","30Rnd_9x21_Mag"},{"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","ToolKit"},{"30Rnd_9x21_Mag","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone"},{},{"10Rnd_338_Mag","10Rnd_338_Mag","10Rnd_338_Mag","10Rnd_338_Mag","10Rnd_338_Mag","10Rnd_338_Mag","10Rnd_338_Mag","10Rnd_338_Mag","10Rnd_338_Mag","10Rnd_338_Mag"},{"","","optic_AMS_snd","bipod_01_F_snd"},{"","","",""},{{"spikeStrip",1},{"redgull",25},{"waterBottle",5},{"rabbit_grilled",10}}};
	};
	
	class heavygunner {
		loadout[] = {"U_B_CombatUniform_mcam","V_PlateCarrier1_rgr","","G_Combat","H_HelmetB",{"ItemMap","ItemCompass","ItemWatch","ItemGPS","NVGoggles","Binocular"},"MMG_02_sand_RCO_LP_F","hgun_P07_snds_F",{"FirstAidKit","FirstAidKit","FirstAidKit"},{"30Rnd_9x21_Mag"},{},{},{"FirstAidKit"},{"130Rnd_338_Mag","130Rnd_338_Mag","30Rnd_9x21_Mag"},{"","acc_pointer_IR","optic_Hamr","bipod_01_F_snd"},{"","","",""},{{"redgull",20},{"waterBottle",1},{"tbacon",3}}};
	};
	
	class cyrus {
		loadout[] = {"U_B_CTRG_2","V_PlateCarrierH_CTRG","B_Carryall_khk","G_Combat","H_Booniehat_khk_hs",{"ItemMap","ItemCompass","ItemWatch","ItemGPS","NVGoggles","Binocular"},"srifle_DMR_05_hex_F","hgun_Pistol_heavy_01_F",{"FirstAidKit"},{"10Rnd_93x64_DMR_05_Mag","11Rnd_45ACP_Mag","11Rnd_45ACP_Mag"},{"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","ToolKit"},{"10Rnd_93x64_DMR_05_Mag","10Rnd_93x64_DMR_05_Mag","10Rnd_93x64_DMR_05_Mag","10Rnd_93x64_DMR_05_Mag","10Rnd_93x64_DMR_05_Mag"},{},{"10Rnd_93x64_DMR_05_Mag","10Rnd_93x64_DMR_05_Mag","10Rnd_93x64_DMR_05_Mag","10Rnd_93x64_DMR_05_Mag","10Rnd_93x64_DMR_05_Mag","10Rnd_93x64_DMR_05_Mag","11Rnd_45ACP_Mag","11Rnd_45ACP_Mag","11Rnd_45ACP_Mag","11Rnd_45ACP_Mag","10Rnd_93x64_DMR_05_Mag"},{"","","optic_AMS_snd","bipod_02_F_hex"},{"","","optic_MRD",""},{{"spikeStrip",2},{"redgull",25},{"waterBottle",5},{"tbacon",9}}};
	};
	
	class lynx {
		loadout[] = {"U_O_FullGhillie_lsh","V_TacVest_khk","B_Carryall_khk","G_Combat","H_HelmetB_camo",{"ItemMap","ItemCompass","ItemWatch","ItemGPS","NVGoggles_INDEP","Binocular"},"srifle_GM6_F","hgun_Pistol_heavy_01_MRD_F",{"FirstAidKit"},{"5Rnd_127x108_Mag","11Rnd_45ACP_Mag","11Rnd_45ACP_Mag","11Rnd_45ACP_Mag","11Rnd_45ACP_Mag"},{"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","ToolKit","ToolKit"},{"5Rnd_127x108_Mag","5Rnd_127x108_Mag","5Rnd_127x108_Mag","5Rnd_127x108_Mag","5Rnd_127x108_Mag"},{},{"5Rnd_127x108_Mag","5Rnd_127x108_Mag","5Rnd_127x108_Mag","5Rnd_127x108_Mag","5Rnd_127x108_Mag","11Rnd_45ACP_Mag","11Rnd_45ACP_Mag"},{"","","optic_LRPS",""},{"","","optic_MRD",""},{{"redgull",20},{"waterBottle",5},{"tbacon",9}}};
	};
	
	class m320_close {
		loadout[] = {"U_I_C_Soldier_Para_3_F","V_TacVest_camo","","G_Bandanna_beast","H_HelmetCrew_O_ghex_F",{"ItemMap","ItemCompass","ItemWatch","ItemRadio","ItemGPS","NVGogglesB_gry_F","Binocular"},"srifle_LRR_F","",{"FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"},{},{},{},{},{"7Rnd_408_Mag","7Rnd_408_Mag","7Rnd_408_Mag","7Rnd_408_Mag","7Rnd_408_Mag","7Rnd_408_Mag","7Rnd_408_Mag"},{"","","",""},{"","","",""},{{"redgull",21},{"tbacon",3}}};
	};
	
	class spotter {
		loadout[] = {"U_I_FullGhillie_lsh","","B_Carryall_khk","","",{"ItemMap","ItemCompass","ItemWatch","ItemGPS","Rangefinder"},"SMG_01_F","",{},{"30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01"},{},{"30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01"},{},{},{"","","optic_Aco",""},{"","","",""},{{"redgull",25},{"waterBottle",5},{"tbacon",5}}};
	};
	
	class taliban {
		loadout[] = {"U_I_C_Soldier_Para_4_F","V_TacChestrig_cbr_F","B_AssaultPack_rgr","","H_ShemagOpen_tan",{"ItemMap","ItemCompass","ItemWatch","ItemGPS","Binocular"},"arifle_AKM_F","",{"FirstAidKit","FirstAidKit","FirstAidKit"},{"30Rnd_762x39_Mag_F"},{},{"RPG7_F","RPG7_F","Toolkit"},{"NVGoggles","FirstAidKit","FirstAidKit"},{"30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F"},{"","","",""},{"","","",""},{{"redgull",30},{"waterBottle",2},{"tbacon",4}}};
	};
	
	class diver {
		loadout[] = {"U_B_Wetsuit","V_RebreatherB","B_Parachute","G_Diving","H_MilCap_blue",{"ItemMap","ItemCompass","ItemWatch","ItemGPS","NVGoggles","Binocular"},"arifle_SDAR_F","",{"20Rnd_556x45_UW_mag","20Rnd_556x45_UW_mag","20Rnd_556x45_UW_mag","20Rnd_556x45_UW_mag","20Rnd_556x45_UW_mag","20Rnd_556x45_UW_mag","20Rnd_556x45_UW_mag"},{"20Rnd_556x45_UW_mag"},{},{},{},{},{"","","",""},{"","","",""},{{"redgull",16},{"waterBottle",3},{"tbacon",5}}};
	};
	
	class blixten {
		loadout[] = {"U_Rangemaster","","","G_Aviator","H_RacingHelmet_1_red_F",{"ItemMap","ItemGPS","ItemCompass","ItemWatch"},"","",{"NVGoggles_OPFOR"},{},{},{},{},{},{"","","",""},{"","","",""},{{"waterBottle",5},{"tbacon",10},{"redgull",9}}};
	};
	
	class blixten_NV {
		loadout[] = {"U_Rangemaster","","","G_Aviator","H_RacingHelmet_1_red_F",{"ItemMap","ItemGPS","ItemCompass","ItemWatch","NVGoggles_OPFOR"},"","",{},{},{},{},{},{},{"","","",""},{"","","",""},{{"waterBottle",5},{"tbacon",10},{"redgull",9}}};
	};
	
	class event {
		loadout[] = {"U_Rangemaster","","","G_Aviator","H_Cap_marshal",{"ItemMap","ItemCompass","ItemWatch","ItemGPS","NVGogglesB_blk_F","Rangefinder"},"","",{},{},{},{},{},{},{"","","",""},{"","","",""},{{"waterBottle",5},{"tbacon",10},{"redgull",9}}};
	};
	
	class admin {
		loadout[] = {"U_Rangemaster","","","G_Aviator","H_Cap_press",{"ItemMap","ItemCompass","ItemWatch","ItemGPS","NVGogglesB_blk_F","Rangefinder"},"","",{},{},{},{},{},{},{"","","",""},{"","","",""},{{"redgull",9},{"waterBottle",5},{"tbacon",10}}};
	};
	
	class default {
		loadout[] = {"defaultLoadout","","B_Carryall_cbr","","",{"ItemMap","ItemCompass","ItemWatch","NVGoggles","Binocular"},"","",{"FirstAidKit","FirstAidKit"},{},{"ToolKit","ToolKit"},{},{},{},{"","","",""},{"","","",""},{{"waterBottle",5},{"tbacon",10},{"redgull",25}}};
	};
};


