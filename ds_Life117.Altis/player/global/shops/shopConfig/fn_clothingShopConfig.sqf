/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Fulls the array and sets up variables for shop items
*/

private ["_shop","_returnList","_return"];

_shop = _this select 0;

switch(_shop)do
	{
	case 9://Civ clothes
		{
			_return = [["U_C_Poloshirt_blue",20],
			["U_C_Poloshirt_burgundy",27],
			["U_C_Poloshirt_redwhite",15],
			["U_C_Poloshirt_salmon",17],
			["U_C_Poloshirt_stripped",12],
			["U_C_Poloshirt_tricolour",35],
			["U_C_Poor_1",25],
			["U_C_Poor_2",25],
			["U_IG_Guerilla2_2",65],
			["U_IG_Guerilla3_1",73],
			["U_IG_Guerilla2_3",120],
			["U_C_HunterBody_grn",150],
			["U_C_WorkerCoveralls",250],
			["U_OrestesBody",110],
			["U_C_Driver_1_black",150],
			["U_C_Driver_1_blue",150],
			["U_C_Driver_1_red",150],
			["U_C_Driver_1_orange",150],
			["U_C_Driver_1_green",150],
			["U_C_Driver_1_white",150],
			["U_C_Driver_1_yellow",150],
			["U_C_Driver_2",350],
			["U_C_Driver_1",360],
			["U_C_Driver_3",370],
			["U_C_Driver_4",370],
			["U_NikosAgedBody",2500],
			["U_NikosBody",5000],
			["V_Press_F",25]];
		};
	case 10://Civ Hats
		{
			_return = [["H_Bandanna_camo",12],
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
			["H_PilotHelmetFighter_I",5000]];
		};
	case 11://civ glasses
		{
			_return = [["G_Shades_Black",2],
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
			["G_Combat",5]];
		};
	case 12://civ backpacks
		{
			_return = [["B_AssaultPack_cbr",250],
			["B_Kitbag_mcamo",450],
			["B_TacticalPack_oli",350],
			["B_FieldPack_ocamo",300],
			["B_Bergen_sgg",450],
			["B_Kitbag_cbr",450],
			["B_Carryall_oli",650],
			["B_Carryall_khk",650],
			["B_Carryall_oucamo",650]];
		};
	case 13://civ diving
		{
			_return = [["U_B_Wetsuit",600],
			["G_Diving",50],
			["V_RebreatherB",900]];
		};
	case 24://cop cadet
		{
			if(DS_copLevel < 2)then
				{
				_return = [["G_Diving",15],
				["U_Rangemaster",200],
				["U_O_Wetsuit",3000],
				["H_Booniehat_dgtl",200],
				["H_Cap_police",200],
				["H_Watchcap_blk",300],
				["V_Rangemaster_belt",7],
				["V_BandollierB_blk",7],
				["V_RebreatherB",7],
				["H_PilotHelmetFighter_B",1100],
				["B_Carryall_cbr",350]];
				}
				else
				{
			if(DS_copLevel == 2)then
				{
				_return = [["G_Diving",15],
				["U_Rangemaster",200],
				["U_O_Wetsuit",3000],
				["H_Booniehat_dgtl",200],
				["H_Cap_police",200],
				["H_Watchcap_blk",300],
				["V_Rangemaster_belt",7],
				["V_BandollierB_blk",7],
				["V_RebreatherB",7],
				["B_Carryall_cbr",350],
				["H_PilotHelmetFighter_B",1100],
				["V_TacVest_blk_POLICE",80],
				["U_BG_Guerilla2_3",555],
				["H_Booniehat_mcamo",320]];
				}
				else
				{
			if(DS_copLevel == 3)then
				{
				_return = [["G_Diving",15],
				["U_Rangemaster",200],
				["U_O_Wetsuit",3000],
				["H_Booniehat_dgtl",200],
				["H_Cap_police",200],
				["H_Watchcap_blk",300],
				["V_Rangemaster_belt",7],
				["V_BandollierB_blk",7],
				["V_RebreatherB",7],
				["B_Carryall_cbr",350],
				["V_TacVest_blk_POLICE",80],
				["U_BG_Guerilla2_3",555],
				["H_Booniehat_mcamo",320],
				["U_Competitor",555],
				["H_MilCap_mcamo",400],
				["H_Shemag_khk",400],
				["H_PilotHelmetFighter_B",1100],
				["H_Beret_blk_POLICE",400],
				["V_PlateCarrier1_blk",600],
				["V_PlateCarrierIAGL_dgtl",600]];
				}
				else
				{
			if(DS_copLevel == 4)then
				{
				_return = [["G_Diving",15],
				["U_Rangemaster",200],
				["U_O_Wetsuit",3000],
				["H_Booniehat_dgtl",200],
				["H_Cap_police",200],
				["H_Watchcap_blk",300],
				["V_Rangemaster_belt",7],
				["V_BandollierB_blk",7],
				["V_RebreatherB",7],
				["B_Carryall_cbr",350],
				["V_TacVest_blk_POLICE",80],
				["U_BG_Guerilla2_3",555],
				["H_Booniehat_mcamo",320],
				["U_Competitor",555],
				["H_MilCap_mcamo",400],
				["H_Shemag_khk",400],
				["H_Beret_blk_POLICE",400],
				["V_PlateCarrier1_blk",600],
				["V_PlateCarrierIAGL_dgtl",600],
				["H_HelmetB_plain_blk",1100],
				["H_CrewHelmetHeli_B",1100],
				["H_PilotHelmetFighter_B",1100],
				["H_HelmetO_oucamo",1100],
				["H_Beret_Colonel",1100],
				["V_PlateCarrier3_rgr",800]];
				}
				else
				{
			if(DS_copLevel == 5)then
				{
				_return = [["G_Diving",15],
				["U_Rangemaster",200],
				["U_O_Wetsuit",3000],
				["H_Booniehat_dgtl",200],
				["H_Cap_police",200],
				["H_Watchcap_blk",300],
				["V_Rangemaster_belt",7],
				["V_BandollierB_blk",7],
				["V_RebreatherB",7],
				["B_Carryall_cbr",350],
				["V_TacVest_blk_POLICE",80],
				["U_BG_Guerilla2_3",555],
				["H_Booniehat_mcamo",320],
				["U_Competitor",555],
				["H_MilCap_mcamo",400],
				["H_Shemag_khk",400],
				["H_Beret_blk_POLICE",400],
				["V_PlateCarrier1_blk",600],
				["V_PlateCarrierIAGL_dgtl",600],
				["H_HelmetB_plain_blk",1100],
				["H_CrewHelmetHeli_B",1100],
				["H_PilotHelmetFighter_B",1100],
				["H_HelmetO_oucamo",1100],
				["H_Beret_Colonel",1100],
				["V_PlateCarrier3_rgr",800],
				["U_millerbody",1155],
				["V_PlateCarrierSpec_blk",1800],
				["V_PlateCarrierIAGL_oli",2200]];
				}
				else
				{
				_return = [["G_Diving",15],
				["U_Rangemaster",200],
				["U_O_Wetsuit",3000],
				["H_Booniehat_dgtl",200],
				["H_Cap_police",200],
				["H_Watchcap_blk",300],
				["V_Rangemaster_belt",7],
				["V_BandollierB_blk",7],
				["V_RebreatherB",7],
				["B_Carryall_cbr",350],
				["V_TacVest_blk_POLICE",80],
				["U_BG_Guerilla2_3",555],
				["H_Booniehat_mcamo",320],
				["U_Competitor",555],
				["H_MilCap_mcamo",400],
				["H_Shemag_khk",400],
				["H_Beret_blk_POLICE",400],
				["V_PlateCarrier1_blk",600],
				["V_PlateCarrierIAGL_dgtl",600],
				["H_HelmetB_plain_blk",1100],
				["H_CrewHelmetHeli_B",1100],
				["H_PilotHelmetFighter_B",1100],
				["H_HelmetO_oucamo",1100],
				["H_Beret_Colonel",1100],
				["V_PlateCarrier3_rgr",800],
				["U_millerbody",1155],
				["V_PlateCarrierSpec_blk",1800],
				["V_PlateCarrierIAGL_oli",2200],
				["U_B_CombatUniform_mcam",1455],
				["V_PlateCarrierGL_blk",2800]];
				};};};};};
		};
	case 25://cop PO
		{
			_return = [
			["V_TacVest_blk_POLICE",80],
			["U_BG_Guerilla2_3",555],
			["H_Booniehat_mcamo",320]];
		};
	case 26://cop S
		{
			_return = [["U_Competitor",555],
			["H_MilCap_mcamo",400],
			["H_Shemag_khk",400],
			["H_Beret_blk_POLICE",400],
			["V_PlateCarrier1_blk",600],
			["V_PlateCarrierIAGL_dgtl",600]];
		};
	case 27://cop SS
		{
			_return = [["H_HelmetB_plain_blk",1100],
			["H_CrewHelmetHeli_B",1100],
			["H_PilotHelmetFighter_B",1100],
			["H_HelmetO_oucamo",1100],
			["H_Beret_Colonel",1100],
			["V_PlateCarrier3_rgr",800]];
		};
	case 28://cop L
		{
			_return = [["U_millerbody",1155],
			["V_PlateCarrierSpec_blk",1800],
			["V_PlateCarrierIAGL_oli",2200]];
		};
	case 29://cop SI
		{
			_return = [["U_B_CombatUniform_mcam",1455],
			["V_PlateCarrierGL_blk",2800]];
		};
	case 73://Rebel clothing
		{
			_return = [["U_IG_Guerilla1_1",500],
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
			["U_I_FullGhillie_sard",7500]];
		};
	case 74://Rebel hats
		{
			_return = [["H_Booniehat_dgtl",50],
			["H_ShemagOpen_tan",185],
			["H_Shemag_olive",185],
			["H_ShemagOpen_khk",180],
			["H_HelmetO_ocamo",250],
			["H_MilCap_oucamo",120],
			["H_Bandanna_camo",65],
			["H_HelmetB_camo",85],
			["H_StrawHat",42],
			["H_PilotHelmetFighter_I",3000]];
			
			if(player distance clanBase3 < 100)then{_return pushBack ["H_Beret_02",66];};
		};
	case 75://Rebel glasses
		{
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
	case 76://Rebel vest
		{
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
			["V_PlateCarrierIAGL_dgtl",13500]];
			
			if(player distance baseClan6 < 100)then{_return pushBack ["V_PlateCarrierSpec_blk",666];};
		};
	case 77://Rebel backpacks
		{
			_return = [["B_AssaultPack_cbr",250],
			["B_Kitbag_mcamo",450],
			["B_TacticalPack_oli",350],
			["B_FieldPack_ocamo",300],
			["B_Bergen_sgg",450],
			["B_Kitbag_cbr",450],
			["B_Carryall_oli",500],
			["B_Carryall_khk",500]];
		};
	case 124://Security lvl3
		{
			_return = [["U_Rangemaster",0],
			["H_Watchcap_blk",25],
			["H_RacingHelmet_4_F",25],
			["H_RacingHelmet_1_orange_F",25],
			["V_PlateCarrierSpec_blk",300]];
		};
	};
	
_return;
			
