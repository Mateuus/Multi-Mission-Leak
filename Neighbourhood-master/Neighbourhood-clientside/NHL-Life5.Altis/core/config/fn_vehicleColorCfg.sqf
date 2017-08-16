/*
	File: fn_vehicleColorCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for vehicle colors.
*/
private["_vehicle","_ret","_path"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
if(_vehicle == "") exitWith {[]};
_ret = [];

switch (_vehicle) do
{
	case "I_Heli_Transport_02_F":
	{
		_path = "\a3\air_f_beta\Heli_Transport_02\Data\Skins\";
		_ret =
		[
			[_path + "heli_transport_02_1_ion_co.paa","civ",_path + "heli_transport_02_2_ion_co.paa",_path + "heli_transport_02_3_ion_co.paa"],
			[_path + "heli_transport_02_1_dahoman_co.paa","civ",_path + "heli_transport_02_2_dahoman_co.paa",_path + "heli_transport_02_3_dahoman_co.paa"]
			
		];
	};
	case "O_Heli_Transport_04_F":
	{
		_ret = 
		[
			["Texturen\vehicles\medic\heli_transport_04_base_01_co.paa","med","Texturen\vehicles\medic\heli_transport_04_base_02_co.paa","Texturen\vehicles\medic\heli_transport_04_pod_ext01_co.paa","Texturen\vehicles\medic\heli_transport_04_pod_ext02_co.paa"]

		];
	};
	case "O_Heli_Transport_04_medevac_F":
	{
		_ret = 
		[
			["Texturen\vehicles\medic\heli_transport_04_base_01_co.paa","med","Texturen\vehicles\medic\heli_transport_04_base_02_co.paa","Texturen\vehicles\medic\heli_transport_04_pod_ext01_co.paa","Texturen\vehicles\medic\heli_transport_04_pod_ext02_co.paa"]

		];
	};
	
	case "C_Hatchback_01_sport_F":
	{
		_path = "\a3\soft_f_gamma\Hatchback_01\data\";
		_ret =
		[
			[_path + "hatchback_01_ext_sport01_co.paa","civ"],
			[_path + "hatchback_01_ext_sport02_co.paa","civ"],
			[_path + "hatchback_01_ext_sport03_co.paa","civ"],
			[_path + "hatchback_01_ext_sport04_co.paa","civ"],
			[_path + "hatchback_01_ext_sport05_co.paa","civ"],
			[_path + "hatchback_01_ext_sport06_co.paa","civ"],
			["Texturen\vehicles\cop\LimoNLPDSport1.paa","cop"],
			["Texturen\vehicles\civ\hatchback1.paa","civ"]
			//["Texturen\vehicles\cop\LimoADFSport1.paa","cop"]
		];
	};
	
	case "C_Offroad_01_F":
	{
		_ret = 
		[
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa", "civ"], 
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa","civ"],
			["Texturen\vehicles\medic\medic_offroad.paa","med"],
			["Texturen\vehicles\cop\OffroadNLPD1.paa","cop"],
			["Texturen\vehicles\civ\Offroad_Wolf.paa","civ"],
			["Texturen\vehicles\civ\hase_offroad.jpg","tuning"],
			["Texturen\vehicles\civ\dodge_offroad.jpg","civ"],
			["Texturen\vehicles\civ\MRSF_offroad.paa","mrsf"]

		];
	};

	
	
	case "C_Hatchback_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa","civ"],
			["Texturen\vehicles\civ\hatchback1.paa","civ"],
			["Texturen\vehicles\cop\LimoNLPD1.paa","cop"]
		];
	};
	
	case "C_SUV_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa","cop"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa","civ"],
			["Texturen\vehicles\cop\SUVNLPD1.paa","cop"],
			//["Texturen\vehicles\cop\SUVNLPDLead1.paa","cop"],
			["Texturen\vehicles\civ\suvMonster.paa","civ"],
			["Texturen\vehicles\civ\Bad_Kitty.paa","civ"],
			["Texturen\vehicles\medic\medic_suv.paa","med"],
			["Texturen\vehicles\civ\inc_suv.paa","inc"],
			["Texturen\vehicles\civ\nl_suv.paa","tuning"],
			["Texturen\vehicles\civ\aqua_suv.jpg","tuning"],
			["Texturen\vehicles\civ\elite_suv.jpg","tuning"],
			["Texturen\vehicles\civ\hyper_suv.jpg","tuning"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa","civ"],
			["Texturen\vehicles\cop\dea_suv.paa","cop"],
			["Texturen\vehicles\civ\cc_suv.paa","cc"],
			["Texturen\vehicles\cop\Marine_suv.paa","mrsf"]
		];
	};
	
	case "C_Van_01_box_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"]
		];
	};
	
	case "C_Van_01_transport_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"]
		];
	};
	
	case "I_MRAP_03_F":
	{
		_ret = 
		[
			["Texturen\vehicles\cop\strider.paa","cop"]
		];
	};
	
	case "B_Quadbike_01_F":
	{
		_ret = 
		[
			["\A3\Soft_F\Quadbike_01\Data\quadbike_01_co.paa","cop"],
			["\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa","reb"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","reb"]

		];
	};
	
	case "B_Heli_Light_01_F":
	{
		_ret = 
		[
			["Texturen\vehicles\cop\cop_humming.paa","cop"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa","donate"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","reb"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","bm"],
			["Texturen\vehicles\civ\Heli_Fire.paa","civ"],
			["Texturen\vehicles\civ\Heli_snake.paa","civ"],
			["Texturen\vehicles\medic\medic_humming.paa","med"]
		];
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		_ret = 
		[
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa","fed"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa","civ"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa","donate"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa","reb"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa","bm"]
		];
	};
	
	case "B_MRAP_01_F":
	{
		_ret = 
		[
			["Texturen\vehicles\cop\nlpd_hunter.paa","cop"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	
	case "B_MRAP_01_hmg_F":
	{
		_ret = 
		[
			["Texturen\vehicles\cop\nlpd_hunter.paa","cop"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	
	case "I_Truck_02_covered_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	
	case "I_Truck_02_transport_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	
	case "B_Truck_01_transport_F":
	{
		_ret = 
		[
			["Texturen\vehicles\civ\DeadHemtt.paa","civ"],
			["\A3\Soft_F_Beta\Truck_01\data\truck_01_ext_01_co.paa","civ"]

		];
	};
	
	case "B_Truck_01_covered_F":
	{
		_ret = 
		[
			["Texturen\vehicles\civ\DeadHemtt.paa","civ"],
			["\A3\Soft_F_Beta\Truck_01\data\truck_01_ext_01_co.paa","civ"]
		];
	};
	
	case "B_Truck_01_box_F":
	{
		_ret = 
		[
			["Texturen\vehicles\civ\DeadHemtt.paa","civ"],
			["\A3\Soft_F_Beta\Truck_01\data\truck_01_ext_01_co.paa","civ"]
		];
	};
	
	case "B_Truck_01_fuel_F":
	{
		_ret = 
		[
			["Texturen\vehicles\civ\DeadHemtt.paa","civ"],
			["\A3\Soft_F_Beta\Truck_01\data\truck_01_ext_01_co.paa","civ"]
		];
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		_ret = 
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	
	case "O_Heli_Attack_02_black_F":
	{
		_ret = 
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};

	case "O_MRAP_02_F":
	{	
		_ret =
		[
		
			["\a3\soft_f\MRAP_02\Data\mrap_02_ext_01_co.paa","reb", "\a3\soft_f\MRAP_02\Data\mrap_02_ext_02_co.paa"],
			["\a3\soft_f\MRAP_02\Data\mrap_02_ext_01_co.paa","bm", "\a3\soft_f\MRAP_02\Data\mrap_02_ext_02_co.paa"]

		
		];
	};
	
	case "O_Truck_02_covered_F":
	{	
		_ret =
		[

			["Texturen\vehicles\civ\Kabine.paa","inc","Texturen\vehicles\civ\Hinten.paa"]
		
		];
	};
	case "I_Heli_light_03_unarmed_F":
	{	
		_ret =
		[

			["Texturen\vehicles\cop\cop_hellcat.paa","cop"]
		
		];
	};
	case "C_Offroad_02_unarmed_F":
	{	
		_ret =
		[
			["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa","civ"],
			["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa","civ"],
			["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa","civ"],
			["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_orange_co.paa","civ"],
			["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa","civ"],
			["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa","civ"]
		
		];
	};
};
_ret;