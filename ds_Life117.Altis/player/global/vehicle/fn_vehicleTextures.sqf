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
							["extras\textures\vehicles\TF.jpg"]
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
							["extras\textures\vehicles\scorp_hell.jpg","extras\textures\vehicles\scorp_hell.jpg"],
							["extras\textures\vehicles\reb_hellcat2.jpg","extras\textures\vehicles\reb_hellcat2.jpg"],
							["extras\textures\vehicles\rebel_hummingbird.jpg","extras\textures\vehicles\rebel_hummingbird.jpg"]
						];
					};
				case "O_Heli_Transport_04_F":
					{
					_return =
						[
							["extras\textures\vehicles\scorp_hell.jpg","extras\textures\vehicles\scorp_hell.jpg"],
							["extras\textures\vehicles\reb_hellcat2.jpg","extras\textures\vehicles\reb_hellcat2.jpg"],
							["extras\textures\vehicles\rebel_hummingbird.jpg","extras\textures\vehicles\rebel_hummingbird.jpg"],
							["extras\textures\vehicles\newBlue.jpg","extras\textures\vehicles\newBlue.jpg"]
						];
					};
				case "O_Heli_Transport_04_fuel_F":
					{
					_return =
						[
							["extras\textures\vehicles\scorp_hell.jpg","extras\textures\vehicles\scorp_hell.jpg"],
							["extras\textures\vehicles\reb_hellcat2.jpg","extras\textures\vehicles\reb_hellcat2.jpg"],
							["extras\textures\vehicles\rebel_hummingbird.jpg","extras\textures\vehicles\rebel_hummingbird.jpg"],
							["extras\textures\vehicles\newBlue.jpg","extras\textures\vehicles\newBlue.jpg"]
						];
					};
				case "O_Heli_Transport_04_ammo_F":
					{
					_return =
						[
							["extras\textures\vehicles\scorp_hell.jpg","extras\textures\vehicles\scorp_hell.jpg"],
							["extras\textures\vehicles\reb_hellcat2.jpg","extras\textures\vehicles\reb_hellcat2.jpg"],
							["extras\textures\vehicles\rebel_hummingbird.jpg","extras\textures\vehicles\rebel_hummingbird.jpg"],
							["extras\textures\vehicles\newBlue.jpg","extras\textures\vehicles\newBlue.jpg"]
						];
					};
				case "B_Heli_Transport_03_unarmed_F":
					{
					_return =
						[
							["extras\textures\vehicles\scorp_hell.jpg","extras\textures\vehicles\scorp_hell.jpg"],
							["extras\textures\vehicles\reb_hellcat2.jpg","extras\textures\vehicles\reb_hellcat2.jpg"],
							["extras\textures\vehicles\rebel_hummingbird.jpg","extras\textures\vehicles\rebel_hummingbird.jpg"],
							["extras\textures\vehicles\newBlue.jpg","extras\textures\vehicles\newBlue.jpg"]
						];
					};
				case "B_Heli_Transport_03_F":
					{
					_return =
						[
							["extras\textures\vehicles\scorp_hell.jpg","extras\textures\vehicles\scorp_hell.jpg"],
							["extras\textures\vehicles\reb_hellcat2.jpg","extras\textures\vehicles\reb_hellcat2.jpg"],
							["extras\textures\vehicles\rebel_hummingbird.jpg","extras\textures\vehicles\rebel_hummingbird.jpg"],
							["extras\textures\vehicles\newBlue.jpg","extras\textures\vehicles\newBlue.jpg"]
						];
					};
				case "O_MRAP_02_hmg_F":
					{
					_return =
						[
							["extras\textures\vehicles\rebel_ifrit_1.jpg","extras\textures\vehicles\black.paa"]
						];
					};
				case "O_MRAP_02_F":
					{
					_return =
						[
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
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"]
						];
					};
				case "B_Plane_CAS_01_F":
					{
					_return =
						[
							["extras\textures\vehicles\newBlue.jpg","extras\textures\vehicles\newBlue.jpg"],
							["extras\textures\vehicles\reb_hellcat2.jpg","extras\textures\vehicles\reb_hellcat2.jpg"],
							["extras\textures\vehicles\rebel_hummingbird.jpg","extras\textures\vehicles\rebel_hummingbird.jpg"],
							["extras\textures\vehicles\wipeoutcockpit_camo.jpg","extras\textures\vehicles\WipeoutWing_camo.jpg"],
							["extras\textures\vehicles\scorp_hell.jpg","extras\textures\vehicles\scorp_hell.jpg"]
						];
					};
				case "I_Plane_Fighter_03_AA_F":
					{
					_return =
						[
							["extras\textures\vehicles\newBlue.jpg","extras\textures\vehicles\newBlue.jpg"],
							["extras\textures\vehicles\reb_hellcat2.jpg","extras\textures\vehicles\reb_hellcat2.jpg"],
							["extras\textures\vehicles\rebel_hummingbird.jpg","extras\textures\vehicles\rebel_hummingbird.jpg"],
							["extras\textures\vehicles\wipeoutcockpit_camo.jpg","extras\textures\vehicles\WipeoutWing_camo.jpg"],
							["extras\textures\vehicles\scorp_hell.jpg","extras\textures\vehicles\scorp_hell.jpg"]
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
							["extras\textures\vehicles\dragon_hatchback_sport.jpg"],
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
							["extras\textures\vehicles\Zamak_DS.jpg","extras\textures\vehicles\Zamak_rear.jpg"]
						];
					};
				case "I_Truck_02_covered_F":
					{
					_return =
						[
							["extras\textures\vehicles\zamak_frontGray.jpg","extras\textures\vehicles\zamak_backPink.jpg"],
							["extras\textures\vehicles\zamak_frontGray.jpg","extras\textures\vehicles\zamak_frontGray.jpg"],
							["extras\textures\vehicles\Zamak_DS.jpg","extras\textures\vehicles\Zamak_rear.jpg"]
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
							["extras\textures\vehicles\reb_hellcat2.jpg"],
							["extras\textures\vehicles\scorp_hell.jpg"]
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
							["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"]
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
							["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa"]
						];
					};
				case "B_Heli_Light_01_F":
					{
					_return =
						[
							["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"],
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
							["extras\textures\vehicles\ORCADARKSIDE.jpg"]
						];
					};
				case "B_Heli_Light_01_armed_F":
					{
					_return =
						[
							["extras\textures\vehicles\scorp_hell.jpg","extras\textures\vehicles\scorp_hell.jpg"],
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
							"The Family"
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
							"Black Darkside",
							"Grey Darkside",
							"Green Darkside"
						];
					};
				case "O_Heli_Transport_04_F":
					{
					_return =
						[
							"Black Darkside",
							"Grey Darkside",
							"Green Darkside",
							"Blue"
						];
					};
				case "O_Heli_Transport_04_fuel_F":
					{
					_return =
						[
							"Black Darkside",
							"Grey Darkside",
							"Green Darkside",
							"Blue"
						];
					};
				case "O_Heli_Transport_04_ammo_F":
					{
					_return =
						[
							"Black Darkside",
							"Grey Darkside",
							"Green Darkside",
							"Blue"
						];
					};
				case "B_Heli_Transport_03_unarmed_F":
					{
					_return =
						[
							"Black Darkside",
							"Grey Darkside",
							"Green Darkside",
							"Blue"
						];
					};
				case "B_Heli_Transport_03_F":
					{
					_return =
						[
							"Black Darkside",
							"Grey Darkside",
							"Green Darkside",
							"Blue"
						];
					};
				case "O_MRAP_02_hmg_F":
					{
					_return =
						[
							"Rebel"
						];
					};
				case "O_MRAP_02_F":
					{
					_return =
						[
							"Rebel"
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
							"Waves Blue"
						];
					};
				case "B_Plane_CAS_01_F":
					{
					_return =
						[
							"Blue",
							"Black/Red",
							"Green",
							"Green Camo",
							"Darkside"
						];
					};
				case "I_Plane_Fighter_03_AA_F":
					{
					_return =
						[
							"Blue",
							"Black/Red",
							"Green",
							"Green Camo",
							"Darkside"
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
							"Day Z",
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
							"Orange",
							"Black",
							"Darkside"
						];
					};
				case "I_Truck_02_covered_F":
					{
					_return =
						[
							"Orange",
							"Black",
							"Darkside"
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
							"Darkside",
							"Scorp"
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
							"Red"
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
							"Digi Green"
						];
					};
				case "B_Heli_Light_01_F":
					{
					_return =
						[
							"Blue",
							"Red",
							"Digi Green",
							"Blueline",
							"Elliptical",
							"Furious",
							"Jeans Blue",
							"Speedy Redline",
							"Sunset",
							"Vrana",
							"Blue Waves",
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
							"Darkside"
						];
					};
				case "O_Heli_Light_02_F":
					{
					_return =
						[
							"Black Darkside",
							"Grey Darkside",
							"Green Darkside"
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
				case "C_Offroad_01_F":
					{
					_return =
						[
							["extras\textures\vehicles\Police_Offroad.jpg"]
						];
					};
				case "C_SUV_01_F":
					{
					_return =
						[
							["extras\textures\vehicles\cop_suv_cruiser.paa"],
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
				case "I_APC_Wheeled_03_cannon_F":
					{
					_return =
						[
							["extras\textures\vehicles\black.paa","extras\textures\vehicles\black.paa"]
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
							["extras\textures\vehicles\police_hatchback.jpg"]
						];
					};
				case "O_G_Offroad_01_armed_F":
					{
					_return =
						[
							["extras\textures\vehicles\Police_Offroad.jpg"],
							["extras\textures\vehicles\cop_offroad.paa"]
						];
					};
				case "B_MRAP_01_F":
					{
					_return =
						[
							["extras\textures\vehicles\Cop_hunter_1.jpg"]
						];
					};
				case "B_MRAP_01_hmg_F":
					{
					_return =
						[
							["extras\textures\vehicles\Cop_hunter_1.jpg"]
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
							["extras\textures\vehicles\swatghosthawk.paa"]
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
				case "I_MRAP_03_hmg_F":
					{
					_return =
						[
							["extras\textures\vehicles\Stryder.jpg"]
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
				case "C_Offroad_01_F":
					{
					_return =
						[
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
							"Police"
						];
					};
				case "O_G_Offroad_01_armed_F":
					{
					_return =
						[
							"Police",
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
							"Swat"
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