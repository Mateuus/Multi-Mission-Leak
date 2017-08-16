#include <macro.h>
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
ctrlSetText[3103,"Vetements"];
_ret = [];
switch (_filter) do
{
	case 0:
	{
		if (playerside == east) then {
		_ret pushBack ["U_I_CombatUniform","Staff AltisNewLife",0];
		_ret pushBack ["U_B_Wetsuit","Batman",0];
		_ret pushBack ["U_C_WorkerCoveralls","MacDo",0];
		_ret pushBack ["U_B_CTRG_1","Hello Kitty",0];
		_ret pushBack ["U_Rangemaster","Bruce Lee",0];		
		};
		if (GETC(life_tafflevel) == 1) then	{
		_ret pushBack ["U_C_Scientist","Tenue Anti-radiation",100];
		_ret pushBack ["U_I_G_Story_Protagonist_F","Tenue civil",100];
		};
		if (GETC(life_tafflevel) == 2) then	{
		_ret pushBack ["U_C_WorkerCoveralls","Tenue de travail",100];
		_ret pushBack ["U_I_G_Story_Protagonist_F","Tenue civil",100];
		};
		if (GETC(life_tafflevel) == 3) then	{
		_ret pushBack ["U_I_CombatUniform",nil,500];
		};
		if (GETC(life_tafflevel) == 4) then	{
		_ret pushBack ["U_Rangemaster","Costume de bureau",200];
		};
		if (GETC(life_tafflevel) == 5) then	{
		_ret pushBack ["U_Rangemaster","Costume de bureau",200];
		};
		if (GETC(life_tafflevel) == 6) then	{
		_ret pushBack ["U_IG_Guerilla1_1",nil,200 * _dis];
		_ret pushBack ["U_IG_leader",nil,200 * _dis];
		_ret pushBack ["U_O_CombatUniform_oucamo",nil,300 * _dis];
		_ret pushBack ["U_O_SpecopsUniform_ocamo",nil,300 * _dis];
		_ret pushBack ["U_O_OfficerUniform_ocamo",nil,400 * _dis];
		_ret pushBack ["U_I_CombatUniform_tshirt",nil,350 * _dis];
		_ret pushBack ["U_I_OfficerUniform",nil,400 * _dis];
		_ret pushBack ["U_O_PilotCoveralls",nil,450 * _dis];
		_ret pushBack ["U_I_pilotCoveralls",nil,450 * _dis];
		_ret pushBack ["U_I_HeliPilotCoveralls",nil,450 * _dis];
		_ret pushBack ["U_O_GhillieSuit",nil,4000 * _dis];
		_ret pushBack ["U_I_GhillieSuit",nil,4000 * _dis];
		_ret pushBack ["U_I_FullGhillie_ard",nil,8000 * _dis];
		_ret pushBack ["U_I_FullGhillie_lsh",nil,8000 * _dis];
		_ret pushBack ["U_I_FullGhillie_sard",nil,8000 * _dis];
		_ret pushBack ["U_B_CTRG_1",nil,400 * _dis];
		_ret pushBack ["U_B_CTRG_3",nil,400 * _dis];
		_ret pushBack ["U_B_CTRG_2",nil,400 * _dis];
		_ret pushBack ["U_O_Wetsuit","Tenue de plongée",100 * _dis];
		_ret pushBack ["U_IG_Guerilla2_1","Tenue civil",50 * _dis];
		_ret pushBack ["U_IG_Guerilla2_2","Tenue civil",50 * _dis];
		_ret pushBack ["U_IG_Guerilla2_3","Tenue civil",50 * _dis];
		_ret pushBack ["U_IG_Guerilla3_1","Tenue civil",50 * _dis];
		_ret pushBack ["U_B_CombatUniform_mcam","Tenue Mercenaire",50 * _dis];
		_ret pushBack ["U_B_HeliPilotCoveralls",nil,800 * _dis];
		_ret pushBack ["U_O_Wetsuit","Tenue de plongée",100 * _dis];
		_ret pushBack ["U_B_CombatUniform_mcam_vest","Tenue FSA",100 * _dis];
		_ret pushBack ["U_B_HeliPilotCoveralls",nil,800 * _dis];
		_ret pushBack ["U_B_GhillieSuit",nil,200 * _dis];
		_ret pushBack ["U_O_Wetsuit","Tenue de plongée",100 * _dis];
		};
		if (GETC(life_tafflevel) == 7) then	{
		_ret pushBack ["U_Rangemaster","Costume de bureau",200];
		_ret pushBack ["U_C_Journalist","Journaliste",500];
		};
		if (GETC(life_tafflevel) == 8) then	{
		_ret pushBack ["U_B_CTRG_1","Tenue de la Brinks",250];
		};		
		_ret pushBack ["U_C_Poloshirt_redwhite","Lacoste blanc",50];
		_ret pushBack ["U_C_Poloshirt_burgundy","Lacoste rouge",50];
		_ret pushBack ["U_C_Poloshirt_salmon","Ralph Lauren rose",50];
		_ret pushBack ["U_C_Poloshirt_blue","Ralph Lauren noir",50];
		_ret pushBack ["U_C_Poloshirt_stripped","Ralph Lauren jaune",50];
		_ret pushBack ["U_C_Poloshirt_tricolour","Ralph Lauren vert",50];
		_ret pushBack ["U_NikosAgedBody","Costume de soirée",200];
		_ret pushBack ["U_C_HunterBody_grn","Chasseur",150];
		_ret pushBack ["U_NikosBody","Decontracté",1500];
		_ret pushBack ["U_Competitor","Entreprise",150];
		_ret pushBack ["U_C_Journalist","Journaliste",500];
		_ret pushBack ["U_OrestesBody","Tenue Surfeur",200];
		_ret pushBack ["U_IG_Guerilla2_1","Tenue civil",100];
		_ret pushBack ["U_IG_Guerilla2_2","Tenue civil",100];
		_ret pushBack ["U_IG_Guerilla2_3","Tenue civil",100];
		_ret pushBack ["U_IG_Guerilla3_1","Tenue civil",100];
		_ret pushBack ["U_IG_Guerilla3_2","Tenue kaki",100];
	};
	case 1:
	{
		if (GETC(life_tafflevel) == 3) then	{
		_ret pushBack ["H_MilCap_gry",nil,10];
		};
		if (GETC(life_tafflevel) == 5) then	{
		_ret pushBack ["H_MilCap_gry",nil,10];
		};
		if (GETC(life_tafflevel) == 6) then	{
		_ret pushBack ["H_Watchcap_blk",nil,85 * _dis];
		_ret pushBack ["H_MilCap_gry",nil,85 * _dis];
		_ret pushBack ["H_Beret_grn","Beret",50 * _dis];
		_ret pushBack ["H_Beret_blk",nil,200 * _dis];
		_ret pushBack ["H_Beret_02",nil,200 * _dis];
		_ret pushBack ["H_Beret_Colonel",nil,200 * _dis];
		_ret pushBack ["H_PilotHelmetFighter_B","Masque a Gaz",350 * _dis];
		_ret pushBack ["H_CrewHelmetHeli_B",nil,50 * _dis];
		_ret pushBack ["H_HelmetB_light_black",nil,50 * _dis];
		};		
		_ret pushBack ["H_Cap_red",nil,12];
		_ret pushBack ["H_Cap_blu",nil,12];
		_ret pushBack ["H_Cap_grn",nil,12];
		_ret pushBack ["H_Cap_oli",nil,12];
		_ret pushBack ["H_Cap_tan",nil,12];
		_ret pushBack ["H_Cap_blk",nil,12];
		_ret pushBack ["H_Cap_press",nil,12];		
		_ret pushBack ["H_Cap_surfer",nil,12];
		_ret pushBack ["H_Cap_usblack",nil,12];
		_ret pushBack ["H_Cap_grn_BI",nil,12];	
		_ret pushBack ["H_Cap_blk_ION",nil,12];			
		_ret pushBack ["H_BandMask_blk","Bandanna & Chapeau",12];
		_ret pushBack ["H_Bandanna_surfer","Bandanna Surfer",16];
		_ret pushBack ["H_Bandanna_sgg","Bandanna Sage",16];
		_ret pushBack ["H_Bandanna_cbr","Bandanna Coyote",16];
		_ret pushBack ["H_Bandanna_khk","Bandanna Khaki",16];
		_ret pushBack ["H_Bandanna_gry","Bandanna Gris",16];
		_ret pushBack ["H_Watchcap_blk","Bonnet Gris",16];
		_ret pushBack ["H_Watchcap_khk","Bonnet Sage",16];
		_ret pushBack ["H_Watchcap_sgg","Bonnet Khaki",16];
		_ret pushBack ["H_Hat_blue","Chapeau Bleu",20];
		_ret pushBack ["H_Hat_grey","Chapeau Gris",20];
		_ret pushBack ["H_Hat_checker","Chapeau Checker",20];
		_ret pushBack ["H_Hat_tan","Chapeau Tan",20];
		_ret pushBack ["H_Hat_brown","Chapeau Marron",20];
		_ret pushBack ["H_StrawHat_dark","Chapeau de paille foncé",20];
		_ret pushBack ["H_StrawHat","Chapeau de paille",20];
		_ret pushBack ["H_TurbanO_blk","Bob",20];
		_ret pushBack ["H_Booniehat_khk","Chapeau Sage",20];
		_ret pushBack ["H_Booniehat_tan","Chapeau Tan",20];
		_ret pushBack ["H_Booniehat_grn","Chapeau Vert",20];
		_ret pushBack ["H_BandMask_khk","Casque",30];
	};
	case 2:
	{
		if (GETC(life_tafflevel) == 6) then	{		
		_ret pushBack ["G_Bandanna_aviator",nil,5];
		_ret pushBack ["G_Bandanna_beast",nil,5];
		_ret pushBack ["G_Bandanna_blk",nil,5];
		_ret pushBack ["G_Bandanna_khk",nil,5];
		_ret pushBack ["G_Bandanna_oli",nil,5];
		_ret pushBack ["G_Bandanna_shades",nil,5];
		_ret pushBack ["G_Bandanna_sport",nil,5];
		_ret pushBack ["G_Bandanna_tan",nil,5];
		_ret pushBack ["G_Balaclava_oli",nil,10];
		_ret pushBack ["G_Balaclava_blk",nil,10],
		_ret pushBack ["G_Balaclava_combat",nil,10],
		_ret pushBack ["G_Balaclava_lowprofile",nil,10],
		_ret pushBack ["G_Diving",nil,50]
		};
		_ret pushBack ["G_Shades_Black",nil,2];
		_ret pushBack ["G_Shades_Blue",nil,2];
		_ret pushBack ["G_Sport_Blackred",nil,2];
		_ret pushBack ["G_Sport_Checkered",nil,2];
		_ret pushBack ["G_Sport_Blackyellow",nil,2];
		_ret pushBack ["G_Sport_BlackWhite",nil,2];
		_ret pushBack ["G_Squares",nil,10];
		_ret pushBack ["G_Aviator",nil,10];
		_ret pushBack ["G_Lady_Mirror",nil,15];
		_ret pushBack ["G_Lady_Dark",nil,15];
		_ret pushBack ["G_Lady_Blue",nil,15];
	};
	case 3:
	{
		if (GETC(life_tafflevel) == 3) then	{
		_ret pushBack ["V_TacVest_blk",nil,1000];
		};
		if (GETC(life_tafflevel) == 5) then	{
		_ret pushBack ["V_TacVest_blk",nil,1000];
		};		
		if (GETC(life_tafflevel) == 6) then	{
		_ret pushBack ["V_Chestrig_khk",nil,400 * _dis];
		_ret pushBack ["V_Chestrig_rgr",nil,400 * _dis];
		_ret pushBack ["V_Chestrig_oli",nil,400 * _dis];
		_ret pushBack ["V_BandollierB_khk",nil,400 * _dis];
		_ret pushBack ["V_BandollierB_cbr",nil,400 * _dis];
		_ret pushBack ["V_BandollierB_rgr",nil,400 * _dis];
		_ret pushBack ["V_Chestrig_oli",nil,400 * _dis];
		_ret pushBack ["V_TacVest_khk",nil,400 * _dis];
		_ret pushBack ["V_TacVest_brn",nil,400 * _dis];
		_ret pushBack ["V_TacVest_oli",nil,400 * _dis];
		_ret pushBack ["V_I_G_resistanceLeader_F",nil,400 * _dis];
		_ret pushBack ["V_TacVest_camo",nil,400 * _dis];
		_ret pushBack ["V_HarnessO_brn",nil,400 * _dis];
		_ret pushBack ["V_RebreatherIA",nil,300 * _dis];	
		_ret pushBack ["V_PlateCarrier1_rgr",nil,100 * _dis];
		_ret pushBack ["V_PlateCarrier2_rgr",nil,100 * _dis];
		_ret pushBack ["V_PlateCarrierH_CTRG",nil,100 * _dis];
		_ret pushBack ["V_PlateCarrierIA1_dgtl",nil,100 * _dis];
		_ret pushBack ["V_PlateCarrierIAGL_dgtl",nil,100 * _dis];
		};			
		_ret pushBack ["V_Rangemaster_belt",nil,500];
		_ret pushBack ["V_Press_F",nil,900];
	};
	case 4:
	{
		if (GETC(life_tafflevel) == 3) then	{
		_ret pushBack ["B_AssaultPack_blk",nil,400];
		_ret pushBack ["B_FieldPack_blk",nil,400];
		_ret pushBack ["B_Bergen_blk",nil,400];
		};
		if (GETC(life_tafflevel) == 5) then	{
		_ret pushBack ["B_AssaultPack_blk",nil,400];
		_ret pushBack ["B_FieldPack_blk",nil,400];
		_ret pushBack ["B_Bergen_blk",nil,400];
		_ret pushBack ["B_UAV_01_backpack_F",nil,50];
		};	
		if (GETC(life_tafflevel) == 6) then	{
		_ret pushBack ["B_AssaultPack_dgtl",nil,200 * _dis];
		_ret pushBack ["B_AssaultPack_mcamo",nil,200 * _dis];
		_ret pushBack ["B_Kitbag_mcamo",nil,350 * _dis];
		_ret pushBack ["B_FieldPack_oucamo",nil,200 * _dis];
		_ret pushBack ["B_FieldPack_ocamo",nil,200 * _dis];
		_ret pushBack ["B_Bergen_mcamo",nil,350 * _dis];
		_ret pushBack ["B_Carryall_oucamo",nil,400 * _dis];
		_ret pushBack ["B_Carryall_ocamo",nil,400 * _dis];
		_ret pushBack ["B_Carryall_mcamo",nil,400 * _dis];
		};			
		_ret pushBack ["B_AssaultPack_cbr",nil,250];
		_ret pushBack ["B_AssaultPack_khk",nil,250];
		_ret pushBack ["B_AssaultPack_rgr",nil,250];
		_ret pushBack ["B_AssaultPack_sgg",nil,250];
		_ret pushBack ["B_Kitbag_cbr",nil,450];
		_ret pushBack ["B_Kitbag_sgg",nil,450];
		_ret pushBack ["B_FieldPack_cbr",nil,500];
		_ret pushBack ["B_Bergen_sgg",nil,650];
		_ret pushBack ["B_Carryall_oli",nil,500];
		_ret pushBack ["B_Carryall_khk",nil,500];
		_ret pushBack ["B_Carryall_cbr",nil,500];
	};
};
_ret;