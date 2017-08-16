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
		_ret =
		[
			["\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_ion_co.paa","civ","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_ion_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"],
			["\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_dahoman_co.paa","civ","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_dahoman_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_dahoman_co.paa"],
			["textures\pixel.jpg","fed","textures\pixel.jpg","textures\pixel.jpg"],
			["\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_ion_co.paa","donator1","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_ion_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"],
			["\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_dahoman_co.paa","donator1","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_dahoman_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_dahoman_co.paa"],
			["textures\Fahrzeug_Skins\Medic\MohawkRumpf.paa","med","textures\Fahrzeug_Skins\Medic\MohawkHeck.paa","textures\Fahrzeug_Skins\Medic\MohawkEng.paa"]
		];

	};
	
	case "O_Heli_Transport_04_bench_F":
	{
		_ret =
		[
			["textures\Fahrzeug_Skins\heli_transport_04_base_01_co.paa","civ","textures\Fahrzeug_Skins\heli_transport_04_base_02_co.paa"],
			["textures\Fahrzeug_Skins\heli_transport_04_base_01_co.paa","fed","textures\Fahrzeug_Skins\heli_transport_04_base_02_co.paa"]
		];

	};
	
	case "C_Offroad_02_unarmed_F": // Offroad Apex
	{
		_ret =
		[
			["a3\soft_f_exp\offroad_02\data\offroad_02_ext_black_co.paa","civ","a3\soft_f_exp\offroad_02\data\offroad_02_ext_black_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_black_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_black_co.paa"],
			["a3\soft_f_exp\offroad_02\data\offroad_02_ext_blue_co.paa","civ","a3\soft_f_exp\offroad_02\data\offroad_02_ext_blue_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_blue_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_blue_co.paa"],
			["a3\soft_f_exp\offroad_02\data\offroad_02_ext_green_co.paa","civ","a3\soft_f_exp\offroad_02\data\offroad_02_ext_green_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_green_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_green_co.paa"],
			["a3\soft_f_exp\offroad_02\data\offroad_02_ext_orange_co.paa","civ","a3\soft_f_exp\offroad_02\data\offroad_02_ext_orange_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_orange_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_orange_co.paa"],
			["a3\soft_f_exp\offroad_02\data\offroad_02_ext_red_co.paa","civ","a3\soft_f_exp\offroad_02\data\offroad_02_ext_red_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_red_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_red_co.paa"],
			["a3\soft_f_exp\offroad_02\data\offroad_02_ext_white_co.paa","civ","a3\soft_f_exp\offroad_02\data\offroad_02_ext_white_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_white_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_white_co.paa"],
			["a3\soft_f_exp\offroad_02\data\offroad_02_ext_brown_co.paa","civ","a3\soft_f_exp\offroad_02\data\offroad_02_ext_brown_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_brown_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_brown_co.paa"],
			["a3\soft_f_exp\offroad_02\data\offroad_02_ext_olive_co.paa","civ","a3\soft_f_exp\offroad_02\data\offroad_02_ext_olive_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_olive_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_olive_co.paa"]

		];
	};
	
