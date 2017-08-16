/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Reb shop.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
ctrlSetText[3103,"Rebellenschneider"];

if(life_level < 10) then {["Info: ","Weitere Kleidung schaltest du mit einem höheren Level frei!","#ff1000","#ffffff",7] call life_fnc_texttiles;};

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		if(life_level >= 5) then {
		hint "In diesem Shop sind DLC-Anzüge vorhanden. Ohne DLC wird der Anzug nach Ablage auf den Boden unbenutzbar.";
			_ret =	[
				["U_IG_Guerilla1_1",nil,1000],
				["U_IG_leader",nil,1200],
				["U_I_CombatUniform",nil,1400],
				["U_I_CombatUniform_shortsleeve","Kampfanzug [AAF] (kurz)",1600],
				["U_O_CombatUniform_oucamo",nil,2400],
				["U_O_CombatUniform_ocamo","Militäranzug (Hex) [CSAT]",2600],
				["U_I_HeliPilotCoveralls",nil,3800],
				["U_I_pilotCoveralls",nil,4000],
				["U_O_PilotCoveralls",nil,4200]
			];
		};
		
		if(life_level >= 6) then {
			_ret pushback ["U_I_GhillieSuit",nil,8000];
			_ret pushback ["U_O_GhillieSuit",nil,10000];
			_ret pushback ["U_B_T_Sniper_F",nil,11000];
			_ret pushback ["U_O_T_Sniper_F","Ghillie-Anzug (Grün)",12000];
		};
			
		if(life_level >= 7) then {
			_ret pushback ["U_B_FullGhillie_ard","Ghillie-Anzug [Voll] (Trocken)",100000];
			_ret pushback ["U_B_FullGhillie_lsh","Ghillie-Anzug [Voll] (Grün)",100000];
			_ret pushback ["U_B_FullGhillie_sard","Ghillie-Anzug [Voll] (Untrocken)",100000];
			_ret pushback ["U_O_T_FullGhillie_tna_F","Kompletter Ghillie [CSAT]",100000];
			_ret pushback ["U_B_T_FullGhillie_tna_F","Kompletter Ghillie [NATO]",100000];
			_ret pushback ["U_C_Scientist","Strahlenschutzanzug",100000];
		};

		if(life_level >= 8) then {
			_ret pushback ["U_I_C_Soldier_Camo_F",nil,3400];
			_ret pushback ["U_O_T_Soldier_F","Tarnanzug",3600];
			_ret pushback ["U_B_T_Soldier_SL_F",nil,3700];
			_ret pushback ["U_B_T_Soldier_F",nil,3500];
			_ret pushback ["U_B_T_Soldier_AR_F",nil,3900];
		};

		if(life_level >= 9) then {
			_ret pushback ["U_I_OfficerUniform",nil,4400];
			_ret pushback ["U_O_OfficerUniform_ocamo","Offizier-Militäranzug (Hex)",4600];
			_ret pushback ["U_O_T_Officer_F","Offizierstarnanzug",4700];
		};
		if(life_level >= 10) then {
			_ret pushback ["U_B_CTRG_Soldier_urb_1_F",nil,6200];
			_ret pushback ["U_B_CTRG_Soldier_urb_2_F",nil,6400];
			_ret pushback ["U_B_CTRG_Soldier_urb_3_F","CTRG-Stadt-Uniform (kurz)",6500];
		};
	};
	
	//Hats
	case 1:
	{
		if(life_level >= 5) then {
			_ret =	[
				["H_HelmetB",nil,1000],
				["H_HelmetB_black",nil,1100],
				["H_HelmetB_camo",nil,1200],
				["H_HelmetB_desert",nil,1300],
				["H_HelmetB_grass",nil,1400],
				["H_HelmetB_light",nil,1500],
				["H_HelmetB_light_black",nil,1600],
				["H_HelmetB_light_desert",nil,1700],
				["H_HelmetB_light_grass",nil,1800],
				["H_HelmetB_light_sand",nil,1900],
				["H_HelmetB_light_snakeskin",nil,2000],
				["H_HelmetB_paint",nil,2100],
				["H_Helmet_Kerry",nil,2200],
				["H_HelmetB_plain_blk",nil,2200],
				["H_HelmetB_plain_mcamo",nil,2300],
				["H_HelmetB_sand",nil,2400],
				["H_HelmetB_snakeskin",nil,2500],
				["H_HelmetCrew_B",nil,2000],
				["H_HelmetCrew_I",nil,2700],
				["H_HelmetCrew_O",nil,2800],
				["H_HelmetIA",nil,2900],
				["H_Bandanna_camo",nil,2800],
				["H_Bandanna_cbr",nil,2900],
				["H_Bandanna_gry",nil,3000],
				["H_Bandanna_khk",nil,3100],
				["H_Bandanna_mcamo",nil,3200],
				["H_Bandanna_sgg",nil,3300],
				["H_Bandanna_surfer",nil,3400],
				["H_Bandanna_khk_hs",nil,3500],
				["H_HelmetLeaderO_ocamo",nil,3000],
				["H_HelmetLeaderO_oucamo",nil,3100],
				["H_HelmetO_ocamo",nil,3200],
				["H_HelmetO_oucamo",nil,3300],
				["H_HelmetSpecB",nil,3400],
				["H_HelmetSpecB_blk",nil,3500],
				["H_HelmetSpecB_paint1",nil,3000],
				["H_HelmetSpecB_paint2",nil,3700],
				["H_HelmetSpecO_blk",nil,3800],
				["H_HelmetSpecO_ocamo",nil,4000]
			];
		};
		
		if(life_level >= 6) then {			
			_ret pushback ["H_Shemag_khk",nil,4000];
			_ret pushback ["H_Shemag_olive",nil,4100];
			_ret pushback ["H_Shemag_olive_hs",nil,4200];
			_ret pushback ["H_Shemag_tan",nil,4300];
			_ret pushback ["H_ShemagOpen_khk",nil,4400];
			_ret pushback ["H_ShemagOpen_tan",nil,4500];
			_ret pushback ["H_PilotHelmetHeli_O",nil,4600];
			_ret pushback ["H_PilotHelmetHeli_B",nil,4700];
			_ret pushback ["H_PilotHelmetHeli_I",nil,4800];
			_ret pushback ["H_CrewHelmetHeli_O",nil,4900];
			_ret pushback ["H_CrewHelmetHeli_I",nil,5000];
			_ret pushback ["H_PilotHelmetFighter_B",nil,5200];
			_ret pushback ["H_PilotHelmetFighter_I",nil,5300];
			_ret pushback ["H_PilotHelmetFighter_O",nil,5400];
		};
	};
	
	//Glasses
	case 2:
	{
		if(life_level >= 1) then {
			_ret =	[
				["G_Shades_Black",nil,10],
				["G_Shades_Blue",nil,20],
				["G_Shades_Green",nil,30],
				["G_Shades_Red",nil,40],
				["G_Spectacles",nil,50],
				["G_Spectacles_Tinted",nil,10],
				["G_Sport_Blackred",nil,70],
				["G_Sport_Checkered",nil,80],
				["G_Sport_Blackyellow",nil,90],
				["G_Sport_BlackWhite",nil,100],
				["G_Sport_Greenblack",nil,110],
				["G_Sport_Red",nil,220],
				["G_Squares",nil,230]
			];
		};
		
		if(life_level >= 2) then {
			_ret pushback ["G_Aviator",nil,240];
			_ret pushback ["G_Lady_Blue",nil,250];
			_ret pushback ["G_Tactical_Black",nil,50];
			_ret pushback ["G_Tactical_Clear",nil,70];
			_ret pushback ["G_Lowprofile",nil,100];
		};
		
		if(life_level >= 5) then {
			_ret pushback ["G_Combat","Gasmaske",21.99];
			_ret pushback ["G_Bandanna_tan",nil,200];
			_ret pushback ["G_Bandanna_oli",nil,300];
			_ret pushback ["G_Bandanna_blk",nil,400];
			_ret pushback ["G_Bandanna_beast",nil,500];
			_ret pushback ["G_Bandanna_shades",nil,600];
			_ret pushback ["G_Bandanna_sport",nil,700];
			_ret pushback ["G_Bandanna_aviator",nil,800];
		};
		
		if(life_level >= 6) then {
			_ret pushback ["G_Balaclava_blk",nil,900];
			_ret pushback ["G_Balaclava_oli",nil,1000];
			_ret pushback ["G_Balaclava_lowprofile",nil,1100];
			_ret pushback ["G_Balaclava_combat",nil,1200];
		};
	};

	//Vest
	case 3:
	{
		if(life_level >= 5) then {
			_ret =	[
				["V_Rangemaster_belt",nil,5000],
				["V_BandollierB_blk",nil,6000],
				["V_BandollierB_cbr",nil,7000],
				["V_BandollierB_khk",nil,8000],
				["V_BandollierB_oli",nil,9000],
				["V_BandollierB_rgr",nil,10000],
				["V_Chestrig_blk",nil,11000],
				["V_Chestrig_khk",nil,12000],
				["V_Chestrig_oli",nil,13000],
				["V_Chestrig_rgr",nil,14000],
				["V_HarnessO_brn",nil,15000],
				["V_HarnessO_gry",nil,16000],
				["V_HarnessOGL_brn",nil,17000],
				["V_HarnessOGL_gry",nil,18000],
				["V_HarnessOSpec_brn",nil,19000],
				["V_HarnessOSpec_gry",nil,20000]
			];
		};

		if(life_level >= 6) then {	
			_ret pushback ["V_TacVest_blk",nil,21000];
			_ret pushback ["V_TacVest_brn",nil,22000];
			_ret pushback ["V_TacVest_camo",nil,23000];
			_ret pushback ["V_TacVest_khk",nil,24000];
			_ret pushback ["V_TacVest_oli",nil,25000];
			_ret pushback ["V_TacVestCamo_khk",nil,26000];
		};
		
		if(life_level >= 7) then {
			_ret pushback ["V_I_G_resistanceLeader_F",nil,27000];
			_ret pushback ["V_PlateCarrierIA1_dgtl",nil,28000];
			_ret pushback ["V_PlateCarrierIA2_dgtl",nil,29000];
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
				["B_FieldPack_blk",nil,2500],
				["B_FieldPack_cbr",nil,2500],
				["B_FieldPack_cbr_LAT",nil,2500],
				["B_FieldPack_khk",nil,2500],
				["B_FieldPack_oli",nil,2500],
				["B_FieldPack_oucamo",nil,2500],
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