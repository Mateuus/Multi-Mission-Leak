/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Fills the array and sets up variables for shop items
*/

params ["_shop"];

private _return = [];

switch(_shop)do {
	case 9: { //Civ clothes
		_return = [
			["U_C_man_sport_1_F",80],
			["U_C_man_sport_3_F",80],
			["U_C_man_sport_2_F",80],
			["U_C_Man_casual_6_F",80],
			["U_C_Man_casual_4_F",80],
			["U_C_Man_casual_5_F",80],
			["U_C_Man_casual_2_F",110],
			["U_C_Man_casual_3_F",110],
			["U_C_Man_casual_1_F",110],
			["U_I_C_Soldier_Bandit_4_F",150],
			["U_I_C_Soldier_Bandit_1_F",150],
			["U_I_C_Soldier_Bandit_3_F",150],
			["U_I_C_Soldier_Bandit_2_F",200],
			["U_I_C_Soldier_Bandit_5_F",200],
			["U_NikosAgedBody",2500],
			["U_NikosBody",5000],
			["V_Press_F",25],
			["U_C_Driver_1_black",3500],
			["U_C_Driver_1_blue",3500],
			["U_C_Driver_2",3500],
			["U_C_Driver_1",3500],
			["U_C_Driver_1_green",3500],
			["U_C_Driver_1_orange",3500],
			["U_C_Driver_1_red",3500],
			["U_C_Driver_3",3500],
			["U_C_Driver_4",3500],
			["U_C_Driver_1_white",3500],
			["U_I_Protagonist_VR",100000],
			["U_O_Protagonist_VR",100000],
			["U_B_Protagonist_VR",100000]
		];
	};
	case 10: { //Civ Hats
		_return = [
			["H_Bandanna_camo",12],
			["H_Bandanna_surfer",13],
			["H_Bandanna_gry",15],
			["H_Bandanna_cbr",16],
			["H_Bandanna_surfer",13],
			["H_Bandanna_khk",14],
			["H_Bandanna_sgg",16],
			["H_StrawHat",22],
			["H_BandMask_blk",30],
			["H_Booniehat_tan",42],
			["H_Hat_blue",31],
			["H_Hat_brown",27],
			["H_Hat_checker",34],
			["H_Hat_grey",28],
			["H_Hat_tan",26],
			["H_Cap_blu",15],
			["H_Cap_grn",15],
			["H_Cap_grn_BI",15],
			["H_Cap_oli",15],
			["H_Cap_red",15],
			["H_Cap_tan",15],
			["H_RacingHelmet_1_black_F",100],
			["H_RacingHelmet_1_red_F",100],
			["H_RacingHelmet_1_white_F",100],
			["H_RacingHelmet_1_blue_F",100],
			["H_RacingHelmet_1_yellow_F",100],
			["H_RacingHelmet_1_green_F",100],
			["H_RacingHelmet_1_F",250],
			["H_RacingHelmet_2_F",250],
			["H_RacingHelmet_3_F",250],
			["H_RacingHelmet_4_F",250],
			["H_PilotHelmetFighter_I",5000]
		];
	};
	case 11: { //Civ glasses
		_return = [
			["G_Shades_Black",2],
			["G_Shades_Blue",2],
			["G_Sport_Blackred",2],
			["G_Sport_Checkered",2],
			["G_Sport_Blackyellow",2],
			["G_Sport_BlackWhite",1],
			["G_Squares",1],
			["G_Aviator",10],
			["G_Lady_Mirror",15],
			["G_Lady_Dark",15],
			["G_Lady_Blue",15],
			["G_Lowprofile",3],
			["G_Combat",5]
		];
	};
	case 12: { //Civ backpacks
		_return = [
			["B_AssaultPack_cbr",250],
			["B_Kitbag_mcamo",450],
			["B_TacticalPack_oli",350],
			["B_FieldPack_ocamo",300],
			["B_Bergen_sgg",450],
			["B_Kitbag_cbr",450],
			["B_Carryall_oucamo",650],
			["B_Carryall_khk",650],
			["B_Carryall_oli",650],
			["B_Carryall_cbr",650]
		];
	};
	case 13: { //Civ diving
		_return = [
			["U_B_Wetsuit",600],
			["G_Diving",50],
			["V_RebreatherB",900]
		];
	};
	case 147: { //Mechanic & Medic clothes
		_return = [
			["U_Rangemaster",200],
			["U_I_Wetsuit",600],
			["G_Diving",50],
			["V_RebreatherIA",900]
		];
	};
	case 24: { //Police
		//Public Cop & Cadet
		if(DS_copLevel < 2)then {
			_return = [
				["U_Rangemaster",200],
				["H_Cap_police",200],
				["H_MilCap_gen_F",350],
				["H_PilotHelmetFighter_B",500],
				["U_B_Wetsuit",3000],
				["V_RebreatherB",250],
				["G_Diving",50],
				["B_Carryall_cbr",350],
				["V_TacVestIR_blk",1000],
				["V_TacVest_blk",1000]
			];
		};

		//Constable
		if(DS_copLevel isEqualTo 2)then {
			_return = [
				["U_BG_Guerilla2_3",300],
				["H_Cap_police",200],
				["H_MilCap_gen_F",350],
				["H_MilCap_ghex_F",300],
				["H_PilotHelmetFighter_B",500],
				["U_B_Wetsuit",3000],
				["V_RebreatherB",250],
				["G_Diving",50],
				["B_Carryall_cbr",350],
				["V_TacVestIR_blk",1000],
				["V_TacVest_blk",1000],
				["V_TacVest_blk_POLICE",1000]
			];
		};

		//Senior Constable
		if(DS_copLevel isEqualTo 3)then {
			_return = [
				["U_BG_Guerilla2_3",300],
				["H_Cap_police",200],
				["H_MilCap_gen_F",350],
				["H_MilCap_ghex_F",300],
				["H_Beret_blk",450],
				["H_PilotHelmetFighter_B",500],
				["U_B_Wetsuit",3000],
				["V_RebreatherB",250],
				["G_Diving",50],
				["B_Carryall_cbr",350],
				["V_TacVestIR_blk",1000],
				["V_TacVest_blk",1000],
				["V_TacVest_blk_POLICE",1000],
				["V_TacVest_gen_F",1000]
			];
		};

		//Sergeant
		if(DS_copLevel isEqualTo 4)then {
			_return = [
				["U_B_GEN_Soldier_F",400],
				["G_Bandanna_blk",1000],
				["H_Cap_police",200],
				["H_MilCap_gen_F",350],
				["H_MilCap_ghex_F",300],
				["H_PilotHelmetHeli_B",800],
				["H_Beret_Colonel",550],
				["H_HelmetB_tna_F",600],
				["H_PilotHelmetFighter_B",500],
				["H_CrewHelmetHeli_B",750],
				["U_B_Wetsuit",3000],
				["V_RebreatherB",250],
				["G_Diving",50],
				["B_ViperHarness_blk_F",250],
				["B_Bergen_hex_F",350],
				["V_TacVestIR_blk",1000],
				["V_TacVest_blk",1000],
				["V_TacVest_blk_POLICE",1000],
				["V_TacVest_gen_F",1000],
				["V_PlateCarrier1_blk",1000]
			];
		};

		//Senior Sergeant
		if(DS_copLevel isEqualTo 5)then {
			_return = [
				["U_B_GEN_Soldier_F",400],
				["G_Bandanna_blk",1000],
				["H_Cap_police",200],
				["H_MilCap_gen_F",350],
				["H_MilCap_ghex_F",300],
				["H_PilotHelmetHeli_B",800],
				["H_Beret_Colonel",550],
				["H_HelmetSpecB_blk",900],
				["H_PilotHelmetFighter_B",500],
				["H_CrewHelmetHeli_B",750],
				["U_B_Wetsuit",3000],
				["V_RebreatherB",250],
				["G_Diving",50],
				["B_ViperHarness_blk_F",250],
				["B_Bergen_hex_F",350],
				["V_TacVestIR_blk",1000],
				["V_TacVest_blk",1000],
				["V_TacVest_blk_POLICE",1000],
				["V_TacVest_gen_F",1000],
				["V_PlateCarrier1_blk",1000],
				["V_PlateCarrierGL_blk",1000]
			];
		};

		//Lieutenant
		if(DS_copLevel isEqualTo 6)then {
			_return = [
				["U_B_GEN_Soldier_F",400],
				["G_Bandanna_blk",1000],
				["H_Cap_police",200],
				["H_MilCap_gen_F",350],
				["H_MilCap_ghex_F",300],
				["H_PilotHelmetHeli_B",800],
				["H_Beret_Colonel",550],
				["H_HelmetSpecB_blk",900],
				["H_PilotHelmetFighter_B",500],
				["H_CrewHelmetHeli_B",750],
				["H_HelmetB_TI_tna_F",500],
				["U_B_Wetsuit",3000],
				["V_RebreatherB",250],
				["G_Diving",50],
				["B_ViperHarness_blk_F",250],
				["B_Bergen_hex_F",350],
				["V_TacVestIR_blk",1000],
				["V_TacVest_blk",1000],
				["V_TacVest_blk_POLICE",1000],
				["V_TacVest_gen_F",1000],
				["V_PlateCarrier1_blk",1000],
				["V_PlateCarrierGL_blk",1000],
				["V_PlateCarrierSpec_blk",1000]
			];
		};

		//Superintendent
		if(DS_copLevel isEqualTo 7)then {
			_return = [
				["U_B_GEN_Commander_F",700],
				["G_Bandanna_blk",1000],
				["G_Balaclava_TI_blk_F",1000],
				["H_Cap_police",200],
				["H_MilCap_gen_F",350],
				["H_MilCap_ghex_F",300],
				["H_PilotHelmetHeli_B",800],
				["H_Beret_Colonel",550],
				["H_HelmetSpecB_blk",900],
				["H_PilotHelmetFighter_B",500],
				["H_CrewHelmetHeli_B",750],
				["H_HelmetB_TI_tna_F",500],
				["U_B_Wetsuit",3000],
				["V_RebreatherB",250],
				["G_Diving",50],
				["B_ViperHarness_blk_F",250],
				["B_Bergen_hex_F",350],
				["V_TacVestIR_blk",1000],
				["V_TacVest_blk",1000],
				["V_TacVest_blk_POLICE",1000],
				["V_TacVest_gen_F",1000],
				["V_PlateCarrier1_blk",1000],
				["V_PlateCarrierGL_blk",1000],
				["V_PlateCarrierSpec_blk",1000]
			];
		};

		//Assistant Commissioner
		if(DS_copLevel isEqualTo 8)then {
			_return = [
				["U_B_GEN_Commander_F",700],
				["G_Bandanna_blk",1000],
				["G_Balaclava_TI_blk_F",1000],
				["H_Cap_police",200],
				["H_MilCap_gen_F",350],
				["H_MilCap_ghex_F",300],
				["H_PilotHelmetHeli_B",800],
				["H_Beret_Colonel",550],
				["H_HelmetSpecB_blk",900],
				["H_PilotHelmetFighter_B",500],
				["H_CrewHelmetHeli_B",750],
				["H_HelmetB_TI_tna_F",500],
				["U_B_Wetsuit",3000],
				["V_RebreatherB",250],
				["G_Diving",50],
				["B_ViperHarness_blk_F",250],
				["B_Bergen_hex_F",350],
				["V_TacVestIR_blk",1000],
				["V_TacVest_blk",1000],
				["V_TacVest_blk_POLICE",1000],
				["V_TacVest_gen_F",1000],
				["V_PlateCarrier1_blk",1000],
				["V_PlateCarrierGL_blk",1000],
				["V_PlateCarrierSpec_blk",1000]
			];
		};

		//Deputy Commissioner+
		if(DS_copLevel > 8)then {
			_return = [
				["U_B_CombatUniform_mcam",700],
				["G_Bandanna_blk",1000],
				["G_Balaclava_TI_blk_F",1000],
				["H_Watchcap_blk",1000],
				["H_Cap_police",200],
				["H_MilCap_gen_F",350],
				["H_MilCap_ghex_F",300],
				["H_PilotHelmetHeli_B",800],
				["H_Beret_Colonel",550],
				["H_HelmetSpecB_blk",900],
				["H_PilotHelmetFighter_B",500],
				["H_CrewHelmetHeli_B",750],
				["H_HelmetB_TI_tna_F",500],
				["U_B_Wetsuit",3000],
				["V_RebreatherB",250],
				["G_Diving",50],
				["B_ViperHarness_blk_F",250],
				["B_Bergen_hex_F",350],
				["V_TacVestIR_blk",1000],
				["V_TacVest_blk",1000],
				["V_TacVest_blk_POLICE",1000],
				["V_TacVest_gen_F",1000],
				["V_PlateCarrier1_blk",1000],
				["V_PlateCarrierGL_blk",1000],
				["V_PlateCarrierSpec_blk",1000]
			];
		};
	};
	case 25: {_return = []}; //Cop PO
	case 26: {_return = []}; //Cop S
	case 27: {_return = []}; //Cop SS
	case 28: {_return = []}; //Cop L
	case 29: {_return = []}; //Cop SI
	case 73: { //Rebel clothing
		_return = [
			["U_I_C_Soldier_Para_1_F",500],
			["U_I_C_Soldier_Para_4_F",500],
			["U_I_C_Soldier_Para_5_F",500],
			["U_I_C_Soldier_Para_3_F",500],
			["U_I_C_Soldier_Para_2_F",500],
			["U_I_C_Soldier_Camo_F",600],
			["U_O_T_Officer_F",750],
			["U_B_T_Soldier_SL_F",750],
			["U_O_T_Sniper_F",1250],
			["U_B_T_Sniper_F",1250],
			["U_B_CTRG_Soldier_urb_2_F",2500],
			["U_B_T_Soldier_AR_F",1500],
			["U_B_T_Soldier_F",1600],
			["U_I_G_Story_Protagonist_F",750],
			["U_I_G_resistanceLeader_F",1150],
			["U_O_SpecopsUniform_ocamo",1750],
			["U_O_PilotCoveralls",1561],
			["U_IG_leader",1534],
			["U_O_CombatUniform_ocamo",1700],
			["U_O_CombatUniform_oucamo",1700],
			["U_I_CombatUniform_shortsleeve",1800],
			["U_I_CombatUniform",1900],
			["U_B_CTRG_3",1800],
			["U_O_SpecopsUniform_blk",2000],
			["U_I_GhillieSuit",5000],
			["U_B_GhillieSuit",5000],
			["U_O_GhillieSuit",5000],
			["U_B_FullGhillie_ard",7500],
			["U_B_FullGhillie_lsh",7500],
			["U_B_FullGhillie_sard",7500],
			["U_O_FullGhillie_ard",7500],
			["U_O_FullGhillie_lsh",7500],
			["U_O_FullGhillie_sard",7500],
			["U_I_FullGhillie_ard",7500],
			["U_I_FullGhillie_lsh",7500],
			["U_I_FullGhillie_sard",7500],
			["U_B_T_FullGhillie_tna_F",7500],
			["U_O_T_FullGhillie_tna_F",7500]
		];
	};
	case 74: { //Rebel hats
		_return = [["H_Booniehat_dgtl",50],
		['H_Helmet_Skate',60],
		["H_ShemagOpen_tan",185],
		["H_Shemag_olive",185],
		["H_ShemagOpen_khk",180],
		["H_HelmetO_ocamo",250],
		["H_MilCap_oucamo",120],
		["H_Bandanna_camo",65],
		["H_HelmetB_camo",85],
		["H_StrawHat",42],
		["H_Booniehat_tna_F",200],
		["H_MilCap_ghex_F",200],
		["H_MilCap_tna_F",200],
		["H_HelmetSpecB_blk",1500],
		["H_HelmetB_Enh_tna_F",1500],
		["H_PilotHelmetFighter_I",3000]];
	};
	case 75: { //Rebel glasses
		_return = [["G_Shades_Black",2],
		["G_Shades_Blue",2],
		["G_Sport_Blackred",2],
		["G_Sport_Checkered",2],
		["G_Sport_Blackyellow",2],
		["G_Sport_BlackWhite",2],
		["G_Squares",1],
		["G_Lowprofile",3],
		["G_Combat",5]];
	};
	case 76: { //Rebel vest
		_return = [["V_TacVest_khk",1200],
		["V_BandollierB_cbr",450],
		["V_HarnessO_brn",750],
		["V_PlateCarrierL_CTRG",6000],
		["V_TacVestIR_blk",6000],
		["V_PlateCarrierIA1_dgtl",6000],
		["V_PlateCarrierH_CTRG",8000],
		["V_PlateCarrierIA2_dgtl",8000],
		["V_PlateCarrierSpec_rgr",10000],
		["V_PlateCarrierSpec_mtp",10000],
		["V_PlateCarrierGL_rgr",12500],
		["V_PlateCarrierGL_mtp",12500],
		["V_PlateCarrierIAGL_oli",13500],
		["V_PlateCarrierIAGL_dgtl",13500],
		["V_PlateCarrier1_rgr_noflag_F",10000],
		["V_PlateCarrier1_tna_F",10000],
		["V_PlateCarrier2_rgr_noflag_F",12500],
		["V_PlateCarrier2_tna_F",12500],
		["V_PlateCarrierGL_tna_F",15000],
		["V_PlateCarrierSpec_tna_F",15000]];

		// if((player distance baseClan1 < 100)&&(baseClan1 getVariable ["special",false]))then{_return pushBack ["V_PlateCarrierSpec_blk",30000];};
		// if((player distance baseClan2 < 100)&&(baseClan2 getVariable ["special",false]))then{_return pushBack ["V_PlateCarrierSpec_blk",30000];};
		// if((player distance baseClan3 < 100)&&(baseClan3 getVariable ["special",false]))then{_return pushBack ["V_PlateCarrierSpec_blk",30000];};
		// if((player distance baseClan4 < 100)&&(baseClan4 getVariable ["special",false]))then{_return pushBack ["V_PlateCarrierSpec_blk",30000];};
		// if((player distance baseClan5 < 100)&&(baseClan5 getVariable ["special",false]))then{_return pushBack ["V_PlateCarrierSpec_blk",30000];};
		// if((player distance baseClan7 < 100)&&(baseClan7 getVariable ["special",false]))then{_return pushBack ["V_PlateCarrierSpec_blk",30000];};
		// if((player distance baseClan8 < 100)&&(baseClan8 getVariable ["special",false]))then{_return pushBack ["V_PlateCarrierSpec_blk",30000];};
		// if((player distance baseClan9 < 100)&&(baseClan9 getVariable ["special",false]))then{_return pushBack ["V_PlateCarrierSpec_blk",30000];};
		// if((player distance baseClan10 < 100)&&(baseClan10 getVariable ["special",false]))then{_return pushBack ["V_PlateCarrierSpec_blk",30000];};
		// if((player distance baseClan11 < 100)&&(baseClan11 getVariable ["special",false]))then{_return pushBack ["V_PlateCarrierSpec_blk",30000];};
		// if((player distance baseClan12 < 100)&&(baseClan12 getVariable ["special",false]))then{_return pushBack ["V_PlateCarrierSpec_blk",30000];};

		if(player distance baseClan6 < 100)then{_return pushBack ["V_PlateCarrierSpec_blk",660];};
	};
	case 77: { //Rebel backpacks
		_return = [
			["B_AssaultPack_cbr",250],
			["B_Kitbag_mcamo",450],
			["B_TacticalPack_oli",350],
			["B_FieldPack_ocamo",300],
			["B_Bergen_sgg",450],
			["B_Kitbag_cbr",450],
			["B_Carryall_ocamo",500],
			["B_Carryall_oucamo",500],
			["B_Carryall_mcamo",500],
			["B_Carryall_khk",500],
			["B_Carryall_oli",500],
			["B_Carryall_cbr",500],
			["B_ViperHarness_hex_F",1000],
			["B_ViperHarness_khk_F",1000],
			["B_ViperHarness_oli_F",1000],
			["B_Bergen_dgtl_F",5000],
			["B_Bergen_hex_F",5000],
			["B_Bergen_mcamo_F",5000],
			["B_Bergen_tna_F",5000]
		];

		// if((player distance baseClan1 < 100)&&(baseClan1 getVariable ["special",false]))then{_return pushBack ["B_ViperHarness_blk_F",2000];};
		// if((player distance baseClan2 < 100)&&(baseClan2 getVariable ["special",false]))then{_return pushBack ["B_ViperHarness_blk_F",2000];};
		// if((player distance baseClan3 < 100)&&(baseClan3 getVariable ["special",false]))then{_return pushBack ["B_ViperHarness_blk_F",2000];};
		// if((player distance baseClan4 < 100)&&(baseClan4 getVariable ["special",false]))then{_return pushBack ["B_ViperHarness_blk_F",2000];};
		// if((player distance baseClan5 < 100)&&(baseClan5 getVariable ["special",false]))then{_return pushBack ["B_ViperHarness_blk_F",2000];};
		// if((player distance baseClan6 < 100)&&(baseClan6 getVariable ["special",false]))then{_return pushBack ["B_ViperHarness_blk_F",2000];};
		// if((player distance baseClan7 < 100)&&(baseClan7 getVariable ["special",false]))then{_return pushBack ["B_ViperHarness_blk_F",2000];};
		// if((player distance baseClan8 < 100)&&(baseClan8 getVariable ["special",false]))then{_return pushBack ["B_ViperHarness_blk_F",2000];};
		// if((player distance baseClan9 < 100)&&(baseClan9 getVariable ["special",false]))then{_return pushBack ["B_ViperHarness_blk_F",2000];};
		// if((player distance baseClan10 < 100)&&(baseClan10 getVariable ["special",false]))then{_return pushBack ["B_ViperHarness_blk_F",2000];};
		// if((player distance baseClan11 < 100)&&(baseClan11 getVariable ["special",false]))then{_return pushBack ["B_ViperHarness_blk_F",2000];};
		// if((player distance baseClan12 < 100)&&(baseClan12 getVariable ["special",false]))then{_return pushBack ["B_ViperHarness_blk_F",2000];};
	};
	case 124: { //Security lvl3
		_return = [
			["U_Rangemaster",0],
			["H_Watchcap_blk",25],
			["H_RacingHelmet_4_F",25],
			["H_RacingHelmet_1_orange_F",25],
			["H_PilotHelmetFighter_I",100],
			["V_PlateCarrierSpec_blk",300]
		];
	};
	case 157: { //All facegear
		_return = [
			["G_Aviator",5],
			["G_B_Diving",5],
			["G_Balaclava_blk",50],
			["G_Balaclava_combat",50],
			["G_Balaclava_lowprofile",50],
			["G_Balaclava_oli",50],
			["G_Balaclava_TI_blk_F",50],
			["G_Balaclava_TI_G_blk_F",50],
			["G_Balaclava_TI_G_tna_F",50],
			["G_Balaclava_TI_tna_F",50],
			["G_Bandanna_aviator",50],
			["G_Bandanna_beast",50],
			["G_Bandanna_blk",50],
			["G_Bandanna_khk",50],
			["G_Bandanna_oli",50],
			["G_Bandanna_shades",50],
			["G_Bandanna_sport",50],
			["G_Bandanna_tan",50],
			["G_Combat",5],
			["G_Combat_Goggles_tna_F",5],
			["G_Diving",5],
			["G_Goggles_VR",5],
			["G_I_Diving",5],
			["G_Lady_Blue",5],
			["G_Lady_Dark",5],
			["G_Lady_Mirror",5],
			["G_Lady_Red",5],
			["G_Lowprofile",5],
			["G_O_Diving",5],
			["G_Shades_Black",5],
			["G_Shades_Blue",5],
			["G_Shades_Green",5],
			["G_Shades_Red",5],
			["G_Spectacles",5],
			["G_Spectacles_Tinted",5],
			["G_Sport_Blackred",5],
			["G_Sport_BlackWhite",5],
			["G_Sport_Blackyellow",5],
			["G_Sport_Checkered",5],
			["G_Sport_Greenblack",5],
			["G_Sport_Red",5],
			["G_Squares",5],
			["G_Squares_Tinted",5],
			["G_Tactical_Black",5],
			["G_Tactical_Clear",5]
		];
	};
	case 165: { //All headgear
		_return = [
			["H_Bandanna_blu",15],
			["H_Bandanna_camo",15],
			["H_Bandanna_cbr",15],
			["H_Bandanna_gry",15],
			["H_Bandanna_khk",15],
			["H_Bandanna_khk_hs",15],
			["H_Bandanna_mcamo",15],
			["H_Bandanna_sand",15],
			["H_Bandanna_sgg",15],
			["H_Bandanna_surfer",15],
			["H_Bandanna_surfer_blk",15],
			["H_Bandanna_surfer_grn",15],

			["H_BandMask_blk",30],
			//["H_BandMask_demon",30],
			//["H_BandMask_khk",30],
			//["H_BandMask_reaper",30],

			["H_Beret_02",50],
			["H_Beret_blk",50],
			//["H_Beret_blk_POLICE",50],
			["H_Beret_brn_SF",50],
			["H_Beret_Colonel",50],
			["H_Beret_gen_F",50],
			["H_Beret_grn",50],
			["H_Beret_grn_SF",50],
			["H_Beret_ocamo",50],
			["H_Beret_red",50],

			["H_Booniehat_dgtl",42],
			["H_Booniehat_dirty",42],
			["H_Booniehat_grn",42],
			["H_Booniehat_indp",42],
			["H_Booniehat_khk",42],
			["H_Booniehat_khk_hs",42],
			["H_Booniehat_mcamo",42],
			["H_Booniehat_oli",42],
			["H_Booniehat_tan",42],
			["H_Booniehat_tna_F",42],

			["H_Cap_blk",15],
			["H_Cap_blk_CMMG",15],
			["H_Cap_blk_ION",15],
			["H_Cap_blk_Raven",15],
			["H_Cap_blk_Syndikat_F",15],
			["H_Cap_blu",15],
			["H_Cap_brn_SPECOPS",15],
			["H_Cap_grn",15],
			["H_Cap_grn_BI",15],
			["H_Cap_headphones",15],
			["H_Cap_khaki_specops_UK",15],
			["H_Cap_marshal",15],
			["H_Cap_oli",15],
			["H_Cap_oli_hs",15],
			//["H_Cap_police",15],
			["H_Cap_press",15],
			["H_Cap_red",15],
			["H_Cap_surfer",15],
			["H_Cap_tan",15],
			["H_Cap_tan_specops_US",15],
			["H_Cap_usblack",15],

			["H_Hat_blue",25],
			["H_Hat_brown",25],
			["H_Hat_camo",25],
			["H_Hat_checker",25],
			["H_Hat_grey",25],
			["H_Hat_tan",25],

			["H_StrawHat",20],
			["H_StrawHat_dark",20],

			["H_Watchcap_blk",42],
			["H_Watchcap_camo",42],
			["H_Watchcap_cbr",42],
			["H_Watchcap_khk",42],
			["H_Watchcap_sgg",42]
		];
	};
};

_return;