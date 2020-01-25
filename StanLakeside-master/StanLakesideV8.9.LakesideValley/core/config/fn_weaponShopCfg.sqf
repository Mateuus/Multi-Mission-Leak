#include <macro.h>
/*
        File: fn_weaponShopCfg.sqf
        
       
        Description:
        Master configuration file for the weapon shops.And More Muhahah.
       
        Return:
        String: Close the menu
        Array:
        [Shop Name,
        [ //Array of items to add to the store
                [classname,Custom Name (set nil for default),price]
        ]]
*/

params [["_shop", "", [""]]];

if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.
_ret = [];
 
switch(_shop) do
{
        case "med_supplies":
        {
			switch (true) do
			{
				case (playerSide != independent): {"You are not an EMS"};
				default {
					["Sklep BezSensu EMS",
						[
							["ToolKit",nil,2500],
							["ItemCompass",nil,50],
							["tf_anprc152",nil,10],
							["ItemWatch",nil,10]
						]
					];
				};
			};
        };
        case "med_basic":
        {
			switch (true) do
			{
				case (playerSide != independent): {"You are not an EMS"};
				default {
					["Podstawe wyposazenie EMS",
						[
							["cg_atf_bandage_i",nil,1],
							["cg_ATF_first_aid_kit_i",nil,1],
							["cg_bloodbag_i",nil,1],
							["cg_antibiotics_i",nil,1],
							["CG_ATF_Drug_Bottle_01_i","Valium",1],
							["cg_torch",nil,250], 
							["cg_torchbattery",nil,250], 
							["acc_flashlight","Extinguisher Flashlight",10],
							["cg_atf_bandage_i",nil,1],
							["cg_ATF_first_aid_kit_i",nil,1],
							["cg_bloodbag_i",nil,1],
							["cg_antibiotics_i",nil,1],
							["CG_ATF_Drug_Bottle_01_i","Valium",1],
							["A3L_Extinguisher",nil,35],
							["CL_extinguisher",nil,350],
							["CL_ExtinguisherMagazine",nil,35],
							["30Rnd_test_mag_Tracer",nil,35],
							["A3L_chainsaw","Pila Mechaniczna",35],
							["A3L_fuel","Paliwo do Pily",5],
							["ItemGPS",nil,25],
							["tf_microdagr",nil,5],
							["tf_anprc152",nil,10],
							["Binocular",nil,120],
							["ToolKit",nil,2500],
							["ItemCompass",nil,50],
							["ItemWatch",nil,10],
							["Chemlight_red",nil,20],
							["Chemlight_yellow",nil,20],
							["Chemlight_green",nil,20],
							["Chemlight_blue",nil,20]
						]
					];
				};
			};
        };
    
        case "cop_basic":
        {
			switch(true) do
			{
				case (playerSide != west): {"You are not a cop!"};
				default
				{
					["Podstawowe wyposazenie Policji",								
						[
							["cg_atf_bandage_i","Bandaz",1],
							["CG_Pro_Item_i","GoPro",350],
							["CG_ATF_Handcuffs_i","Kajdanki",10],
							["cg_torch","Latarka",250], 
							["CG_Spikes_Collapsed","Kolczatka",250], 
							["cg_torchbattery",nil,250], 
							["gign_shield","Tarcza",10],
							["CG_BATON","Tonfa",10],
							["CG_TELBAT","Palka teleskopowa",10],
							["Mattaust_Keys","Klucze do Komendy",10],
							["acc_flashlight","ACC Flashlight",10],
							["RH_M6X","RH Flashlight",10],
							["A3L_M4Flashlight","M4A3 Flashlight",10],
							["cl3_fingerprintscanner","Skaner odciskow palcow",1],
							["cl_plastic_shield","Tarcza plastikowa",1],
							["cl3_taserM26_Yellow","Paralizator",1],
							["cl3_taserm26mag_mpx","Kartridz do Paralizatora",1],
							["Radar_Gun","Suszarka",25],								
							["ToolKit",nil,2500], 
							["ItemCompass",nil,50],  
							["ItemWatch",nil,10],                                          
							["Chemlight_red",nil,20],
							["Chemlight_yellow",nil,20],
							["Chemlight_green",nil,20],
							["Chemlight_blue",nil,20],
							["Binocular",nil,15],
							["Rangefinder","Dalmierz SERT",500],
							["ItemGPS",nil,10],  
							["tf_anprc152",nil,10]
						]
					];
				};
			};
        };
		
		case "cop_weaponShop": 
		{
			_ret = [];
			if(__GETC__(life_coplevel) > 0) then {
				_ret pushBack [
					["RH_m9",nil,240],
					["RH_15Rnd_9x19_M9",nil,5],
					["RH_g17",nil,240],
					["RH_17Rnd_9x19_g17",nil,5],
					["RH_X300",nil,5]
				];
			};
			if(__GETC__(life_coplevel) > 1) then {
				_temp = [
					["RH_fnp45",nil,240],
					["RH_15Rnd_45cal_fnp",nil,5],
					["RH_p226",nil,3000],
					["RH_15Rnd_9x19_SIG",nil,240]
				];
				{
					(_ret select 0) pushBack _x;
				} foreach _temp;
			};
			if(__GETC__(life_coplevel) > 2) then {
				_temp =  [
					["RH_uspm",nil,240],
					["RH_16Rnd_40cal_usp",nil,5],
					["RH_SFM952V",nil,10]
				];
				{
					(_ret select 0) pushBack _x;
				} foreach _temp;	
			};
			if(__GETC__(life_coplevel) > 4) then {
				_temp =  [
					["hgun_Pistol_heavy_01_F",nil,3000],
					["11Rnd_45ACP_Mag",nil,240],
					["RH_usp",nil,3000],
					["RH_12Rnd_45cal_usp",nil,240],
					["RH_kimber_nw",nil,240],
					["RH_7Rnd_45cal_m1911",nil,240],
					["RH_fn57",nil,240],
					["RH_20Rnd_57x28_FN",nil,240],
					["SMG_02_F",nil,3000],
					["SMG_01_F",nil,3000],
					["hgun_PDW2000_F",nil,3000],
					["RH_sbr9",nil,3000],
					["30Rnd_9x21_Mag",nil,240],
					["30Rnd_45ACP_Mag_SMG_01",nil,240],
					["hlc_smg_mp5a2",nil,3000],
					["hlc_smg_mp5a4",nil,3000],
					["hlc_smg_mp510",nil,3000],
					["hlc_30Rnd_10mm_B_MP5",nil,240],
					["hlc_30Rnd_10mm_JHP_MP5",nil,240],
					["hlc_30Rnd_9x19_B_MP5",nil,240],
					["hlc_30Rnd_9x19_GD_MP5",nil,240],
					["hlc_30Rnd_9x19_SD_MP5",nil,240],
					["RH_osprey",nil,3000],
					["RH_M6X",nil,240],
					["RH_X2",nil,240],
					["RH_X300",nil,240],
					["RH_docter",nil,240],
					["optic_MRD",nil,240],
					["optic_Yorris",nil,240],
					["optic_Aco_smg",nil,240],
					["acc_flashlight",nil,240],
					["acc_pointer_IR",nil,240],
					["RH_compm4s",nil,240],
					["RH_compM2",nil,240],
					["RH_compM2l",nil,240],
					["RH_eotech553",nil,240],
					["RH_eotech553mag",nil,240],
					["RH_eotexps3",nil,240],
					["RH_eothhs1",nil,240],
					["RH_t1",nil,240],
					["RH_reflex",nil,240],
					["RH_barska_rds",nil,240],
					["RH_cmore",nil,240],
					["RH_LTdocter",nil,240],
					["RH_LTdocterl",nil,240],
					["RH_zpoint",nil,240]
				];
				{
					(_ret select 0) pushBack _x;
				} foreach _temp;	
			};
			if(__GETC__(life_coplevel) > 5) then {
				_temp =  [
					["hgun_Pistol_heavy_02_F",nil,240],
					["6Rnd_45ACP_Cylinder",nil,240],
					["RH_mateba",nil,240],
					["RH_6Rnd_44_Mag",nil,240],
					["RH_mp412",nil,240],
					["RH_python",nil,240],
					["RH_6Rnd_357_Mag",nil,240],
					["RH_bull",nil,240],
					["RH_6Rnd_454_Mag",nil,240],
					["RH_ttracker",nil,240],
					["RH_6Rnd_45ACP_Mag",nil,240],
					["RH_Deaglem",nil,240],
					["RH_demz",nil,240],
					["RH_Deflash",nil,240],
					["RH_7Rnd_50_AE",nil,240],
					["hgun_007_SW_M10",nil,240],
					["hgun_007_SW_M10_special",nil,240],
					["hgun_007_SW_M10_gold",nil,240],
					["prpl_benelli_14_pgs_rail","Shotgun na gumowe kule",2200],
					["prpl_6Rnd_12Gauge_Slug","Gumowe kule",20]
				];
				{
					(_ret select 0) pushBack _x;
				} foreach _temp;	
			};
			if(__GETC__(life_coplevel) > 6) then {
				_temp =  [
                    ["HandGrenade_Stone","Flashbang",300],
				    ["SmokeShellYellow","Gaz lzawiacy",300]				
				];
				{
					(_ret select 0) pushBack _x;
				} foreach _temp;	
			};
			if(__GETC__(life_coplevel) > 7) then {
				_temp =  [
					["RH_kimber",nil,100],
					["RH_7Rnd_45cal_m1911",nil,5],
					["RH_M4A1",nil,5000],
					["RH_M4A6",nil,5000],
					["RH_M16A2",nil,5000],
					["RH_M16A3",nil,5000],
					["RH_M16A4",nil,5000],
					["RH_M16A6",nil,5000],
					["RH_mk12mod1",nil,5000],
					["RH_30Rnd_556x45_Mk262",nil,500],
					["hlc_rifle_bcmjack",nil,5220],
					["hlc_30rnd_556x45_EPR",nil,520],
					["muzzle_snds_M",nil,4],
					["hlc_rifle_honeybadger",nil,25],
					["RH_compM2",nil,25],
					["RH_compM2l",nil,25],
					["RH_demz",nil,1500],
				    ["RH_M6X",nil,1500],
					["RH_leu_mk4",nil,500]
				];
				{
					(_ret select 0) pushBack _x;
				} foreach _temp;	
			};
			["Uzbrojenie Policji", _ret select 0];
		};
		
        case "rebel_low":
        {
			switch(true) do
			{
				case (rebelshipment getVariable["notCaptured",FALSE]): {"Supplies have been taken by Police..!"};
				case (playerSide != civilian && playerSide != east): {"You are not a civilian!"};
				case (!license_civ_rebel): {"Najpierw pokaz mi ze masz jaja!"};
				default
				{
					["Pistolety Rebelii",
						[
							["RH_fn57",nil,25500],
							["RH_20Rnd_57x28_FN",nil,600],
					        ["RH_vp70",nil,10500],
				            ["RH_18Rnd_9x19_VP",nil,600],
							["RH_usp",nil,25500],
							["RH_12Rnd_45cal_usp",nil,600],
							["RH_aacusp",nil,20500],
							["RH_fhusp",nil,2500],
							["RH_uspm",nil,20500],
							["RH_16Rnd_40cal_usp",nil,600],
							["RH_matchsd",nil,20500],
							["RH_m1911",nil,15500],
							["RH_kimber",nil,15500],
							["RH_7Rnd_45cal_m1911",nil,600],
							["hgun_ACPC2_F",nil,15500],
							["9Rnd_45ACP_Mag",nil,600],
							["RH_fnp45t",nil,25500],
							["RH_15Rnd_45cal_fnp",nil,600],
							["RH_fn57_t",nil,25500],
							["RH_fn57_g",nil,25500],
							["RH_20Rnd_57x28_FN",nil,600],
							["RH_sfn57",nil,20500],
							["muzzle_snds_L",nil,20500],
							["RH_gemtech9",nil,20500],
							["RH_m9qd",nil,20500],
							["muzzle_snds_acp",nil,20500],
							["RH_gemtech45",nil,20500],
							["RH_osprey",nil,20500],
							["RH_suppr9",nil,20500],
							["RH_pmsd",nil,20500],
							["RH_vp70stock",nil,2500],
							["RH_M6X",nil,2500],
							["RH_X2",nil,2500],
							["RH_X300",nil,2500],
							["RH_A26",nil,2500],
							["RH_pmIR",nil,2500],
							["RH_docter",nil,2500],
							["optic_MRD",nil,2500],
							["optic_Yorris",nil,2500],
					        ["RH_gsh18",nil,10500],
				            ["RH_18Rnd_9x19_gsh",nil,600]
						]
					];
				};
			};
        };

        case "rebel_high":
        {
			switch(true) do
			{
				case (rebelshipment getVariable["notCaptured",FALSE]): {"Supplies have been taken by Police..!"};
				case (playerSide != civilian && playerSide != east): {"You are not a civilian!"};
				case (!license_civ_rebel): {"Najpierw pokaz ze masz jaja i szkolenie!"};
				default
				{
					["Bronie Dlugie Rebelii",
						[
							["SMG_01_F",nil,127500],
			                ["30Rnd_45ACP_Mag_SMG_01",nil,750],
							["SMG_02_F",nil,127500],
							["RH_sbr9_wdl",nil,127500],
							["RH_sbr9_tg",nil,127500],
							["RH_sbr9_des",nil,127500],
							["RH_32Rnd_9mm_M822",nil,750],
							["AG_MP9_sand_peq",nil,127500],
							["AG_MP9_wcam_peq",nil,127500],
							["AG_MP9_digi_peq",nil,127500],
							["AG_MP9_wcam",nil,127500],
							["AG_MP9_digi",nil,127500],
							["AG_MP9_sand",nil,127500],
							["AG_MP9_folded_wcam",nil,127500],
							["AG_MP9_folded_digi",nil,127500],
							["AG_MP9_folded_sand",nil,127500],
							["30Rnd_45ACP_Mag_SMG_01",nil,750],
							["30Rnd_9x21_Mag",nil,750],
							["optic_Aco",nil,2500],
							["optic_ACO_grn_smg",nil,2500],
							["chakFNP90_50rnd_skin1",nil,160500],
							["chakFNP90_57x28_B_skin1",nil,2250],
							["hlc_rifle_augpara",nil,160500],
							["hlc_rifle_auga2para",nil,160500],
							["hlc_rifle_augpara_t",nil,160500],
							["hlc_rifle_auga2para_t",nil,160500],
							["hlc_25Rnd_9x19mm_M882_AUG",nil,750],
							["hlc_25Rnd_9x19mm_JHP_AUG",nil,750],
							["hgun_PDW2000_F",nil,117500],
							["30Rnd_9x21_Mag",nil,750],
							["ej_Thompson",nil,255500],
							["ej_ThompsonTactical",nil,260500],
							["ej_ThompsonTactical2",nil,260500],
							["Thompsonjhpplus_mag",nil,750],
							["RH_g18",nil,48000],
							["RH_33Rnd_9x19_g18",nil,750],
							["RH_vz61",nil,58000],
							["RH_20Rnd_32cal_vz61",nil,750],
							["RH_tec9",nil,58000],
							["RH_32Rnd_9x19_tec",nil,750],
							["RH_muzi",nil,58000],
							["RH_30Rnd_9x19_UZI",nil,750],
							["RH_deagle",nil,97500],
							["RH_7Rnd_50_AE",nil,750],
							["RH_compm4s",nil,5000],
							["RH_compM2_tan",nil,5000],
							["RH_eotexps3_tan",nil,5000],
							["RH_t1_tan",nil,5000],
							["RH_reflex",nil,5000],
			                ["RH_M6X",nil,4500]
						]
					];
				};
			};
        };
		
		case "donator":
        {
			switch(true) do
			{
			case (license_civ_donator1):
                {
                    ["Sklep Donatora Poziom 1",
                        [
							["A3L_CZ550",nil,100000],
                            ["A3L_CZ550mag",nil,500],
                            ["A3L_CZ550Scope",nil,1500],
							["KPFS_HKP7",nil,500],
                            ["KPFS_8Rnd_9x19_PARA",nil,20],
							["hlc_optic_kobra",nil,5500],
							["RH_Delft",nil,550],
							["KPFS_P99",nil,800],
                            ["KPFS_15rnd_9x19_P99",nil,50],
							["RH_fn57",nil,15500],
							["RH_20Rnd_57x28_FN",nil,600],
					        ["RH_vp70",nil,10500],
				            ["RH_18Rnd_9x19_VP",nil,600],
							["RH_usp",nil,20500],
							["RH_12Rnd_45cal_usp",nil,600],
							["RH_aacusp",nil,20000],
							["RH_fhusp",nil,2500],
							["RH_uspm",nil,5000],
							["RH_16Rnd_40cal_usp",nil,600],
							["RH_matchsd",nil,5000],
							["RH_M6X",nil,2500],
							["RH_X2",nil,2500],
							["RH_X300",nil,2500],
							["RH_A26",nil,2500],
							["RH_pmIR",nil,2500],
							["RH_docter",nil,2500],
							["optic_MRD",nil,2500],
							["optic_Yorris",nil,2500],
							["AG_MP9_sand_peq",nil,107500],
							["AG_MP9_wcam_peq",nil,107500],
							["AG_MP9_digi_peq",nil,107500],
							["AG_MP9_wcam",nil,107500],
							["AG_MP9_digi",nil,107500],
							["AG_MP9_sand",nil,107500],
							["AG_MP9_folded_wcam",nil,107500],
							["AG_MP9_folded_digi",nil,107500],
							["AG_MP9_folded_sand",nil,107500],
							["30Rnd_45ACP_Mag_SMG_01",nil,750],
							["30Rnd_9x21_Mag",nil,750],

                            ["KPFS_Mauser_Hsc",nil,600],
                            ["kpfs_8Rnd_765x17_PP",nil,50],

                            ["KPFS_Walther_M9",nil,700],
                            ["kpfs_6Rnd_635x15",nil,50],

                            ["KPFS_P99",nil,800],
                            ["KPFS_15rnd_9x19_P99",nil,50],

                            ["RH_g17",nil,900],
                            ["RH_g19",nil,900],
                            ["RH_g19t",nil,900],
                            ["RH_17Rnd_9x19_g17",nil,50],

                            ["RH_m9",nil,900],
                            ["RH_15Rnd_9x19_M9",nil,50],

                            ["RH_sw659",nil,1000],
                            ["RH_14Rnd_9x19_sw",nil,50],

                            ["RH_gsh18",nil,1500],
                            ["RH_18Rnd_9x19_gsh",nil,50],

                            ["SMG_01_F",nil,65000],
                            ["30Rnd_45ACP_Mag_SMG_01",nil,250],

							["RH_g18",nil,35000],
                            ["RH_33Rnd_9x19_g18",nil,150],

                            ["RH_kimber",nil,9000],
                            ["RH_7Rnd_45cal_m1911",nil,750]
                        ]
                    ];
                };

               case (license_civ_donator2):
               {
                    ["Sklep Donatora Poziom 2",
                       [ 
							["A3L_CZ550",nil,100000],
                            ["A3L_CZ550mag",nil,500],
                            ["A3L_CZ550Scope",nil,1500],
							["KPFS_HKP7",nil,500],
                            ["KPFS_8Rnd_9x19_PARA",nil,50],

                            ["KPFS_Mauser_Hsc",nil,600],
                            ["kpfs_8Rnd_765x17_PP",nil,50],

                            ["KPFS_Walther_M9",nil,700],
                            ["kpfs_6Rnd_635x15",nil,50],

                            ["KPFS_P99",nil,800],
                            ["KPFS_15rnd_9x19_P99",nil,50],
							["RH_fn57",nil,15500],
							["RH_20Rnd_57x28_FN",nil,600],
					        ["RH_vp70",nil,10500],
				            ["RH_18Rnd_9x19_VP",nil,600],
							["RH_usp",nil,20500],
							["RH_12Rnd_45cal_usp",nil,600],
							["RH_aacusp",nil,20500],
							["RH_fhusp",nil,2500],
							["RH_uspm",nil,20500],
							["RH_16Rnd_40cal_usp",nil,600],
							["RH_matchsd",nil,5000],
							["RH_m1911",nil,10500],
							["RH_kimber",nil,10500],
							["RH_7Rnd_45cal_m1911",nil,600],
							["hgun_ACPC2_F",nil,15500],
							["9Rnd_45ACP_Mag",nil,600],
							["RH_fnp45t",nil,20500],
							["RH_15Rnd_45cal_fnp",nil,600],
							["RH_fn57_t",nil,20500],
							["RH_fn57_g",nil,20500],
							["RH_20Rnd_57x28_FN",nil,600],
							["RH_sfn57",nil,20500],
							["muzzle_snds_L",nil,20500],
							["RH_gemtech9",nil,20500],
							["RH_m9qd",nil,20500],
							["muzzle_snds_acp",nil,20500],
							["RH_gemtech45",nil,20500],
							["RH_osprey",nil,5000],
							["RH_suppr9",nil,5000],
							["RH_pmsd",nil,5000],
							["RH_vp70stock",nil,2500],
							["RH_M6X",nil,2500],
							["RH_X2",nil,2500],
							["RH_X300",nil,2500],
							["RH_A26",nil,2500],
							["RH_pmIR",nil,2500],
							["RH_docter",nil,2500],
							["optic_MRD",nil,2500],
							["optic_Yorris",nil,2500],
					        ["RH_gsh18",nil,10500],
				            ["RH_18Rnd_9x19_gsh",nil,600],
							["AG_MP9_sand_peq",nil,107500],
							["AG_MP9_wcam_peq",nil,107500],
							["AG_MP9_digi_peq",nil,107500],
							["AG_MP9_wcam",nil,107500],
							["AG_MP9_digi",nil,107500],
							["AG_MP9_sand",nil,107500],
							["AG_MP9_folded_wcam",nil,107500],
							["AG_MP9_folded_digi",nil,107500],
							["AG_MP9_folded_sand",nil,107500],
							["30Rnd_45ACP_Mag_SMG_01",nil,750],
							["30Rnd_9x21_Mag",nil,750],
							["ej_Thompson",nil,185500],
							["ej_ThompsonTactical",nil,185500],
							["ej_ThompsonTactical2",nil,185500],
							["Thompsonjhpplus_mag",nil,750],
							["RH_eotech553_tan",nil,5000],
							["RH_eotexps3_tan",nil,5000],
							["RH_t1_tan",nil,5000],
							["RH_reflex",nil,5000],

                            ["RH_g17",nil,900],
                            ["RH_g19",nil,900],
                            ["RH_g19t",nil,900],
							["RH_g18",nil,35000],
                            ["RH_33Rnd_9x19_g18",nil,1250],
                            ["RH_17Rnd_9x19_g17",nil,50],
							["RH_vz61",nil,48000],
							["RH_20Rnd_32cal_vz61",nil,750],
							["RH_tec9",nil,48000],
							["RH_32Rnd_9x19_tec",nil,750],
							["RH_tecsd",nil,5000],
							["RH_muzi",nil,48000],
							["RH_30Rnd_9x19_UZI",nil,750],
							["RH_muzisd",nil,5000],
							["RH_deagle",nil,70000],
							["RH_7Rnd_50_AE",nil,750],

                            ["RH_m9",nil,900],
                            ["RH_15Rnd_9x19_M9",nil,50],

                            ["RH_sw659",nil,1200],
                            ["RH_14Rnd_9x19_sw",nil,50],

                            ["RH_gsh18",nil,1500],
                            ["RH_18Rnd_9x19_gsh",nil,50],
							["chakFNP90_50rnd_skin2",nil,135000],
                            ["chakFNP90_57x28_B_skin1",nil,2250],

                            ["RH_kimber",nil,9000],
                            ["RH_7Rnd_45cal_m1911",nil,900],

                            ["RH_Deagles",nil,60000],
                            ["RH_7Rnd_50_AE",nil,2050]
                        ]
                    ];
                };

			case (license_civ_donator3):
                {
                    ["Sklep Donatora Poziom 3",
                        [
						    ["A3L_CZ550",nil,80050],
                            ["A3L_CZ550mag",nil,500],
                            ["A3L_CZ550Scope",nil,1500],
							["KPFS_HKP7",nil,500],
                            ["KPFS_Mauser_Hsc",nil,600],
                            ["kpfs_8Rnd_765x17_PP",nil,50],
                            ["KPFS_Walther_M9",nil,700],
                            ["kpfs_6Rnd_635x15",nil,1250],
                            ["KPFS_P99",nil,800],
                            ["KPFS_15rnd_9x19_P99",nil,50],
                            ["RH_g17",nil,900],
                            ["RH_g19",nil,900],
                            ["RH_g19t",nil,900],
                            ["RH_17Rnd_9x19_g17",nil,50],
                            ["RH_m9",nil,900],
                            ["RH_15Rnd_9x19_M9",nil,50],
                            ["RH_sw659",nil,1200],
                            ["RH_14Rnd_9x19_sw",nil,50],
                            ["RH_gsh18",nil,1500],
                            ["RH_18Rnd_9x19_gsh",nil,50],
                            ["SMG_01_F",nil,55000],
                            ["30Rnd_45ACP_Mag_SMG_01",nil,500],
							["RH_g18",nil,25000],
                            ["RH_33Rnd_9x19_g18",nil,1250],
							["chakFNP90_50rnd_skin1",nil,89500],
							["chakFNP90_57x28_B_skin1",nil,2250],
							["RH_fn57",nil,15500],
							["RH_20Rnd_57x28_FN",nil,600],
					        ["RH_vp70",nil,10500],
				            ["RH_18Rnd_9x19_VP",nil,600],
							["RH_usp",nil,20500],
							["RH_12Rnd_45cal_usp",nil,600],
							["RH_aacusp",nil,20500],
							["RH_fhusp",nil,2500],
							["RH_uspm",nil,20500],
							["RH_16Rnd_40cal_usp",nil,600],
							["RH_matchsd",nil,5000],
							["RH_m1911",nil,10500],
							["RH_kimber",nil,10500],
							["RH_7Rnd_45cal_m1911",nil,600],
							["hgun_ACPC2_F",nil,15500],
							["9Rnd_45ACP_Mag",nil,600],
							["RH_fnp45t",nil,20500],
							["RH_15Rnd_45cal_fnp",nil,600],
							["RH_fn57_t",nil,20500],
							["RH_fn57_g",nil,20500],
							["RH_20Rnd_57x28_FN",nil,600],
							["RH_sfn57",nil,20500],
							["muzzle_snds_L",nil,5000],
							["RH_gemtech9",nil,5000],
							["RH_m9qd",nil,5000],
							["muzzle_snds_acp",nil,5000],
							["RH_gemtech45",nil,5000],
							["RH_osprey",nil,5000],
							["RH_suppr9",nil,5000],
							["RH_pmsd",nil,5000],
							["RH_vp70stock",nil,2500],
							["RH_M6X",nil,2500],
							["RH_X2",nil,2500],
							["RH_X300",nil,2500],
							["RH_A26",nil,2500],
							["RH_pmIR",nil,2500],
							["RH_docter",nil,2500],
							["optic_MRD",nil,2500],
							["optic_Yorris",nil,2500],
					        ["RH_gsh18",nil,10500],
				            ["RH_18Rnd_9x19_gsh",nil,600],
                            ["RH_kimber",nil,9000],
                            ["RH_7Rnd_45cal_m1911",nil,750],
							["ej_Thompson",nil,155500],
							["ej_ThompsonTactical",nil,150500],
							["ej_ThompsonTactical2",nil,155500],
							["Thompsonjhpplus_mag",nil,750],
							["SMG_01_F",nil,89500],
			                ["30Rnd_45ACP_Mag_SMG_01",nil,750],
							["SMG_02_F",nil,117500],
							["RH_sbr9_wdl",nil,107500],
							["RH_sbr9_tg",nil,107500],
							["RH_sbr9_des",nil,107500],
							["RH_32Rnd_9mm_M822",nil,750],
							["AG_MP9_sand_peq",nil,89500],
							["AG_MP9_wcam_peq",nil,89500],
							["AG_MP9_digi_peq",nil,89500],
							["AG_MP9_wcam",nil,89500],
							["AG_MP9_digi",nil,89500],
							["AG_MP9_sand",nil,89500],
							["AG_MP9_folded_wcam",nil,89500],
							["AG_MP9_folded_digi",nil,89500],
							["AG_MP9_folded_sand",nil,89500],
							["30Rnd_45ACP_Mag_SMG_01",nil,750],
							["30Rnd_9x21_Mag",nil,750],
							["hlc_rifle_augpara",nil,89500],
							["hlc_rifle_auga2para",nil,89500],
							["hlc_rifle_augpara_t",nil,89500],
							["hlc_rifle_auga2para_t",nil,89500],
							["hlc_25Rnd_9x19mm_M882_AUG",nil,750],
							["hlc_25Rnd_9x19mm_JHP_AUG",nil,750],
							["hgun_PDW2000_F",nil,89750],
							["30Rnd_9x21_Mag",nil,750],
							["hlc_rifle_augpara",nil,89500],
			                ["hlc_25Rnd_9x19mm_JHP_AUG",nil,900],
							["optic_Aco",nil,2500],
							["optic_ACO_grn_smg",nil,2500],
							["RH_vz61",nil,48000],
							["RH_20Rnd_32cal_vz61",nil,750],
							["RH_tec9",nil,44000],
							["RH_32Rnd_9x19_tec",nil,750],
							["RH_tecsd",nil,5000],
							["RH_muzi",nil,44000],
							["RH_30Rnd_9x19_UZI",nil,750],
							["RH_muzisd",nil,5000],
							["RH_deagle",nil,60000],
							["RH_7Rnd_50_AE",nil,750],
							["RH_compm4s",nil,5000],
							["RH_compM2_tan",nil,5000],
							["RH_compM2l_tan",nil,5000],
							["RH_eotech553_tan",nil,5000],
							["RH_eotexps3_tan",nil,5000],
							["RH_t1_tan",nil,5000],
							["RH_reflex",nil,5000],
							["RH_zpoint",nil,5000],
			                ["RH_M6X",nil,4500],
							["chakFNP90_50rnd_skin2",nil,89500],
							["chakFNP90_57x28_B_skin1",nil,2250],
							["A3L_AK47sgold",nil,125000],
							["A3L_RedDot",nil,250],
							["A3L_AK47sMag",nil,750],
							["RH_Deagleg",nil,65000],
							["RH_Deagles",nil,65000],
							["RH_Deaglem",nil,70000],
							["RH_demz",nil,250],
							["optic_Yorris",nil,250]
                        ]
                    ];
                };
			};
        };
        case "gun":
        {
			switch(true) do
			{
				case (life_karma < 0): {"You need positive reputation to use this store!"};
				case (playerSide != civilian && playerSide != east): {"You are not a civilian!"};
				case (!license_civ_gun): {"You don't have a Firearms license!"};
				default
				{
					["Bronie Palne Goodmana",
						[
							["KPFS_HKP7",nil,1250],
							["KPFS_8Rnd_9x19_PARA",nil,120],

							["KPFS_Mauser_Hsc",nil,1450],
							["kpfs_8Rnd_765x17_PP",nil,120],

							["KPFS_Walther_M9",nil,1550],
							["kpfs_6Rnd_635x15",nil,120],

							["KPFS_P99",nil,1600],
							["KPFS_15rnd_9x19_P99",nil,125],

							["RH_g17",nil,1750],
							["RH_g19",nil,1850],
							["RH_g19t",nil,1850],
							["RH_17Rnd_9x19_g17",nil,120],

							["RH_m9",nil,1800],
							["RH_15Rnd_9x19_M9",nil,120],

							["RH_sw659",nil,1950],
							["RH_14Rnd_9x19_sw",nil,150],
							["RH_mp412",nil,19950],
							["RH_6Rnd_357_Mag",nil,550],

							["hgun_Rook40_F",nil,3350],
							["16Rnd_9x21_Mag",nil,125],
							["RH_mk2",nil,4350],
							["RH_10Rnd_22LR_mk2",nil,225],
							
							["hgun_P07_F",nil,3350],
							["16Rnd_9x21_Mag",nil,125],
							["RH_gsh18",nil,5150],
							["RH_18Rnd_9x19_gsh",nil,195],
							["RH_kimber",nil,30500],
							["RH_7Rnd_45cal_m1911",nil,275]                                            
						]
					];
				};
			};
        };
        
        case "rifle":
        {
			switch(true) do
			{
				case (playerSide != civilian && playerSide != east): {"You are not a civilian!"};
				case (!license_civ_rifle): {"You don't have a Rifle license!"};
				default
				{
					["Sklep mysliwski",
						[
							["A3L_CZ550",nil,137500],
							["A3L_CZ550mag",nil,500],
							["A3L_CZ550Scope",nil,12500],
							["arifle_SDAR_F","Turtle ONLY-SDAR",1000],
							["cl3_crossbow","Kusza",55000],
							["4Rnd_crossbow_mag","Magazynek do kuszy",1000],
							["20Rnd_556x45_UW_mag","Underwater magazine",120]
						]
					];
				};
			};
        };      
       
        case "gang":
        {
			switch(true) do
			{
				case (playerSide != civilian && playerSide != east): {"You are not a civilian!"};
				default
				{
					["Hideout Armament",
						[
							["A3L_Glock17",nil,1260],
							["A3L_Glock17mag",nil,50]                                          
						]
					];
				};
			};
        };
       
        case "genstore":
        {
			["Sklep Wielobranzowy",
				[
					["cg_atf_bandage_i","Bandaz",25],
					["ItemGPS",nil,1000],  
					["CG_Pro_Item_i","GoPro",350],
					["CG_tabletd","Tablet",50],
					["CG_battery_i","Bateria",5],
					["CG_ATF_Pizza_Box_i","Pizza Na Wynos",1000],
					["CG_ATF_Donut_Box_i","Donuty Na Wynos",1000],
					["cg_torch","Latarka",550], 
					["cl_axe","Topor",550], 
					["cl_bin_shield","Tarcza Bin Lida",550], 
					["cl_picket_ftp","Znak Jebac Policje",550], 
					["cl_picket_mlnw","Znak Milosci",550], 
					["cl_picket_rtp","Znak Wypuscic Wieznia",550], 
					["vvv_fishing_rod","Wedka",1550], 
					["cebos","Przyneta do wedki",50], 
					["cg_torchbattery","Bateria do Latarki",50], 				
					["Chemlight_red",nil,120],
					["Chemlight_yellow",nil,120],
					["Chemlight_green",nil,120],
					["Chemlight_blue",nil,120],
					["ItemMap",nil,6],
					["Binocular",nil,110],
					["ToolKit",nil,1500],
					["ItemCompass",nil,50],
					["ItemWatch",nil,10],
					["nonlethal_swing", "Slepa amunicja", 10],
					["sharp_swing","Ostra amunicja",10],
					["cg_scythe","Sierp",500],
					["CG_PICKAXE","Kilof",500],
					["cg_hatchet","Siekiera",500],
					["cg_machete","Maczeta",500],
					["CG_BAT","Kij Bejsbolowy",500],
					["CG_CROSS","Krzyz",500],
					["A3L_Sign2","Znak Legalizacji Marihuany",1000],
					["A3L_Sign","Znak Jebac Policje",1000],
					["Tv_Camera","Kamera Telewizyjna",2520]
				]
			];
        };
};