//	case "B_T_VTOL_01_infantry_F": // VTOL blufor infantry
//	{
//		_ret =
//		[
//			["a3\air_f_exp\vtol_01\data\vtol_01_ext01_blue_co.paa","civ","a3\air_f_exp\vtol_01\data\vtol_01_ext02_blue_co.paa","a3\air_f_exp\vtol_01\data\vtol_01_ext03_blue_co.paa","a3\air_f_exp\vtol_01\data\vtol_01_ext04_blue_co.paa"],
//			["a3\air_f_exp\vtol_01\data\vtol_01_ext01_olive_co.paa","civ","a3\air_f_exp\vtol_01\data\vtol_01_ext02_olive_co.paa","a3\air_f_exp\vtol_01\data\vtol_01_ext03_olive_co.paa","a3\air_f_exp\vtol_01\data\vtol_01_ext04_olive_co.paa"]
//
//		];
//	};
	
	case "I_C_Boat_Transport_02_F": // RHIB
	{
		_ret =
		[
			["a3\boat_f_exp\boat_transport_02\data\boat_transport_02_exterior_co.paa","civ","a3\boat_f_exp\boat_transport_02\data\boat_transport_02_interior_2_co.paa"],
			["a3\boat_f_exp\boat_transport_02\data\boat_transport_02_exterior_civilian_co.paa","civ","a3\boat_f_exp\boat_transport_02\data\boat_transport_02_interior_2_civilian_co.paa"]


		];
	};
	
	case "B_T_LSV_01_unarmed_F": // Prowler
	{
		_ret =
		[
			["a3\soft_f_exp\lsv_01\data\nato_lsv_01_black_co.paa","civ","a3\soft_f_exp\lsv_01\data\nato_lsv_02_black_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_03_black_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_adds_black_co.paa"],
			["a3\soft_f_exp\lsv_01\data\nato_lsv_01_olive_co.paa","civ","a3\soft_f_exp\lsv_01\data\nato_lsv_02_olive_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_03_olive_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_adds_olive_co.paa"],
			["a3\soft_f_exp\lsv_01\data\nato_lsv_01_sand_co.paa","civ","a3\soft_f_exp\lsv_01\data\nato_lsv_02_sand_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_03_sand_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_adds_sand_co.paa"],
			["a3\soft_f_exp\lsv_01\data\nato_lsv_01_dazzle_co.paa","reb","a3\soft_f_exp\lsv_01\data\nato_lsv_02_olive_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_03_olive_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_adds_olive_co.paa"],
			["a3\soft_f_exp\lsv_01\data\nato_lsv_01_black_co.paa","cop","a3\soft_f_exp\lsv_01\data\nato_lsv_02_black_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_03_black_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_adds_black_co.paa"]
			
		];
	};
	
	case "O_T_LSV_02_unarmed_F": // Quilin
	{
		_ret =
		[
			["a3\soft_f_exp\lsv_02\data\csat_lsv_01_black_co.paa","civ","a3\soft_f_exp\lsv_02\data\csat_lsv_02_black_co.paa","a3\soft_f_exp\lsv_02\data\csat_lsv_03_black_co.paa"],
			["a3\soft_f_exp\lsv_02\data\csat_lsv_01_ghex_co.paa","reb","a3\soft_f_exp\lsv_02\data\csat_lsv_02_ghex_co.paa","a3\soft_f_exp\lsv_02\data\csat_lsv_03_ghex_co.paa"],
			["a3\soft_f_exp\lsv_02\data\csat_lsv_01_arid_co.paa","reb","a3\soft_f_exp\lsv_02\data\csat_lsv_02_arid_co.paa","a3\soft_f_exp\lsv_02\data\csat_lsv_03_arid_co.paa"],
			["a3\soft_f_exp\lsv_02\data\csat_lsv_01_black_co.paa","cop","a3\soft_f_exp\lsv_02\data\csat_lsv_02_black_co.paa","a3\soft_f_exp\lsv_02\data\csat_lsv_03_black_co.paa"]

		];
	};
	
	case "C_Hatchback_01_sport_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa","civ"],
			["textures\Fahrzeug_Skins\Cops\hatchback.jpg","cop"],
			["textures\Fahrzeug_Skins\donator\hellokitty.jpg","civ"],
			["textures\Fahrzeug_Skins\donator\monster.jpg","civ"],
			["textures\Fahrzeug_Skins\donator\Metallica.jpg","civ"],
			["textures\Fahrzeug_Skins\donator\hatchback_impreza.jpg","civ"],
			["textures\Fahrzeug_Skins\donator\asiimov_hatchback.jpg","civ"],
			["textures\Fahrzeug_Skins\lopedition.paa","admin1"],
			["textures\Fahrzeug_Skins\lopedition.paa","admin1"],
			["textures\Fahrzeug_Skins\donator\hellokitty.jpg","donator1"],
			["textures\Fahrzeug_Skins\donator\monster.jpg","donator1"],
			["textures\Fahrzeug_Skins\donator\Metallica.jpg","donator1"],
			["textures\Fahrzeug_Skins\donator\hatchback_impreza.jpg","donator1"],
			["textures\Fahrzeug_Skins\donator\asiimov_hatchback.jpg","donator1"]
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
			["textures\pixel.jpg","fed"],
			["textures\Fahrzeug_Skins\CIV\Gay.jpg","civ"],
			["textures\Fahrzeug_Skins\CIV\Holz.jpg","civ"],
			["textures\Fahrzeug_Skins\Cops\offroader.jpg","cop"],
			["textures\Fahrzeug_Skins\Medic\offroad.paa","med"],
			["textures\Fahrzeug_Skins\CIV\offroad_monster.jpg","civ"],
			["textures\Fahrzeug_Skins\CIV\offroad_ram.jpg","civ"],
			["textures\Fahrzeug_Skins\Cops\zoffroader.paa","cop"],
			["textures\Event\offroad_event.paa","fed"]
		];
	};
	
	case "C_Offroad_01_repair_F":
	{
		_ret = 
		[
		["textures\pixel.jpg","fed"],
		["textures\Fahrzeug_Skins\Medic\offroad.paa","med"]
		];
	};
	
	case "B_Truck_01_mover_F":
	{
		_ret = 
		[
		["textures\pixel.jpg","fed"]
		];
	};
	
	case "B_MRAP_01_hmg_F":
	{
		_ret = 
		[
			["textures\Fahrzeug_Skins\Cops\hunter.jpg","cop","textures\Fahrzeug_Skins\Cops\hunter1.jpg"]
		];
	};
	
	case "O_Plane_CAS_02_F":
		{
		_ret = 
		[
			["textures\Fahrzeug_Skins\CivJetHaupt.paa","civ","textures\Fahrzeug_Skins\CivJetAdds.paa"],
			["textures\Fahrzeug_Skins\CivJetHauptred.paa","civ","textures\Fahrzeug_Skins\CivJetAddsred.paa"]
		];
	};
	
	case "I_MRAP_03_hmg_F":
	{
		_ret = 
		[
			["textures\Fahrzeug_Skins\Cops\strider.jpg","cop","textures\Fahrzeug_Skins\Cops\strider.jpg"]
		];
	};
	
	case "B_Truck_01_covered_F":
	{
		_ret = 
		[
			["\a3\soft_f_beta\Truck_01\data\truck_01_ext_01_co.paa","civ","\a3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"],
			["textures\Fahrzeug_Skins\Cops\h-vorne.paa","cop","textures\Fahrzeug_Skins\Cops\h-hinten.paa"],
			["\a3\soft_f_beta\Truck_01\data\truck_01_ext_01_co.paa","donator1","\a3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"]
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
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa","civ"]
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
			["#(ai,64,64,1)Fresnel(1.3,7)","cop"],
			["textures\Fahrzeug_Skins\CIV\Carbon.jpg","civ"],
			["textures\Fahrzeug_Skins\Cops\suv.jpg","cop"],
			["textures\Fahrzeug_Skins\Cops\zsuv.paa","cop"],
			["textures\Fahrzeug_Skins\CIV\suv_monster.jpg","civ"],
			["textures\Fahrzeug_Skins\Presse\presse.paa","presse"],
			["textures\Fahrzeug_Skins\Medic\medic_suv.paa","med"],
			["textures\Fahrzeug_Skins\CIV\city.jpg","donator1"],
			["textures\pixel.jpg","fed"],
			["textures\pixel.jpg","fed"],
			["textures\Fahrzeug_Skins\lop2015.paa","fed"],
			["textures\Event\suv_event.paa","fed"]
		];
	};
	case "C_Van_01_box_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"],
			["textures\Fahrzeug_Skins\Medic\rtwfront.paa","med","textures\Fahrzeug_Skins\Medic\rtwback.paa"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_black_co.paa","civ"]
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
		_ret = 
		[
			["\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa","cop"],
			["\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","donator1"],
			["textures\Event\quad_event.paa","fed"]
		];
	};
	
	case "B_Heli_Light_01_F":
	{
		_ret = 
		[
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa","cop"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","donator1"],
			["#(argb,8,8,3)color(1,1,1,0.8)","fed"],
			["textures\Fahrzeug_Skins\Cops\bird.jpg","cop"],
			["textures\pixel.jpg","fed"],
			["textures\Fahrzeug_Skins\CIV\hummingbird_monster.jpg","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","donator1"],
			["#(ai,64,64,1)Fresnel(1.3,7)","civ"],
			["#(ai,64,64,1)Fresnel(1.3,7)","donator1"],
			["textures\Fahrzeug_Skins\Medic\Notarzt_Hummingbird.paa","med"],
			["textures\Fahrzeug_Skins\CIV\hummingbird_monster.jpg","civ"],
			["textures\pixel.jpg","ar"],
			["textures\Fahrzeug_Skins\Cops\swatbird.paa","cop"],
			["textures\pixel.jpg","fed"]

		];
	};
	
	case "C_Heli_Light_01_civil_F":
	{
		_ret = [
["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","civ"],
["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_graywatcher_co.paa","civ"],
["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_light_co.paa","civ"],
["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa","civ"],
["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa","civ"],
["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"],
["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa","civ"],
["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","donator1"],
["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","donator1"],
["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","donator1"],
["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","donator1"],
["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_graywatcher_co.paa","donator1"],
["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","donator1"],
["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_light_co.paa","donator1"],
["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa","donator1"],
["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa","donator1"],
["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","donator1"],
["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","donator1"],
["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","donator1"],
["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa","donator1"],
["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","donator1"]
];
	};

	case "O_Heli_Light_02_unarmed_F":
	{
		_ret = 
		[
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa","fed"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa","civ"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa","donator1"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa","donator1"],
			["textures\pixel.jpg","fed"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa","donator1"],
			["#(ai,64,64,1)Fresnel(1.3,7)","civ"],
			["#(ai,64,64,1)Fresnel(1.3,7)","donator1"],
			["textures\pixel.jpg","fed"],
			["textures\Fahrzeug_Skins\ars_orca.jpg","med"]
		];
	};
	
	case "I_Heli_light_03_unarmed_F":
	{
		_ret = 
		[
			["\a3\air_f_epb\Heli_Light_03\data\heli_light_03_base_co.paa","donator1"],
			["textures\Fahrzeug_Skins\bhc\hellcat.paa","bhc"],
			["textures\Fahrzeug_Skins\Cops\hellcat.jpg","cop"],
			["textures\Fahrzeug_Skins\bhc\hellcat.paa","cop"],
			["textures\Fahrzeug_Skins\Cops\swathellcat.paa","cop"],
			["textures\Fahrzeug_Skins\dm\hellcat.paa","dm"],
			["textures\pixel.jpg","fed","textures\pixel.jpg"]
		];
	};
	
	case "B_MRAP_01_F":
	{
		_ret = 
		[
			["textures\Fahrzeug_Skins\Cops\hunter.jpg","cop","textures\Fahrzeug_Skins\Cops\hunter1.jpg"],
			["textures\Fahrzeug_Skins\Medic\hunter_notarzt_front1.paa","med","textures\Fahrzeug_Skins\Medic\hunter_notarzt_hinten1.paa"],
			["textures\Fahrzeug_Skins\CIV\hunter_urban1.paa","donator1","textures\Fahrzeug_Skins\CIV\hunter_urban2.paa"],
			["textures\Fahrzeug_Skins\Cops\swathunter.paa","cop","textures\Fahrzeug_Skins\Cops\swathunter1.paa"],
			["\a3\soft_f\MRAP_01\Data\mrap_01_base_co.paa","civ","\a3\soft_f\MRAP_01\Data\mrap_01_adds_co.paa"],
			["textures\Fahrzeug_Skins\dm\hunter2.paa","dm","textures\Fahrzeug_Skins\dm\hunter1.paa"],
			["textures\Fahrzeug_Skins\X\hunterX1.paa","x","textures\Fahrzeug_Skins\X\hunterX2.paa"],
			["textures\pixel.jpg","fed","textures\pixel.jpg"],
			["\a3\soft_f\MRAP_01\Data\mrap_01_base_co.paa","civ","\a3\soft_f\MRAP_01\Data\mrap_01_adds_co.paa"],
			["textures\pixel.jpg","fed","textures\pixel.jpg"]
		];
	};
	
		case "O_MRAP_02_F":
	{
		_ret = 
		[
			["\A3\soft_f\mrap_02\data\mrap_02_ext_01_co.paa","reb","\a3\soft_f\mrap_02\data\mrap_02_ext_02_co.paa"],
			["textures\Fahrzeug_Skins\bhc\ifrit1.paa","bhc","textures\Fahrzeug_Skins\bhc\ifrit2.paa"],
			["textures\Fahrzeug_Skins\CIV\ifrit_grey_front.paa","reb","textures\Fahrzeug_Skins\CIV\ifrit_grey_back.paa"],
			["textures\Fahrzeug_Skins\CIV\ifrit_lion_front.paa","reb","textures\Fahrzeug_Skins\CIV\ifrit_lion_back.paa"],
			["textures\Fahrzeug_Skins\CIV\ifrit_red_front.paa","reb","textures\Fahrzeug_Skins\CIV\ifrit_red_back.paa"],
			["textures\pixel.jpg","fed","textures\pixel.jpg"],
			["textures\Fahrzeug_Skins\bhc\ifrit1.paa","cop","textures\Fahrzeug_Skins\bhc\ifrit2.paa"]
		];
	};

	case "I_MRAP_03_F":
	{
		_ret = 
		[
			["\A3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa","reb"],
			["textures\Fahrzeug_Skins\bhc\strider.paa","bhc"],
			["textures\Fahrzeug_Skins\Cops\strider.jpg","cop"],
			["\A3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa","tf"],
			["textures\Fahrzeug_Skins\bhc\strider.paa","cop"],
			["textures\Fahrzeug_Skins\X\StriderX.paa","x"],
			["\A3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa","donator1"],
			["textures\Fahrzeug_Skins\CIV\striderblaudigital.paa","donator1"],
			["textures\Fahrzeug_Skins\CIV\stridersafari.paa","donator1"],
			["textures\pixel.jpg","fed"],
			["textures\Fahrzeug_Skins\Medic\Strider.paa","med"],
			["textures\pixel.jpg","gg"],
			["textures\Fahrzeug_Skins\Cops\swatstrider.paa","cop"]
		];
	};
	
	case "I_Truck_02_covered_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["textures\Fahrzeug_Skins\CIV\zamak_kindl1.paa","civ","textures\Fahrzeug_Skins\CIV\zamak_kindl2.paa"],
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","donator1","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["textures\Fahrzeug_Skins\CIV\zamak_kindl1.paa","donator1","textures\Fahrzeug_Skins\CIV\zamak_kindl2.paa"],
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","cop","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"]
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
	
		case "I_Truck_02_fuel_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_fuel_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
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
};

_ret;