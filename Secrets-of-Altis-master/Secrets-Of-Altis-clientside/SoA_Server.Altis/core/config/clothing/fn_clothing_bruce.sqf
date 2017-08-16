/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;

ctrlSetText[3103,"Andreas' Altkleidersammlung"];
if(life_level < 8) then {["Info: ","Weitere Kleidung schaltest du mit einem höheren Level frei!","#ff1000","#ffffff",7] call life_fnc_texttiles;};

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		if(life_level >= 1) then {
			_ret = [
				["U_C_Poor_1","Altkleidersammlungskleidung",200],
				["U_C_Commoner1_1","Gestreifte Kleidung",1000],
				["U_C_Poloshirt_blue",nil,1500],
				["U_C_Poloshirt_burgundy","Fett-Shirt",2000],
				["U_C_Poloshirt_salmon",nil,3000],
				["U_C_Poloshirt_tricolour",nil,3500],
				["U_Rangemaster","Hawaiihemd",10000],
				["U_C_Man_casual_1_F",nil,2500],
				["U_C_Man_casual_2_F",nil,2700]
			];
		};
		
		if(life_level >= 2) then {		
			_ret pushback ["U_IG_Guerilla2_2",nil,4000];
			_ret pushback ["U_OG_Guerilla2_3",nil,4500];
			_ret pushback ["U_IG_Guerilla2_1",nil,5000];
			_ret pushback ["U_OG_Guerrilla_6_1","Wollpullover",7000];
			_ret pushback ["U_C_Poloshirt_redwhite","Deutschlandtrikot",2500];
			_ret pushback ["U_C_Man_casual_3_F",nil,3000];
			_ret pushback ["U_C_Man_casual_4_F",nil,3200];
			_ret pushback ["U_C_man_sport_1_F",nil,3500];
		};
		
		if(life_level >= 3) then {
			_ret pushback ["U_I_G_Story_Protagonist_F",nil,5500];
			_ret pushback ["U_I_G_resistanceLeader_F",nil,6000];
			_ret pushback ["U_IG_Guerilla3_2","Guerillakittel (neu)",6500];
			_ret pushback ["U_IG_Guerilla3_1","Guerillakittel (getragen)",7000];
			_ret pushback ["U_Competitor",nil,12000];
			_ret pushback ["U_Marshal","Bayerische Tracht",25000];
			_ret pushback ["U_C_Man_casual_5_F",nil,2900];
		};
		
		if(life_level >= 4) then {
			_ret pushback ["U_NikosAgedBody","Teurer Anzug",30000];
			_ret pushback ["U_OrestesBody",nil,10000];
			_ret pushback ["U_C_WorkerCoveralls",nil,11000];
			_ret pushback ["U_C_Man_casual_6_F",nil,3250];
			_ret pushback ["U_C_man_sport_2_F",nil,2600];
			_ret pushback ["U_C_man_sport_3_F",nil,3100];
		};
		
		if(life_level >= 7) then {
			_ret pushback ["U_C_Scientist","Strahlenschutzanzug",100000];
		};

		if(life_level >= 12) then {
			_ret pushback ["U_NikosBody","Don Ator's pfiffiger Anzug",50000];		
		};
	};
	
	//Hats
	case 1:
	{
		if (life_level >= 1) then {
			_ret =	[
				["H_Helmet_Skate",nil,500],
				["H_Booniehat_tna_F",nil,1650],
				["H_Cap_blk",nil,100],
				["H_Cap_grn",nil,200],
				["H_Cap_oli",nil,300],
				["H_Cap_tan",nil,400],
				["H_Cap_blk_Raven",nil,500],
				["H_Cap_brn_SPECOPS",nil,600],
				["H_Cap_blu",nil,700],
				["H_Cap_red",nil,800],
				["H_Cap_blk_CMMG",nil,900],
				["H_Cap_blk_ION",nil,1000],
				["H_Cap_grn_BI",nil,1100],
				["H_Cap_khaki_specops_UK",nil,1300],
				["H_Cap_tan_specops_US",nil,1400],
				["H_BandMask_blk",nil,1500],
				["H_Cap_oli_hs",nil,1600],
				["H_Cap_headphones",nil,1700],
				["H_Hat_tan",nil,1900],
				["H_Hat_grey",nil,2000],
				["H_Hat_brown",nil,2100],
				["H_Hat_checker",nil,2200],
				["H_Hat_blue",nil,2300],
				["H_Hat_camo",nil,2400],
				["H_StrawHat",nil,2500],
				["H_StrawHat_dark",nil,2600],
				["H_TurbanO_blk",nil,2700],
				["H_Bandanna_camo",nil,2800],
				["H_Bandanna_cbr",nil,2900],
				["H_Bandanna_gry",nil,3000],
				["H_Bandanna_khk",nil,3100],
				["H_Bandanna_mcamo",nil,3200],
				["H_Bandanna_sgg",nil,3300],
				["H_Bandanna_surfer",nil,3400],
				["H_Bandanna_khk_hs",nil,3500],
				["H_Watchcap_blk",nil,3600],
				["H_Watchcap_camo",nil,3700],
				["H_Watchcap_khk",nil,3800],
				["H_Watchcap_sgg",nil,3900],
				["H_Booniehat_tan",nil,4000],
				["H_Booniehat_grn",nil,4100],
				["H_Booniehat_mcamo",nil,4200],
				["H_Booniehat_indp",nil,4300],
				["H_Booniehat_khk_hs",nil,4400],
				["H_MilCap_blue",nil,4500],
				["H_MilCap_dgtl",nil,4600],
				["H_MilCap_gry",nil,4700],
				["H_MilCap_mcamo",nil,4800],
				["H_MilCap_ocamo",nil,4900],
				["H_MilCap_oucamo",nil,5000],
				["H_MilCap_rucamo",nil,5100]
			];
		};
	};
	
	//Glasses
	case 2:
	{
		if(life_level >= 1) then {
			_ret =	[
				["G_Shades_Black",nil,110],
				["G_Shades_Blue",nil,120],
				["G_Shades_Green",nil,130],
				["G_Shades_Red",nil,140],
				["G_Spectacles",nil,150],
				["G_Spectacles_Tinted",nil,160],
				["G_Sport_Blackred",nil,170],
				["G_Sport_Checkered",nil,180],
				["G_Sport_Blackyellow",nil,190],
				["G_Sport_BlackWhite",nil,200],
				["G_Sport_Greenblack",nil,210],
				["G_Sport_Red",nil,220],
				["G_Squares",nil,230]
			];
		};

		if(life_level >= 2) then {
			_ret pushback ["G_Aviator",nil,240];
			_ret pushback ["G_Lady_Blue",nil,250];
			_ret pushback ["G_Tactical_Black",nil,500];
			_ret pushback ["G_Tactical_Clear",nil,700];
			_ret pushback ["G_Lowprofile",nil,1000];
		};
	};
	
	//Vest
	case 3:
	{
		if(life_level >= 2) then {
			_ret pushback ["V_Rangemaster_belt",nil,5000];
		};
	};
	
	//Backpacks
	case 4:
	{
		if(life_level >= 1) then {
			_ret =	[
				["B_AssaultPack_blk",nil,1000],
				["B_AssaultPack_cbr",nil,1000],
				["B_AssaultPack_dgtl",nil,1000],
				["B_AssaultPack_khk",nil,1000],
				["B_AssaultPack_mcamo",nil,100],
				["B_AssaultPack_ocamo",nil,1000],
				["B_AssaultPack_rgr",nil,1000],
				["B_AssaultPack_sgg",nil,1000],
				["B_AssaultPack_Kerry",nil,1000],
				["B_AssaultPack_tna_F",nil,1000],
				["B_FieldPack_blk",nil,2500],
				["B_FieldPack_cbr",nil,2500],
				["B_FieldPack_cbr_LAT",nil,2500],
				["B_FieldPack_khk",nil,2500],
				["B_FieldPack_oli",nil,2500],
				["B_FieldPack_oucamo",nil,2500],
				["B_FieldPack_ghex_F",nil,2500],
				["B_BergenC_grn",nil,5000],
				["B_TacticalPack_oli",nil,5000],
				["B_AssaultPack_mcamo_AAR",nil,5000],
				["B_TacticalPack_blk",nil,5000],
				["B_TacticalPack_ocamo",nil,5000],
				["B_TacticalPack_rgr",nil,5000]
			];
		};	
	};
};

_ret;