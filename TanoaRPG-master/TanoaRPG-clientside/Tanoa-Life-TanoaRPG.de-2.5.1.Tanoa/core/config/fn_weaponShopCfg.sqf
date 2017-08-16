#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop","_rabatt","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.
if(__GETC__(life_donator) == 1) then
{
	_rabatt = 1;
} else {
	_rabatt = 1;
};
if(__GETC__(life_donator) > 1) then
{
	_rabatt = 1;
};

switch(_shop) do
{
	case "cop_weapon":
	{
		if(playerSide != west) then {_return = "Du bist kein Polizist!"}
		else {
				_return = ["Primärwaffen",[]];
				(_return select 1) pushBack
				["SMG_02_F",nil,1000];//Sting
				(_return select 1) pushBack
				["SMG_01_F",nil,1000];//Vermin
				(_return select 1) pushBack
				["arifle_Mk20_F",nil,15000];//Mk20
				(_return select 1) pushBack
				["arifle_TRG21_F",nil,20000];//TRG 21
				(_return select 1) pushBack
				["arifle_SDAR_F",nil,20000];
				(_return select 1) pushBack
				["SMG_05_F",nil,20000];//Rogue
				
			if(__GETC__(life_coplevel) > 1) then {
				(_return select 1) pushBack
				["srifle_DMR_01_F",nil,25000];//Rahim
				(_return select 1) pushBack
				["arifle_MXC_Black_F",nil,17500];//MXC
				(_return select 1) pushBack
				["arifle_MX_Black_F",nil,22500];//MX
				(_return select 1) pushBack
				["arifle_SPAR_01_blk_F",nil,50000];//SPAR 16
				(_return select 1) pushBack
				["arifle_MX_GL_Black_F",nil,28500];//MX GL
				
			};			
			if(__GETC__(life_coplevel) > 2) then {
				(_return select 1) pushBack
				["arifle_MXM_Black_F",nil,52500];//MXM

			};
			if(__GETC__(life_coplevel) > 3) then {
				(_return select 1) pushBack
				["srifle_LRR_F",nil,80000];//M320 LRR
				(_return select 1) pushBack
				["srifle_EBR_F",nil,70000];//MK18
				(_return select 1) pushBack
				["arifle_ARX_blk_F",nil,50000]; //TYP 115
				(_return select 1) pushBack
				["srifle_DMR_07_blk_F",nil,50000]; //CMR-76
				
			};
			if(__GETC__(life_coplevel) > 4) then {
				(_return select 1) pushBack
				["srifle_DMR_03_F",nil,80000];//MK-1
				(_return select 1) pushBack
                ["arifle_SPAR_03_blk_F",nil,80000];//SPAR 17
                (_return select 1) pushBack				
                ["arifle_MX_SW_Black_F",nil,100000];//MXSW
			};	
			if(__GETC__(life_coplevel) > 5) then {
				(_return select 1) pushBack
				["srifle_DMR_02_F",nil,150000];//MAR-10
				(_return select 1) pushBack
				["srifle_DMR_04_F",nil,50000];//ASP-1

			};
			if(__GETC__(life_coplevel) > 6) then {
				(_return select 1) pushBack
				["srifle_DMR_05_blk_F",nil,160000];//Cyrus
				
			};
		};
		_return;
	};
	
	case "cop_pistol":
	{
		if(playerSide != west) then {_return = "Du bist kein Polizist!"}
		else {
				_return = ["Sekudärwaffen",[]];
				(_return select 1) pushBack
				["hgun_Rook40_snds_F","Taser-Pistole Silenced",10];
				
		};
		_return;
	};
	
	case "cop_zubehoer":
	{
		if(playerSide != west) then {_return = "Du bist kein Polizist!"}
		else {
				_return = ["Waffenzubehör",[]];
				(_return select 1) pushBack
				["acc_flashlight",nil,10];
				(_return select 1) pushBack
				["optic_Hamr",nil,10];
				(_return select 1) pushBack
				["optic_Holosight_smg",nil,10];
				(_return select 1) pushBack
				["muzzle_snds_M",nil,10];//5.56mm Schalldämpfer
				(_return select 1) pushBack
				["muzzle_snds_H",nil,10];
				(_return select 1) pushBack
				["optic_MRCO",nil,10];
				(_return select 1) pushback
				["optic_DMS",nil,10];
				(_return select 1) pushback
				["optic_ERCO_blk_F",nil,12500];
				(_return select 1) pushBack
				["1Rnd_SmokeRed_Grenade_shell","Rauchgranate",500];
				(_return select 1) pushBack
				["optic_Aco","ACO Rot",500];
				(_return select 1) pushBack
                ["bipod_01_F_blk", "Zweibein", 3000];				
				(_return select 1) pushBack
				["optic_AMS",nil,2500];
				(_return select 1) pushBack
				["B_UavTerminal",nil,1000];
			    (_return select 1) pushBack
				["optic_LRPS",nil,5000];
				(_return select 1) pushBack
				["optic_SOS",nil,2500];
				(_return select 1) pushBack
				["optic_NVS",nil,5000];
				(_return select 1) pushBack
				["optic_Arco",nil,5000];
				(_return select 1) pushBack
                ["muzzle_snds_B",nil,5000];
				(_return select 1) pushBack
				["muzzle_snds_65_TI_blk_F",nil,5000];
				(_return select 1) pushBack
				["muzzle_snds_H_MG",nil,7500]; //MXSW MAG
                (_return select 1) pushBack
                ["optic_KHS_blk",nil,2500];
				
			/*
			if(__GETC__(life_coplevel) > 1) then {
				(_return select 1) pushBack
				["muzzle_snds_H",nil,10];
				(_return select 1) pushBack
				["optic_MRCO",nil,10];
				(_return select 1) pushback
				["optic_DMS",nil,10];
				(_return select 1) pushback
				["optic_ERCO_blk_F",nil,12500];
			};
			if(__GETC__(life_coplevel) > 2) then {
				(_return select 1) pushBack
				["1Rnd_SmokeRed_Grenade_shell","Rauchgranate",500];
				(_return select 1) pushBack
				["optic_Aco","ACO Rot",500];
				(_return select 1) pushBack
                ["bipod_01_F_blk", "Zweibein", 3000];				
				(_return select 1) pushBack
				["optic_AMS",nil,2500];
				(_return select 1) pushBack
				["B_UavTerminal",nil,1000];
			};
			if(__GETC__(life_coplevel) > 3) then {
			    (_return select 1) pushBack
				["optic_LRPS",nil,5000];
				(_return select 1) pushBack
				["optic_SOS",nil,2500];
				(_return select 1) pushBack
				["optic_NVS",nil,5000];
				(_return select 1) pushBack
				["optic_Arco",nil,5000];
				(_return select 1) pushBack
                ["muzzle_snds_B",nil,5000];
				(_return select 1) pushBack
				["muzzle_snds_65_TI_blk_F",nil,5000];
				(_return select 1) pushBack
				["muzzle_snds_H_MG",nil,7500]; //MXSW MAG
			};
            if(__GETC__(life_coplevel) > 4) then {
                (_return select 1) pushBack
                ["optic_KHS_blk",nil,2500];
			};
			*/
		};
		_return;
	};
	
	case "cop_ammo":
	{
		if(playerSide != west) then {_return = "Du bist kein Polizist!"}
		else {
				_return = ["Munition",[]];
				(_return select 1) pushBack
				["30Rnd_9x21_Mag",nil,10];//Sting
				(_return select 1) pushBack
				["30Rnd_45ACP_Mag_SMG_01",nil,10];//Vermin
				(_return select 1) pushBack
				["30Rnd_556x45_Stanag",nil,10];//Mk20
				(_return select 1) pushBack
				["20Rnd_556x45_UW_mag","SDAR UW 5.56",10];//SDAR
				(_return select 1) pushBack
				["30Rnd_9x21_Mag_SMG_02",nil,10];//Rouge
				
				
			if(__GETC__(life_coplevel) > 1) then {
				(_return select 1) pushBack
				["10Rnd_762x54_Mag",nil,10];//Rahim
				(_return select 1) pushBack
				["30Rnd_65x39_caseless_mag",nil,10];//MXC
				
			};			
			if(__GETC__(life_coplevel) > 2) then {
				(_return select 1) pushBack
				["30Rnd_65x39_caseless_mag",nil,10];//MX
				["30Rnd_556x45_Stanag",nil,10];//SPAR16
				
			};
			if(__GETC__(life_coplevel) > 3) then {
				(_return select 1) pushback
				["7Rnd_408_Mag",nil,4000];//M320 LRR
				(_return select 1) pushBack
				["20Rnd_762x51_Mag",nil,2500];//MK18
				(_return select 1) pushBack
				["30Rnd_580x42_Mag_F",nil,2000]; //CAR-95 Mag
				(_return select 1) pushBack
				["20Rnd_650x39_Cased_Mag_F",nil,3000]; //CMR-76 MAG
				(_return select 1) pushBack
				["30Rnd_65x39_caseless_green",nil,2000]; //TYP Mag
				(_return select 1) pushBack
				["100Rnd_65x39_caseless_mag",nil,5000]; //MXSW MAG
				
				
			};
			if(__GETC__(life_coplevel) > 5) then {
				(_return select 1) pushBack
				["10Rnd_338_Mag",nil,8000];//MAR-10
				(_return select 1) pushBack
				["10Rnd_127x54_Mag",nil,5000];//ASP-1

			};
			if(__GETC__(life_coplevel) > 6) then {
				(_return select 1) pushBack
				["10Rnd_93x64_DMR_05_Mag",nil,8200];//Cyrus

			};
		};
		_return;
	};	
	case "cop_rest":
	{
		if(playerSide != west) then {_return = "Du bist kein Polizist!"}
		else {	
			_return = ["Zubehör",[]];
			if(__GETC__(life_coplevel) > 7) then {
				(_return select 1) pushBack
				["9Rnd_45ACP_Mag",nil,2000];
			};
			if(__GETC__(life_coplevel) > 7) then {
				(_return select 1) pushBack
				["11Rnd_45ACP_Mag",nil,3000];				//.45 Ammo
			};
			if(__GETC__(life_coplevel) > 7) then {
				(_return select 1) pushBack
				["6Rnd_45ACP_Cylinder",nil,4000];			//.45 Ammo
			};
				
				(_return select 1) pushBack
				["Chemlight_red",nil,10];
				(_return select 1) pushBack
				["Chemlight_yellow",nil,10];
				(_return select 1) pushBack
				["Chemlight_green",nil,10];
				(_return select 1) pushBack
				["Chemlight_blue",nil,10];
				(_return select 1) pushBack
				["ItemCompass",nil,10];
				(_return select 1) pushBack
				["ItemWatch",nil,10];
				(_return select 1) pushBack
				["ItemMap",nil,10];
				(_return select 1) pushBack
				["Binocular",nil,10];
				(_return select 1) pushBack
				["Rangefinder",nil,10];
				(_return select 1) pushBack
				["ItemGPS",nil,10];
				(_return select 1) pushBack
				["ToolKit",nil,10];
				(_return select 1) pushBack
				["FirstAidKit",nil,10];
				(_return select 1) pushBack
				["Medikit",nil,10];
				(_return select 1) pushBack
				["NVGoggles_OPFOR",nil,10];
				(_return select 1) pushBack
				["Item_O_NVGoggles_hex_F",nil,10];
				(_return select 1) pushBack
				["Item_O_NVGoggles_urb_F",nil,10];
				(_return select 1) pushBack
				["Item_O_NVGoggles_ghex_F",nil,10];
				
			if(__GETC__(life_coplevel) > 2) then {
				(_return select 1) pushBack
				["HandGrenade_Stone","Flashbang",10];
			};
			if(__GETC__(life_coplevel) > 3) then {
				(_return select 1) pushBack
				["SmokeShellBlue","CE-Gas",10];
			};
		};
		_return;
	};
	
	case "adac_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"Du bist kein ADAC"};
			case (__GETC__(life_mediclevel) < 2): {"Du kannst erst als ADAC hier Zugreifen !"}; 
			default {
				["ADAC Shop",
					[
						["ItemGPS",nil,10],
						["Binocular",nil,10],
						["ToolKit",nil,10],
						["FirstAidKit",nil,10],
						["Medikit",nil,10],
						["NVGoggles",nil,10],
						["Item_O_NVGoggles_hex_F",nil,10],
						["Item_O_NVGoggles_urb_F",nil,10],
						["Item_O_NVGoggles_ghex_F",nil,10],
						["Chemlight_red",nil,20],
						["Chemlight_yellow",nil,20],
						["Chemlight_green",nil,20],
						["Chemlight_blue",nil,20]
					]
				];
			};
		};
	};
	
	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"Du bist kein MEDIC"};
			case (__GETC__(life_mediclevel) < 1): {"Du kannst erst als MEDIC hier Zugreifen !"}; 
			default {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,10],
						["Binocular",nil,10],
						["ToolKit",nil,10],
						["FirstAidKit",nil,10],
						["Medikit",nil,10],
						["NVGoggles",nil,10],
						["Item_O_NVGoggles_hex_F",nil,10],
						["Item_O_NVGoggles_urb_F",nil,10],
						["Item_O_NVGoggles_ghex_F",nil,10],
						["Chemlight_red",nil,20],
						["Chemlight_yellow",nil,20],
						["Chemlight_green",nil,20],
						["Chemlight_blue",nil,20]
					]
				];
			};
		};
	};
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (!license_civ_rebel): {"Du besitz keine Rebellenlizenz!"};
			default
			{
				["TanoaRPG Rebellenwaffen",
					[
						["Rangefinder",nil,10000],  //Rangefinder
						["muzzle_snds_acp",nil,9500], //ACP Schalli
						["muzzle_snds_L",nil,10000], //9mm Schalli
						["muzzle_snds_M",nil,60000], //5.56mm Schalli
						["muzzle_snds_58_blk_F",nil,75000], //5,8mm Schalli
						["muzzle_snds_H",nil,90000], //6.5mm Schalli
						["muzzle_snds_65_TI_blk_F",nil,100000], //TYP Schalli
						["muzzle_snds_B",nil,120000], // 7,62mm Schalli
						
						["hgun_Pistol_heavy_02_Yorris_F",nil,45000], //Zubr Scoped
						["6Rnd_45ACP_Cylinder",nil,3900], //Zubr Munni
						["hgun_Pistol_heavy_01_F",nil,60000], //fourfive
						["11Rnd_45ACP_Mag",nil,3000], //fourfive mag
						["hgun_P07_F",nil,12000], //P07
						["hgun_Pistol_01_F",nil,12000], //PM 9mm
						["10Rnd_9x21_Mag",nil,300], //PM Ammo
						
						["hgun_PDW2000_F",nil,20000], //PDW
						["SMG_02_F",nil,25000], //Sting
						["30Rnd_9x21_Mag",nil,1500], //9mm 30Schuss Magazin
						["SMG_05_F",nil,30000], //Rogue
						["30Rnd_9x21_Mag_SMG_02",nil,10], //Rouge Mag
						["SMG_01_F",nil,30000], //Vermin
						["30Rnd_45ACP_Mag_SMG_01",nil,2500], //Vermin Mag
						["30Rnd_45ACP_Mag_SMG_01_tracer_green",nil,1900], //Vermin Mag Tracer
						
						["arifle_SDAR_F",nil,50000], //SDAR
						["arifle_TRG20_F",nil,55000], //TRG20
						["arifle_TRG21_F",nil,55000], //TRG21
						["arifle_TRG21_GL_F",nil,70000], //TRG21 3GL
						["arifle_Mk20_F",nil,65000], //Mk20
						["arifle_Mk20C_F",nil,65000], //Mk20
						["arifle_Mk20_GL_F",nil,75000], //MK20 3GL
						["20Rnd_556x45_UW_mag","SDAR UW 5.56",1000], //SDAR Mag
						["30Rnd_556x45_Stanag",nil,1500], //5.56 Mag
						["30Rnd_556x45_Stanag_Tracer_Green",nil,1500], //5.56 Mag Tracer
						["30Rnd_556x45_Stanag_Tracer_Red",nil,1500], //5.56 Mag Tracer
						["30Rnd_556x45_Stanag_Tracer_Yellow",nil,1500], //5.56 Mag Tracer
						
						["arifle_Katiba_F",nil,250000], //Katiba
						["arifle_Katiba_C_F",nil,240000], //Katiba Karabiner
						["arifle_Katiba_GL_F",nil,270000], //Katiba 3GL
						["30Rnd_65x39_caseless_green",nil,2000], //Katiba Mag
						["30Rnd_65x39_caseless_green_mag_Tracer",nil,2000], //Katiba Mag Tracer
						["arifle_MXC_F",nil,230000], //MXC
						["arifle_MX_F",nil,250000], //MX
						["arifle_MX_GL_F",nil,270000], //MX 3GL
						["arifle_MXM_F",nil,330000], //MXM
						["30Rnd_65x39_caseless_mag",nil,2000], //MX MAG
						["30Rnd_65x39_caseless_mag_Tracer",nil,2000], //MX MAG Tracer
						["srifle_DMR_01_F",nil,400000], //Rahim
						["10Rnd_762x54_Mag",nil,3500], //Rahim Mag
						["srifle_DMR_04_tan_F",nil,340000], //ASP
						["10Rnd_127x54_Mag",nil,10000], //ASP Mag
						
						["arifle_AKS_F",nil,200000], //AK 74U
						["30Rnd_545x39_Mag_F",nil,2000], // AK74U MAG
						["arifle_ARX_ghex_F",nil,250000], //TYP 115
						["30Rnd_65x39_caseless_green",nil,2000], //TYP Mag
						["arifle_CTAR_blk_F",nil,250000], //CAR-95
						["30Rnd_580x42_Mag_F",nil,2000], //CAR-95 Mag
						["srifle_DMR_07_ghex_F",nil,330000], //CMR-76
						["20Rnd_650x39_Cased_Mag_F",nil,3000], //CMR-76 MAG
						
						
						["optic_ACO_grn",nil,10000], //ACO Grün	
						["optic_Aco",nil,10000], //ACO
						["optic_Holosight",nil,10000], //HOLO
						["optic_MRD",nil,8000], //4five Scope
						["optic_Holosight_smg",nil,8000], //HOLO für Kleinwaffen
						["optic_MRCO",nil,12500], //MRCO
						["optic_SOS",nil,90000], //SOS
						["optic_NVS",nil,18000], //Nachtsicht Scope
						["optic_DMS",nil,50000], //DMS
						["optic_LRPS",nil,120000], //LRPS
						["optic_Arco",nil,13000], //ARCO
						["optic_ERCO_blk_F",nil,12500], //ERCO
						["optic_Hamr",nil,12000], //RCO
						["optic_AMS",nil,75000], //AMS
						["optic_AMS_khk",nil,75000], //AMS
						["optic_AMS_snd",nil,75000], //AMS
						["optic_KHS_blk",nil,65000], //Kahlia
						["optic_KHS_hex",nil,65000], //Kahlia
						["optic_KHS_old",nil,65000], //Kahlia
						["optic_KHS_hex",nil,65000], //Kahlia
						
						["bipod_02_F_hex",nil,30000], //Zweibein
						["bipod_03_F_oli",nil,30000], //Zweibein
						["bipod_01_F_mtp",nil,30000], //Zweibein
						["bipod_02_F_tan",nil,30000], //Zweibein
						
						["acc_flashlight",nil,5000], //Lampe
						["acc_pointer_IR",nil,5500], //Laser
						
						["UGL_FlareGreen_F",nil,4500],
						["UGL_FlareRed_F",nil,4500],
						["1Rnd_SmokeRed_Grenade_shell",nil,5000],
						["1Rnd_SmokeGreen_Grenade_shell",nil,5000],
						["3Rnd_UGL_FlareGreen_F",nil,10000],
						["3Rnd_UGL_FlareRed_F",nil,10000],
						["3Rnd_SmokeRed_Grenade_shell",nil,12000],
						["3Rnd_SmokeGreen_Grenade_shell",nil,12000]
					]
				];
			};
		};
	};
	
		case "schwarzmarkt":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (!license_civ_schwarzmarkt): {"Du hast keinen Schwarzmarktzugang!"};
			default
			{
				["TanoaRPG Rebellenwaffen",
					[
						["arifle_MX_SW_F",nil,600000], //MXSW
						["30Rnd_65x39_caseless_mag_Tracer",nil,2000], //MX MAG Tracer
						["100Rnd_65x39_caseless_mag",nil,12000], //MXSW MAG
						["100Rnd_65x39_caseless_mag_Tracer",nil,12000], //MXSW MAG Tracer
						["muzzle_snds_H_MG_khk_F",nil,90000], //MX SW LMG Suppresor
						["muzzle_snds_H_MG",nil,90000],	//MX SW LMG Suppresor
						
						["srifle_EBR_F",nil,500000], //MK18
						["srifle_DMR_06_camo_F",nil,470000], //MK14
						["srifle_DMR_06_olive_F",nil,470000], //MK14
						["20Rnd_762x51_Mag",nil,3900], //7,62 20 Schuss Mag
						["srifle_DMR_03_multicam_F",nil,580000], //MK-1
						["20Rnd_762x51_Mag",nil,3900], //7,62 20 Schuss Mag
						["srifle_DMR_02_camo_F",nil,1200000], //MAR-10
						["10Rnd_338_Mag",nil,11000], //MAR-10 Mag
						["srifle_DMR_05_tan_f",nil,1700000], //Cyrus
						["10Rnd_93x64_DMR_05_Mag",nil,11000], //Cyrus Mag
						["srifle_LRR_camo_F",nil,3200000], //LRR
						["7Rnd_408_Mag",nil,10000], //LRR Mag
						
						["arifle_AK12_F",nil,900000], //AK12
						["arifle_AKM_F",nil,400000], //AKM
						["30Rnd_762x39_Mag_F",nil,4000] //AK MAG
						
					]
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (!license_civ_gun): {"Du hast keinen Waffenschein!"};
			default
			{
				["TanoaRPG Waffenladen",
					[
						["hgun_P07_F",nil,12000], //P07
						["hgun_Pistol_heavy_02_F",nil,30000], //Zubr
						["hgun_ACPC2_F",nil,11500], //ACP
						
						["arifle_SDAR_F",nil,75000], //SDAR
						["hgun_PDW2000_F",nil,35000], //PDW
						["SMG_01_F",nil,37000], //Vermin
						["SMG_02_F",nil,30000], //Sting
						["SMG_05_F",nil,35000], //Protector
						
						["optic_ACO_grn_smg",nil,2500], //ACO
						
						["30Rnd_9x21_Mag_SMG_02",nil,750],//Rouge
						["16Rnd_9x21_Mag",nil,250],
						["9Rnd_45ACP_Mag",nil,450],
						["6Rnd_45ACP_Cylinder",nil,500],
						["30Rnd_9x21_Mag",nil,750],
						["30Rnd_45ACP_Mag_SMG_01",nil,1000],
						["30Rnd_556x45_Stanag",nil,2500],
						["30Rnd_9x21_Mag_SMG_02",nil,750],
						["30Rnd_9x21_Mag_SMG_02_Tracer_Red",nil,750],
						["30Rnd_9x21_Mag_SMG_02_Tracer_Green",nil,750]
					]
				];
			};
		};
	};
	
	case "donator":
	{
		switch(true) do
		{
			case (__GETC__(life_donator) == 0): {"Du bist kein Donator!"};
			case (__GETC__(life_donator) >= 1): //DONATER
			{
				["Söldner Waffen Händler",
					[
						["Rangefinder",nil,_rabatt * 10000],
						["muzzle_snds_L",nil,_rabatt * 10000],
						["muzzle_snds_M",nil,_rabatt * 60000],
						["muzzle_snds_H",nil,_rabatt * 120000],
						["hgun_Pistol_heavy_02_Yorris_F",nil,_rabatt * 75000],
						["6Rnd_45ACP_Cylinder",nil,_rabatt * 3900],
						["hgun_Pistol_heavy_01_F",nil,_rabatt * 60000],
						["11Rnd_45ACP_Mag",nil,_rabatt * 3000],
						["hgun_P07_F",nil,_rabatt * 40000],
						["hgun_PDW2000_F",nil,_rabatt * 60000],
						["SMG_02_F",nil,_rabatt * 90000],
						["30Rnd_9x21_Mag",nil,_rabatt * 1500],
						["SMG_01_F",nil,_rabatt * 70000],
						["30Rnd_45ACP_Mag_SMG_01",nil,_rabatt * 2500],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green",nil,_rabatt * 1900],
						["arifle_SDAR_F",nil,_rabatt * 50000],
						["arifle_TRG20_F",nil,_rabatt * 110000],
						["arifle_TRG21_F",nil,_rabatt * 135000],
						["arifle_TRG21_GL_F",nil,_rabatt * 150000],
						["arifle_Mk20_F",nil,_rabatt * 150000],
						["arifle_Mk20C_F",nil,_rabatt * 140000],
						["arifle_Mk20_GL_F",nil,_rabatt * 160000],
						["20Rnd_556x45_UW_mag","SDAR UW 5.56",_rabatt * 1000],
						["30Rnd_556x45_Stanag",nil,_rabatt * 1500],
						["30Rnd_556x45_Stanag_Tracer_Green",nil,_rabatt * 1500],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,_rabatt * 1500],
						["30Rnd_556x45_Stanag_Tracer_Yellow",nil,_rabatt * 1500],
						["arifle_Katiba_F",nil,_rabatt * 200000],
						["arifle_Katiba_C_F",nil,_rabatt * 190000],
						["arifle_Katiba_GL_F",nil,_rabatt * 210000],
						["30Rnd_65x39_caseless_green",nil,_rabatt * 2000],
						["30Rnd_65x39_caseless_green_mag_Tracer",nil,_rabatt * 2000],
						["arifle_MXC_F",nil,_rabatt * 200000],
						["arifle_MX_F",nil,_rabatt * 220000],
						["arifle_MX_GL_F",nil,_rabatt * 230000],
						["srifle_EBR_F",nil,_rabatt * 450000],
						["srifle_DMR_06_camo_F",nil,_rabatt * 400000],
						["srifle_DMR_03_multicam_F",nil,_rabatt * 500000],
						["srifle_DMR_06_olive_F",nil,_rabatt * 400000],
						["20Rnd_762x51_Mag",nil,_rabatt * 3900],
						["srifle_DMR_01_F",nil,_rabatt * 300000],
						["10Rnd_762x54_Mag",nil,_rabatt * 3500],
						["arifle_MXM_F",nil,_rabatt * 280000],
						["arifle_MX_SW_F",nil,_rabatt * 600000],
						["LMG_Mk200_F",nil,_rabatt * 950000],
						["200Rnd_65x39_cased_Box_Tracer",nil,_rabatt * 10000],
						["30Rnd_65x39_caseless_mag",nil,_rabatt * 2000],
						["30Rnd_65x39_caseless_mag_Tracer",nil,_rabatt * 2000],
						["100Rnd_65x39_caseless_mag",nil,_rabatt * 4000],
						["100Rnd_65x39_caseless_mag_Tracer",nil,_rabatt * 4000],
						["srifle_DMR_02_camo_F",nil,_rabatt * 2800000],
						["10Rnd_338_Mag",nil,_rabatt * 65000],
						["srifle_DMR_04_tan_F",nil,_rabatt * 2200000],
						["10Rnd_127x54_Mag",nil,_rabatt * 125000],
						["srifle_LRR_F",nil,_rabatt * 2800000],
						["7Rnd_408_Mag",nil,_rabatt * 125000],						
						["optic_ACO_grn",nil,_rabatt * 10000],
						["optic_Aco",nil,_rabatt * 10000],
						["optic_Holosight",nil,_rabatt * 10000],
						["optic_Holosight_smg",nil,_rabatt * 10000],
						["optic_MRCO",nil,_rabatt * 12500],
						["optic_SOS",nil,_rabatt * 120000],
						["optic_NVS",nil,_rabatt * 30000],
						["optic_DMS",nil,_rabatt * 50000],
						["optic_LRPS",nil,_rabatt * 100000],
						["optic_Arco",nil,_rabatt * 25000],
						["optic_Hamr",nil,_rabatt * 25000],
						["optic_AMS",nil,_rabatt * 75000],
						["optic_AMS_khk",nil,_rabatt * 75000],
						["optic_AMS_snd",nil,_rabatt * 75000],
						["optic_KHS_blk",nil,_rabatt * 75000],
						["optic_KHS_hex",nil,_rabatt * 75000],
						["optic_KHS_old",nil,_rabatt * 75000],
						["optic_KHS_hex",nil,_rabatt * 75000],
						["bipod_02_F_hex",nil,_rabatt * 150000],
						["bipod_03_F_oli",nil,_rabatt * 150000],
						["acc_flashlight",nil,_rabatt * 5000],
						["acc_pointer_IR",nil,_rabatt * 5500],
						["UGL_FlareGreen_F",nil,_rabatt * 4500],
						["UGL_FlareRed_F",nil,_rabatt * 4500],
						["1Rnd_SmokeRed_Grenade_shell",nil,_rabatt * 5000],
						["1Rnd_SmokeGreen_Grenade_shell",nil,_rabatt * 5000],
						["3Rnd_UGL_FlareGreen_F",nil,_rabatt * 10000],
						["3Rnd_UGL_FlareRed_F",nil,_rabatt * 10000],
						["3Rnd_SmokeRed_Grenade_shell",nil,_rabatt * 12000],
						["3Rnd_SmokeGreen_Grenade_shell",nil,_rabatt * 12000]
					]
				];
			};
		};
	};
	
	case "special_donator":
	{
		switch(true) do
		{
			case (__GETC__(life_donator) == 0): {"Du bist kein Donator!"};
			case (__GETC__(life_donator) >= 1): //DONATER
			{
				["Spezial Waffenshop",
					[
						["srifle_GM6_F",nil,(_rabatt + 0.15) * 3500000],
						["5Rnd_127x108_Mag",nil,(_rabatt + 0.15) * 500000],
						["srifle_DMR_05_blk_F",nil,(_rabatt + 0.15) * 2400000],
						["10Rnd_93x64_DMR_05_Mag",nil,(_rabatt + 0.15) * 380000]
					]
				];
			};
		};
	};
	
	case "genstore":
	{
		["TanoaRPG Baumarkt",
			[
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["ItemMap",nil,50],
				["ItemCompass",nil,50],
				["ItemWatch",nil,50],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,1500],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
			]
		];
	};

	case "uranium":
    {
        switch(true) do
        {
            case (playerSide != civilian): {"Du bist kein Zivilist"};
            case (!license_civ_uran): {"Du benötigst eine Uran-Lizenz"};
            default
            {
                ["Uranverkäufer",
                    [
                        ["ToolKit",nil,200],
                        ["FirstAidKit",nil,100],
                        ["U_I_HeliPilotCoveralls","Strahlenschutzanzug",5000]
                    ]
                ];
            };
        };
    }; 
	
	case "PeWeaponShop":
	{
		if((life_gangData select 0) == 12) then		//PE
		{
			_return = ["PE's geheimer Waffenshop",[]];
			(_return select 1) pushBack
			["LMG_Mk200_F",nil,950000];
			(_return select 1) pushBack
			["200Rnd_65x39_cased_Box",nil,10000];
			(_return select 1) pushBack
			["LMG_Zafir_F",nil,1300000];
			(_return select 1) pushBack
			["150Rnd_762x54_Box",nil,9000];
			(_return select 1) pushBack
			["srifle_DMR_03_F",nil,500000];
			(_return select 1) pushBack
			["20Rnd_762x51_Mag",nil,3900];
			(_return select 1) pushBack
			["optic_Hamr",nil,25000];
			(_return select 1) pushBack
			["optic_NVS",nil,30000];
			(_return select 1) pushBack
			["optic_AMS",nil,75000];
		}
		else
		{
			_return = "Du bist kein Midglied von Public Enemy !!!";
		};
		_return;
	};
	
	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			default
			{
				["Hideout Bewaffnung",
					[
						["optic_ACO_grn",nil,8000], //ACO Grün	
						["optic_Holosight",nil,8000], //HOLO
						["optic_MRD",nil,8000], //4five Scope
						["optic_Holosight_smg",nil,6000], //HOLO für Kleinwaffen
						["optic_MRCO",nil,10500], //MRCO
						["hgun_Pistol_heavy_01_F",nil,50000], //fourfive
						["11Rnd_45ACP_Mag",nil,2000], //fourfive mag
						["hgun_P07_F",nil,10000], //P07
						["Rangefinder",nil,8000],  //Rangefinder
						["muzzle_snds_H",nil,60000], //6.5mm Schalli
						["arifle_Katiba_F",nil,180000], //Katiba
						["arifle_Katiba_C_F",nil,170000], //Katiba Karabiner
						["30Rnd_65x39_caseless_green",nil,1000], //Katiba Mag
						["30Rnd_65x39_caseless_green_mag_Tracer",nil,800], //Katiba Mag Tracer
						["arifle_MXC_F",nil,210000], //MXC
						["30Rnd_65x39_caseless_mag",nil,1000], //MX MAG
						["30Rnd_65x39_caseless_mag_Tracer",nil,1000] //MX MAG Tracer
					]
				];
			};
		};
	};
	
	case "adacgen":
    {
		if(playerSide != east) then {_return = "Du bist kein Imperialist"}
		else {
			_return = ["Imperium Waffen",[]];
			(_return select 1) pushBack ["SMG_05_F",nil,25000];
			(_return select 1) pushBack ["30Rnd_9x21_Mag_SMG_02",nil,100];
			
			(_return select 1) pushBack ["arifle_Mk20_plain_F",nil,25000];
			(_return select 1) pushBack ["30Rnd_556x45_Stanag",nil,100];
			
			(_return select 1) pushBack ["srifle_DMR_01_F",nil,50000];
			(_return select 1) pushBack ["10Rnd_762x54_Mag",nil,100];
			
			(_return select 1) pushBack ["arifle_SDAR_F",nil,25000];
			(_return select 1) pushBack ["arifle_TRG21_F",nil,25000];
			(_return select 1) pushBack ["30Rnd_556x45_Stanag",nil,100];
			
			(_return select 1) pushBack ["SMG_01_F",nil,25000];
			(_return select 1) pushBack ["30Rnd_45ACP_Mag_SMG_01",nil,100];
			
			(_return select 1) pushBack ["arifle_AKS_F",nil,50000];
			(_return select 1) pushBack ["30Rnd_545x39_Mag_F",nil,100];
			
			(_return select 1) pushBack ["arifle_MX_khk_F",nil,50000];
			(_return select 1) pushBack ["arifle_MXC_khk_F",nil,50000];
			(_return select 1) pushBack ["30Rnd_65x39_caseless_mag",nil,100];
				
			if(__GETC__(life_adaclevel) > 1) then {
				(_return select 1) pushBack ["arifle_CTAR_ghex_F",nil,65000];
				(_return select 1) pushBack ["30Rnd_580x42_Mag_F",nil,100];
				
				(_return select 1) pushBack ["srifle_DMR_07_ghex_F",nil,65000];
				(_return select 1) pushBack ["20Rnd_650x39_Cased_Mag_F",nil,100];
				
				(_return select 1) pushBack ["arifle_Katiba_C_F",nil,50000];
				(_return select 1) pushBack ["arifle_ARX_ghex_F",nil,65000];
				(_return select 1) pushBack ["30Rnd_65x39_caseless_green",nil,100];
				
				(_return select 1) pushBack ["arifle_MXM_khk_F",nil,65000];
				(_return select 1) pushBack ["30Rnd_65x39_caseless_mag",nil,100];
				
				(_return select 1) pushBack ["srifle_EBR_F",nil,100000];
				(_return select 1) pushBack ["20Rnd_762x51_Mag",nil,100];
			};			
			if(__GETC__(life_adaclevel) > 2) then {
				(_return select 1) pushBack ["srifle_DMR_03_woodland_F",nil,150000];
				
				(_return select 1) pushBack ["srifle_DMR_06_camo_F",nil,150000];
				
				(_return select 1) pushBack ["srifle_LRR_F",nil,1000000];
				(_return select 1) pushBack ["7Rnd_408_Mag",nil,1000];
				
				(_return select 1) pushBack ["srifle_DMR_04_Tan_F",nil,350000];
				(_return select 1) pushBack ["10Rnd_127x54_Mag",nil,1000];
				
				(_return select 1) pushBack ["arifle_MX_SW_khk_F",nil,120000];
				(_return select 1) pushBack ["100Rnd_65x39_caseless_mag",nil,10000];

			};
			if(__GETC__(life_adaclevel) > 3) then {
				(_return select 1) pushBack ["srifle_DMR_05_hex_F",nil,2000000];
				(_return select 1) pushBack ["10Rnd_93x64_DMR_05_Mag",nil,1000];
				
				(_return select 1) pushBack ["srifle_DMR_02_F",nil,300000];
				(_return select 1) pushBack ["10Rnd_338_Mag",nil,1000];
				//(_return select 1) pushBack ["LMG_03_F",nil,450000];
			};
			
			//Zubehör
			
			(_return select 1) pushBack ["optic_ACO_grn",nil,1000];
			(_return select 1) pushBack ["optic_Holosight",nil,1000];
			(_return select 1) pushBack ["optic_Hamr",nil,1000];
			(_return select 1) pushBack ["muzzle_snds_M",nil,1000];
			(_return select 1) pushBack ["muzzle_snds_L",nil,1000];
			(_return select 1) pushBack ["muzzle_snds_H",nil,1000];
				
			if(__GETC__(life_adaclevel) > 1) then {
				(_return select 1) pushBack ["optic_Arco",nil,1000];
				(_return select 1) pushBack ["optic_AMS",nil,1000];
				(_return select 1) pushBack ["optic_DMS",nil,1000];
				(_return select 1) pushBack ["optic_MRCO",nil,1000];
				(_return select 1) pushBack ["muzzle_snds_B",nil,1000];
				(_return select 1) pushBack ["muzzle_snds_H_MG",nil,1000];
				(_return select 1) pushBack ["bipod_02_F_blk",nil,1000];
				(_return select 1) pushBack ["acc_flashlight",nil,1000];
			};			
			if(__GETC__(life_adaclevel) > 2) then {
				(_return select 1) pushBack ["optic_LRPS",nil,1000];
				(_return select 1) pushBack ["optic_KHS_blk",nil,1000];
				(_return select 1) pushBack ["optic_ERCO_blk_F",nil,1000];
			};
			if(__GETC__(life_adaclevel) > 3) then {
				(_return select 1) pushBack ["muzzle_snds_93mmg",nil,350000];
			};
			
		};
		_return;
	};
};
