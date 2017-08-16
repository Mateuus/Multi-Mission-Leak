/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Fills the combo box of all textures available to any given vehicle
*/

private ["_className","_return","_texture"];

_className = [_this,0,"",[""]] call BIS_fnc_param;
_texture = _this select 1;
_playerSide = _this select 2;
//systemchat format ["Class = %1 || Texture = %2 || Side = %3",_className,_texture,_playerSide];
if(_className == "") exitWith {[]};
_return = [];

switch(_playerSide)do
	{
	case civilian:
		{
		if(_texture)then
			{
			switch (_className) do
				{
				case "C_Van_01_fuel_F":
					{
					_return =
						[
							["\A3\soft_f_gamma\van_01\Data\Van_01_ext_black_CO.paa","\A3\soft_f_gamma\Van_01\Data\Van_01_tank_CO.paa"],
							["\A3\soft_f_gamma\van_01\Data\Van_01_ext_black_CO.paa","\A3\soft_f_gamma\Van_01\Data\Van_01_tank_red_CO.paa"],
							["\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_01_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_tank_IG_01_CO.paa"],
							["\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_02_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_tank_IG_02_CO.paa"],
							["\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_03_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_tank_IG_03_CO.paa"],
							["\A3\soft_f_gamma\van_01\Data\Van_01_ext_red_CO.paa","\A3\soft_f_gamma\Van_01\Data\Van_01_tank_CO.paa"],
							["\A3\soft_f_gamma\van_01\Data\Van_01_ext_red_CO.paa","\A3\soft_f_gamma\Van_01\Data\Van_01_tank_red_CO.paa"],
							["\A3\soft_f_gamma\van_01\Data\van_01_ext_CO.paa","\A3\soft_f_gamma\Van_01\Data\Van_01_tank_CO.paa"],
							["\A3\soft_f_gamma\van_01\Data\van_01_ext_CO.paa","\A3\soft_f_gamma\Van_01\Data\Van_01_tank_red_CO.paa"]
						];
					};
				case "B_T_VTOL_01_infantry_F":
					{
					_return =
						[
							["\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT01_blue_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT02_blue_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT03_blue_CO.paa"]
						];
					};
				case "O_Truck_03_device_F":
					{
					_return =
						[
							["\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext01_ghex_CO.paa","\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext02_ghex_CO.paa","\A3\Soft_F_Exp\Truck_03\Data\Truck_03_cargo_ghex_CO.paa"]
						];
					};
				case "B_Heli_Transport_01_F":
					{
					_return =
						[
							["\A3\Air_F_Beta\Heli_Transport_01\Data\Heli_Transport_01_ext01_BLUFOR_CO.paa","\A3\Air_F_Beta\Heli_Transport_01\Data\Heli_Transport_01_ext02_BLUFOR_CO.paa"],
							["\A3\Air_F_Exp\Heli_Transport_01\Data\Heli_Transport_01_ext01_tropic_CO.paa","\A3\Air_F_Exp\Heli_Transport_01\Data\Heli_Transport_01_ext02_tropic_CO.paa"],
							["\A3\Air_F_Exp\Heli_Transport_01\Data\Heli_Transport_01_ext01_sand_CO.paa","\A3\Air_F_Exp\Heli_Transport_01\Data\Heli_Transport_01_ext02_sand_CO.paa"]
						];
					};
				case "O_Truck_02_fuel_F":
					{
					_return =
						[
							["\a3\soft_f_beta\Truck_02\data\truck_02_kab_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_fuel_co.paa"]
						];
					};
				case "I_MRAP_03_F":
					{
					_return =
						[
							["\a3\soft_f_beta\MRAP_03\Data\mrap_03_ext_co.paa","\a3\data_f\vehicles\turret_co.paa"],
							["\a3\soft_f_beta\mrap_03\data\mrap_03_ext_indp_co.paa","\a3\data_f\vehicles\turret_indp_co.paa"]
						];
					};
				case "O_T_LSV_02_unarmed_F":
					{
					_return =
						[
							["\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_01_arid_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_02_arid_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_03_arid_CO.paa"],
							["\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_01_black_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_02_black_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_03_black_CO.paa"],
							["\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_01_ghex_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_03_ghex_CO.paa"]
						];
					};
				case "B_T_LSV_01_unarmed_F":
					{
					_return =
						[
							["\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_black_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_black_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_black_CO.paa"],
							["\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_dazzle_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_olive_CO.paa"],
							["\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_olive_CO.paa"],
							["\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_sand_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_sand_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_sand_CO.paa"]
						];
					};
				case "C_Scooter_Transport_01_F":
					{
					_return =
						[
							["\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Black_CO.paa","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Black_CO.paa"],
							["\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Blue_co.paa","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Blue_co.paa"],
							["\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Grey_co.paa","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Grey_co.paa"],
							["\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Lime_co.paa","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Lime_co.paa"],
							["\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Red_CO.paa","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_CO.paa"],
							["\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_CO.paa","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_CO.paa"],
							["\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Yellow_CO.paa","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Yellow_CO.paa"]
						];
					};
				case "I_C_Boat_Transport_02_F":
					{
					_return =
						[
							["\A3\Boat_F_Exp\Boat_Transport_02\Data\Boat_Transport_02_exterior_civilian_CO.paa","\A3\Boat_F_Exp\Boat_Transport_02\Data\Boat_Transport_02_interior_2_civilian_CO.paa"]
						];
					};
				case "C_Plane_Civil_01_F":
					{
					_return =
						[
							["A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa"],
							["A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa"],
							["A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa"],
							["A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa"]
						];
					};
				case "C_Offroad_02_unarmed_F":
					{
					_return =
						[
							["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_black_co.paa"],
							["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_blue_co.paa"],
							["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_brown_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_brown_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_brown_co.paa"],
							["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_green_co.paa"],
							["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa"],
							["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_orange_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_orange_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_orange_co.paa"],
							["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_red_co.paa"],
							["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_white_co.paa"]
						];
					};
				case "C_Offroad_01_F":
					{
					_return =
						[
							["\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"],
							["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"],
							["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"],
							["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"],
							["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"],
							["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"],
							["extras\textures\vehicles\Offroad_Farm.jpg"],
							["extras\textures\vehicles\TF.jpg"],
							["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa"],
							["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa"],
							["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa"],
							["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa"],
							["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa"],
							["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa"],
							["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa"],
							["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa"],
							["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa"],
							["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa"],
							["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa"],
							["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa"]
						];
					};
				case "C_SUV_01_F":
					{
					_return =
						[
							["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"],
							["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"],
							["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"],
							["extras\textures\vehicles\ferrari_suv.jpg"],
							["extras\textures\vehicles\suv_taxi.jpg"],
							["extras\textures\vehicles\rebel_suv.jpg"],
							["extras\textures\vehicles\civ_suv.jpg"],
							["extras\textures\vehicles\civ_suv_v2.jpg"]
						];
					};
				case "B_Heli_Transport_01_camo_F":
					{
					_return =
						[
							["extras\textures\vehicles\reb_hellcat2.jpg","extras\textures\vehicles\reb_hellcat2.jpg"],
							["extras\textures\vehicles\rebel_hummingbird.jpg","extras\textures\vehicles\rebel_hummingbird.jpg"]
						];
					};
				case "O_Heli_Transport_04_F":
					{
					_return =
						[
							["extras\textures\vehicles\reb_hellcat2.jpg","extras\textures\vehicles\reb_hellcat2.jpg"],
							["extras\textures\vehicles\rebel_hummingbird.jpg","extras\textures\vehicles\rebel_hummingbird.jpg"],
							["extras\textures\vehicles\newBlue.jpg","extras\textures\vehicles\newBlue.jpg"]
						];
					};
				case "O_Heli_Transport_04_fuel_F":
					{
					_return =
						[
							["extras\textures\vehicles\reb_hellcat2.jpg","extras\textures\vehicles\reb_hellcat2.jpg"],
							["extras\textures\vehicles\rebel_hummingbird.jpg","extras\textures\vehicles\rebel_hummingbird.jpg"],
							["extras\textures\vehicles\newBlue.jpg","extras\textures\vehicles\newBlue.jpg"]
						];
					};
				case "O_Heli_Transport_04_ammo_F":
					{
					_return =
						[
							["extras\textures\vehicles\reb_hellcat2.jpg","extras\textures\vehicles\reb_hellcat2.jpg"],
							["extras\textures\vehicles\rebel_hummingbird.jpg","extras\textures\vehicles\rebel_hummingbird.jpg"],
							["extras\textures\vehicles\newBlue.jpg","extras\textures\vehicles\newBlue.jpg"]
						];
					};
				case "B_Heli_Transport_03_unarmed_F":
					{
					_return =
						[
							["extras\textures\vehicles\reb_hellcat2.jpg","extras\textures\vehicles\reb_hellcat2.jpg"],
							["extras\textures\vehicles\rebel_hummingbird.jpg","extras\textures\vehicles\rebel_hummingbird.jpg"],
							["extras\textures\vehicles\newBlue.jpg","extras\textures\vehicles\newBlue.jpg"]
						];
					};
				case "B_Heli_Transport_03_F":
					{
					_return =
						[
							["extras\textures\vehicles\reb_hellcat2.jpg","extras\textures\vehicles\reb_hellcat2.jpg"],
							["extras\textures\vehicles\rebel_hummingbird.jpg","extras\textures\vehicles\rebel_hummingbird.jpg"],
							["extras\textures\vehicles\newBlue.jpg","extras\textures\vehicles\newBlue.jpg"]
						];
					};
				case "O_MRAP_02_hmg_F":
					{
					_return =
						[
							["extras\textures\vehicles\rebel_ifrit_1.jpg","extras\textures\vehicles\black.paa"],
							["extras\textures\vehicles\rebel_ifrit_1.jpg","extras\textures\vehicles\black.paa"],
							["extras\textures\vehicles\rebel_ifrit_1.jpg","extras\textures\vehicles\black.paa"]
						];
					};
				case "O_MRAP_02_F":
					{
					_return =
						[
							["extras\textures\vehicles\rebel_ifrit_1.jpg","extras\textures\vehicles\black.paa"],
							["extras\textures\vehicles\rebel_ifrit_1.jpg","extras\textures\vehicles\black.paa"],
							["extras\textures\vehicles\rebel_ifrit_1.jpg","extras\textures\vehicles\black.paa"]
						];
					};
				case "C_Heli_Light_01_civil_F":
					{
					_return =
						[
							["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_light_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_graywatcher_co.paa"]
						];
					};
				case "B_Plane_CAS_01_F":
					{
					_return =
						[
							["extras\textures\vehicles\newBlue.jpg","extras\textures\vehicles\newBlue.jpg"],
							["extras\textures\vehicles\reb_hellcat2.jpg","extras\textures\vehicles\reb_hellcat2.jpg"],
							["extras\textures\vehicles\rebel_hummingbird.jpg","extras\textures\vehicles\rebel_hummingbird.jpg"],
							["extras\textures\vehicles\wipeoutcockpit_camo.jpg","extras\textures\vehicles\WipeoutWing_camo.jpg"]
						];
					};
				case "I_Plane_Fighter_03_AA_F":
					{
					_return =
						[
							["extras\textures\vehicles\newBlue.jpg","extras\textures\vehicles\newBlue.jpg"],
							["extras\textures\vehicles\reb_hellcat2.jpg","extras\textures\vehicles\reb_hellcat2.jpg"],
							["extras\textures\vehicles\rebel_hummingbird.jpg","extras\textures\vehicles\rebel_hummingbird.jpg"],
							["extras\textures\vehicles\wipeoutcockpit_camo.jpg","extras\textures\vehicles\WipeoutWing_camo.jpg"]
						];
					};
				case "I_Heli_Transport_02_F":
					{
					_return =
						[
							["\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_ion_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_ion_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"],
							["\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_dahoman_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_dahoman_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_dahoman_co.paa"]
						];
					};
				case "C_Hatchback_01_sport_F":
					{
					_return =
						[
							["extras\textures\vehicles\civ_hatchback_sport.jpg"],
							["extras\textures\vehicles\Metallica.jpg"],
							["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa"],
							["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa"],
							["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa"],
							["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"],
							["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"],
							["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa"],
							["extras\textures\vehicles\dsHATCHBACK.jpg"],
							["extras\textures\vehicles\redbullHATCHBACK.jpg"]
						];
					};
				case "B_Truck_01_box_F":
					{
					_return =
						[
							["extras\textures\vehicles\Hemtt_bodyGreenStripe.jpg","extras\textures\vehicles\Hemtt_middleGreenStripe.jpg"],
							["extras\textures\vehicles\Hemtt_bodyCamo.jpg","extras\textures\vehicles\Hemtt_midCamo.jpg"]
						];
					};
				case "I_Truck_02_transport_F":
					{
					_return =
						[
							["extras\textures\vehicles\zamak_frontGray.jpg","extras\textures\vehicles\zamak_backPink.jpg"],
							["extras\textures\vehicles\zamak_frontGray.jpg","extras\textures\vehicles\zamak_frontGray.jpg"],
							["extras\textures\vehicles\Zamak_DS.jpg","extras\textures\vehicles\Zamak_rear.jpg"],
							["\a3\soft_f_beta\Truck_02\data\truck_02_kab_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"]
						];
					};
				case "I_Truck_02_covered_F":
					{
					_return =
						[
							["extras\textures\vehicles\zamak_frontGray.jpg","extras\textures\vehicles\zamak_backPink.jpg"],
							["extras\textures\vehicles\zamak_frontGray.jpg","extras\textures\vehicles\zamak_frontGray.jpg"],
							["extras\textures\vehicles\Zamak_DS.jpg","extras\textures\vehicles\Zamak_rear.jpg"],
							["\a3\soft_f_beta\Truck_02\data\truck_02_kab_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"]
						];
					};
				case "C_Hatchback_01_F":
					{
					_return =
						[
							["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa"],
							["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"],
							["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa"],
							["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa"],
							["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa"],
							["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa"],
							["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa"],
							["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"]
						];
					};
				case "I_Heli_light_03_unarmed_F":
					{
					_return =
						[
							["extras\textures\vehicles\Civ_hellcat.jpg"],
							["extras\textures\vehicles\reb_hellcat2.jpg"]
						];
					};
				case "C_Van_01_box_F":
					{
					_return =
						[
							["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"],
							["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"]
						];
					};
				case "C_Van_01_transport_F":
					{
					_return =
						[
							["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"],
							["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"],
							["\A3\Soft_F_Exp\Van_01\Data\Van_01_ext_oli_co.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa","\A3\Soft_F_Exp\Van_01\Data\Van_01_int_base_3_CO.paa"],
							["\A3\Soft_F_Exp\Van_01\Data\Van_01_ext_brn_co.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa","\A3\Soft_F_Exp\Van_01\Data\Van_01_int_base_2_CO.paa"],
							["\A3\soft_f_gamma\van_01\Data\Van_01_ext_black_CO.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa","\a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"],
							["\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_01_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_01_CO.paa","\a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"],
							["\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_02_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_02_CO.paa","\a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"],
							["\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_03_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_03_CO.paa","\a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"],
							["\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_04_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_04_CO.paa","\a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"],
							["\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_05_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_05_CO.paa","\a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"],
							["\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_06_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_06_CO.paa","\a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"],
							["\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_07_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_07_CO.paa","\a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"],
							["\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_08_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_08_CO.paa","\a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"]
						];
					};
				case "B_Quadbike_01_F":
					{
					_return =
						[
							["\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa"],
							["\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa"],
							["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa"],
							["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa"],
							["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa"],
							["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa"],
							["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa"],
							["\A3\Soft_F_Exp\Quadbike_01\Data\Quadbike_01_ghex_CO.paa","\A3\Soft_F_Exp\Quadbike_01\Data\Quadbike_01_wheel_ghex_CO.paa"],
							["\A3\Soft_F_Bootcamp\Quadbike_01\Data\Quadbike_01_IG_CO.paa","\A3\soft_f_gamma\Quadbike_01\Data\Quadbike_01_wheel_IG_CO.paa"],
							["\A3\Soft_F_Bootcamp\Quadbike_01\Data\Quadbike_01_INDP_Hunter_CO.paa","\A3\soft_f_gamma\Quadbike_01\Data\Quadbike_01_wheel_INDP_Hunter_CO.paa"]
						];
					};
				case "B_Heli_Light_01_F":
					{
					_return =
						[
							["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_light_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_graywatcher_co.paa"],
							["extras\textures\vehicles\rebel_humming2.jpg"],
							["extras\textures\vehicles\rebel_hummingbird.jpg"]
						];
					};
				case "O_Heli_Light_02_unarmed_F":
					{
					_return =
						[
							["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"],
							["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"],
							["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa"],
							["extras\textures\vehicles\ORCADARKSIDE.jpg"]
						];
					};
				case "O_Heli_Light_02_F":
					{
					_return =
						[
							["extras\textures\vehicles\ORCADARKSIDE.jpg"],
							["\A3\Air_F_Heli\Heli_Light_02\Data\Heli_Light_02_ext_OPFOR_V2_CO.paa"],
							["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"],
							["\A3\Air_F\Heli_Light_02\Data\Heli_Light_02_ext_OPFOR_CO.paa"]
						];
					};
				case "B_Heli_Light_01_armed_F":
					{
					_return =
						[
							["extras\textures\vehicles\reb_hellcat2.jpg","extras\textures\vehicles\reb_hellcat2.jpg"],
							["extras\textures\vehicles\rebel_hummingbird.jpg","extras\textures\vehicles\rebel_hummingbird.jpg"]
						];
					};
				};
			}
			else//----------------------------------------------------------------------------CIVILIAN STRING NAMES------------------------------------------------------------------------------
			{
			switch (_className) do
				{
				case "C_Van_01_fuel_F":
					{
					_return =
						[
						"Black",
						"Black V2",
						"Guerilla 1",
						"Guerilla 2",
						"Guerilla 3",
						"Red",
						"Red V2",
						"White",
						"White V2"
						];
					};
				case "B_T_VTOL_01_infantry_F":
					{_return =
						[
						"Civilian"
						];
					};
				case "O_Truck_03_device_F":
					{
					_return =
						[
						"Green Hex"
						];
					};
				case "B_Heli_Transport_01_F":
					{
					_return =
						[
						"Green",
						"Olive",
						"Sand"
						];
					};
				case "O_Truck_02_fuel_F":
					{
					_return =
						[
						"Fuel"
						];
					};
				case "I_MRAP_03_F":
					{
					_return =
						[
						"Green Camo",
						"Gray"
						];
					};
				case "B_T_LSV_01_unarmed_F":
					{
					_return =
						[
						"Black",
						"Dazzle",
						"Olive",
						"Sand"
						];
					};
				case "O_T_LSV_02_unarmed_F":
					{
					_return =
						[
						"Arid",
						"Black",
						"Green Hex"
						];
					};
				case "C_Scooter_Transport_01_F":
					{
					_return =
						[
						"Black",
						"Blue",
						"Grey",
						"Line",
						"Red",
						"White",
						"Yellow"
						];
					};
				case "I_C_Boat_Transport_02_F":
					{
					_return =
						[
							"Civilian"
						];
					};
				case "C_Plane_Civil_01_F":
					{
					_return =
						[
							"Racing",
							"RedLine",
							"Tribal",
							"Blue Wave"
						];
					};
				case "C_Offroad_02_unarmed_F":
					{
					_return =
						[
							"Black",
							"Blue",
							"Brown",
							"Green",
							"Olive",
							"Orange",
							"Red",
							"White"
						];
					};
				case "C_Offroad_01_F":
					{
					_return =
						[
							"Red",
							"Yellow",
							"White",
							"Blue",
							"Dark Red",
							"Blue / White",
							"Farmers Union",
							"The Family",
							"Guerilla 1",
							"Guerilla 2",
							"Guerilla 3",
							"Guerilla 4",
							"Guerilla 5",
							"Guerilla 6",
							"Guerilla 7",
							"Guerilla 8",
							"Guerilla 9",
							"Guerilla 10",
							"Guerilla 11",
							"Guerilla 12"
						];
					};
				case "C_SUV_01_F":
					{
					_return =
						[
							"Dark Red",
							"Silver",
							"Orange",
							"Ferrari",
							"Taxi",
							"Green Camo",
							"Black & Models",
							"Blue Skull"
						];
					};
				case "B_Heli_Transport_01_camo_F":
					{
					_return =
						[
							"Grey Darkside",
							"Green Darkside"
						];
					};
				case "O_Heli_Transport_04_F":
					{
					_return =
						[
							"Grey Darkside",
							"Green Darkside",
							"Blue"
						];
					};
				case "O_Heli_Transport_04_fuel_F":
					{
					_return =
						[
							"Grey Darkside",
							"Green Darkside",
							"Blue"
						];
					};
				case "O_Heli_Transport_04_ammo_F":
					{
					_return =
						[
							"Grey Darkside",
							"Green Darkside",
							"Blue"
						];
					};
				case "B_Heli_Transport_03_unarmed_F":
					{
					_return =
						[
							"Grey Darkside",
							"Green Darkside",
							"Blue"
						];
					};
				case "B_Heli_Transport_03_F":
					{
					_return =
						[
							"Grey Darkside",
							"Green Darkside",
							"Blue"
						];
					};
				case "O_MRAP_02_hmg_F":
					{
					_return =
						[
							"Black",
							"Green Hex",
							"Brown Hex"
						];
					};
				case "O_MRAP_02_F":
					{
					_return =
						[
							"Black",
							"Green Hex",
							"Brown Hex"
						];
					};
				case "C_Heli_Light_01_civil_F":
					{
					_return =
						[
							"Blue",
							"Red",
							"Blueline",
							"Elliptical",
							"Furious",
							"Jeans Blue",
							"Speedy Redline",
							"Sunset",
							"Vrana",
							"Waves Blue",
							"Light",
							"Shadow",
							"Sheriff",
							"Wasp",
							"Graywatcher"
						];
					};
				case "B_Plane_CAS_01_F":
					{
					_return =
						[
							"Blue",
							"Black/Red",
							"Green",
							"Green Camo"
						];
					};
				case "I_Plane_Fighter_03_AA_F":
					{
					_return =
						[
							"Blue",
							"Black/Red",
							"Green",
							"Green Camo"
						];
					};
				case "I_Heli_Transport_02_F":
					{
					_return =
						[
							"Ion",
							"Dahoman"
						];
					};
				case "C_Hatchback_01_sport_F":
					{
					_return =
						[
							"Monster",
							"Metallica",
							"Black/White",
							"Tan",
							"Green",
							"Red",
							"Dark Blue",
							"Orange",
							"Darkside",
							"Red Bull"
						];
					};
				case "B_Truck_01_box_F":
					{
					_return =
						[
							"Green",
							"Camo"
						];
					};
				case "I_Truck_02_transport_F":
					{
					_return =
						[
							"Pink",
							"Black",
							"Darkside",
							"Orange"
						];
					};
				case "I_Truck_02_covered_F":
					{
					_return =
						[
							"Pink",
							"Black",
							"Darkside",
							"Orange"
						];
					};
				case "C_Hatchback_01_F":
					{
					_return =
						[
							"Beige",
							"Green",
							"Blue",
							"Dark Blue",
							"Yellow",
							"White",
							"Grey",
							"Black"
						];
					};
				case "I_Heli_light_03_unarmed_F":
					{
					_return =
						[
							"White & Blue",
							"Darkside"
						];
					};
				case "C_Van_01_box_F":
					{
					_return =
						[
							"White",
							"Red"
						];
					};
				case "C_Van_01_transport_F":
					{
					_return =
						[
							"White",
							"Red",
							"Olive",
							"Brown",
							"Black",
							"Guerrilla 1",
							"Guerrilla 2",
							"Guerrilla 3",
							"Guerrilla 4",
							"Guerrilla 5",
							"Guerrilla 6",
							"Guerrilla 7",
							"Guerrilla 8"
						];
					};
				case "B_Quadbike_01_F":
					{
					_return =
						[
							"Brown",
							"Digi Desert",
							"Black",
							"Blue",
							"Red",
							"White",
							"Digi Green",
							"Green Hex",
							"FIA 1",
							"FIA 2"
						];
					};
				case "B_Heli_Light_01_F":
					{
					_return =
						[
							"Blue",
							"Red",
							"Blueline",
							"Elliptical",
							"Furious",
							"Jeans Blue",
							"Speedy Redline",
							"Sunset",
							"Vrana",
							"Waves Blue",
							"Light",
							"Shadow",
							"Sheriff",
							"Wasp",
							"Graywatcher",
							"Grey Camo",
							"Green Camo"
						];
					};
				case "O_Heli_Light_02_unarmed_F":
					{
					_return =
						[
							"White / Blue",
							"Digi Green",
							"Desert Digi",
							"Grey Camo"
						];
					};
				case "O_Heli_Light_02_F":
					{
					_return =
						[
							"Darkside",
							"Black",
							"Blue",
							"Opfor"
						];
					};
				case "B_Heli_Light_01_armed_F":
					{
					_return =
						[
							"Black Darkside",
							"Green"
						];
					};
				};
			};
		};
	case west:
		{//---------------------------------------------------------------------------------------POLICE--------------------------------------------------------------------------------------
		if(_texture)then
			{
			switch (_className) do
				{
				case "O_Plane_Fighter_02_F":
					{
					_return =
						[
							["extras\textures\vehicles\black.paa","extras\textures\vehicles\black.paa","extras\textures\vehicles\black.paa"]
						];
					};
				case "C_Plane_Civil_01_F":
					{
					_return =
						[
							["extras\textures\vehicles\black.paa","extras\textures\vehicles\black.paa","extras\textures\vehicles\black.paa"]
						];
					};
				case "B_T_LSV_01_unarmed_F":
					{
					_return =
						[
							["extras\textures\vehicles\prowler.jpg","extras\textures\vehicles\prowler.jpg","extras\textures\vehicles\prowler.jpg","extras\textures\vehicles\prowler.jpg"]
						];
					};
				case "O_T_LSV_02_unarmed_F":
					{
					_return =
						[
							["extras\textures\vehicles\qilin.jpg","extras\textures\vehicles\qilin.jpg","extras\textures\vehicles\qilin.jpg","extras\textures\vehicles\qilin.jpg"],
							["extras\textures\vehicles\patrol.jpg","extras\textures\vehicles\patrol.jpg","extras\textures\vehicles\patrol.jpg","extras\textures\vehicles\patrol.jpg"]
						];
					};
				case "O_T_LSV_02_armed_F":
					{
					_return =
						[
							["extras\textures\vehicles\qilin.jpg","extras\textures\vehicles\qilin.jpg","extras\textures\vehicles\qilin.jpg","extras\textures\vehicles\qilin.jpg"],
							["extras\textures\vehicles\patrol.jpg","extras\textures\vehicles\patrol.jpg","extras\textures\vehicles\patrol.jpg","extras\textures\vehicles\patrol.jpg"]
						];
					};
				case "B_T_LSV_01_armed_F":
					{
					_return =
						[
							["extras\textures\vehicles\prowler.jpg","extras\textures\vehicles\prowler.jpg","extras\textures\vehicles\prowler.jpg","extras\textures\vehicles\prowler.jpg"]
						];
					};
				case "I_C_Boat_Transport_02_F":
					{
					_return =
						[
							["extras\textures\vehicles\black.paa"]
						];
					};
				case "C_Scooter_Transport_01_F":
					{
					_return =
						[
							["extras\textures\vehicles\black.paa"]
						];
					};
				case "C_Offroad_02_unarmed_F":
					{
					_return =
						[
							["extras\textures\vehicles\black.paa"]
						];
					};
				case "B_Quadbike_01_F":
					{
					_return =
						[
							["extras\textures\vehicles\black.paa"]
						];
					};
				case "C_Offroad_01_F":
					{
					_return =
						[
							["extras\textures\vehicles\Police_Offroad.jpg"],
							["extras\textures\vehicles\altis_Offroad.jpg"]
						];
					};
				case "C_SUV_01_F":
					{
					_return =
						[
							["extras\textures\vehicles\cop_suv_cruiser.jpg"],
							["extras\textures\vehicles\suv_3_police_co.jpg"]
						];
					};
				case "O_Heli_Transport_04_bench_F":
					{
					_return =
						[
							["extras\textures\vehicles\scorp_hell.jpg","extras\textures\vehicles\pig_hellcat2.jpg"]
						];
					};
				case "O_MRAP_02_F":
					{
					_return =
						[
							["extras\textures\vehicles\ifrit-F.jpg","extras\textures\vehicles\ifrit-b.jpg"]
						];
					};
				case "O_MRAP_02_hmg_F":
					{
					_return =
						[
							["extras\textures\vehicles\ifrit-F.jpg","extras\textures\vehicles\ifrit-b.jpg","extras\textures\vehicles\black.paa","extras\textures\vehicles\black.paa"]
						];
					};
				case "I_MRAP_03_F":
					{
					_return =
						[
							["extras\textures\vehicles\Stryder.jpg"]
						];
					};
				case "B_Heli_Transport_03_black_F":
					{
					_return =
						[
							["extras\textures\vehicles\black.paa","extras\textures\vehicles\black.paa"]
						];
					};
				case "O_Truck_03_ammo_F":
					{
					_return =
						[
							["extras\textures\vehicles\black.paa","extras\textures\vehicles\black.paa","extras\textures\vehicles\black.paa"]
						];
					};
				case "O_Truck_03_repair_F":
					{
					_return =
						[
							["extras\textures\vehicles\black.paa","extras\textures\vehicles\black.paa","extras\textures\vehicles\black.paa"]
						];
					};
				case "O_Truck_03_medical_F":
					{
					_return =
						[
							["extras\textures\vehicles\black.paa","extras\textures\vehicles\black.paa","extras\textures\vehicles\black.paa"]
						];
					};
				case "O_Truck_03_fuel_F":
					{
					_return =
						[
							["extras\textures\vehicles\black.paa","extras\textures\vehicles\black.paa","extras\textures\vehicles\black.paa"]
						];
					};
				case "I_APC_Wheeled_03_cannon_F":
					{
					_return =
						[
							["extras\textures\vehicles\black.paa","extras\textures\vehicles\black.paa","extras\textures\vehicles\black.paa","extras\textures\vehicles\black.paa","extras\textures\vehicles\black.paa"]
						];
					};
				case "O_Plane_CAS_02_F":
					{
					_return =
						[
							["extras\textures\vehicles\pig_hellcat2.jpg","extras\textures\vehicles\pig_hellcat2.jpg"]
						];
					};
				case "C_Hatchback_01_sport_F":
					{
					_return =
						[
							["#(ai,64,64,1)Fresnel(1.3,7)"],
							["extras\textures\vehicles\police_hatchback.jpg"],
							["extras\textures\vehicles\altis_hatchback.jpg"]
						];
					};
				case "O_G_Offroad_01_armed_F":
					{
					_return =
						[
							["extras\textures\vehicles\Police_Offroad.jpg"]
						];
					};
				case "B_MRAP_01_F":
					{
					_return =
						[
							["extras\textures\vehicles\Cop_hunter_1.jpg","extras\textures\vehicles\Cop_hunter_2.jpg"]
						];
					};
				case "B_MRAP_01_hmg_F":
					{
					_return =
						[
							["extras\textures\vehicles\Cop_hunter_1.jpg","extras\textures\vehicles\Cop_hunter_2.jpg","extras\textures\vehicles\black.paa","extras\textures\vehicles\black.paa"]
						];
					};
				case "B_Heli_Light_01_F":
					{
					_return =
						[
							["extras\textures\vehicles\police_heli.jpg"],
							["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa"]
						];
					};
				case "B_Heli_Transport_01_F":
					{
					_return =
						[
							["extras\textures\vehicles\black.paa"],
							["\A3\Air_F_Beta\Heli_Transport_01\Data\Heli_Transport_01_ext01_BLUFOR_CO.paa","\A3\Air_F_Beta\Heli_Transport_01\Data\Heli_Transport_01_ext02_BLUFOR_CO.paa"],
							["\A3\Air_F_Exp\Heli_Transport_01\Data\Heli_Transport_01_ext01_tropic_CO.paa","\A3\Air_F_Exp\Heli_Transport_01\Data\Heli_Transport_01_ext02_tropic_CO.paa"],
							["\A3\Air_F_Exp\Heli_Transport_01\Data\Heli_Transport_01_ext01_sand_CO.paa","\A3\Air_F_Exp\Heli_Transport_01\Data\Heli_Transport_01_ext02_sand_CO.paa"]
						];
					};
				case "I_Heli_light_03_F":
					{
					_return =
						[
							["extras\textures\vehicles\pig_hellcat2.jpg"],
							["extras\textures\vehicles\grey.jpg"]
						];
					};
				case "B_Heli_Light_01_armed_F":
					{
					_return =
						[
							["extras\textures\vehicles\police_heli.jpg"]
						];
					};
				case "C_Heli_Light_01_civil_F":
					{
					_return =
						[
							["extras\textures\vehicles\police_heli.jpg"]
						];
					};
				case "I_MRAP_03_hmg_F":
					{
					_return =
						[
							["extras\textures\vehicles\Stryder.jpg","extras\textures\vehicles\black.paa","extras\textures\vehicles\black.paa"]
						];
					};
				case "O_Heli_Light_02_F":
					{
					_return =
						[
							["extras\textures\vehicles\pig_hellcat2.jpg"]
						];
					};
				};
			}
			else//-----------------------------------------------------------------------------------------POLICE STRINGS--------------------------------------------------------------------
			{
			switch (_className) do
				{
				case "O_Plane_Fighter_02_F":
					{
					_return =
						[
							"Police"
						];
					};
				case "C_Plane_Civil_01_F":
					{
					_return =
						[
							"Police"
						];
					};
				case "B_T_LSV_01_unarmed_F":
					{
					_return =
						[
							"Police"
						];
					};
				case "O_T_LSV_02_unarmed_F":
					{
					_return =
						[
							"Police",
							"Patrol"
						];
					};
				case "O_T_LSV_02_armed_F":
					{
					_return =
						[
							"Police",
							"Patrol"
						];
					};
				case "B_T_LSV_01_armed_F":
					{
					_return =
						[
							"Police"
						];
					};
				case "I_C_Boat_Transport_02_F":
					{
					_return =
						[
							"Police"
						];
					};
				case "C_Scooter_Transport_01_F":
					{
					_return =
						[
							"Police"
						];
					};
				case "C_Offroad_02_unarmed_F":
					{
					_return =
						[
							"Police"
						];
					};
				case "B_Quadbike_01_F":
					{
					_return =
						[
							"Police"
						];
					};
				case "C_Offroad_01_F":
					{
					_return =
						[
							"Police",
							"Police"
						];
					};
				case "C_SUV_01_F":
					{
					_return =
						[
							"Cruiser",
							"Black Cruiser"
						];
					};
				case "O_Heli_Transport_04_bench_F":
					{
					_return =
						[
							"Police"
						];
					};
				case "O_MRAP_02_F":
					{
					_return =
						[
							"Police"
						];
					};
				case "O_MRAP_02_hmg_F":
					{
					_return =
						[
							"Police"
						];
					};
				case "I_MRAP_03_F":
					{
					_return =
						[
							"Police"
						];
					};
				case "B_Heli_Transport_03_black_F":
					{
					_return =
						[
							"Police"
						];
					};
				case "I_APC_Wheeled_03_cannon_F":
					{
					_return =
						[
							"Police"
						];
					};
				case "O_Truck_03_ammo_F":
					{
					_return =
						[
							"Police"
						];
					};
				case "O_Truck_03_repair_F":
					{
					_return =
						[
							"Police"
						];
					};
				case "O_Truck_03_medical_F":
					{
					_return =
						[
							"Police"
						];
					};
				case "O_Truck_03_fuel_F":
					{
					_return =
						[
							"Police"
						];
					};
				case "O_Plane_CAS_02_F":
					{
					_return =
						[
							"Police"
						];
					};
				case "C_Hatchback_01_sport_F":
					{
					_return =
						[
							"Black",
							"Police",
							"Police"
						];
					};
				case "O_G_Offroad_01_armed_F":
					{
					_return =
						[
							"Police"
						];
					};
				case "B_MRAP_01_F":
					{
					_return =
						[
							"Police"
						];
					};
				case "B_MRAP_01_hmg_F":
					{
					_return =
						[
							"Police"
						];
					};
				case "B_Heli_Light_01_F":
					{
					_return =
						[
							"Police",
							"Black"
						];
					};
				case "B_Heli_Transport_01_F":
					{
					_return =
						[
							"Black",
							"Green",
							"Olive",
							"Sand"
						];
					};
				case "I_Heli_light_03_F":
					{
					_return =
						[
							"Swat",
							"Grey"
						];
					};
				case "B_Heli_Light_01_armed_F":
					{
					_return =
						[
							"Police"
						];
					};
				case "C_Heli_Light_01_civil_F":
					{
					_return =
						[
							"Police"
						];
					};
				case "I_MRAP_03_hmg_F":
					{
					_return =
						[
							"Police"
						];
					};
				case "O_Heli_Light_02_F":
					{
					_return =
						[
							"Police"
						];
					};
				};
			};
		};
	case independent:
		{
		if(_texture)then
			{
			switch (_className) do
				{
				case "O_MRAP_02_F":
					{
					_return =
						[
							["extras\textures\vehicles\medic_ifrit_00.jpg","extras\textures\vehicles\medic_ifrit_01.jpg"]
						];
					};
				case "C_SUV_01_F":
					{
					_return =
						[
							["extras\textures\vehicles\med_suv.jpg"],
							["extras\textures\vehicles\black.paa"]
						];
					};
				case "C_Van_01_box_F":
					{
					_return =
						[
							["extras\textures\vehicles\AMBO_Truck_0.jpg","extras\textures\vehicles\AMBO_Truck_1.jpg"],
							["extras\textures\vehicles\black.paa"]
						];
					};
				case "C_Heli_Light_01_civil_F":
					{
					_return =
						[
							["extras\textures\vehicles\medichummingbird.jpg"],
							["extras\textures\vehicles\black.paa"],
							["extras\textures\vehicles\dscheli.jpg","extras\textures\vehicles\security_back.jpg"]
						];
					};
				case "C_Offroad_01_F":
					{
					_return =
						[
							["extras\textures\vehicles\mech_offroad.jpg"],
							["extras\textures\vehicles\black.paa"]
						];
					};
				case "B_Truck_01_mover_F":
					{
					_return =
						[
							["extras\textures\vehicles\Darkside_Mech.jpg","extras\textures\vehicles\ds_hemtt_back.jpg"],
							["extras\textures\vehicles\black.paa"]
						];
					};
				case "C_Hatchback_01_sport_F":
					{
					_return =
						[
							["extras\textures\vehicles\black.paa"],
							["extras\textures\vehicles\DSCHATCHBACK.jpg"]
						];
					};
				case "B_MRAP_01_F":
					{
					_return =
						[
							["extras\textures\vehicles\security_hunter.jpg","extras\textures\vehicles\security_back.jpg"]
						];
					};
				case "B_Heli_Light_01_F":
					{
					_return =
						[
							["extras\textures\vehicles\dscheli.jpg","extras\textures\vehicles\security_back.jpg"]
						];
					};
				case "I_Heli_light_03_unarmed_F":
					{
					_return =
						[
							["extras\textures\vehicles\black.paa","extras\textures\vehicles\black.paa"]
						];
					};
				case "I_MRAP_03_F":
					{
					_return =
						[
							["extras\textures\vehicles\secstrider.jpg"]
						];
					};
				case "O_Heli_Transport_04_F":
					{
					_return =
						[
							["extras\textures\vehicles\black.paa","extras\textures\vehicles\black.paa"],
							["extras\textures\vehicles\mtaru-0.jpg","extras\textures\vehicles\mtaru-1.jpg"]
						];
					};
				};
			}
			else
			{
			switch (_className) do
				{
				case "O_MRAP_02_F":
					{
					_return =
						[
							"Medic"
						];
					};
				case "C_SUV_01_F":
					{
					_return =
						[
							"Medic",
							"Black"
						];
					};
				case "C_Van_01_box_F":
					{
					_return =
						[
							"Medic",
							"Black"
						];
					};
				case "C_Heli_Light_01_civil_F":
					{
					_return =
						[
							"Medic",
							"Black",
							"Security"
						];
					};
				case "C_Offroad_01_F":
					{
					_return =
						[
							"Mechanic",
							"Black"
						];
					};
				case "B_Truck_01_mover_F":
					{
					_return =
						[
							"Mechanic",
							"Black"
						];
					};
				case "C_Hatchback_01_sport_F":
					{
					_return =
						[
							"Black",
							"Security"
						];
					};
				case "B_MRAP_01_F":
					{
					_return =
						[
							"Security"
						];
					};
				case "B_Heli_Light_01_F":
					{
					_return =
						[
							"Security"
						];
					};
				case "I_Heli_light_03_unarmed_F":
					{
					_return =
						[
							"Black"
						];
					};
				case "I_MRAP_03_F":
					{
					_return =
						[
							"Security"
						];
					};
				case "O_Heli_Transport_04_F":
					{
					_return =
						[
							"Black",
							"Mechanic"
						];
					};
				};
			};
		};
	};
_return;