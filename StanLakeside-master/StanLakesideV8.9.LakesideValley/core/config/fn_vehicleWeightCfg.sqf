/*
	File: fn_vehicleWeightCfg.sqf
	
	
	Description:
	Master configuration for vehicle weight.
*/
private["_className"];
_className = param [0,"",[""]];

switch (_className) do
{
	// Boats
	case "A3L_Ship": {100};
	case "A3L_Jetski_yellow": {2};
	case "A3L_Jetski": {2};
	
    // Koil Added Cars
	case "AM_Holden_EMS": {45};
	case "A3L_BMW135Sport1": {45};
	case "A3L_BMW135Sport2": {45};
	case "A3L_BMW135Sport3": {45};
	case "A3L_BMW135Sport4": {45};
	case "A3L_BMW135Sport5": {45};	
	case "A3L_BMW135White": {45};
	case "A3L_BMW135Black": {45};
	case "A3L_BMW135Blue": {45};
	case "A3L_BMW135Purple": {45};
	case "A3L_BMW135Red": {45};
	case "bv_monster_2tone1": {200};

	case "AM_Holden_RBlue": {45};
	case "AM_Holden_RRed": {45};
	case "AM_Holden_RWhite": {45};
	case "AM_Holden_RBlack": {45};

	case "cg_rv_camper": {190};

	case "critgamin_vangmcc_civ": {100};
	case "critgamin_vangmcc_civ_noir": {100};
	case "critgamin_vangmcc_civ_bleufonce": {100};
	case "critgamin_vangmcc_civ_bleu": {100};
	case "critgamin_vangmcc_civ_vert": {100};
	case "critgamin_vangmcc_civ_rouge": {100};
	case "critgamin_vangmcc_civ_jaune": {100};
	case "critgamin_vangmcc_civ_rose": {100};
	case "critgamin_vangmcc_civ_grise": {100};
	case "critgamin_vangmcc_civ_violet": {100};
	case "critgamin_vangmcc_civ_orange": {100};

	case "cg_raptor_truck_noir": {200};
	case "cg_raptor_truck_violet": {200};
	case "cg_raptor_truck_rose": {200};
	case "cg_raptor_truck_orange": {200};
	case "cg_raptor_truck_grise": {200};
	case "cg_raptor_truck_vert": {200};
	case "cg_raptor_truck_bleufonce": {200};
	case "cg_raptor_truck_bleu": {200};
	case "cg_raptor_truck_white": {200};
	case "cg_raptor_truck_jaune": {200};
	case "cg_raptor_truck_rogue": {200};

	case "cg_bowler_offroad_noir": {150};
	case "cg_bowler_offroad_violet": {150};
	case "cg_bowler_offroad_rose": {150};
	case "cg_bowler_offroad_orange": {150};
	case "cg_bowler_offroad_grise": {150};
	case "cg_bowler_offroad_vert": {150};
	case "cg_bowler_offroad_bleufonce": {150};
	case "cg_bowler_offroad_bleu": {150};
	case "cg_bowler_offroad_white": {150};
	case "cg_bowler_offroad_jaune": {150};
	case "cg_bowler_offroad_rogue": {150};


	case "shounka_avalanche_bleufonce": {200};
	case "shounka_avalanche_grise": {200};
	case "shounka_avalanche_jaune": {200};
	case "shounka_avalanche_noir": {200};
	case "shounka_avalanche_orange": {200};
	case "shounka_avalanche_rose": {200};
	case "shounka_avalanche_rouge": {200};
	case "shounka_avalanche_violet": {200};


	case "cg_daf_xf_euro6_noir": {300};
	case "cg_daf_xf_euro6_violet": {300};
	case "cg_daf_xf_euro6_rose": {300};
	case "cg_daf_xf_euro6_orange": {300};
	case "cg_daf_xf_euro6_grise": {300};
	case "cg_daf_xf_euro6_vert": {300};
	case "cg_daf_xf_euro6_bleufonce": {300};
	case "cg_daf_xf_euro6_bleu": {300};
	case "cg_daf_xf_euro6_white": {300};
	case "cg_daf_xf_euro6_jaune": {300};
	case "cg_daf_xf_euro6_rouge": {300};
	
	case "Jonzie_Transit": {150};
	case "Jonzie_Flat_Bed": {200};
	case "Jonzie_Log_Truck": {200};
	case "Jonzie_Box_Truck": {300};
	case "Jonzie_Tanker_Truck": {300};

	case "cg_renault_magnum_truck_f_noir": {350};
	case "cg_renault_magnum_truck_f_violet": {350};
	case "cg_renault_magnum_truck_f_rose": {350};
	case "cg_renault_magnum_truck_f_orange": {350};
	case "cg_renault_magnum_truck_f_grise": {350};
	case "cg_renault_magnum_truck_f_vert": {350};
	case "cg_renault_magnum_truck_f_bleufonce": {350};
	case "cg_renault_magnum_truck_f_white": {350};
	case "cg_renault_magnum_truck_f_jaune": {350};
	case "cg_renault_magnum_truck_f_rouge": {350};



	case "shounka_ivceco_bleufonce": {450};
	case "shounka_ivceco_grise": {450};
	case "shounka_ivceco_jaune": {450};
	case "shounka_ivceco_noir": {450};
	case "shounka_ivceco_orange": {450};
	case "shounka_ivceco_rose": {450};
	case "shounka_ivceco_rouge": {450};
	case "shounka_ivceco_violet": {450};
	case "C_MSSprinter_01_F": {190};
	case "C_MSSprinter_02_F": {300};



	case "Nhz_audia8limo": {50};

	case "Sab_af_An2": {200};
	case "Sab_tk_An2": {200};
	case "sab_ca_An2": {200};
	case "Sab_ana_An2": {200};
	case "Sab_yel_An2": {200};
	case "Sab_fd_An2": {200};
	case "Sab_sea2_An2": {200};
	case "Sab_sea4_An2": {200};
	case "Sab_Amphi_An2": {200};
	case "sab_camel": {250};
	case "CUP_C_C47_CIV": {300};
	case "CUP_C_DC3_CIV": {300};

	case "tcg_hrly": {65};
	case "tcg_hrly_white": {65};	
	case "tcg_hrly_red": {65};
	case "tcg_hrly_metal": {65};
	case "tcg_hrly_blue": {65};
	case "tcg_hrly_limited": {65};
	case "tcg_hrly_demon": {65};
	case "tcg_hrly_coco": {65};
	case "tcg_hrly_orig1": {65};
	case "tcg_hrly_orig2": {65};
	case "tcg_hrly_skeleton": {65};
	case "tcg_hrly_gay": {65};

    case "A3L_Veyron": {25};
    case "O_Heli_Light_02_unarmed_F": {135};
	case "EvoXSo1": {65};
	case "EvoXSo2": {65};
	case "EvoXSo3": {65};
	case "EvoXSo4": {65};
	case "AM_Holden_Police": {75};

	case "A3L_EvoXDarkGreen": {25};
	case "A3L_OffGreen": {25};
	case "A3L_EvoXOffYellow": {25};
	case "A3L_EvoXYellow": {25};
	case "A3L_EvoXPink": {25};
	case "A3L_EvoXPurple": {25};
	case "A3L_EvoXWhite": {25};
	case "A3L_EvoXBlack": {25};
	case "A3L_EvoXRed": {25};
	case "GNT_C185": {125};

	case "A3L_EvoXrally_green": {25};
	case "A3L_EvoXrally_white": {25};
	case "A3L_EvoXrally_red": {25};
	case "A3L_EvoXrally_blue": {25};

	case "A3L_SuburbanCSO": {65};
	case "A3L_Suburban": {65};
	case "A3L_SuburbanUM": {65};

	// cars
	case "A3L_Veyron": {25};
	case "A3L_Veyron_red": {25};
	case "A3L_Veyron_black": {25};
	case "A3L_Veyron_white": {25};
	case "A3L_Veyron_orange": {25};

	case "S_Rangerover_Black": {25};
	case "S_Rangerover_Red": {25};
	case "S_Rangerover_Blue": {25};
	case "S_Rangerover_Green": {25};
	case "S_Rangerover_Purple": {25};
	case "S_Rangerover_Grey": {25};
	case "S_Rangerover_Orange": {25};
	case "S_Rangerover_White": {25};
	
	case "A3L_RX7_Blue": {25};
	case "A3L_RX7_Red": {25};
	case "A3L_RX7_White": {25};
	case "A3L_RX7_Black": {25};
	
	case "S_Vantage_Red": {25};
	case "S_Vantage_Blue": {25};
	case "S_Vantage_Yellow": {25};
	case "S_Vantage_Black": {25};
	case "S_Vantage_LightBlue": {25};
	case "S_Vantage_Purple": {25};
	case "S_Vantage_White": {25};	

	case "A3L_ChargerUC": {65};
	case "A3L_ChargerUCWhite": {65};

	case "A3L_CVWhite": {25};
	case "A3L_CVBlack": {25};
	case "A3L_CVGrey": {25};
	case "A3L_CVRed": {25};
	case "A3L_CVPink": {25};
	case "A3L_CVBlue": {25};
	
	case "A3L_CVPILBFD": {65};
	
	case "A3L_CVPIUC": {65};
	case "A3L_CVPIUCBlack": {65};
	case "A3L_CVPIUCWhite": {65};
	case "A3L_CVPIUCGrey": {65};
	case "A3L_CVPIUCRed": {65};
	case "A3L_CVPIUCPink": {65};
	case "A3L_CVPIUCBlue": {65};
	
	case "Jonzie_Mini_Cooper": {25};
	case "Jonzie_Mini_Cooper_R_spec": {20};	
	case "Jonzie_Viper": {30};	
	case "Jonzie_Quattroporte": {45};
	case "Jonzie_Raptor": {100};
	case "Jonzie_30CSL": {45};
	case "Jonzie_Datsun_Z432": {30};
	case "Jonzie_STI": {25};
	case "Jonzie_Escalade": {80};
	case "Jonzie_Datsun_510": {30};
	case "Jonzie_Ceed": {25};
	case "Jonzie_Galant": {30};
	case "Jonzie_Corolla": {30};
	case "Jonzie_XB": {30};
	case "Jonzie_VE": {30};
	case "Jonzie_Ute": {30};	

	case "S_McLarenP1_Black": {25};
	case "S_McLarenP1_Blue": {25};
	case "S_McLarenP1_Orange": {25};
	case "S_McLarenP1_White": {25};
	case "S_McLarenP1_Yellow": {25};
	case "S_McLarenP1_Silver": {25};
	
	case "S_PorscheRS_Black": {25};
	case "S_PorscheRS_Yellow": {25};
	case "S_PorscheRS_White": {25};
	
	case "IVORY_C": {25};
	case "IVORY_GT500": {25};
	case "IVORY_LFA": {25};
	case "IVORY_PRIUS": {25};
	case "IVORY_R8": {25};
	case "IVORY_R8SPYDER": {25};
	case "IVORY_REV": {25};
	case "IVORY_ISF": {25};
	case "IVORY_M3": {50};
	case "IVORY_M3_GTS": {50};
	case "IVORY_WRX": {25};
	case "IVORY_WRX_CIV_UTILITY": {25};
	case "IVORY_WRX_COP_MARKED": {25};
	case "IVORY_WRX_COP_SLICKTOP": {25};
	case "IVORY_WRX_COP_UNMARKED": {25};
	case "IVORY_WRX_MED_EMS": {25};
	
	
	case "A3L_EvoXFPBLBSO": {65};
	case "A3L_GrandCaravanUC": {25};
	case "A3L_GrandCaravanUCBlack": {25};
	
	case "A3L_Bus": {30};
	
	case "A3L_TaurusFPBLBPD": {65};
	case "A3L_TaurusFPBLBCSO": {65};
	case "A3L_TaurusFPBPD": {65};
	case "A3L_TaurusFPBPDGM": {65};
	case "A3L_TaurusFPBCSO": {65};
	case "A3L_TaurusUCBlack": {65};
	case "A3L_TaurusUCGrey": {65};
	case "A3L_TaurusUCWhite": {65};
	case "A3L_TaurusUCBlue": {65};
	
	case "A3L_CVPIFPBPD": {65};
	case "A3L_CVPIFPBCSO": {65};
	case "A3L_CVPIFPBFG": {65};
	case "A3L_CVPIFPBLBPD": {65};
	case "A3L_CVPIFPBLBFG": {65};
	//Trooper vehicles
	case "cg_cvpitrooper": {65};
	case "cg_taurustrooperf": {65};
	case "A3L_ChargerTROOPERLB": {65};				
	case "cg_trooperevo": {65};
	
	case "A3L_TahoeUCPB": {65};
	case "A3L_TahoeUC": {65};
	case "A3L_TahoeUCGMPB": {65};
	case "A3L_TahoeCSOLBPB": {65};
	
	case "A3L_jailBus": {125};
	
	case "A3L_Suburban": {65};
	case "A3L_SuburbanCSO": {65};
	case "A3L_SuburbanFG": {65};
	
	case "A3L_AmberLamps": {25};
	case "A3L_Laddertruck": {25};
	
	case "A3L_Karts": {5};	
	case "A3L_Towtruck": {30};
	case "M1030": {25};

	case "A3L_Escort": {25};
	case "CG_Taxi": {25};
	case "A3L_EscortBlue": {25};
	case "A3L_EscortWhite": {25};
	case "A3L_EscortPink": {25};
	
	case "A3L_PuntoRed": {35};
	case "A3L_PuntoBlack": {35};
	case "A3L_PuntoWhite": {35};
	case "A3L_PuntoGrey": {35};
	
	case "A3L_FordKaBlue": {35};
	case "A3L_FordKaRed": {35};
	case "A3L_FordKaBlack": {35};
	case "A3L_FordKaWhite": {35};
	case "A3L_FordKaGrey": {35};
	
	case "A3L_RegalBlack": {35};
	case "A3L_RegalBlue": {35};
	case "A3L_RegalOrange": {35};
	case "A3L_RegalRed": {35};
	case "A3L_RegalWhite": {35};
	
	case "A3L_JeepWhiteBlack": {35};
	case "A3L_JeepGreenBlack": {35};
	case "A3L_JeepRedTan": {35};
	case "A3L_JeepRedBlack": {35};
	case "A3L_JeepGrayBlack": {35};
	
	case "A3L_SuburbanWhite": {45};
	case "A3L_SuburbanBlue": {45};
	case "A3L_SuburbanRed": {45};
	case "A3L_SuburbanBlack": {45};
	case "A3L_SuburbanGrey": {45};
	case "A3L_SuburbanOrange": {45};
	
	case "A3L_TahoeWhite": {45};
	case "A3L_TahoeRed": {45};
	case "A3L_TahoeBlue": {45};
	
	case "A3L_Camaro": {55};
	
	case "A3L_Taurus": {60};
	case "A3L_TaurusBlack": {60};
	case "A3L_TaurusBlue": {60};
	case "A3L_TaurusRed": {60};
	case "A3L_TaurusBlue": {60};
	
	case "A3L_Challenger": {60};
	case "A3L_ChallengerGreen": {60};
	case "A3L_ChallengerRed": {60};
	case "A3L_ChallengerWhite": {60};
	case "A3L_ChallengerBlack": {60};
	case "A3L_ChallengerBlue": {60};
	
	case "A3L_ChargerBlack": {60};
	case "A3L_ChargerWhite": {60};
	case "A3L_ChargerRed": {60};
	case "A3L_ChargerBlue": {60};

	case "A3L_VolksWagenGolfGTired": {35};
	case "A3L_VolksWagenGolfGTiblack": {35};
	case "A3L_VolksWagenGolfGTiblue": {35};
    case "A3L_VolksWagenGolfGTiwhite": {35};
	
	case "A3L_AMC": {35};
	case "A3L_AMXRed": {35};
	case "A3L_AMXWhite": {35};
	case "A3L_AMXBlue": {35};
	case "A3L_AMXGL": {35};
	
	case "A3L_VolvoS60RBlack": {35};
	case "A3L_VolvoS60Rred": {35};
	
	case "S_Skyline_Red": {35};
	case "S_Skyline_Blue": {35};
	case "S_Skyline_Black": {35};
	case "S_Skyline_Yellow": {35};
	case "S_Skyline_Purple": {35};
	case "S_Skyline_White": {35};
	
	case "A3L_Cooper_concept_blue": {25};
	case "A3L_Cooper_concept_black": {25};
	case "A3L_Cooper_concept_red": {25};
	case "A3L_Cooper_concept_white": {25};
	
	case "A3L_Ferrari458black": {25};
	case "A3L_Ferrari458white": {25};
	case "A3L_Ferrari458blue": {25};
	
	case "A3L_GrandCaravan": {25};
	case "A3L_GrandCaravanBlk": {25};
	case "A3L_GrandCaravanBlue": {25};
	case "A3L_GrandCaravanGreen": {25};
	case "A3L_GrandCaravanRed": {25};
	case "A3L_GrandCaravanPurple": {25};
	
	case "A3L_F350Black": {85};
	case "A3L_F350Blue": {85};
	case "A3L_F350Red": {85};
	case "A3L_F350White": {85};
	case "A3L_Dumptruck": {180};

	// default
	case "B_G_Offroad_01_F": {65};
	case "B_Quadbike_01_F": {25};
			
	case "C_Van_01_fuel_F": {100};
	case "I_G_Van_01_fuel_F": {100};

	case "C_Van_01_transport_F": {100};
	case "I_G_Van_01_transport_F": {100};
	case "C_Van_01_box_F": {120};

	case "shounka_nemo_bleufonce": {140};
	case "shounka_nemo_grise": {140};
	case "shounka_nemo_jaune": {140};
	case "shounka_nemo_noir": {140};
	case "shounka_nemo_orange": {140};
	case "shounka_nemo_rose": {140};
	case "shounka_nemo_rouge": {140};
	case "shounka_nemo_violet": {140};

	case "C_Boat_Civil_01_F": {85};
	case "C_Boat_Civil_01_police_F": {85};
	case "C_Boat_Civil_01_rescue_F": {85};
	case "CUP_C_Fishing_Boat_Chernarus": {150};
	case "CUP_B_Zodiac_USMC": {45};
	case "B_Heli_Light_01_F": {0};
	case "I_Heli_Transport_02_F": {0};
	case "C_Rubberboat": {45};
	case "O_Boat_Armed_01_hmg_F": {175};
	case "B_Boat_Armed_01_minigun_F": {175};
	case "I_Boat_Armed_01_minigun_F": {175};
	case "B_G_Boat_Transport_01_F": {45};
	case "B_Boat_Transport_01_F": {45};
	case "Land_CargoBox_V1_F": {5000};
	case "Box_IND_Grenades_F": {350};
	case "B_supplyCrate_F": {700};
	default {35};
};
