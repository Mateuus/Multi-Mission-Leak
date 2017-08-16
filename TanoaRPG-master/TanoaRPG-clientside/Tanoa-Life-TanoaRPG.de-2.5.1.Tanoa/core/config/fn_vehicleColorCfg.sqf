/*
	File: fn_vehicleColorCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for vehicle colors.
*/
private["_vehicle","_ret","_path","_path2"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
if(_vehicle == "") exitWith {[]};
_ret = [];

switch (_vehicle) do
{
	case "B_Truck_01_mover_F":
	{
		_ret =
		[
			["skins\car\cop_hemmit_1.paa","cop","skins\car\cop_hemmit_2.paa"]
		];
	};
	
	case "O_Heli_Transport_04_medevac_F":
	{
		_ret =
		[
			["skins\air\taruMedic_1.jpg","med","skins\air\taruMedic_2.jpg","skins\air\taruMedic_3.jpg","skins\air\taruMedic_4.jpg"]
		];
	};

	case "I_Heli_Transport_02_F":
	{
		_path = "\a3\air_f_beta\Heli_Transport_02\Data\Skins\";
		_path2 = "skins\air\";
		_ret =
		[
			[_path + "heli_transport_02_1_ion_co.paa","civ",_path + "heli_transport_02_2_ion_co.paa",_path + "heli_transport_02_3_ion_co.paa"],
			[_path + "heli_transport_02_1_dahoman_co.paa","civ",_path + "heli_transport_02_2_dahoman_co.paa",_path + "heli_transport_02_3_dahoman_co.paa"],
			[_path2 + "medic_mowhawk.jpg","med","#(argb,8,8,3)color(1,1,1,0.8)","#(argb,8,8,3)color(1,1,1,0.8)"],
			[_path2 + "Mohawk 1Polizei.paa","cop",_path2 + "Mohawk 2Polizei.paa",_path2 + "Mohawk 3Polizei.paa"]
			
		];
	};
	
	case "C_Hatchback_01_sport_F":
	{
		_path = "\a3\soft_f_gamma\Hatchback_01\data\";
		_path2 = "skins\car\";
		_ret =
		[
			[_path + "hatchback_01_ext_sport01_co.paa","civ"],
			[_path + "hatchback_01_ext_sport02_co.paa","civ"],
			[_path + "hatchback_01_ext_sport03_co.paa","civ"],
			[_path + "hatchback_01_ext_sport04_co.paa","civ"],
			[_path + "hatchback_01_ext_sport05_co.paa","civ"],
			[_path + "hatchback_01_ext_sport06_co.paa","civ"],
			[_path2 + "police_hatchbacksport.paa","cop"],
			[_path2 + "civ_hatchback_metallica.paa","civ"],
			[_path2 + "sportlimoMedic.paa","med"],
			[_path2 + "ateam_hatchback.paa","ateam"],
			[_path2 + "qt_hatchback.paa","qt"]
		];
	};
		
	case "C_Offroad_01_F":
	{
		_path = "skins\car\";
		_ret = 
		[
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa", "civ"], 
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa","civ"],
			["#(ai,64,64,1)Fresnel(0.3,3)","civ"],
			[_path + "police_offroad.paa","cop"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			[_path + "monsterenergy_off.paa","civ"],
			[_path + "IMP_Offroad.paa","imp"],
			[_path + "ateam_offroader.paa","ateam"],
			[_path + "qt_offroader.paa","qt"]
		];
	};
	
	case "C_Hatchback_01_F":
	{
		_path = "skins\car\";
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
			[_path + "PolizeiLimo.paa","cop"]
		];
	};
	
	case "C_SUV_01_F":
	{
		_path = "skins\car\";
		_ret =
		[			
			[_path + "SUVPolizei.paa","cop"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa","civ"],
			[_path + "medic_suv.paa","med"],
			[_path + "HyperbeastSuv.paa","civ"],
			[_path + "Joker_Suv.paa","civ"],
			[_path + "qt_suv.paa","qt"],
			[_path + "presse_suv.paa","civ"],
			["#(rgb,8,8,3)color(0.05,0.05,0.05,1)","civ"]
		];
	};
	
	case "C_Van_01_box_F":
	{
		_path = "skins\car\";
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"],
			[_path + "rtwfront.paa","med",_path + "rtwback.paa"]
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
	
	case "B_Quadbike_01_F":
	{
		_path = "skins\car\";
		_ret = 
		[
			[_path + "QuadPolizei.paa","cop"],
			["\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","civ"]
		];
	};
	
	case "B_Heli_Light_01_F":
	{
		_path  = "skins\air\";
		_ret = 
		[
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","civ"],
			[_path + "HummingbirdPolizei.paa","cop"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","civ"],
			[_path + "medic_littlebird.jpg","med"],
			[_path + "IMP_Hummingbird.paa","imp"],
			[_path + "ateam_hummingbird.paa","ateam"],
			[_path + "qt_hummingbird.paa","qt"]
		];
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		_path = "skins\air\";
		_ret = 
		[
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa","civ"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa","civ"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa","civ"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa","civ"],
			[_path + "medic_orca.jpg","med"],
			["#(rgb,8,8,3)color(0,0,0,1)","cop"],
			[_path + "ateam_orca.paa","ateam"],
			[_path + "qt_orca.paa","qt"]
		];
	};
	
	case "B_MRAP_01_F":
	{
		_path = "skins\car\";
		_ret = 
		[
			["\A3\Soft_F\MRAP_01\data\mrap_01_adds_co.paa","civ"],
			[_path + "grau_hunter_front.paa","civ",_path + "grau_hunter_hinten.paa"],
			[_path + "hunter-medic1.paa","med",_path + "hunter-medic2.paa"],
			[_path + "HunterPolizei1.paa","cop",_path + "HunterPolizei2.paa"],
			[_path + "IMP_HUNTER.paa","imp",_path + "IMP_HUNTER2.paa"],
			[_path + "ateam_hunter_01.paa","ateam",_path + "ateam_hunter_02.paa"]
		];
	};
	
	case "I_Truck_02_covered_F":
	{
		_path = "skins\car\";
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"],
			[_path + "qt_zamak_01.paa","qt",_path + "qt_zamak_02.paa"]
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

	case "I_Heli_light_03_unarmed_F":
	{
		_path = "skins\air\";
		_ret =
		[
			[_path + "hellcat_adac.jpg","med"]
		];
	};
	
	case "I_Heli_light_03_F":
	{
		_path = "skins\air\";
		_ret =
		[
			[_path + "Polizei_Hellcat.paa","cop"]
		];
	};

	case "I_MRAP_03_F":
	{
		_path = "skins\car\";
		_ret =
		[
			["\A3\Soft_F_beta\MRAP_03\data\mrap_03_ext_indp_co.paa","civ"],
			[_path + "strider.paa","civ"],
			[_path + "StriderPolizei.paa","cop"],
			[_path + "ateam_strider.paa","ateam"]
		];
	};

	case "O_MRAP_02_F":
	{
		_path = "skins\car\";
		_ret =
		[
			["\A3\Soft_F\MRAP_02\data\mrap_02_ext_01_co.paa","civ","\A3\Soft_F\MRAP_02\data\mrap_02_ext_02_co.paa"],
			[_path + "ifrit_r1.paa","civ",_path + "ifrit_r2.paa"],
			[_path + "ifritTotenkopf1.paa","civ",_path + "ifritTotenkopf2.paa"],
			[_path + "IMP_Ifrit1.paa","imp",_path + "IMP_Ifrit2.paa"],
			[_path + "ateam_ifrit_01.paa","ateam",_path + "ateam_ifrit_02.paa"]
		];
	};

	case "B_Heli_Transport_01_F":
	{
		_path = "skins\air\";
		_ret =
		[
			["#(rgb,8,8,3)color(0,0,0,1)","cop"]
		];
	};
	case "B_Truck_01_box_F":
	{
		_path = "skins\car\";
		_ret =
		[
			["a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa","civ","a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa","a3\soft_f_gamma\truck_01\data\truck_01_ammo_co.paa"],
			["#(rgb,8,8,3)color(1,0,1,0.5)","civ","#(rgb,8,8,3)color(1,0,1,0.5)","#(rgb,8,8,3)color(1,0,1,0.5)"],
			[_path + "qt_hemmt_01.paa","qt",_path + "qt_hemmt_02.paa"]
		];
	};
	case "B_Truck_01_transport_F":
	{
		_path = "skins\car\";
		_ret =
		[
			["a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa","civ","a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa"],
			["#(rgb,8,8,3)color(1,0,1,0.5)","civ","#(rgb,8,8,3)color(1,0,1,0.5)"],
			[_path + "adac_hemtt.paa","med",_path + "adac_hemtt_1.paa"]
		];
	};
	case "B_Truck_01_covered_F":
	{
		_ret =
		[
			["a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa","civ","a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa"],
			["#(rgb,8,8,3)color(1,0,1,0.5)","civ","#(rgb,8,8,3)color(1,0,1,0.5)"]
		];
	};
	case "B_Truck_01_ammo_F":
	{
		_ret =
		[
			["a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa","civ","a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa","a3\soft_f_gamma\truck_01\data\truck_01_ammo_co.paa"],
			["#(rgb,8,8,3)color(1,0,1,0.5)","civ","#(rgb,8,8,3)color(1,0,1,0.5)","#(rgb,8,8,3)color(1,0,1,0.5)"]
		];
	};
	
	//Apex by cat24max
	case "C_Offroad_02_unarmed_F": //Offroad AWD
	{
		_ret =
		[
			["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa","civ","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_black_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_black_co.paa"],
			["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa","cop","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_blue_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_blue_co.paa"],
			["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa","civ","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_green_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_green_co.paa"],
			["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_orange_co.paa","civ","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_orange_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_orange_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_orange_co.paa"],
			["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa","civ","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_red_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_red_co.paa"],
			["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa","civ","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_white_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_white_co.paa"],
			["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_brown_co.paa","civ","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_brown_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_brown_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_brown_co.paa"],
			["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa","civ","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa"],
			["skins\air\cop_AWD.paa","cop","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_black_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_black_co.paa"]
		];
	};
	
	case "C_Scooter_Transport_01_F": //Scooter
	{
		_ret =
		[
			["\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_CO.paa","civ","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_CO.paa"],
			["\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Black_CO.paa","civ","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Black_CO.paa"],
			["\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Blue_co.paa","civ","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Blue_co.paa"],
			["\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Grey_co.paa","civ","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Grey_co.paa"],
			["\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Lime_co.paa","civ","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Lime_co.paa"],
			["\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Red_CO.paa","civ","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_CO.paa"],
			["\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Yellow_CO.paa","civ","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Yellow_CO.paa"]
		];
	};
	
	case "C_Plane_Civil_01_F": //Caesar Civ
	{
		_ret =
		[
			["A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa","civ","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"],
			["A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa","civ","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"],
			["A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa","civ","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"],
			["A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa","civ","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"],
			["A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa","civ","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"],
			["A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa","civ","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"],
			["A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa","civ","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"],
			["A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa","civ","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"]
			
		];
	};
	
	case "B_T_LSV_01_unarmed_F": //Offroad AWD
	{
		_ret =
		[
			["skins\car\prowler_police1.paa","cop","skins\car\Prowler_Police2.paa","skins\car\Prowler_Police3.paa","skins\car\Prowler_Police4.paa"]
		];
	};
	
	
};

_ret;