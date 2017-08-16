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
		_path = "\a3\air_f_beta\Heli_Transport_02\Data\skins\";
		_ret =
		[
			["#(ai,64,64,1)Fresnel(0.3,3)","civ", "#(ai,64,64,1)Fresnel(0.3,3)", "#(ai,64,64,1)Fresnel(0.3,3)"],
			[_path + "heli_transport_02_1_dahoman_co.paa","civ",_path + "heli_transport_02_2_dahoman_co.paa",_path + "heli_transport_02_3_dahoman_co.paa"],
			["images\vehicles\mohawk_ahw_01_co.paa", "med", "images\vehicles\mohawk_ahw_02_co.paa", "images\vehicles\mohawk_ahw_03_co.paa"],
			[_path + "heli_transport_02_1_ion_co.paa","president",_path + "heli_transport_02_2_ion_co.paa",_path + "heli_transport_02_3_ion_co.paa"]
		];
	};

	case "B_T_VTOL_01_infantry_F": 
	{
		_ret = 
		[
			["a3\air_f_exp\vtol_01\data\vtol_01_ext01_blue_co.paa","civ","a3\air_f_exp\vtol_01\data\vtol_01_ext02_blue_co.paa","a3\air_f_exp\vtol_01\data\vtol_01_ext03_blue_co.paa","a3\air_f_exp\vtol_01\data\vtol_01_ext04_blue_co.paa"],
			["a3\air_f_exp\vtol_01\data\vtol_01_ext01_olive_co.paa","civ","a3\air_f_exp\vtol_01\data\vtol_01_ext02_olive_co.paa","a3\air_f_exp\vtol_01\data\vtol_01_ext03_olive_co.paa","a3\air_f_exp\vtol_01\data\vtol_01_ext04_olive_co.paa"],
			["a3\air_f_exp\vtol_01\data\vtol_01_ext01_blue_co.paa","cop","a3\air_f_exp\vtol_01\data\vtol_01_ext02_blue_co.paa","a3\air_f_exp\vtol_01\data\vtol_01_ext03_blue_co.paa","a3\air_f_exp\vtol_01\data\vtol_01_ext04_blue_co.paa"]
		];
	};

	case "B_T_VTOL_01_vehicle_F": 
	{
		_ret = 
		[
			["a3\air_f_exp\vtol_01\data\vtol_01_ext01_blue_co.paa","civ","a3\air_f_exp\vtol_01\data\vtol_01_ext02_blue_co.paa","a3\air_f_exp\vtol_01\data\vtol_01_ext03_blue_co.paa","a3\air_f_exp\vtol_01\data\vtol_01_ext04_blue_co.paa"],
			["a3\air_f_exp\vtol_01\data\vtol_01_ext01_olive_co.paa","civ","a3\air_f_exp\vtol_01\data\vtol_01_ext02_olive_co.paa","a3\air_f_exp\vtol_01\data\vtol_01_ext03_olive_co.paa","a3\air_f_exp\vtol_01\data\vtol_01_ext04_olive_co.paa"],
			["a3\air_f_exp\vtol_01\data\vtol_01_ext01_blue_co.paa","cop","a3\air_f_exp\vtol_01\data\vtol_01_ext02_blue_co.paa","a3\air_f_exp\vtol_01\data\vtol_01_ext03_blue_co.paa","a3\air_f_exp\vtol_01\data\vtol_01_ext04_blue_co.paa"],
			["#(argb,8,8,3)color(0.4,0,0,1)","med","#(argb,8,8,3)color(0.4,0,0,1)","#(argb,8,8,3)color(0.4,0.3,0,1)","#(argb,8,8,3)color(0.4,0.3,0,1)"]
		];
	};
	
	case "B_Plane_CAS_01_F": 
	{
		_ret = 
		[
			["#(argb,8,8,3)color(0,0,0,1)","civ","#(argb,8,8,3)color(0,0,0,1)"],
			["#(argb,8,8,3)color(1,1,1,0.4)","civ","#(argb,8,8,3)color(0.5,0.2,0,0.4)"]
		];
	};

	case "C_Plane_Civil_01_F": 
	{
		_ret = 
		[
			["a3\air_f_exp\plane_civil_01\data\btt_ext_01_wave_co.paa","civ","a3\air_f_exp\plane_civil_01\data\btt_ext_02_wave_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_01_tan_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_02_tan_co.paa"],
			["a3\air_f_exp\plane_civil_01\data\btt_ext_01_redline_co.paa","civ","a3\air_f_exp\plane_civil_01\data\btt_ext_02_redline_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_01_tan_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_02_tan_co.paa"],
			["a3\air_f_exp\plane_civil_01\data\btt_ext_01_racer_co.paa","civ","a3\air_f_exp\plane_civil_01\data\btt_ext_02_racer_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_01_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_02_co.paa"],
			["a3\air_f_exp\plane_civil_01\data\btt_ext_01_tribal_co.paa","civ","a3\air_f_exp\plane_civil_01\data\btt_ext_02_tribal_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_01_tan_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_02_tan_co.paa"]
		];
	};

	case "C_Plane_Civil_01_racing_F": 
	{
		_ret = 
		[
			["a3\air_f_exp\plane_civil_01\data\btt_ext_01_wave_co.paa","civ","a3\air_f_exp\plane_civil_01\data\btt_ext_02_wave_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_01_tan_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_02_tan_co.paa"],
			["a3\air_f_exp\plane_civil_01\data\btt_ext_01_redline_co.paa","civ","a3\air_f_exp\plane_civil_01\data\btt_ext_02_redline_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_01_tan_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_02_tan_co.paa"],
			["a3\air_f_exp\plane_civil_01\data\btt_ext_01_racer_co.paa","civ","a3\air_f_exp\plane_civil_01\data\btt_ext_02_racer_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_01_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_02_co.paa"],
			["a3\air_f_exp\plane_civil_01\data\btt_ext_01_tribal_co.paa","civ","a3\air_f_exp\plane_civil_01\data\btt_ext_02_tribal_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_01_tan_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_02_tan_co.paa"]
		];
	};
	
	case "C_Quadbike_01_black_F": 
	{
		_ret = 
		[
			["","civ",""]
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
			["images\vehicles\hatchback_blau_co.paa", "cop"],
			[""],
			["images\vehicles\hatchback_altis_co.paa","presse"],
			["images\vehicles\hatchback_brokencat.paa","civ"],
			["images\vehicles\hatchback_euro_co.paa","donator"],
			["images\vehicles\hatchback_asiimov_co.paa","civ"],
			["#(argb,8,8,3)color(1,0.7,0,0.5)","rar"]
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
			["#(ai,64,64,1)Fresnel(0.3,3)","reb"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			["images\vehicles\offroad_ahw.paa","med"],
			["images\vehicles\offroad_blau_co.paa", "cop"],
			["images\vehicles\offroad_pizza_co.paa", "donator"],
			["images\vehicles\offroad_blackmagic_co.paa", "civ"],
			["#(argb,8,8,3)color(1,0.7,0,0.5)","rar","#(argb,8,8,3)color(1,0.7,0,0.5)"]
		];
	};

	case "C_Offroad_02_unarmed_F":
	{	
		_ret = 
		[
			["a3\soft_f_exp\offroad_02\data\offroad_02_ext_black_co.paa","civ","a3\soft_f_exp\offroad_02\data\offroad_02_int_black_co.paa"],
			["a3\soft_f_exp\offroad_02\data\offroad_02_ext_blue_co.paa","civ","a3\soft_f_exp\offroad_02\data\offroad_02_int_blue_co.paa"],
			["a3\soft_f_exp\offroad_02\data\offroad_02_ext_green_co.paa","civ","a3\soft_f_exp\offroad_02\data\offroad_02_int_green_co.paa"],
			["a3\soft_f_exp\offroad_02\data\offroad_02_ext_orange_co.paa","civ","a3\soft_f_exp\offroad_02\data\offroad_02_int_orange_co.paa"],
			["a3\soft_f_exp\offroad_02\data\offroad_02_ext_red_co.paa","civ","a3\soft_f_exp\offroad_02\data\offroad_02_int_red_co.paa"],
			["a3\soft_f_exp\offroad_02\data\offroad_02_ext_white_co.paa","civ","a3\soft_f_exp\offroad_02\data\offroad_02_int_white_co.paa"],
			["a3\soft_f_exp\offroad_02\data\offroad_02_ext_brown_co.paa","civ","a3\soft_f_exp\offroad_02\data\offroad_02_int_brown_co.paa"],
			["a3\soft_f_exp\offroad_02\data\offroad_02_ext_olive_co.paa","civ","a3\soft_f_exp\offroad_02\data\offroad_02_int_olive_co.paa"],
			["images\vehicles\MB_4WD_AHW.paa","med","a3\soft_f_exp\offroad_02\data\offroad_02_ext_white_co.paa"],
			["images\vehicles\MB_4WD_Polizei.paa","cop","a3\soft_f_exp\offroad_02\data\offroad_02_ext_white_co.paa"]
		];
	};
	
	case "I_G_Offroad_01_F":
	{
		_ret = 
		[
			["images\vehicles\offroad_ahw.paa","med"]
		];
	};
		
	case "O_T_LSV_02_unarmed_F":
	{
		_ret = 
		[
			["a3\soft_f_exp\lsv_02\data\csat_lsv_01_arid_co.paa","reb","a3\soft_f_exp\lsv_02\data\csat_lsv_02_arid_co.paa","a3\soft_f_exp\lsv_02\data\csat_lsv_03_arid_co.paa"],
			["a3\soft_f_exp\lsv_02\data\csat_lsv_01_ghex_co.paa","reb","a3\soft_f_exp\lsv_02\data\csat_lsv_02_ghex_co.paa","a3\soft_f_exp\lsv_02\data\csat_lsv_03_ghex_co.paa"],
			["a3\soft_f_exp\lsv_02\data\csat_lsv_01_black_co.paa","reb","a3\soft_f_exp\lsv_02\data\csat_lsv_02_black_co.paa","a3\soft_f_exp\lsv_02\data\csat_lsv_03_black_co.paa"]
		];
	};

	case "B_T_LSV_01_unarmed_F":
	{
		_ret = 
		[
			["a3\soft_f_exp\lsv_01\data\nato_lsv_01_black_co.paa","reb","a3\soft_f_exp\lsv_01\data\nato_lsv_02_black_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_03_black_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_adds_black_co.paa"],
			["a3\soft_f_exp\lsv_01\data\nato_lsv_01_olive_co.paa","reb","a3\soft_f_exp\lsv_01\data\nato_lsv_02_olive_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_03_olive_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_adds_olive_co.paa"],
			["a3\soft_f_exp\lsv_01\data\nato_lsv_01_sand_co.paa","reb","a3\soft_f_exp\lsv_01\data\nato_lsv_02_sand_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_03_sand_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_adds_sand_co.paa"],
			["a3\soft_f_exp\lsv_01\data\nato_lsv_01_dazzle_co.paa","reb","a3\soft_f_exp\lsv_01\data\nato_lsv_02_olive_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_03_olive_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_adds_olive_co.paa"]
		];
	};

	case "C_Scooter_Transport_01_F":
	{
		_ret = 
		[
			["a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_grey_co.paa","civ","a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_vp_grey_co.paa"],
			["a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_blue_co.paa","civ","a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_vp_blue_co.paa"],
			["a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_co.paa","civ","a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_vp_co.paa"],
			["a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_black_co.paa","civ","a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_vp_black_co.paa"],
			["a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_lime_co.paa","civ","a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_vp_lime_co.paa"],
			["a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_red_co.paa","civ","a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_vp_co.paa"],
			["a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_yellow_co.paa","civ","a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_vp_yellow_co.paa"]
		];
	};
	
	case "C_Boat_Civil_01_F":
	{
		_ret = 
		[
			["images\vehicles\automatisch_heli.paa","civ"],
			["#(argb,8,8,3)color(1,0.7,0,0)","civlux","#(argb,8,8,3)color(1,0.7,0,0.5)"]
		];
	};
	
	case "C_Boat_Civil_01_rescue_F":
	{
		_ret = 
		[
			["#(argb,8,8,3)color(1,0.7,0,0)","civlux","#(argb,8,8,3)color(1,0.7,0,0.5)"],
			["#(argb,8,8,3)color(1,0,0,1)","med","#(argb,8,8,3)color(1,1,1,1)"]
		];
	};

	case "I_C_Boat_Transport_02_F":
	{
		_ret = 
		[
			["a3\boat_f_exp\boat_transport_02\data\boat_transport_02_exterior_co.paa","cop","a3\boat_f_exp\boat_transport_02\data\boat_transport_02_interior_2_co.paa"],
			["a3\boat_f_exp\boat_transport_02\data\boat_transport_02_exterior_civilian_co.paa","civ","a3\boat_f_exp\boat_transport_02\data\boat_transport_02_interior_2_civilian_co.paa"]
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
			["images\vehicles\hatchback_blau_co.paa", "cop"],
			["images\vehicles\hatchback_brokencat.paa","civ"],
			["images\vehicles\hatchback_asiimov_co.paa","civ"]
		];
	};
	
	case "C_SUV_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa","civ"],
			["images\vehicles\suv_blau_co.paa","cop"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa","cop"],
			["images\vehicles\suv_ahw.paa","med"],
			["images\vehicles\suv_space.paa","civ"],
			["images\vehicles\suv_comic_co.paa","civ"],
			["images\vehicles\suv_kitty_co.paa","civ"],
			["images\vehicles\poly_suv_co.paa","civ"],
			["images\vehicles\suv_taxi_co.paa","civ"],
			[""],
			["images\vehicles\suv_pixel_co.paa","donator"],
			["images\colors\dark_grey.paa","civ"],
			["#(argb,8,8,3)color(1,0.7,0,0.5)","rar"],
			["images\vehicles\suv_black_obama.paa","president"],
			[""],
			["images\vehicles\emcar.paa","civ"]
		];
	};
	
	case "C_Van_01_box_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"],
			["images\vehicles\civ_box_ahw_front.paa","med","images\vehicles\civ_box_ahw_back.paa"],
			["images\vehicles\civ_boxeis1_co.paa","donator","images\vehicles\civ_boxeis_co.paa"],
			["images\vehicles\civ_boxeis1_co.paa","civ","images\vehicles\civ_boxapils_co.paa"],
			[""],
			[""],
			["images\vehicles\altis_post_1.paa","civ","images\vehicles\altis_post_2.paa"]
		];
	};
	
	case "C_Rubberboat":
	{
		_ret =
		[
			["#(argb,8,8,3)color(1,0,0,1)","med"]
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
	
	case "C_Quadbike_01_F":
	{
		_ret = 
		[
			["\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa","civ"],
			["\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa","reb"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","reb"],
			["images\colors\dark_grey.paa","civ","images\colors\dark_grey.paa"],
			["images\vehicles\polizei_quad_co.paa","cop"]
		];
	};
	
	case "B_Heli_Light_01_F":
	{
		_ret = 
		[
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","reb"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa","reb"],
			["\a3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
			["\a3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
			["\a3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"],
			["\a3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
			["\a3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
			["\a3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa","civ"],
			[""],
			["images\vehicles\hummingbird_blau_co.paa", "cop"],
			["images\vehicles\hummingbird_altis_co.paa","presse"],
			["images\vehicles\hummingbird_ahw.paa","med"],
			["images\haltstopp_co.paa","civ"],
			["images\wanted.paa","civ"],
			["images\vehicles\hummingbird_timpsons.paa","civ"],
			["images\vehicles\hummingbird_unicorn.paa","civ"]
		];
	};
	
	case "C_Heli_Light_01_civil_F":
	{
		_ret = 
		[
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","reb"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa","reb"],
			["\a3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
			["\a3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
			["\a3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"],
			["\a3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
			["\a3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
			["\a3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa","civ"],
			[""],
			["images\vehicles\hummingbird_blau_co.paa", "cop"],
			["images\vehicles\hummingbird_altis_co.paa","presse"],
			["images\vehicles\hummingbird_ahw.paa","med"],
			["images\haltstopp_co.paa","civ"],
			["images\wanted.paa","civ"],
			[""],
			["images\vehicles\hummingbird_ddr_co.paa","donator"],
			["images\vehicles\hummingbird_timpsons.paa","civ"],
			["images\vehicles\hummingbird_unicorn.paa","civ"]
		];
	};	
	
	case "O_Heli_Light_02_unarmed_F":
	{
		_ret = 
		[
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa","reb"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa","civ"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa","reb"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa","reb"],
			["images\vehicles\orca_ahw.paa", "med"]
		];
	};
	
	case "B_Heli_Transport_01_F":
	{
		_ret = 
		[
			["images\vehicles\ghosthawk1_co.paa","cop","images\vehicles\ghosthawk2_co.paa"]
		];
	};
	
	case "B_Heli_Transport_03_unarmed_F":
	{
		_ret = 
		[
			["#(argb,8,8,3)color(0.05,0.05,0.10,1)","cop","#(argb,8,8,3)color(0.05,0.05,0.10,1)"],
			["a3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext01_black_co.paa","civ","a3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext02_black_co.paa"]
		];
	}; 
	
	case "I_Heli_light_03_unarmed_F":
	{
		_ret =
		[
			["images\vehicles\hellcat_blau_co.paa", "cop"]
		];	
	};
	
	case "B_MRAP_01_F":
	{
		_ret = 
		[
			["images\colors\dark_grey.paa","reb"],
			["images\vehicles\polizei_hunter_01_co.paa", "cop", "images\vehicles\polizei_hunter_02_co.paa"]
		];
	};
	
	case "I_MRAP_03_F":
	{
		_ret = 
		[
			["images\vehicles\strider_polizei_co.paa", "cop"]
		];
	};
	
	
	case "B_MRAP_01_hmg_F":
	{
		_ret = 

		[
			["images\colors\dark_grey.paa","reb"],
			["images\vehicles\polizei_hunter_01_co.paa", "cop", "images\vehicles\polizei_hunter_02_co.paa"]
		];
	};
	
	case "B_Truck_01_mover_F":
	{
		_ret =
		[
			["images\vehicles\hemtt_ahw.paa", "med"]
		];
	};
	
	case "I_Truck_02_covered_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["images\colors\dark_grey.paa","reb"],
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","cop","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["images\vehicles\zamak_sanitater1_co.paa","med","#(argb,8,8,3)color(1,0,0,1)"],
			["images\vehicles\zamak_kindl1_co.paa","civ","images\vehicles\zamak_kindl2_co.paa"],
			["images\vehicles\zamak_roco1_co.paa","civ","images\vehicles\zamak_roco2_co.paa"]
		];
	};
	
		case "I_Truck_02_box_F":
	{
		_ret = 
		[
			["images\vehicles\zamak_sanitater1_co.paa","med","images\vehicles\zamak_sanitater2_co.paa"]
		];
	};
	
	case "I_Truck_02_transport_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["images\colors\dark_grey.paa","reb"]
		];
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		_ret = 
		[
			["images\colors\dark_grey.paa","reb"]
		];
	};
	
	case "O_Heli_Attack_02_black_F":
	{
		_ret = 
		[
			["images\colors\dark_grey.paa","reb"]
		];
	};
	
	case "O_Heli_Transport_04_medevac_F":
	{
		_ret =
		[
			["#(argb,8,8,3)color(1,1,1,1)","med","#(argb,8,8,3)color(1,0,0,1)","#(argb,8,8,3)color(1,0,0,1)","#(argb,8,8,3)color(1,1,1,1)"]
		];
	};
	
	case "O_Heli_Transport_04_covered_F":
	{
		_ret =
		[
			["images\colors\dark_grey.paa","civ","images\colors\dark_grey.paa","images\colors\dark_grey.paa","images\colors\dark_grey.paa"]
		];
	};
	
	case "O_Heli_Transport_04_bench_F":
	{
		_ret =
		[
			["images\colors\dark_grey.paa","civ","images\colors\dark_grey.paa","images\colors\dark_grey.paa","images\colors\dark_grey.paa"]
		];
	};
	
	case "O_Heli_Transport_04_box_F":
	{
		_ret =
		[
			["images\colors\dark_grey.paa","civ","images\colors\dark_grey.paa","images\colors\dark_grey.paa","images\colors\dark_grey.paa"]
		];
	};
	
	case "O_MRAP_02_F":
	{ 
		_ret =
		[
			["images\vehicles\ifrit_01_co.paa", "reb", "images\vehicles\ifritback_co.paa"],
			["images\vehicles\ifrit_unicorn_co.paa", "donator", "images\vehicles\ifritback_unicorn_co.paa"],
			["#(argb,8,8,3)color(1,0.7,0,0.5)","rar","#(argb,8,8,3)color(1,0.7,0,0.5)"]
		];
	};
	
	case "B_Truck_01_transport_F":
	{
		_ret =
		[
			["A3\soft_f_beta\Truck_01\data\truck_01_ext_01_co.paa", "civ", "A3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"],
			["images\colors\dark_grey.paa","civ","images\colors\dark_grey.paa","images\colors\dark_grey.paa"],
			["images\vehicles\hemtt_engine_01.paa","civ","images\vehicles\hemtt_engine_02.paa"],
			["images\vehicles\hemtt_skyrim.paa","civ","A3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"]
		];
	};
	
	case "B_Truck_01_covered_F":
	{
		_ret =
		[
			["A3\soft_f_beta\Truck_01\data\truck_01_ext_01_co.paa", "civ", "A3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"],
			["images\colors\dark_grey.paa","civ","images\colors\dark_grey.paa"],
			["images\vehicles\hemtt_engine_01.paa","civ","images\vehicles\hemtt_engine_02.paa"],
			["images\vehicles\hemtt_skyrim.paa","civ","A3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"]	
		];
	};

	case "B_Truck_01_ammo_F":
	{
		_ret =
		[
			["a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa", "civ", "a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa","a3\soft_f_gamma\truck_01\data\truck_01_ammo_co.paa"],
			["images\colors\dark_grey.paa", "civ", "images\colors\dark_grey.paa","images\colors\dark_grey.paa"],
			["images\vehicles\hemtt_engine_01.paa","civ","images\vehicles\hemtt_engine_02.paa"],
			["images\vehicles\hemtt_skyrim.paa","civ","A3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"],
			["a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa","lud","A3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa","images\vehicles\clan\hemtt_ludolf.paa"]
		];
	};
	
	case "B_Truck_01_fuel_F":
	{
		_ret =
		[
			["A3\soft_f_beta\Truck_01\data\truck_01_ext_01_co.paa", "civ", "A3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"],
			["images\colors\dark_grey.paa","civ","images\colors\dark_grey.paa", "images\colors\dark_grey.paa"],
			["images\vehicles\hemtt_engine_01.paa","civ","images\vehicles\hemtt_engine_02.paa"],
			["images\vehicles\hemtt_skyrim.paa","civ","A3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"]
		];
	};
	
	case "B_Truck_01_box_F":
	{
		_ret =
		[
			["A3\soft_f_beta\Truck_01\data\truck_01_ext_01_co.paa", "civ", "A3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"],
			["images\colors\dark_grey.paa","civ","images\colors\dark_grey.paa"],
			["images\vehicles\hemtt_engine_01.paa","civ","images\vehicles\hemtt_engine_02.paa"],
			["images\vehicles\hemtt_skyrim.paa","civ","A3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"]
		];
	};
	
	case "O_Truck_02_fuel_F":
	{
		_ret =
		[
			["images\colors\dark_grey.paa", "civ", "A3\soft_f_beta\Truck_02\data\truck_02_fuel_co.paa"]
		];
	};

	case "O_Truck_03_transport_F":
	{
		_ret =
		[
			["a3\soft_f_epc\truck_03\data\truck_03_ext01_co.paa","civ","a3\soft_f_epc\truck_03\data\truck_03_ext02_co.paa","a3\soft_f_epc\truck_03\data\truck_03_cargo_co.paa"],
			["images\colors\dark_grey.paa", "civ", "images\colors\dark_grey.paa", "images\colors\dark_grey.paa", "images\colors\dark_grey.paa"],
			["a3\soft_f_exp\truck_03\data\truck_03_ext01_ghex_co.paa","civ","a3\soft_f_exp\truck_03\data\truck_03_ext02_ghex_co.paa","a3\soft_f_exp\truck_03\data\truck_03_cargo_ghex_co.paa"],
			["images\vehicles\clan\salt1.paa", "slg", "images\vehicles\clan\salt2.paa","a3\soft_f_exp\truck_03\data\truck_03_ext02_ghex_co.paa","a3\soft_f_exp\truck_03\data\truck_03_cargo_ghex_co.paa"]
		];
	};

	case "O_Truck_03_covered_F":
	{
		_ret =
		[
			["a3\soft_f_epc\truck_03\data\truck_03_ext01_co.paa","civ","a3\soft_f_epc\truck_03\data\truck_03_ext02_co.paa","a3\soft_f_epc\truck_03\data\truck_03_cargo_co.paa","a3\soft_f_epc\truck_03\data\truck_03_cover_co.paa"],
			["images\colors\dark_grey.paa", "civ", "images\colors\dark_grey.paa", "images\colors\dark_grey.paa", "images\colors\dark_grey.paa"],
			["a3\soft_f_exp\truck_03\data\truck_03_ext01_ghex_co.paa","civ","a3\soft_f_exp\truck_03\data\truck_03_ext02_ghex_co.paa","a3\soft_f_exp\truck_03\data\truck_03_cargo_ghex_co.paa","a3\soft_f_exp\truck_03\data\truck_03_cover_ghex_co.paa"],
			["images\vehicles\clan\salt1.paa", "slg", "images\vehicles\clan\salt2.paa","a3\soft_f_exp\truck_03\data\truck_03_ext02_ghex_co.paa","a3\soft_f_exp\truck_03\data\truck_03_cargo_ghex_co.paa"]
		];
	};

	case "O_Truck_03_device_F":
	{
		_ret =
		[
			["a3\soft_f_epc\truck_03\data\truck_03_ext01_co.paa","civ","a3\soft_f_epc\truck_03\data\truck_03_ext02_co.paa","a3\soft_f_epc\truck_03\data\truck_03_cargo_co.paa","a3\structures_f_epc\items\electronics\data\the_device_02_co.paa","a3\structures_f_epc\items\electronics\data\the_device_03_co.paa"],
			["images\colors\dark_grey.paa", "civ", "images\colors\dark_grey.paa", "images\colors\dark_grey.paa", "images\colors\dark_grey.paa"],
			["a3\soft_f_exp\truck_03\data\truck_03_ext01_ghex_co.paa","civ","a3\soft_f_exp\truck_03\data\truck_03_ext02_ghex_co.paa","a3\soft_f_exp\truck_03\data\truck_03_cargo_ghex_co.paa","civ","a3\structures_f_epc\items\electronics\data\the_device_02_co.paa","a3\structures_f_epc\items\electronics\data\the_device_03_co.paa"],
			["images\vehicles\clan\salt1.paa", "slg", "images\vehicles\clan\salt2.paa","a3\structures_f_epc\items\electronics\data\the_device_02_co.paa","a3\structures_f_epc\items\electronics\data\the_device_03_co.paa"]
		];
	};

	case "O_Truck_03_fuel_F":
	{
		_ret =
		[	
			["a3\soft_f_epc\truck_03\data\truck_03_ext01_co.paa","civ","a3\soft_f_epc\truck_03\data\truck_03_ext02_co.paa","a3\soft_f_epc\truck_03\data\truck_03_fuel_co.paa"],
			["images\colors\dark_grey.paa", "civ", "images\colors\dark_grey.paa", "images\colors\dark_grey.paa", "images\colors\dark_grey.paa"],
			["a3\soft_f_exp\truck_03\data\truck_03_ext01_ghex_co.paa","civ","a3\soft_f_exp\truck_03\data\truck_03_ext02_ghex_co.paa","a3\soft_f_exp\truck_03\data\truck_03_fuel_ghex_co.paa"],
			["images\vehicles\clan\salt1.paa", "slg", "images\vehicles\clan\salt2.paa","a3\soft_f_exp\truck_03\data\truck_03_ext02_ghex_co.paa","a3\soft_f_exp\truck_03\data\truck_03_fuel_ghex_co.paa"]
		];
	};

	case "O_Truck_03_ammo_F":
	{
		_ret =
		[	
			["a3\soft_f_epc\truck_03\data\truck_03_ext01_co.paa","civ","a3\soft_f_epc\truck_03\data\truck_03_ext02_co.paa","a3\soft_f_epc\truck_03\data\truck_03_cargo_co.paa","a3\structures_f\data\metal\containers\containers_02_set_co.paa"],
			["images\colors\dark_grey.paa", "civ", "images\colors\dark_grey.paa", "images\colors\dark_grey.paa", "images\colors\dark_grey.paa"],
			["a3\soft_f_exp\truck_03\data\truck_03_ext01_ghex_co.paa","civ","a3\soft_f_exp\truck_03\data\truck_03_ext02_ghex_co.paa","a3\soft_f_exp\truck_03\data\truck_03_cargo_ghex_co.paa","a3\structures_f\data\metal\containers\containers_colors_05_co.paa"],
			["images\vehicles\clan\salt1.paa", "slg", "images\vehicles\clan\salt2.paa","a3\soft_f_exp\truck_03\data\truck_03_cargo_ghex_co.paa","a3\structures_f\data\metal\containers\containers_colors_05_co.paa"]
		];
	};
};

_ret;