#include <macro.h>
/*
	File:
	
	VEHICLES ARE 10% of WHAT THEY ARE IN HERE.
	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_className","_vehicles"];
_className = param [0,"",[""]];
if(_className == "") exitWith {nil};
_return = nil;

_vehicles =
[
	//PD
		//Adam
	["cg_CVPIFPBLBPD","[PD][A] Ford CV"],
	["cg_CVPIFPBPD","[PD][A] Ford CV Slicktop"],
	["A3L_CVPI_HWY_LB","[PD][A] Ford CV"],
	["A3L_CVPI_HWY_Slick","[PD][A] Ford CV Slicktop"],
	["cg_TaurusPD1","[PD][A] Ford Taurus"],
	["cg_TaurusPD2","[PD][A] Ford Taurus Slicktop"],
	["bv_the_crowner_cop_patrol","[PD][A] Ford CV Slicktop"],
	["DAR_TahoePoliceSlick","[PD][A] Chevrolet Tahoe Slicktop"],
	["DAR_ExplorerPolice","[PD][A] Ford Explorer"],
	["cg_mercedes_sprinter_pol_base_reg","[PD][A] Mercedes Sprinter"],
		//Edward
	["cg_evopol1","[PD][E] Mitsubishi Evo"],
	["charger_pd_skinned","[PD][E] Charger"],
	["bv_caressa_gt_cop_patrol","[PD][E] Porsche Caressa"],
	["bv_458_cop_patrol","[PD][E] Ferrari 485"],
		//David
	["A3L_GMC_Van_Swat","[PD][D] GMC"],
	["cg_h2_sert","[PD][D] Hummer H2"],
	["cg_suburban_sert_pol","[PD][D] Suburban (podnosnik)"],
	["DAR_SWATPolice","[PD][D] Lenco Razorback"],
	["burnes_foxhound_w","[PD][D] Foxhound"],
	["cg_evoSERT1","[PD][D/E] Mitsubishi Evo"],
	["charger_sert","[PD][D/E] Charger"],
		//Pozostale
	["cg_ducati_pol_reg","[PD] Ducati"],
	["cg_peugeot_508_pol_d","[PD] Peugot 508"],	
	["charger_st","[ST][A] Charger"],
	["charger_trp_skinned","[ST][A] Charger"],
	["cg_taurustrooperf","[ST][A] Ford Taurus"],
	["cg_trooperevo","[ST][E] Mitsubishi Evo"],
	//CO
	["A3L_CVPI_Corrections_LB","[CO][A] Ford CV"],
	["A3L_TaurusCO2","[CO][A] Ford Taurus Slicktop"],
	["A3L_SuburbanDOC","[CO][S] Suburban"],
	["cg_evocor1","[CO][E] Mitsubishi Evo"],
	["charger_cor_skinned","[CO][E] Charger"],
	["A3L_jailBus","[CO] Wiezniarka"],
	//SO
	["cg_ss2","[SO][A] Ford CV"],
	["A3L_CVPI_Sheriff_LB","[SO][A] Ford CV (czarny)"],
	["A3L_CVPI_Sheriff_Slick","[SO][A] Ford CV Slicktop"],
	["A3L_CVPI_HWY_Slick_Blue","[SO][A] Ford CV Slicktop (niebieski)"],
	["A3L_CVPI_HWY_LB_Blue","[SO][A] Ford CV (niebieski)"],
	["cg_TaurusSS1","[SO][A] Ford Taurus"],
	["cg_TaurusSS2","[SO][A] Ford Taurus Slicktop"],
	["A3L_TaurusFPBLBCSO","[SO][A] Ford Taurus"],
	["A3L_SuburbanCSO","[SO][A] Suburban"],
	["DAR_ExplorerSheriff","[SO][A] Ford SUV"],
	["cg_CVPISH","[SO][A] Ford CV Slicktop"],
	["cg_evoss1","[SO][E] Mitsubishi Evo"],
	["charger_sh","[SO][E] Charger"],
	//UC
	["bv_the_crowner_uc","Ford Crowner (uc)"],
	["cg_hummer_h1_noir","Hummer H1 (uc)"],
	["critgamin_vangmcc_civ_noir","GMC (uc)"],
	["AM_Escalade_SERT","Cadillac Escalade (uc)"],
	["A3L_TaurusUC","Ford Taurus Czarny (uc)"],
	["A3L_TaurusUCBlue","Ford Taurus Niebieski (uc)"],
	["A3L_TaurusUCGrey","Ford Taurus Szary (uc)"],
	["A3L_TaurusUCRed","Ford Taurus Czerwony (uc)"],
	["A3L_TaurusUCWhite","Ford Taurus Bialy (uc)"],
	["A3L_GrandCaravanUC","Caravan Bialy (uc)"],
	["A3L_GrandCaravanUCBlack","Caravan Czarny (uc)"],
	["DAR_TahoePoliceDet","Chevrolet Tahoe Czarny (uc)"],
	["DAR_ExplorerPoliceStealth","Ford Explorer Czarny (uc)"],
	["A3L_Suburban_UM_Black","Suburban Opancerzony (uc)"],
	["A3L_ChargerUC","Charger Czarny (uc)"],
	["A3L_ChargerUCWhite","Charger Bialy (uc)"],
	["cg_audi_rs4_pol_noir","Audi RS4"],
	["cg_brinks_bank_noir","Brinks"]
];
{
	if(_x select 0 == _className) exitWith {_return = _x select 1};
} forEach _vehicles;
_return;

/*
["cg_merc_atego_firetruck_reg",25000],
	["ivory_wrx_marked",200000],
	["ivory_wrx_unmarked",200000],
	["ivory_wrx_slicktop",200000],
	
	["ivory_m3_marked",200000],
	["ivory_m3_unmarked",200000],
	["ivory_m3_slicktop",200000],

	["ivory_isf_marked",200000],
	["ivory_isf_unmarked",200000],			
	["ivory_isf_slicktop",200000],
	
	["cnp_Defender",200000],
	["CNP_c4_picasso_F",200000],
	["cnp_seat_altea_pol",200000],
	["UR_416_M2",200000],
	["UR_416_Cargo",200000],
	["Vamtac_Policia",200000],
	["cnp_Iveco_GOIT",200000],
	["CNP_mercedes_sprinter_GOIT_F",200000],
	["CNP_mercedes_sprinter_UIP_F",200000],
	["Navara_Policia",200000],

*/
