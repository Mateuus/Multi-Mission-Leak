/*
	File: fn_vehicleColorCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration for vehicle colors.
*/
private["_vehicle","_ret","_path","_donPath"];
_vehicle = param [0,"",[""]];
if(_vehicle == "") exitWith {[]};
_ret = [];
_donPath = "core\textures\vehicles\donator\";

switch (_vehicle) do
{

	case "B_Quadbike_01_F": // Quadbike
	{
		_ret =
		[
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","civ"],
			["core\textures\vehicles\quad\quad_laser.jpg","civ"],
			["core\textures\vehicles\quad\quad_lady.jpg","civ"],
			["core\textures\vehicles\quad\quad_police.jpg","cop"],
			["core\textures\vehicles\quad\med_quad.jpg","med"]
		];
	};

	case "C_Offroad_01_F": // Offroad
	{
		_ret =
		[
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa","civ"],
			["#(argb,8,8,3)color(0,1,0.9,0.8)","civ"],
			["#(argb,8,8,3)color(05,0.1,0.4,0.8)","civ"],
			["core\textures\vehicles\donator\don_ad_offroad.jpg","don"],
			["core\textures\vehicles\donator\don_mech_offroad.jpg","don"],
			["core\textures\vehicles\offroad\cop_black_offroad.paa","cop","core\textures\vehicles\offroad\cop_black_offroad_back.paa"],
			["core\textures\vehicles\offroad\cop_black_offroad.paa","cop","core\textures\vehicles\offroad\cop_black_offroad_back.paa"],
			["core\textures\vehicles\offroad\med_offroad.paa","med"],
			["core\textures\vehicles\offroad\sec_offroad.paa","sec"]
		];
	};

	case "I_G_Offroad_01_F": // Offroad ADAC
	{
		_ret =
		[
			["core\textures\vehicles\offroad\adac_offroad.jpg", "adac"]
		];
	};

	case "B_G_Offroad_01_F": // Offroad Rebel
	{
		_ret =
		[
			["core\textures\vehicles\offroad\reb_lion_offroad.jpg","reb"],
			["core\textures\vehicles\offroad\reb_liongreen_offroad.jpg","reb"]
		];
	};

	case "B_G_Offroad_01_armed_F": // Offroad HMG
	{
		_ret =
		[
			["core\textures\vehicles\offroad\reb_lion_offroad.jpg","reb"],
			["core\textures\vehicles\offroad\reb_liongreen_offroad.jpg","reb"]
		];
	};

	case "C_Hatchback_01_F": // Hatckback
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
			["core\textures\vehicles\donator\don_barb_hatchback.jpg","don"],
			["core\textures\vehicles\donator\don_ganja_hatchback.jpg","don"],
			["core\textures\vehicles\donator\don_fire_hatchback.jpg","don"],
			["core\textures\vehicles\donator\don_matrix_hatchback.jpg","don"],
			["core\textures\vehicles\donator\don_erotik_hatchback.jpg","don"],
			["core\textures\vehicles\hatchback\cop_hatchback.paa","cop"]

		];
	};

	case "C_Hatchback_01_sport_F": // Hatckback Sport
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
			["core\textures\vehicles\donator\don_ferrari_hatchback.jpg","don"],
			["core\textures\vehicles\donator\don_porsche_hatchback.jpg","don"],
			["core\textures\vehicles\donator\don_batman_hatchback.jpg","don"],
			["core\textures\vehicles\donator\don_matrix_hatchback.jpg","don"],
			["core\textures\vehicles\donator\don_fire_hatchback.jpg","don"],
			["core\textures\vehicles\donator\don_erotik_hatchback.jpg","don"],
			["core\textures\vehicles\hatchback\cop_hatchback.paa","cop"],
			["core\textures\vehicles\hatchback\med_hatchback.paa","med"],
			["core\textures\vehicles\hatchback\sec_hatchback.jpg","sec"]
		];
	};

	case "C_SUV_01_F": // SUV
	{
		_ret =
		[
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa","civ"],
			["core\textures\vehicles\suv\civ_suv_ghostrider.jpg","civ"],
			["core\textures\vehicles\suv\civ_suv_cartoon.paa","civ"],
			["core\textures\vehicles\suv\civ_suv_fire.jpg","civ"],
			["core\textures\vehicles\suv\civ_suv_grey.jpg","civ"],
			["core\textures\vehicles\suv\adac_suv.jpg","adac"],
			["core\textures\vehicles\donator\don_makaveli_suv.jpg","don"],
			["#(ai,64,64,1)Fresnel(1.3,7)","cop"],
			["core\textures\vehicles\suv\cop_suv.paa","cop"],
			["core\textures\vehicles\suv\cop_suv_terror.jpg","cop"],
			["core\textures\vehicles\suv\med_suv.paa","med"],
			["core\textures\vehicles\suv\hunter_suv.jpg","hunter"],
			["core\textures\vehicles\suv\sec_suv.paa","sec"],
			["#(argb,8,8,3)color(0,0,0.3,0.8)","civ"],
			["core\textures\vehicles\suv\civ_suv_taxi.jpg","civ"],
			["core\textures\vehicles\suv\suv_vip.jpg","sec"]
		];
	};

	case "B_MRAP_01_F": // Hunter
	{
		_ret =
		[
			["core\textures\vehicles\hunter\cop_hunter_front.paa","cop","core\textures\vehicles\hunter\cop_hunter_back.paa"],
			["core\textures\vehicles\hunter\med_hunter_0.paa","med","core\textures\vehicles\hunter\med_hunter_1.paa"]
		];
	};

	case "B_MRAP_01_hmg_F": // Hunter HMG
	{
		_ret =
		[
			["core\textures\vehicles\hunter\cop_hunter_front.paa","cop","core\textures\vehicles\hunter\cop_hunter_back.paa","core\textures\vehicles\hunter\nero_co.jpg"]
		];
	};

	case "C_Van_01_transport_F": // Truck
	{
		_ret =
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"]
		];
	};

	case "C_Van_01_box_F": // Truck Boxer
	{
		_ret =
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"],
			["core\textures\vehicles\boxer\med_boxer_0.paa","med","core\textures\vehicles\boxer\med_boxer_1.paa"]
		];
	};

	case "B_Truck_01_mover_F": // Hemtt Mover
	{
		_ret =
		[
			["core\textures\vehicles\hemtt\med_hemtt_1_0.jpg","med","core\textures\vehicles\hemtt\med_hemtt_1_1.jpg"]
		];
	};

	case "O_Truck_02_Ammo_F": // Zamak COP/SEC
	{
		_ret =
		[
			["core\textures\vehicles\zamak\cop_zamak_front.jpg","cop","core\textures\vehicles\zamak\cop_zamak_back.jpg"],
			["core\textures\vehicles\zamak\sec_zamak_front.jpg","sec","core\textures\vehicles\zamak\sec_zamak_back.jpg"]
		];
	};

	case "I_Truck_02_box_F": // Zamak Medic
	{
		_ret =
		[
			["core\textures\vehicles\zamak\med_zamak_1_0.jpg","med","core\textures\vehicles\zamak\med_zamak_1_1.jpg"]
		];
	};

	case "I_Truck_02_medical_F": // Zamak Sanitätsfahrzeug
	{
		_ret =
		[
			["core\textures\vehicles\zamak\med_zamak_2_0.jpg","med","core\textures\vehicles\zamak\med_zamak_2_1.jpg"]
		];
	};

	case "I_Truck_02_covered_F": // Zamak covered
	{
		_ret =
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["core\textures\vehicles\donator\don_weed_zamak_front.jpg","don","core\textures\vehicles\donator\don_weed_zamak_back.jpg"],
			["core\textures\vehicles\zamak\civ_treiber_zamak_front.jpg","civ","core\textures\vehicles\zamak\civ_white_zamak_back.jpg"],
			["core\textures\vehicles\zamak\civ_red_zamak_front.jpg","civ","core\textures\vehicles\zamak\civ_red_zamak_back.jpg"],
			["core\textures\vehicles\zamak\civ_treiber_zamak_front.jpg","civ","#(argb,8,8,3)color(1,1,1,1)"]
		];
	};

	case "I_Truck_02_transport_F": // Zamak closed
	{
		_ret =
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["core\textures\vehicles\donator\don_weed_zamak_front.jpg","don","core\textures\vehicles\donator\don_weed_zamak_back.jpg"],
			["core\textures\vehicles\zamak\civ_treiber_zamak_front.jpg","civ"],
			["core\textures\vehicles\zamak\civ_red_zamak_front.jpg","civ"]
		];
	};

	case "O_MRAP_02_F": // Ifrit
	{
		_ret =
		[
			["\a3\soft_f\mrap_02\data\mrap_02_ext_01_co.paa","reb","\a3\soft_f\mrap_02\data\mrap_02_ext_02_co.paa"],
			["core\textures\vehicles\ifrit\reb_white_ifrit_front.jpg","reb","core\textures\vehicles\ifrit\reb_white_ifrit_back.jpg"],
			["core\textures\vehicles\ifrit\reb_black_ifrit_front.jpg","reb","core\textures\vehicles\ifrit\reb_black_ifrit_back.jpg"],
			["core\textures\vehicles\donator\reb_red_ifrit_front.jpg","don","core\textures\vehicles\donator\reb_red_ifrit_back.jpg"],
			["core\textures\vehicles\donator\reb_green_ifrit_front.jpg","don","core\textures\vehicles\donator\reb_green_ifrit_back.jpg"]
		];
	};

	case "I_MRAP_03_F": // Security  Strider
	{
		_ret =
		[
			["core\textures\vehicles\strider\sec_strider.paa","sec","#(argb,8,8,3)color(0,0.5,0.8,0.2)"]
		];
	};

	case "B_APC_Wheeled_01_cannon_F": // Marshall APC
	{
		_ret =
		[
			["core\textures\vehicles\marshall\cop_marshall.jpg","cop","core\textures\vehicles\marshall\cop_marshall_back.jpg","core\textures\vehicles\marshall\nero_co.jpg"]
		];
	};

	case "C_Heli_Light_01_civil_F": // M-900
	{
		_ret =
		[
			["core\textures\vehicles\hummingbird\adac_hummingbird.jpg","adac"],
			["#(argb,8,8,3)color(0.3,0.6,0.1,1)","civ"],
			["#(argb,8,8,3)color(1,1,1,1)","civ"],
			["core\textures\vehicles\hummingbird\cop_hummingbird.jpg","cop"],
			["core\textures\vehicles\hummingbird\med_hummingbird.paa","med"],
			["core\textures\vehicles\hummingbird\sec_hummingbird.paa","sec"]
		];
	};

	case "B_Heli_Light_01_F": // Hummingbird
	{
		_ret =
		[
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
			["#(argb,8,8,3)color(0.3,0.6,0.1,1)","civ"],
			["#(argb,8,8,3)color(1,1,1,1)","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","reb"],
			["core\textures\vehicles\hummingbird\cop_hummingbird.jpg","cop"],
			["core\textures\vehicles\hummingbird\med_hummingbird.paa","med"],
			["core\textures\vehicles\hummingbird\sec_hummingbird.paa","sec"]
		];
	};

	case "O_Heli_Light_02_unarmed_F": // Orca
	{
		_ret =
		[
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa","civ"],
			["core\textures\vehicles\orca\civ_orca_green.paa","civ"],
			["a3\air_f_heli\heli_light_02\data\heli_light_02_ext_opfor_v2_co.paa","civ"],
			["core\textures\vehicles\orca\civ_orca_adac.paa","adac"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa","don"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa","reb"],
			["core\textures\vehicles\orca\med_orca.paa","med"]
		];
	};

	case "I_Heli_Transport_02_F": // Mohawk
	{
		_path = "\a3\air_f_beta\Heli_Transport_02\Data\Skins\";
		_ret =
		[
			[_path + "heli_transport_02_1_ion_co.paa","civ",_path + "heli_transport_02_2_ion_co.paa",_path + "heli_transport_02_3_ion_co.paa"],
			[_path + "heli_transport_02_1_dahoman_co.paa","civ",_path + "heli_transport_02_2_dahoman_co.paa",_path + "heli_transport_02_3_dahoman_co.paa"],
			["core\textures\vehicles\mohawk\med_mohawk_0.paa","med","core\textures\vehicles\mohawk\med_mohawk_1.paa","core\textures\vehicles\mohawk\med_mohawk_2.paa"],
			["core\textures\vehicles\mohawk\sec_mohawk_1.paa","sec","core\textures\vehicles\mohawk\sec_mohawk_2.paa","core\textures\vehicles\mohawk\sec_mohawk_3.paa"]
		];
	};

	case "B_Heli_Transport_03_unarmed_F": // Huron Donator
	{
		_ret =
		[
			["#(ai,64,64,1)Fresnel(1.3,7)","don","#(ai,64,64,1)Fresnel(1.3,7)"],
			["#(argb,8,8,3)color(1,0,0,0.3)","don","#(argb,8,8,3)color(1,0.8,0,0.3)"],
			["core\textures\vehicles\donator\don_stormtrooper_huron_front.jpg","don","core\textures\vehicles\donator\don_stormtrooper_huron_back.jpg"]
		];
	};

	case "O_Heli_Transport_04_F": // Taru Cops
	{
		_ret =
		[
			["#(ai,64,64,1)Fresnel(1.3,7)","cop","#(ai,64,64,1)Fresnel(1.3,7)"]
		];
	};

	case "O_Heli_Transport_04_bench_F": // Taru Donator
	{
		_ret =
		[
			["#(argb,8,8,3)color(5,0.9,0.4,0.1)","don","#(argb,8,8,3)color(5,0.9,0.4,0.1)"],
			["#(ai,64,64,1)Fresnel(1.3,7)","cop","#(ai,64,64,1)Fresnel(1.3,7)"]
		];
	};

	case "I_Heli_light_03_unarmed_F": // Hellcat
	{
		_ret =
		[
			["core\textures\vehicles\hellcat\cop_hellcat.jpg","cop"],
			["\A3\Air_F_EPB\Heli_Light_03\data\Heli_Light_03_base_CO.paa","civ"]
		];
	};

	case "B_Heli_Transport_01_F": // Ghosthawk
	{
		_ret =
		[
			["core\textures\vehicles\ghosthawk\cop_ghosthawk_0.jpg","cop","core\textures\vehicles\ghosthawk\cop_ghosthawk_1.jpg"],
			["core\textures\vehicles\ghosthawk\cop_ghosthawk_cg_0.paa","cop","core\textures\vehicles\ghosthawk\cop_ghosthawk_cg_1.paa"]
		];
	};

	case "B_Heli_Transport_01_camo_F": // Ghosthawk Rebellen
	{
		_ret =
		[
			["#(argb,8,8,3)color(0,0.1,0,1)","reb","#(argb,8,8,3)color(0,0.1,0,1)"],
			["#(argb,8,8,3)color(0.3,0.2,0.1,1)","reb","#(argb,8,8,3)color(0.3,0.2,0.1,1)"]
		];
	};

