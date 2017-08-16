private ["_vehicle", "_return"];
_vehicle = [_this, 0, "", [""]] call GTA_fnc_param;
if (_vehicle == "") exitWith {[]};

_return = switch _vehicle do {
  //--- Taru
  case "O_Heli_Transport_04_F": {
    [
      ["a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_co.paa", "reb", "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_co.paa"],
      ["a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_black_co.paa", "civ", "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_black_co.paa"]
    ]
  };

  //--- Taru (Bench)
  case "O_Heli_Transport_04_bench_F": {
    [
      ["a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_co.paa", "reb", "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_co.paa"],
      ["a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_black_co.paa", "civ", "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_black_co.paa", "A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_bench_black_CO.paa"]
    ]
  };

  //--- Taru (Pods)
  case "O_Heli_Transport_04_medevac_F";
  case "O_Heli_Transport_04_repair_F";
  case "O_Heli_Transport_04_covered_F";
  case "O_Heli_Transport_04_ammo_F";
  case "O_Heli_Transport_04_box_F": {
    [
      ["a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_co.paa", "reb", "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_co.paa", "a3\air_f_heli\heli_transport_04\data\heli_transport_04_pod_ext01_co.paa", "a3\air_f_heli\heli_transport_04\data\heli_transport_04_pod_ext02_co.paa"],
      ["a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_black_co.paa", "civ", "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_black_co.paa", "a3\air_f_heli\heli_transport_04\data\heli_transport_04_pod_ext01_black_co.paa", "a3\air_f_heli\heli_transport_04\data\heli_transport_04_pod_ext02_black_co.paa"]
    ]
  };

  case "I_Heli_Transport_02_F": {
    [
      ["\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_ion_co.paa", "civ", "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_ion_co.paa", "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"],
      ["\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_dahoman_co.paa", "civ", "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_dahoman_co.paa", "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_dahoman_co.paa"],
      ["#(argb,8,8,3)color(0.05,0.05,0.05,1)", "reb", "#(argb,8,8,3)color(0.05,0.05,0.05,1)", "#(argb,8,8,3)color(0.05,0.05,0.05,1)"],
      ["a3\air_f_beta\heli_transport_02\data\heli_transport_02_1_indp_co.paa", "reb", "a3\air_f_beta\heli_transport_02\data\heli_transport_02_2_indp_co.paa", "a3\air_f_beta\heli_transport_02\data\heli_transport_02_3_indp_co.paa"]
    ]
  };

  case "C_Hatchback_01_sport_F": {
    [
      ["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa", "civ"],
      ["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa", "civ"],
      ["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa", "civ"],
      ["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa", "civ"],
      ["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa", "civ"],
      ["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa", "civ"],
      ["textures\civilian\vehicles\MonsterWRC.paa", "civ"],
      ["textures\civilian\vehicles\RedBullWRC.paa", "civ"],
      ["textures\civilian\vehicles\hatchback_dominos.paa", "auction"],
      ["textures\civilian\vehicles\hatchback_monster2.paa", "auction"],
      ["textures\civilian\vehicles\hatchback_redbull2.paa", "auction"],
      ["textures\civilian\vehicles\hatchback_kfc.paa", "auction"],
      ["textures\civilian\vehicles\hatchback_wrc.paa", "auction"],
      ["textures\paramedic\vehicles\GTA_Paramedic_Hatchback.paa", "med"],
      ["textures\police\vehicles\GTA_Police_Hatchback_RPU.paa", "cop"]
    ]
  };

  case "C_Offroad_01_F": {
    [
      ["\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa", "civ"],
      ["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa", "civ"],
      ["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa", "civ"],
      ["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa", "civ"],
      ["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa", "civ"],
      ["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa", "civ"],
      ["#(argb,8,8,3)color(0.6,0.3,0.01,1)", "civ"],
      ["textures\civilian\vehicles\monsteroffroadbycodon.paa", "civ"],
      ["textures\police\vehicles\GTA_Police_Offroader.paa", "cop"]
    ]
  };

  case "B_G_Offroad_01_F";
  case "B_G_Offroad_01_armed_F": {
    [
      ["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa", "reb", "\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa"],
      ["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa", "reb", "\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa"],
      ["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa", "reb", "\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa"],
      ["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa", "reb", "\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa"],
      ["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa", "reb", "\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa"],
      ["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa", "reb", "\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa"],
      ["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa", "reb", "\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa"],
      ["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa", "reb", "\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa"],
      ["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa", "reb", "\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa"],
      ["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa", "reb", "\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa"],
      ["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa", "reb", "\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa"],
      ["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa", "reb", "\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa"],
      ["textures\military\vehicles\gta_nato_offroad.paa", "mil", "a3\soft_f\offroad_01\data\offroad_01_ext_base05_co.paa"],
      ["#(argb,8,8,3)color(0.05,0.05,0.05,1)", "mil", "\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE05_CO.paa"]
    ]
  };

  case "C_Hatchback_01_F": {
    [
      ["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa", "civ"],
      ["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa", "civ"],
      ["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa", "civ"],
      ["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa", "civ"],
      ["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa", "civ"],
      ["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa", "civ"],
      ["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa", "civ"],
      ["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa", "civ"],
      ["textures\paramedic\vehicles\GTA_Paramedic_Hatchback.paa", "med"],
      ["textures\hato\vehicles\GTA_HATO_Hatchback.paa", "hato"],
      ["textures\police\vehicles\GTA_Police_Hatchback.paa", "cop"]
    ]
  };

  case "C_SUV_01_F": {
    [
      ["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa", "civ"],
      ["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa", "civ"],
      ["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa", "civ"],
      ["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa", "civ"],
      ["textures\paramedic\vehicles\GTA_Paramedic_SUV.paa", "med"],
      ["textures\hato\vehicles\GTA_HATO_SUV.paa", "hato"],
      ["textures\police\vehicles\GTA_Police_SUV_Kavala.paa", "cop"],
      ["textures\police\vehicles\GTA_Police_SUV_Pyrgos.paa", "cop"],
      ["textures\police\vehicles\GTA_Police_SUV_RPU.paa", "cop"],
      ["textures\military\vehicles\gta_nato_suv.paa", "mil"],
      ["textures\civilian\vehicles\suv_taxi.paa", "taxi"],
      ["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa", "press"],
      ["textures\civilian\vehicles\suv_jurassicpark.paa", "auction"],
      ["textures\civilian\vehicles\suv_halloween.paa", "auction"],
      ["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa", "cop"],
      ["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa", "mil"]
    ]
  };

  case "C_Van_01_box_F": {
    [
      ["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa", "civ"],
      ["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa", "civ"],
      ["\A3\soft_f_gamma\van_01\Data\Van_01_ext_black_CO.paa", "auction", "\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa"],
      ["textures\civilian\vehicles\Cream_Truck_Cab.paa", "auction", "textures\civilian\vehicles\Cream_Truck_Back.paa"],
      ["textures\paramedic\vehicles\GTA_Paramedic_Ambulance_Front.paa", "med", "textures\paramedic\vehicles\GTA_Paramedic_Ambulance_Back.paa"]
    ]
  };

  case "C_Van_01_transport_F": {
    [
      ["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa", "civ"],
      ["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa", "civ"],
      ["textures\hato\vehicles\GTA_HATO_ISU_Truck_Flat_Cab.paa", "hato", "textures\hato\vehicles\GTA_HATO_ISU_Truck_Flat_Back.paa"]
    ]
  };

  case "C_Van_01_fuel_F":	{
    [
      ["textures\hato\vehicles\GTA_HATO_ISU_Truck_Flat_Cab.paa", "hato", "textures\hato\vehicles\GTA_HATO_ISU_Truck_Fuel_Back.paa"]
    ]
  };


  case "B_Quadbike_01_F":	{
    [
      ["\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa", "auction"],
      ["\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa", "reb"],
      ["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa", "civ"],
      ["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa", "civ"],
      ["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa", "civ"],
      ["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa", "civ"],
      ["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa", "civ"],
      ["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa", "civ"],
      ["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa", "reb"],
      ["textures\police\vehicles\GTA_Police_Quadbike.paa", "cop"]
    ]
  };

  case "B_Heli_Light_01_F";
  case "C_Heli_Light_01_civil_F":	{
    [
      ["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa", "civ"],
      ["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa", "civ"],
      ["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa", "civ"],
      ["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa", "civ"],
      ["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa", "civ"],
      ["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_graywatcher_co.paa", "civ"],
      ["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa", "civ"],
      ["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_light_co.paa", "civ"],
      ["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa", "civ"],
      ["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa", "civ"],
      ["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa", "civ"],
      ["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa", "civ"],
      ["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa", "auction"],
      ["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa", "civ"],
      ["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa", "reb"],
      ["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa", "reb"],
      ["\a3\Air_F\Heli_Light_01\Data\Heli_Light_01_ext_Blufor_CO.paa", "mil"],
      ["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa", "mil"],
      ["textures\police\vehicles\GTA_Police_Hummingbird.paa", "cop"],
      ["textures\paramedic\vehicles\GTA_Paramedic_M900.paa", "med"]
    ]
  };

  case "O_Heli_Light_02_unarmed_F": {
    [
      ["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa", "reb"],
      ["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa", "civ"],
      ["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa", "reb"],
      ["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa", "reb"],
      ["textures\paramedic\vehicles\GTA_Paramedic_HEMS_Chopper.paa", "med"]
    ]
  };

  case "B_MRAP_01_F";
  case "B_MRAP_01_hmg_F":	{
    [
      ["textures\police\vehicles\GTA_Police_Hunter_TFU_Cab.paa", "cop", "textures\police\vehicles\GTA_Police_Hunter_TFU_Back.paa"],
      ["\A3\soft_F\MRAP_01\data\MRAP_01_base_CO.paa", "mil", "\A3\soft_F\MRAP_01\data\MRAP_01_adds_CO.paa", "\A3\Data_F\Vehicles\Turret_CO.paa"]
    ]
  };

  case "I_MRAP_03_F";
  case "I_MRAP_03_hmg_F": {
    [
      ["a3\soft_f_beta\mrap_03\data\mrap_03_ext_indp_co.paa", "civ", "a3\data_f\vehicles\turret_indp_co.paa"],
      ["\A3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa", "mil", "\A3\data_f\vehicles\turret_co.paa"]
    ]
  };

  case "O_MRAP_02_F": {
    [
      ["a3\soft_f\MRAP_02\data\mrap_02_ext_01_co.paa", "reb", "a3\soft_f\MRAP_02\data\mrap_02_ext_02_co.paa", "#(rgb,8,8,3)color(0,0,0,1)"],
      ["#(rgb,8,8,3)color(0.09,0.09,0.09,1)", "reb", "#(rgb,8,8,3)color(0.09,0.09,0.09,1)", "#(rgb,8,8,3)color(0.09,0.09,0.09,1)"],
      ["#(argb,8,8,3)color(0.05,0.05,0.05,1)", "reb", "#(argb,8,8,3)color(0.05,0.05,0.05,1)", "#(rgb,8,8,3)color(0,0,0,1)"],
      ["#(rgb,8,8,3)color(0,0.1,0.5,1)", "reb", "#(rgb,8,8,3)color(0,0,0,1)", "#(rgb,8,8,3)color(0,0,0,1)"],
      ["#(rgb,8,8,3)color(0.01,0.02,0.27,1)", "reb", "#(rgb,8,8,3)color(0,0,0,1)", "#(rgb,8,8,3)color(0,0,0,1)"],
      ["#(rgb,8,8,3)color(0.43,0.72,0,1)", "reb", "#(rgb,8,8,3)color(0,0,0,1)", "#(rgb,8,8,3)color(0,0,0,1)"],
      ["#(rgb,8,8,3)color(0.96,0.25,0.01,1)", "reb", "#(rgb,8,8,3)color(0,0,0,1)", "#(rgb,8,8,3)color(0,0,0,1)"],
      ["#(rgb,8,8,3)color(0.63,0.01,0,1)", "reb", "#(rgb,8,8,3)color(0,0,0,1)", "#(rgb,8,8,3)color(0,0,0,1)"],
      ["#(rgb,8,8,3)color(0.1,0.09,0.05,1)", "reb", "#(rgb,8,8,3)color(0,0,0,1)", "#(rgb,8,8,3)color(0,0,0,1)"],
      ["#(rgb,8,8,3)color(1,1,1,1)", "reb", "#(rgb,8,8,3)color(0,0,0,1)", "#(rgb,8,8,3)color(0,0,0,1)"],
      ["#(rgb,8,8,3)color(0.3,0.3,0.17,1)", "reb", "#(rgb,8,8,3)color(0,0,0,1)", "#(rgb,8,8,3)color(0,0,0,1)"],
      ["#(rgb,8,8,3)color(0.1,0.1,0.1,1)", "reb", "#(rgb,8,8,3)color(0,0,0,1)", "#(rgb,8,8,3)color(0,0,0,1)"],
      ["#(rgb,8,8,3)color(0.42,0.427,0.361,0.2)", "reb", "#(rgb,8,8,3)color(0,0,0,1)", "#(rgb,8,8,3)color(0,0,0,1)"]
    ]
  };

  case "I_Truck_02_covered_F": {
    [
      ["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa", "civ", "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
      ["textures\police\vehicles\GTA_Police_Zamak_Cab.paa", "cop", "textures\police\vehicles\GTA_Police_Zamak_Back.paa"],
      ["textures\civilian\vehicles\zamak_redbull_front.paa", "auction", "textures\civilian\vehicles\zamak_redbull_back.paa"],
      ["#(argb,8,8,3)color(0.39,0,0,1)", "civ", "#(argb,8,8,3)color(0.03,0.03,0.03,1)"],
      ["#(argb,8,8,3)color(0.12,0.02,0.14,1)", "civ", "#(argb,8,8,3)color(0.03,0.03,0.03,1)"],
      ["#(argb,8,8,3)color(0,0.03,0.22,1)", "civ", "#(argb,8,8,3)color(0.03,0.03,0.03,1)"],
      ["#(argb,8,8,3)color(0.19,0.19,0,1)", "civ", "#(argb,8,8,3)color(0.03,0.03,0.03,1)"],
      ["#(argb,8,8,3)color(0,0.19,0.1,1)", "civ", "#(argb,8,8,3)color(0.03,0.03,0.03,1)"],
      ["textures\hato\vehicles\GTA_HATO_ISU_Zamak_Cab.paa", "hato", "textures\hato\vehicles\GTA_HATO_ISU_Zamak_Back.paa"]
    ]
  };

  case "I_Truck_02_transport_F": {
    [
      ["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa", "civ", "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
      ["#(argb,8,8,3)color(0.05,0.05,0.05,1)", "cop", "#(argb,8,8,3)color(0.09,0.09,0.09,1)"],
      ["#(argb,8,8,3)color(0.39,0,0,1)", "civ", "#(argb,8,8,3)color(0.03,0.03,0.03,1)"],
      ["#(argb,8,8,3)color(0.12,0.02,0.14,1)", "civ", "#(argb,8,8,3)color(0.03,0.03,0.03,1)"],
      ["#(argb,8,8,3)color(0,0.03,0.22,1)", "civ", "#(argb,8,8,3)color(0.03,0.03,0.03,1)"],
      ["#(argb,8,8,3)color(0.19,0.19,0,1)", "civ", "#(argb,8,8,3)color(0.03,0.03,0.03,1)"],
      ["#(argb,8,8,3)color(0,0.19,0.1,1)", "civ", "#(argb,8,8,3)color(0.03,0.03,0.03,1)"]
    ]
  };

  case "I_Heli_light_03_unarmed_F": {
    [
      ["\A3\Air_F_EPB\Heli_Light_03\data\Heli_Light_03_base_INDP_CO.paa", "reb"],
      ["textures\police\vehicles\GTA_Police_HC_I99.paa", "cop"],
      ["\A3\Air_F_EPB\Heli_Light_03\data\heli_light_03_base_co.paa", "reb"],
      ["textures\military\vehicles\gta_nato_hellcat.paa", "mil"]
    ]
  };

  case "B_Truck_01_ammo_F": {
    [
      ["textures\civilian\vehicles\hemtt_cab_industrial.paa", "civ", "textures\civilian\vehicles\hemtt_engine_industrial.paa", "#(rgb,8,8,3)color(0.08,0.08,0.08,1)"],
      ["textures\civilian\vehicles\hemtt_cab_green.paa", "reb", "#(rgb,8,8,3)color(0.22,0.235,0.133,0.55)", "#(rgb,8,8,3)color(0.22,0.235,0.133,0.55)"],
      ["\a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa", "mil", "\a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa", "\A3\Soft_F_Gamma\Truck_01\Data\truck_01_ammo_CO.paa"]
    ]
  };

  case "B_Truck_01_box_F": {
    [
      ["textures\civilian\vehicles\hemtt_cab_industrial.paa", "civ", "textures\civilian\vehicles\hemtt_engine_industrial.paa", "#(rgb,8,8,3)color(0.08,0.08,0.08,1)"],
      ["textures\civilian\vehicles\hemtt_cab_green.paa", "reb", "#(rgb,8,8,3)color(0.22,0.235,0.133,0.55)", "#(rgb,8,8,3)color(0.22,0.235,0.133,0.55)"],
      ["\a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa", "mil", "\a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa", "\A3\Soft_F_Gamma\Truck_01\Data\truck_01_ammo_CO.paa"]
    ]
  };

  case "B_Heli_Transport_03_unarmed_F": {
    [
      ["\A3\Air_F_Heli\Heli_Transport_03\Data\Heli_Transport_03_ext01_black_CO.paa", "reb", "\a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext02_black_co.paa"],
      ["\a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext01_co.paa", "mil", "\a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext02_co.paa"]
    ]
  };

  case "C_Offroad_01_repair_F": {
    [
      ["textures\hato\vehicles\GTA_HATO_RepairOffroader.paa", "hato"]
    ]
  };

  case "I_Truck_02_box_F": {
    [
      ["textures\hato\vehicles\GTA_HATO_ISU_ZamakRepair_Cab.paa", "hato", "textures\hato\vehicles\GTA_HATO_ISU_ZamakRepair_Back.paa"]
    ]
  };

  case "I_UGV_01_F": {
    [
      ["textures\hato\vehicles\GTA_HATO_MCU_Stomper_0.paa", "hato", "textures\hato\vehicles\GTA_HATO_MCU_Stomper_1.paa"]
    ]
  };

  case "O_Boat_Armed_01_hmg_F": {
    [
      ["\A3\boat_f\Boat_Armed_01\data\Boat_Armed_01_ext_co.paa", "mil", "\A3\boat_f\Boat_Armed_01\data\Boat_Armed_01_int_co.paa", "\A3\boat_f\Boat_Armed_01\data\Boat_Armed_01_crows_blufor_co.paa"]
    ]
  };

  case "B_Heli_Attack_01_F": {
    [
      ["A3\Air_F\Heli_Light_02\Data\heli_light_02_common_co.paa", "mil"]
    ]
  };

  default {[]};
};

_return