// Container

	case "Land_Pod_Heli_Transport_04_bench_F": // Taru pod bench
	{
		_ret =
		[
			["a3\air_f_heli\heli_transport_04\data\heli_transport_04_bench_co.paa","civ"],
			["a3\air_f_heli\heli_transport_04\data\heli_transport_04_bench_co.paa","cop"]
		];
	};

	case "Land_Pod_Heli_Transport_04_covered_F": // Taru pod bench covered
	{
		_ret =
		[
			["#(argb,8,8,3)color(0.5,0.5,0.5,0.07)","civ","#(argb,8,8,3)color(0.5,0.5,0.5,0.9)"],
			["#(argb,8,8,3)color(0.5,0.5,0.5,0.07)","cop","#(argb,8,8,3)color(0.5,0.5,0.5,0.9)"]
		];
	};

	case "Land_Pod_Heli_Transport_04_box_F": // Taru transport Box
	{
		_ret =
		[
			["#(argb,8,8,3)color(0.5,0.5,0.5,0.07)","civ","#(argb,8,8,3)color(0.5,0.5,0.5,0.9)"]
		];
	};

	case "Land_Pod_Heli_Transport_04_medevac_F": // Medic Container
	{
		_ret =
		[
			["core\textures\vehicles\container\med_container_0.jpg","med","core\textures\vehicles\container\med_container_1.jpg"]
		];
	};

};
_ret;