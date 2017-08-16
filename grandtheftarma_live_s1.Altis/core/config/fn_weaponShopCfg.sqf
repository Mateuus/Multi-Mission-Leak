private ["_shop", "_return"];
_shop = [_this, 0, "", [""]] call GTA_fnc_param;
if (_shop == "") exitWith {closeDialog 0};
_return = ["Shop", []];

switch _shop do {
  case "cop_basic": {
    if !([] call GTA_fnc_isCop) exitWith {"You are not a member of APC"};

    (_return select 1) pushBack ["ItemMap", nil, 0];
    (_return select 1) pushBack ["ItemGPS", nil, 0];
    (_return select 1) pushBack ["ItemCompass", nil, 0];
    (_return select 1) pushBack ["ItemWatch", nil, 0];
    (_return select 1) pushBack ["ItemRadio", nil, 0];
    (_return select 1) pushBack ["ToolKit", nil, 0];
    (_return select 1) pushBack ["NVGoggles_OPFOR", nil, 0];
    (_return select 1) pushBack ["FirstAidKit", nil, 0];
    (_return select 1) pushBack ["Binocular", nil, 0];
	  (_return select 1) pushBack ["Rangefinder", nil, 0];

    if (["GTA_copRank"] call GTA_fnc_const >= 7) then {
      (_return select 1) pushBack ["Chemlight_blue", nil, 0];
      (_return select 1) pushBack ["SmokeShellBlue", nil, 0];
    };

    //--- Taser
    (_return select 1) pushBack ["hgun_Pistol_heavy_01_snds_F", "Taser", 0];
    (_return select 1) pushBack ["11Rnd_45ACP_Mag", nil, 0];
    (_return select 1) pushBack ["optic_MRD", nil, 0];

    if (["GTA_copRank"] call GTA_fnc_const >= 2) then {
      //--- Stun gun
      (_return select 1) pushBack ["SMG_02_ACO_F", "Stun Gun", 0];
      (_return select 1) pushBack ["30Rnd_9x21_Mag", nil, 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 3) then {
      //--- P07 9 mm
      (_return select 1) pushBack ["hgun_P07_F", nil, 0];
      (_return select 1) pushBack ["16Rnd_9x21_Mag", nil, 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 6) then {
      //--- Zubr
      (_return select 1) pushBack ["hgun_Pistol_heavy_02_F", nil, 0];
      (_return select 1) pushBack ["6Rnd_45ACP_Cylinder", nil, 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 3) then {
      //--- Sting
      (_return select 1) pushBack ["SMG_02_F", nil, 0];

      //--- PDW
      (_return select 1) pushBack ["hgun_PDW2000_F", nil, 0];
      (_return select 1) pushBack ["30Rnd_9x21_Mag", nil, 0];

      //--- Vermin
      (_return select 1) pushBack ["SMG_01_F", nil, 0];
      (_return select 1) pushBack ["30Rnd_45ACP_Mag_SMG_01", nil, 0];

      //--- TRG
      (_return select 1) pushBack ["arifle_TRG20_F", nil, 0];
      (_return select 1) pushBack ["arifle_TRG21_F", nil, 0];

      //--- MK20
      (_return select 1) pushBack ["arifle_Mk20C_plain_F", nil, 0];
      (_return select 1) pushBack ["arifle_Mk20_plain_F", nil, 0];
      (_return select 1) pushBack ["30Rnd_556x45_Stanag", nil, 0];

      //--- SDAR
      (_return select 1) pushBack ["arifle_SDAR_F", nil, 0];
      (_return select 1) pushBack ["20Rnd_556x45_UW_mag", nil, 0];
    };

    //--- MX
    if (["GTA_copRank"] call GTA_fnc_const >= 4) then {

      (_return select 1) pushBack ["arifle_MXC_Black_F", nil, 0];
      (_return select 1) pushBack ["arifle_MXC_F", nil, 0];
      (_return select 1) pushBack ["arifle_MX_Black_F", nil, 0];
      (_return select 1) pushBack ["arifle_MX_F", nil, 0];

    };

    if (["GTA_copRank"] call GTA_fnc_const >= 7 || {license_cop_dmt}) then {
      (_return select 1) pushBack ["arifle_MXM_Black_F", nil, 0];
      (_return select 1) pushBack ["arifle_MXM_F", nil, 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 4 || {license_cop_dmt}) then {
      (_return select 1) pushBack ["30Rnd_65x39_caseless_mag", nil, 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 8) then {
      //--- MX SW
      (_return select 1) pushBack ["arifle_MX_SW_Black_F", nil, 0];
      (_return select 1) pushBack ["arifle_MX_SW_F", nil, 0];
      (_return select 1) pushBack ["100Rnd_65x39_caseless_mag", nil, 0];
      (_return select 1) pushBack ["100Rnd_65x39_caseless_mag_Tracer", nil, 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 5) then {
      //--- Katiba
      (_return select 1) pushBack ["arifle_Katiba_C_F", nil, 0];
      (_return select 1) pushBack ["arifle_Katiba_F", nil, 0];
      (_return select 1) pushBack ["30Rnd_65x39_caseless_green", nil, 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 9 || {license_cop_dmt}) then {
      //--- MK14
      (_return select 1) pushBack ["srifle_DMR_06_olive_F", nil, 0];

      //--- Mk-1 EMR
      (_return select 1) pushBack ["srifle_DMR_03_F", nil, 0];

      //--- Mk18
      (_return select 1) pushBack ["srifle_EBR_F", nil, 0];
      (_return select 1) pushBack ["20Rnd_762x51_Mag", nil, 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 10) then {
      //--- ASP-1 Kir
      (_return select 1) pushBack ["srifle_DMR_04_F", nil, 0];
      (_return select 1) pushBack ["10Rnd_127x54_Mag", nil, 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 10 || {license_cop_dmt}) then {
      //--- Mar-10
      (_return select 1) pushBack ["srifle_DMR_02_F", nil, 0];
      (_return select 1) pushBack ["10Rnd_338_Mag", nil, 0];

      //--- Cyrus
      (_return select 1) pushBack ["srifle_DMR_05_blk_F", nil, 0];
      (_return select 1) pushBack ["10Rnd_93x64_DMR_05_Mag", nil, 0];
    };

    //--- Optics
    if (["GTA_copRank"] call GTA_fnc_const >= 3 || {license_cop_dmt}) then {
      (_return select 1) pushBack ["optic_ACO", nil, 0];
      (_return select 1) pushBack ["optic_Aco_smg", nil, 0];
      (_return select 1) pushBack ["optic_ACO_grn", nil, 0];
      (_return select 1) pushBack ["optic_ACO_grn_smg", nil, 0];
      (_return select 1) pushBack ["optic_Holosight", nil, 0];
      (_return select 1) pushBack ["optic_Holosight_smg", nil, 0];
      (_return select 1) pushBack ["optic_MRCO", nil, 0];
      (_return select 1) pushBack ["optic_Arco", nil, 0];
      (_return select 1) pushBack ["optic_Hamr", nil, 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 6 || {license_cop_dmt}) then {
      (_return select 1) pushBack ["optic_NVS", nil, 0];
      (_return select 1) pushBack ["optic_DMS", nil, 0];
      (_return select 1) pushBack ["optic_SOS", nil, 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 7 || {license_cop_dmt}) then {
      (_return select 1) pushBack ["optic_AMS", nil, 0];
      (_return select 1) pushBack ["optic_KHS_old", nil, 0];
      (_return select 1) pushBack ["optic_KHS_blk", nil, 0];
      (_return select 1) pushBack ["optic_LRPS", nil, 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 2) then {
      //--- Muzzles 9mm
      (_return select 1) pushBack ["muzzle_snds_L", nil, 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 3) then {
      //--- Muzzles .45 ACP
      (_return select 1) pushBack ["muzzle_snds_acp", nil, 0];

      //--- Muzzles 5.56
      (_return select 1) pushBack ["muzzle_snds_M", nil, 0];
    };

    //--- Muzzles 6.5
    if (["GTA_copRank"] call GTA_fnc_const >= 4 || {license_cop_dmt}) then {
      (_return select 1) pushBack ["muzzle_snds_H", nil, 0];
    };

    //--- Muzzles 7.62
    if (["GTA_copRank"] call GTA_fnc_const >= 9 || {license_cop_dmt}) then {
      (_return select 1) pushBack ["muzzle_snds_B", nil, 0];
    };

    //--- Bipod
    if (["GTA_copRank"] call GTA_fnc_const >= 6 || {license_cop_dmt}) then {
      (_return select 1) pushBack ["bipod_01_F_blk", nil, 0];
    };

    //--- Attachments
    if (["GTA_copRank"] call GTA_fnc_const >= 3) then {
      (_return select 1) pushBack ["acc_flashlight", nil, 0];
      (_return select 1) pushBack ["acc_pointer_IR", nil, 0];
    };
  };

  case "cop_safe": {
    if (playerSide != west) exitWith {"You are not a member of the APC"};

    //--- Rook 40 (9 mm pistol)
    (_return select 1) pushBack ["hgun_Rook40_F", nil, 0];
    (_return select 1) pushBack ["16Rnd_9x21_Mag", nil, 0];

    //--- Zubr
    if (["GTA_copRank"] call GTA_fnc_const >= 5) then {(_return select 1) pushBack ["hgun_Pistol_heavy_02_F", nil, 0]};
    if (["GTA_copRank"] call GTA_fnc_const >= 5) then {(_return select 1) pushBack ["6Rnd_45ACP_Cylinder", nil, 0]};

    //--- Sting
    (_return select 1) pushBack ["SMG_02_F", nil, 0];
    (_return select 1) pushBack ["30Rnd_9x21_Mag", nil, 0];

    //--- Vermin
    (_return select 1) pushBack ["SMG_01_F", nil, 0];
    (_return select 1) pushBack ["30Rnd_45ACP_Mag_SMG_01", nil, 0];

    //--- PDW
    (_return select 1) pushBack ["hgun_PDW2000_F", nil, 0];
    (_return select 1) pushBack ["30Rnd_9x21_Mag", nil, 0];

    if (["GTA_copRank"] call GTA_fnc_const >= 3) then {

    //--- TRG
    (_return select 1) pushBack ["arifle_TRG20_F", nil, 0];
    (_return select 1) pushBack ["arifle_TRG21_F", nil, 0];

    //--- MK20
    (_return select 1) pushBack ["arifle_Mk20C_plain_F", nil, 0];
    (_return select 1) pushBack ["arifle_Mk20_plain_F", nil, 0];
    (_return select 1) pushBack ["30Rnd_556x45_Stanag", nil, 0];

    //--- SDAR
    (_return select 1) pushBack ["arifle_SDAR_F", nil, 0];
    (_return select 1) pushBack ["20Rnd_556x45_UW_mag", nil, 0];

    //--- MX
    (_return select 1) pushBack ["arifle_MXC_Black_F", nil, 0];
    (_return select 1) pushBack ["arifle_MXC_F", nil, 0];
    (_return select 1) pushBack ["arifle_MX_Black_F", nil, 0];
    (_return select 1) pushBack ["arifle_MX_F", nil, 0];

    };

    if (["GTA_copRank"] call GTA_fnc_const >= 5) then {
      (_return select 1) pushBack ["arifle_MXM_Black_F", nil, 0];
      (_return select 1) pushBack ["arifle_MXM_F", nil, 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 3) then {
      (_return select 1) pushBack ["30Rnd_65x39_caseless_mag", nil, 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 6) then {
      //--- MX SW
      (_return select 1) pushBack ["arifle_MX_SW_Black_F", nil, 0];
      (_return select 1) pushBack ["arifle_MX_SW_F", nil, 0];
      (_return select 1) pushBack ["100Rnd_65x39_caseless_mag", nil, 0];
      (_return select 1) pushBack ["100Rnd_65x39_caseless_mag_Tracer", nil, 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 4) then {
      //--- Katiba
      (_return select 1) pushBack ["arifle_Katiba_C_F", nil, 0];
      (_return select 1) pushBack ["arifle_Katiba_F", nil, 0];
      (_return select 1) pushBack ["30Rnd_65x39_caseless_green", nil, 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 6) then {
      //--- MK14
      (_return select 1) pushBack ["srifle_DMR_06_olive_F", nil, 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 7) then {
      //--- Mk-1 EMR
      (_return select 1) pushBack ["srifle_DMR_03_F", nil, 0];

      //--- MK18
      (_return select 1) pushBack ["srifle_EBR_F", nil, 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 6) then {
      (_return select 1) pushBack ["20Rnd_762x51_Mag", nil, 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 8) then {
      //--- ASP-1 Kir
      (_return select 1) pushBack ["srifle_DMR_04_F", nil, 0];
      (_return select 1) pushBack ["10Rnd_127x54_Mag", nil, 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 9) then {
      //--- MK200
      (_return select 1) pushBack ["LMG_Mk200_F", nil, 0];
      (_return select 1) pushBack ["200Rnd_65x39_cased_Box", nil, 0];
      (_return select 1) pushBack ["200Rnd_65x39_cased_Box_Tracer", nil, 0];

      //--- Mar-10
      (_return select 1) pushBack ["srifle_DMR_02_F", nil, 0];
      (_return select 1) pushBack ["10Rnd_338_Mag", nil, 0];
    };

    //--- Optics
    (_return select 1) pushBack ["optic_ACO", nil, 0];
    (_return select 1) pushBack ["optic_Aco_smg", nil, 0];
    (_return select 1) pushBack ["optic_ACO_grn", nil, 0];
    (_return select 1) pushBack ["optic_ACO_grn_smg", nil, 0];
    (_return select 1) pushBack ["optic_Holosight", nil, 0];
    (_return select 1) pushBack ["optic_Holosight_smg", nil, 0];
    (_return select 1) pushBack ["optic_MRCO", nil, 0];
    (_return select 1) pushBack ["optic_Arco", nil, 0];
    (_return select 1) pushBack ["optic_Hamr", nil, 0];

    if (["GTA_copRank"] call GTA_fnc_const >= 3) then {
      (_return select 1) pushBack ["optic_NVS", nil, 0];
      (_return select 1) pushBack ["optic_DMS", nil, 0];
      (_return select 1) pushBack ["optic_LRPS", nil, 0];
      (_return select 1) pushBack ["optic_SOS", nil, 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 5) then {
      (_return select 1) pushBack ["optic_AMS", nil, 0];
      (_return select 1) pushBack ["optic_KHS_old", nil, 0];
      (_return select 1) pushBack ["optic_KHS_blk", nil, 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 6) then {
      (_return select 1) pushBack ["optic_LRPS", nil, 0];
    };

    //--- Muzzles 9mm
    (_return select 1) pushBack ["muzzle_snds_L", nil, 0];

    //--- Muzzles .45 ACP
    (_return select 1) pushBack ["muzzle_snds_acp", nil, 0];

    if (["GTA_copRank"] call GTA_fnc_const >= 3) then {
      //--- Muzzles 5.56
      (_return select 1) pushBack ["muzzle_snds_M", nil, 0];

      //--- Muzzles 6.5
      (_return select 1) pushBack ["muzzle_snds_H", nil, 0];
    };

    //--- Muzzles 7.62
    if (["GTA_copRank"] call GTA_fnc_const >= 6) then {
      (_return select 1) pushBack ["muzzle_snds_B", nil, 0];
    };

    //--- Bipod
    if (["GTA_copRank"] call GTA_fnc_const >= 3) then {
      (_return select 1) pushBack ["bipod_01_F_blk", nil, 0];
    };

    //--- Attachments
    (_return select 1) pushBack ["acc_flashlight", nil, 0];
    (_return select 1) pushBack ["acc_pointer_IR", nil, 0];
  };

  case "mil": {
    if !([player] call GTA_fnc_isMilitary) exitWith {"You are not a member of NATO" };

    _return = ["NATO Armoury", []];

    //--- P07
    (_return select 1) pushBack ["hgun_P07_F", nil, 0];
    (_return select 1) pushBack ["16Rnd_9x21_Mag", nil, 0];
    (_return select 1) pushBack ["30Rnd_9x21_Mag", nil, 0];

    //--- ACP
    (_return select 1) pushBack ["hgun_ACPC2_F", nil, 0];
    (_return select 1) pushBack ["9Rnd_45ACP_Mag", nil, 0];

    //--- Taser
    (_return select 1) pushBack ["hgun_Pistol_heavy_01_F", nil, 0];
    (_return select 1) pushBack ["hgun_Pistol_heavy_01_snds_F", "Taser", 0];
    (_return select 1) pushBack ["11Rnd_45ACP_Mag", nil, 0];

    //--- Sting
    (_return select 1) pushBack ["SMG_02_F", nil, 0];
    (_return select 1) pushBack ["SMG_02_ACO_F", "Stun Gun", 0];
    (_return select 1) pushBack ["30Rnd_9x21_Mag", nil, 0];

    //--- Vermin
    (_return select 1) pushBack ["SMG_01_F", nil, 0];
    (_return select 1) pushBack ["30Rnd_45ACP_Mag_SMG_01", nil, 0];
    (_return select 1) pushBack ["30Rnd_45ACP_Mag_SMG_01_tracer_green", nil, 0];

    //--- SDAR
    (_return select 1) pushBack ["arifle_SDAR_F", nil, 0];
    (_return select 1) pushBack ["20Rnd_556x45_UW_mag", nil, 0];
    (_return select 1) pushBack ["30Rnd_556x45_Stanag", nil, 0];
    (_return select 1) pushBack ["30Rnd_556x45_Stanag_Tracer_Red", nil, 0];

    //--- TRG
    (_return select 1) pushBack ["arifle_TRG20_F", nil, 0];
    (_return select 1) pushBack ["arifle_TRG21_F", nil, 0];
    if (["GTA_milRank"] call GTA_fnc_const >= 2) then {(_return select 1) pushBack ["arifle_TRG21_GL_F", nil, 0]};
    (_return select 1) pushBack ["30Rnd_556x45_Stanag", nil, 0];
    (_return select 1) pushBack ["30Rnd_556x45_Stanag_Tracer_Red", nil, 0];

    //--- MK20
    (_return select 1) pushBack ["arifle_Mk20C_plain_F", nil, 0];
    (_return select 1) pushBack ["arifle_Mk20_plain_F", nil, 0];
    if (["GTA_milRank"] call GTA_fnc_const >= 2) then {(_return select 1) pushBack ["arifle_Mk20_GL_plain_F", nil, 0]};
    (_return select 1) pushBack ["30Rnd_556x45_Stanag", nil, 0];
    (_return select 1) pushBack ["30Rnd_556x45_Stanag_Tracer_Red", nil, 0];

    //--- Katiba
    (_return select 1) pushBack ["arifle_Katiba_C_F", nil, 0];
    (_return select 1) pushBack ["arifle_Katiba_F", nil, 0];
    if (["GTA_milRank"] call GTA_fnc_const >= 3) then {(_return select 1) pushBack ["arifle_Katiba_GL_F", nil, 0]};
    (_return select 1) pushBack ["30Rnd_65x39_caseless_green", nil, 0];
    (_return select 1) pushBack ["30Rnd_65x39_caseless_green_mag_Tracer", nil, 0];

    //--- MX
    (_return select 1) pushBack ["arifle_MXC_F", nil, 0];
    (_return select 1) pushBack ["arifle_MX_F", nil, 0];
    if (["GTA_milRank"] call GTA_fnc_const >= 3) then {(_return select 1) pushBack ["arifle_MX_GL_F", nil, 0]};
    if (["GTA_milRank"] call GTA_fnc_const >= 2) then {(_return select 1) pushBack ["arifle_MXM_F", nil, 0]};
    (_return select 1) pushBack ["arifle_MXC_Black_F", nil, 0];
    (_return select 1) pushBack ["arifle_MX_Black_F", nil, 0];
    if (["GTA_milRank"] call GTA_fnc_const >= 3) then {(_return select 1) pushBack ["arifle_MX_GL_Black_F", nil, 0]};
    if (["GTA_milRank"] call GTA_fnc_const >= 2) then {(_return select 1) pushBack ["arifle_MXM_Black_F", nil, 0]};
    (_return select 1) pushBack ["30Rnd_65x39_caseless_mag", nil, 0];
    (_return select 1) pushBack ["30Rnd_65x39_caseless_mag_Tracer", nil, 0];

    //--- MX SW
    if (["GTA_milRank"] call GTA_fnc_const >= 2) then {
      (_return select 1) pushBack ["arifle_MX_SW_F", nil, 0];
      (_return select 1) pushBack ["arifle_MX_SW_Black_F", nil, 0];
      (_return select 1) pushBack ["100Rnd_65x39_caseless_mag", nil, 0];
      (_return select 1) pushBack ["100Rnd_65x39_caseless_mag_Tracer", nil, 0];
    };

    //--- Mk200
    if (["GTA_milRank"] call GTA_fnc_const >= 3) then {
      (_return select 1) pushBack ["LMG_Mk200_F", nil, 0];
      (_return select 1) pushBack ["200Rnd_65x39_cased_Box", nil, 0];
      (_return select 1) pushBack ["200Rnd_65x39_cased_Box_Tracer", nil, 0];
    };

    if (["GTA_milRank"] call GTA_fnc_const >= 3) then {
      //--- Mk18
      (_return select 1) pushBack ["srifle_EBR_F", nil, 0];
      (_return select 1) pushBack ["20Rnd_762x51_Mag", nil, 0];

      //--- Mk-I EMR
      (_return select 1) pushBack ["srifle_DMR_03_F", nil, 0];
      (_return select 1) pushBack ["srifle_DMR_03_khaki_F", nil, 0];
      (_return select 1) pushBack ["srifle_DMR_03_tan_F", nil, 0];
      (_return select 1) pushBack ["srifle_DMR_03_multicam_F", nil, 0];
      (_return select 1) pushBack ["20Rnd_762x51_Mag", nil, 0];

      //--- ASP
      (_return select 1) pushBack ["srifle_DMR_04_F", nil, 0];
      (_return select 1) pushBack ["srifle_DMR_04_Tan_F", nil, 0];
      (_return select 1) pushBack ["10Rnd_127x54_Mag", nil, 0];
    };

    if (["GTA_milRank"] call GTA_fnc_const >= 4) then {
      //--- Mar-10
      (_return select 1) pushBack ["srifle_DMR_02_F", nil, 0];
      (_return select 1) pushBack ["srifle_DMR_02_camo_F", nil, 0];
      (_return select 1) pushBack ["srifle_DMR_02_sniper_F", nil, 0];
      (_return select 1) pushBack ["10Rnd_338_Mag", nil, 0];

      //--- Cyrus
      (_return select 1) pushBack ["srifle_DMR_05_blk_F", nil, 0];
      (_return select 1) pushBack ["srifle_DMR_05_tan_F", nil, 0];
      (_return select 1) pushBack ["10Rnd_93x64_DMR_05_Mag", nil, 0];
    };

    //--- Titan AA
    if (["GTA_milRank"] call GTA_fnc_const >= 3) then {
      (_return select 1) pushBack ["launch_B_Titan_F", nil, 0];
      (_return select 1) pushBack ["Titan_AA", nil, 0];
    };

    //--- Static
    if (["GTA_milRank"] call GTA_fnc_const >= 4) then {
      (_return select 1) pushBack ["B_AA_01_weapon_F", nil, 0];
      (_return select 1) pushBack ["B_HMG_01_support_F", "Folded Tripod (Titan)", 0];

      (_return select 1) pushBack ["B_HMG_01_high_weapon_F", "Static HMG", 0];
      (_return select 1) pushBack ["B_HMG_01_support_high_F", nil, 0];
    };

    //--- Optics
    (_return select 1) pushBack ["optic_MRD", nil, 0];
    (_return select 1) pushBack ["optic_ACO", nil, 0];
    (_return select 1) pushBack ["optic_Aco_smg", nil, 0];
    (_return select 1) pushBack ["optic_ACO_grn", nil, 0];
    (_return select 1) pushBack ["optic_ACO_grn_smg", nil, 0];
    (_return select 1) pushBack ["optic_Holosight", nil, 0];
    (_return select 1) pushBack ["optic_Holosight_smg", nil, 0];
    (_return select 1) pushBack ["optic_MRCO", nil, 0];
    (_return select 1) pushBack ["optic_Arco", nil, 0];
    (_return select 1) pushBack ["optic_Hamr", nil, 0];
    (_return select 1) pushBack ["optic_NVS", nil, 0];
    if (["GTA_milRank"] call GTA_fnc_const >= 2) then {(_return select 1) pushBack ["optic_DMS", nil, 0]};
    if (["GTA_milRank"] call GTA_fnc_const >= 2) then {(_return select 1) pushBack ["optic_SOS", nil, 0]};
    if (["GTA_milRank"] call GTA_fnc_const >= 3) then {(_return select 1) pushBack ["optic_AMS", nil, 0]};
    if (["GTA_milRank"] call GTA_fnc_const >= 3) then {(_return select 1) pushBack ["optic_AMS_khk", nil, 0]};
    if (["GTA_milRank"] call GTA_fnc_const >= 3) then {(_return select 1) pushBack ["optic_AMS_snd", nil, 0]};
    if (["GTA_milRank"] call GTA_fnc_const >= 3) then {(_return select 1) pushBack ["optic_KHS_blk", nil, 0]};
    if (["GTA_milRank"] call GTA_fnc_const >= 3) then {(_return select 1) pushBack ["optic_KHS_tan", nil, 0]};
    if (["GTA_milRank"] call GTA_fnc_const >= 4) then {(_return select 1) pushBack ["optic_LRPS", nil, 0]};

    //--- Attachments
    (_return select 1) pushBack ["acc_flashlight", nil, 0];
    (_return select 1) pushBack ["acc_pointer_IR", nil, 0];

    //--- Bipods
    if (["GTA_milRank"] call GTA_fnc_const >= 3) then {
      (_return select 1) pushBack ["bipod_01_F_blk", nil, 0];
      (_return select 1) pushBack ["bipod_01_F_mtp", nil, 0];
      (_return select 1) pushBack ["bipod_01_F_snd", nil, 0];
      (_return select 1) pushBack ["bipod_02_F_tan", nil, 0];
    };

    //--- Muzzles
    (_return select 1) pushBack ["muzzle_snds_L", nil, 0];
    (_return select 1) pushBack ["muzzle_snds_acp", nil, 0];
    (_return select 1) pushBack ["muzzle_snds_M", nil, 0];
    (_return select 1) pushBack ["muzzle_snds_H", nil, 0];
    (_return select 1) pushBack ["muzzle_snds_H_MG", nil, 0];
    (_return select 1) pushBack ["muzzle_snds_B", nil, 0];

    //--- Chemlights
    (_return select 1) pushBack ["Chemlight_blue", nil, 0];
    (_return select 1) pushBack ["Chemlight_yellow", nil, 0];
    (_return select 1) pushBack ["Chemlight_green", nil, 0];
    (_return select 1) pushBack ["Chemlight_red", nil, 0];

    //--- Smoke
    (_return select 1) pushBack ["SmokeShell", nil, 0];
    (_return select 1) pushBack ["SmokeShellRed", nil, 0];
    (_return select 1) pushBack ["SmokeShellGreen", nil, 0];
    (_return select 1) pushBack ["SmokeShellBlue", nil, 0];
    (_return select 1) pushBack ["SmokeShellPurple", nil, 0];

    //--- GL
    (_return select 1) pushBack ["1Rnd_Smoke_Grenade_shell", nil, 0];
    (_return select 1) pushBack ["1Rnd_SmokeRed_Grenade_shell", nil, 0];
    (_return select 1) pushBack ["1Rnd_SmokeGreen_Grenade_shell", nil, 0];
    (_return select 1) pushBack ["1Rnd_SmokeBlue_Grenade_shell", nil, 0];
    (_return select 1) pushBack ["1Rnd_SmokePurple_Grenade_shell", nil, 0];
    (_return select 1) pushBack ["3Rnd_Smoke_Grenade_shell", nil, 0];
    (_return select 1) pushBack ["3Rnd_SmokeRed_Grenade_shell", nil, 0];
    (_return select 1) pushBack ["3Rnd_SmokeGreen_Grenade_shell", nil, 0];
    (_return select 1) pushBack ["3Rnd_SmokeBlue_Grenade_shell", nil, 0];
    (_return select 1) pushBack ["3Rnd_SmokePurple_Grenade_shell", nil, 0];

    //--- Flare
    (_return select 1) pushBack ["UGL_FlareWhite_F", nil, 0];
    (_return select 1) pushBack ["3Rnd_UGL_FlareWhite_F", nil, 0];

    //--- IR
    (_return select 1) pushBack ["UGL_FlareCIR_F", nil, 0];
    (_return select 1) pushBack ["3Rnd_UGL_FlareCIR_F", nil, 0];

    //--- Items
    (_return select 1) pushBack ["ItemMap", nil, 0];
    (_return select 1) pushBack ["ItemGPS", nil, 0];
    (_return select 1) pushBack ["ItemCompass", nil, 0];
    (_return select 1) pushBack ["ItemWatch", nil, 0];
    (_return select 1) pushBack ["ItemRadio", nil, 0];
    (_return select 1) pushBack ["ToolKit", nil, 0];
    (_return select 1) pushBack ["NVGoggles", nil, 0];
    (_return select 1) pushBack ["NVGoggles_OPFOR", nil, 0];
    (_return select 1) pushBack ["FirstAidKit", nil, 0];
    if (["GTA_milRank"] call GTA_fnc_const >= 4) then {(_return select 1) pushBack ["B_UavTerminal", nil, 0]};

    //--- Binoculars
    (_return select 1) pushBack ["Binocular", nil, 0];
    (_return select 1) pushBack ["Rangefinder", nil, 0];
  };

  case "hato_basic": {
    if !(player call GTA_fnc_isHATO) exitWith {"You are not a member of HATO"};

    (_return select 1) pushBack ["ItemMap", nil, 0];
    (_return select 1) pushBack ["ItemGPS", nil, 0];
    (_return select 1) pushBack ["ItemCompass", nil, 0];
    (_return select 1) pushBack ["ItemWatch", nil, 0];
    (_return select 1) pushBack ["ItemRadio", nil, 0];
    (_return select 1) pushBack ["ToolKit", nil, 0];
    (_return select 1) pushBack ["Binocular", nil, 0];
    (_return select 1) pushBack ["FirstAidKit", nil, 0];

    if (["GTA_hatoRank"] call GTA_fnc_const >= 2) then {
      (_return select 1) pushBack ["Chemlight_blue", nil, 0];
      (_return select 1) pushBack ["Chemlight_yellow", nil, 0];
      (_return select 1) pushBack ["Chemlight_green", nil, 0];
      (_return select 1) pushBack ["Chemlight_red", nil, 0];
    };

    if (["GTA_hatoRank"] call GTA_fnc_const >= 3) then {
      (_return select 1) pushBack ["I_UavTerminal", nil, 0];
    };
  };

  case "med_basic": {
    if !(player call GTA_fnc_isMedic) exitWith {"You are not a member of NHS"};

    (_return select 1) pushBack ["ItemMap", nil, 0];
    (_return select 1) pushBack ["ItemGPS", nil, 0];
    (_return select 1) pushBack ["ItemCompass", nil, 0];
    (_return select 1) pushBack ["ItemWatch", nil, 0];
    (_return select 1) pushBack ["ItemRadio", nil, 0];
    (_return select 1) pushBack ["ToolKit", nil, 0];
    (_return select 1) pushBack ["NVGoggles_INDEP", nil, 0];
    (_return select 1) pushBack ["Binocular", nil, 0];
    (_return select 1) pushBack ["FirstAidKit", nil, 0];
    (_return select 1) pushBack ["Medikit", nil, 0];
    if (["GTA_medRank"] call GTA_fnc_const >= 4) then {
      (_return select 1) pushBack ["Rangefinder", nil, 0];
    };
  };

  case "hideout": {
    if (playerSide != civilian) exitWith {"You are not a civilian!"};

    (_return select 1) pushBack ["ItemMap", nil, 100];
    (_return select 1) pushBack ["ItemGPS", nil, 100];
    (_return select 1) pushBack ["ItemCompass", nil, 100];
    (_return select 1) pushBack ["ItemWatch", nil, 100];
    (_return select 1) pushBack ["ItemRadio", nil, 100];
    (_return select 1) pushBack ["ToolKit", nil, 3000];
    (_return select 1) pushBack ["NVGoggles", nil, 5000];
    (_return select 1) pushBack ["NVGoggles_OPFOR", nil, 5000];
    (_return select 1) pushBack ["NVGoggles_INDEP", nil, 5000];
    (_return select 1) pushBack ["FirstAidKit", nil, 1000];
    (_return select 1) pushBack ["Binocular", nil, 500];

    //--- Perk: Race Marshal
    if (["race_marshal"] call GTA_fnc_hasPerk) then {
      (_return select 1) pushBack ["hgun_Pistol_Signal_F", nil, 10000];
      (_return select 1) pushBack ["6Rnd_GreenSignal_F", nil, 500];
      (_return select 1) pushBack ["6Rnd_RedSignal_F", nil, 500];
    };

    //--- P07 9 mm
    (_return select 1) pushBack ["hgun_P07_F", nil, 15000];

    //--- Rook-40
    (_return select 1) pushBack ["hgun_Rook40_F", nil, 15000];
    (_return select 1) pushBack ["16Rnd_9x21_Mag", nil, 400];
    (_return select 1) pushBack ["30Rnd_9x21_Mag", nil, 600];

    //--- 4-five .45
    (_return select 1) pushBack ["hgun_Pistol_heavy_01_F", nil, 18000];
    (_return select 1) pushBack ["11Rnd_45ACP_Mag", nil, 600];

    //--- ACP-C2
    (_return select 1) pushBack ["hgun_ACPC2_F", nil, 18000];
    (_return select 1) pushBack ["9Rnd_45ACP_Mag", nil, 600];

    //--- Zubr
    (_return select 1) pushBack ["hgun_Pistol_heavy_02_F", nil, 23000];
    (_return select 1) pushBack ["6Rnd_45ACP_Cylinder", nil, 800];

    //--- PDW2000
    (_return select 1) pushBack ["hgun_PDW2000_F", nil, 30000];
    (_return select 1) pushBack ["16Rnd_9x21_Mag", nil, 400];
    (_return select 1) pushBack ["30Rnd_9x21_Mag", nil, 600];

    //--- Sting
    (_return select 1) pushBack ["SMG_02_F", nil, 40000];
    (_return select 1) pushBack ["30Rnd_9x21_Mag", nil, 600];

    //--- Vermin
    (_return select 1) pushBack ["SMG_01_F", nil, 60000];
    (_return select 1) pushBack ["30Rnd_45ACP_Mag_SMG_01", nil, 1000];

    //--- SDAR
    (_return select 1) pushBack ["arifle_SDAR_F", nil, 60000];
    (_return select 1) pushBack ["20Rnd_556x45_UW_mag", nil, 1000];
    (_return select 1) pushBack ["30Rnd_556x45_Stanag", nil, 2000];
    (_return select 1) pushBack ["30Rnd_556x45_Stanag_Tracer_Green", nil, 3000];

    //--- TRG
    (_return select 1) pushBack ["arifle_TRG20_F", nil, 70000];
    (_return select 1) pushBack ["arifle_TRG21_F", nil, 80000];
    (_return select 1) pushBack ["30Rnd_556x45_Stanag", nil, 2000];
    (_return select 1) pushBack ["30Rnd_556x45_Stanag_Tracer_Green", nil, 3000];

    //--- MK20
    (_return select 1) pushBack ["arifle_Mk20C_F", nil, 70000];
    (_return select 1) pushBack ["arifle_Mk20_F", nil, 80000];
    (_return select 1) pushBack ["30Rnd_556x45_Stanag", nil, 2000];
    (_return select 1) pushBack ["30Rnd_556x45_Stanag_Tracer_Green", nil, 3000];

    //--- Optics
    (_return select 1) pushBack ["optic_MRD", nil, 2500];
    (_return select 1) pushBack ["optic_Yorris", nil, 2500];
    (_return select 1) pushBack ["optic_Aco", nil, 10000];
    (_return select 1) pushBack ["optic_ACO_grn", nil, 10000];
    (_return select 1) pushBack ["optic_Aco_smg", nil, 10000];
    (_return select 1) pushBack ["optic_ACO_grn_smg", nil, 10000];
    (_return select 1) pushBack ["optic_Holosight", nil, 10000];
    (_return select 1) pushBack ["optic_Holosight_smg", nil, 10000];

    //--- Attachments
    (_return select 1) pushBack ["acc_flashlight", nil, 2500];
    (_return select 1) pushBack ["acc_pointer_IR", nil, 2500];

    //--- Hideout prices are an additional 25%
    {
      _x set [2, (_x select 2) * 1.25];
    } forEach (_return select 1);
  };

  case "rebel": {
    if (playerSide != civilian) exitWith {"You are not a civilian!"};
    if (!license_civ_rebel) exitWith {"You don't have a Rebel Training license!"};

    (_return select 1) pushBack ["ItemMap", nil, 100];
    (_return select 1) pushBack ["ItemGPS", nil, 100];
    (_return select 1) pushBack ["ItemCompass", nil, 100];
    (_return select 1) pushBack ["ItemWatch", nil, 100];
    (_return select 1) pushBack ["ItemRadio", nil, 100];
    (_return select 1) pushBack ["ToolKit", nil, 3000];
    (_return select 1) pushBack ["NVGoggles", nil, 5000];
    (_return select 1) pushBack ["NVGoggles_OPFOR", nil, 5000];
    (_return select 1) pushBack ["NVGoggles_INDEP", nil, 5000];
    (_return select 1) pushBack ["FirstAidKit", nil, 1000];
    (_return select 1) pushBack ["Binocular", nil, 500];
    (_return select 1) pushBack ["Rangefinder", nil, 50000];

    //--- Perk: Race Marshal
    if (["race_marshal"] call GTA_fnc_hasPerk) then {
      (_return select 1) pushBack ["hgun_Pistol_Signal_F", nil, 10000];
      (_return select 1) pushBack ["6Rnd_GreenSignal_F", nil, 500];
      (_return select 1) pushBack ["6Rnd_RedSignal_F", nil, 500];
    };

    //--- P07 9 mm
    (_return select 1) pushBack ["hgun_P07_F", nil, 15000];

    //--- Rook-40
    (_return select 1) pushBack ["hgun_Rook40_F", nil, 15000];
    (_return select 1) pushBack ["16Rnd_9x21_Mag", nil, 400];
    (_return select 1) pushBack ["30Rnd_9x21_Mag", nil, 600];

    //--- 4-five .45
    (_return select 1) pushBack ["hgun_Pistol_heavy_01_F", nil, 18000];
    (_return select 1) pushBack ["11Rnd_45ACP_Mag", nil, 600];

    //--- ACP-C2
    (_return select 1) pushBack ["hgun_ACPC2_F", nil, 18000];
    (_return select 1) pushBack ["9Rnd_45ACP_Mag", nil, 600];

    //--- Zubr
    (_return select 1) pushBack ["hgun_Pistol_heavy_02_F", nil, 23000];
    (_return select 1) pushBack ["6Rnd_45ACP_Cylinder", nil, 800];

    //--- PDW2000
    (_return select 1) pushBack ["hgun_PDW2000_F", nil, 30000];
    (_return select 1) pushBack ["16Rnd_9x21_Mag", nil, 400];
    (_return select 1) pushBack ["30Rnd_9x21_Mag", nil, 600];

    //--- Sting
    (_return select 1) pushBack ["SMG_02_F", nil, 40000];
    (_return select 1) pushBack ["30Rnd_9x21_Mag", nil, 600];

    //--- Vermin
    (_return select 1) pushBack ["SMG_01_F", nil, 60000];
    (_return select 1) pushBack ["30Rnd_45ACP_Mag_SMG_01", nil, 1000];

    //--- SDAR
    (_return select 1) pushBack ["arifle_SDAR_F", nil, 60000];
    (_return select 1) pushBack ["20Rnd_556x45_UW_mag", nil, 1000];
    (_return select 1) pushBack ["30Rnd_556x45_Stanag", nil, 2000];
    (_return select 1) pushBack ["30Rnd_556x45_Stanag_Tracer_Green", nil, 3000];

    //--- TRG
    (_return select 1) pushBack ["arifle_TRG20_F", nil, 70000];
    (_return select 1) pushBack ["arifle_TRG21_F", nil, 80000];
    (_return select 1) pushBack ["30Rnd_556x45_Stanag", nil, 2000];
    (_return select 1) pushBack ["30Rnd_556x45_Stanag_Tracer_Green", nil, 3000];

    //--- MK20
    (_return select 1) pushBack ["arifle_Mk20C_F", nil, 70000];
    (_return select 1) pushBack ["arifle_Mk20_F", nil, 80000];
    (_return select 1) pushBack ["30Rnd_556x45_Stanag", nil, 2000];
    (_return select 1) pushBack ["30Rnd_556x45_Stanag_Tracer_Green", nil, 3000];

    //--- Katiba
    (_return select 1) pushBack ["arifle_Katiba_C_F", nil, 150000];
    (_return select 1) pushBack ["arifle_Katiba_F", nil, 165000];
    (_return select 1) pushBack ["30Rnd_65x39_caseless_green", nil, 4000];
    (_return select 1) pushBack ["30Rnd_65x39_caseless_green_mag_Tracer", nil, 5000];

    //--- MX
    (_return select 1) pushBack ["arifle_MXC_F", nil, 150000];
    (_return select 1) pushBack ["arifle_MX_F", nil, 165000];
    (_return select 1) pushBack ["arifle_MXM_F", nil, 195000];
    (_return select 1) pushBack ["arifle_MXC_Black_F", nil, 150000];
    (_return select 1) pushBack ["arifle_MX_Black_F", nil, 165000];
    (_return select 1) pushBack ["arifle_MXM_Black_F", nil, 195000];
    (_return select 1) pushBack ["30Rnd_65x39_caseless_mag", nil, 4000];
    (_return select 1) pushBack ["30Rnd_65x39_caseless_mag_Tracer", nil, 5000];

    //--- MX SW
    (_return select 1) pushBack ["arifle_MX_SW_F", nil, 450000];
    (_return select 1) pushBack ["arifle_MX_SW_Black_F", nil, 450000];
    (_return select 1) pushBack ["100Rnd_65x39_caseless_mag", nil, 25000];
    (_return select 1) pushBack ["100Rnd_65x39_caseless_mag_Tracer", nil, 30000];

    //--- Rahim
    (_return select 1) pushBack ["srifle_DMR_01_F", nil, 480000];
    (_return select 1) pushBack ["10Rnd_762x54_Mag", nil, 10000];

    //--- MK14
    (_return select 1) pushBack ["srifle_DMR_06_camo_F", nil, 520000];
    (_return select 1) pushBack ["srifle_DMR_06_olive_F", nil, 520000];
    (_return select 1) pushBack ["20Rnd_762x51_Mag", nil, 20000];

    //--- Optics
    (_return select 1) pushBack ["optic_MRD", nil, 2500];
    (_return select 1) pushBack ["optic_Yorris", nil, 2500];
    (_return select 1) pushBack ["optic_Aco", nil, 10000];
    (_return select 1) pushBack ["optic_ACO_grn", nil, 10000];
    (_return select 1) pushBack ["optic_Aco_smg", nil, 10000];
    (_return select 1) pushBack ["optic_ACO_grn_smg", nil, 10000];
    (_return select 1) pushBack ["optic_Holosight", nil, 10000];
    (_return select 1) pushBack ["optic_Holosight_smg", nil, 10000];
    (_return select 1) pushBack ["optic_Hamr", nil, 40000];
    (_return select 1) pushBack ["optic_Arco", nil, 40000];
    (_return select 1) pushBack ["optic_MRCO", nil, 40000];
    (_return select 1) pushBack ["optic_DMS", nil, 100000];
    (_return select 1) pushBack ["optic_KHS_old", nil, 150000];

    //--- Attachments
    (_return select 1) pushBack ["acc_flashlight", nil, 2500];
    (_return select 1) pushBack ["acc_pointer_IR", nil, 2500];

    //--- Bipods
    (_return select 1) pushBack ["bipod_01_F_snd", nil, 35000];
    (_return select 1) pushBack ["bipod_01_F_blk", nil, 35000];
    (_return select 1) pushBack ["bipod_01_F_mtp", nil, 35000];
    (_return select 1) pushBack ["bipod_02_F_blk", nil, 35000];
    (_return select 1) pushBack ["bipod_02_F_hex", nil, 35000];
    (_return select 1) pushBack ["bipod_02_F_tan", nil, 35000];
    (_return select 1) pushBack ["bipod_03_F_blk", nil, 35000];
    (_return select 1) pushBack ["bipod_03_F_oli", nil, 35000];

    //--- Muzzles
    (_return select 1) pushBack ["muzzle_snds_L", nil, 10000];
    (_return select 1) pushBack ["muzzle_snds_acp", nil, 20000];
    (_return select 1) pushBack ["muzzle_snds_M", nil, 50000];
    (_return select 1) pushBack ["muzzle_snds_H", nil, 100000];
    (_return select 1) pushBack ["muzzle_snds_H_MG", nil, 100000];
    (_return select 1) pushBack ["muzzle_snds_B", nil, 150000];
  };

  case "advrebel": {
    if (playerSide != civilian) exitWith {"You are not a civilian!"};
    if (!license_civ_advrebel) exitWith {"You don't have an Avanced Rebel Training license!"};

    //--- TRG GL
    (_return select 1) pushBack ["arifle_TRG21_GL_F", nil, 100000];
    (_return select 1) pushBack ["30Rnd_556x45_Stanag", nil, 2000];
    (_return select 1) pushBack ["30Rnd_556x45_Stanag_Tracer_Green", nil, 3000];

    //--- MK20 GL
    (_return select 1) pushBack ["arifle_Mk20_GL_F", nil, 100000];
    (_return select 1) pushBack ["30Rnd_556x45_Stanag", nil, 2000];
    (_return select 1) pushBack ["30Rnd_556x45_Stanag_Tracer_Green", nil, 3000];

    //--- Katiba GL
    (_return select 1) pushBack ["arifle_Katiba_GL_F", nil, 195000];
    (_return select 1) pushBack ["30Rnd_65x39_caseless_green", nil, 4000];
    (_return select 1) pushBack ["30Rnd_65x39_caseless_green_mag_Tracer", nil, 5000];

    //--- MX GL
    (_return select 1) pushBack ["arifle_MX_GL_F", nil, 195000];
    (_return select 1) pushBack ["arifle_MX_GL_Black_F", nil, 195000];
    (_return select 1) pushBack ["30Rnd_65x39_caseless_mag", nil, 4000];
    (_return select 1) pushBack ["30Rnd_65x39_caseless_mag_Tracer", nil, 5000];

    //--- MK200
    (_return select 1) pushBack ["LMG_Mk200_F", nil, 600000];
    (_return select 1) pushBack ["200Rnd_65x39_cased_Box", nil, 50000];
    (_return select 1) pushBack ["200Rnd_65x39_cased_Box_Tracer", nil, 60000];

    //--- MK18
    (_return select 1) pushBack ["srifle_EBR_F", nil, 620000];
    (_return select 1) pushBack ["20Rnd_762x51_Mag", nil, 20000];

    //--- Mk-1 EMR
    (_return select 1) pushBack ["srifle_DMR_03_F", nil, 620000];
    (_return select 1) pushBack ["srifle_DMR_03_tan_F", nil, 620000];
    (_return select 1) pushBack ["srifle_DMR_03_khaki_F", nil, 620000];
    (_return select 1) pushBack ["srifle_DMR_03_multicam_F", nil, 620000];
    (_return select 1) pushBack ["srifle_DMR_03_woodland_F", nil, 620000];
    (_return select 1) pushBack ["20Rnd_762x51_Mag", nil, 20000];

    //--- ASP-1 Kir
    (_return select 1) pushBack ["srifle_DMR_04_F", nil, 700000];
    (_return select 1) pushBack ["srifle_DMR_04_tan_F", nil, 700000];
    (_return select 1) pushBack ["10Rnd_127x54_Mag", nil, 30000];

    //--- Mar-10
    (_return select 1) pushBack ["srifle_DMR_02_F", nil, 2000000];
    (_return select 1) pushBack ["srifle_DMR_02_camo_F", nil, 2000000];
    (_return select 1) pushBack ["srifle_DMR_02_sniper_F", nil, 2000000];
    (_return select 1) pushBack ["10Rnd_338_Mag", nil, 50000];

    //--- Cyrus
    (_return select 1) pushBack ["srifle_DMR_05_blk_F", nil, 2300000];
    (_return select 1) pushBack ["srifle_DMR_05_hex_F", nil, 2300000];
    (_return select 1) pushBack ["srifle_DMR_05_tan_F", nil, 2300000];
    (_return select 1) pushBack ["10Rnd_93x64_DMR_05_Mag", nil, 50000];

    //--- Optics
    (_return select 1) pushBack ["optic_NVS", nil, 40000];
    (_return select 1) pushBack ["optic_SOS", nil, 100000];
    (_return select 1) pushBack ["optic_AMS", nil, 200000];
    (_return select 1) pushBack ["optic_AMS_khk", nil, 200000];
    (_return select 1) pushBack ["optic_AMS_snd", nil, 200000];
    (_return select 1) pushBack ["optic_KHS_blk", nil, 200000];
    (_return select 1) pushBack ["optic_KHS_hex", nil, 200000];
    (_return select 1) pushBack ["optic_KHS_tan", nil, 200000];
    (_return select 1) pushBack ["optic_LRPS", nil, 300000];

    //--- Smoke
    (_return select 1) pushBack ["SmokeShell", nil, 7000];
    (_return select 1) pushBack ["SmokeShellRed", nil, 7000];
    (_return select 1) pushBack ["SmokeShellGreen", nil, 7000];
    (_return select 1) pushBack ["SmokeShellBlue", nil, 7000];
    (_return select 1) pushBack ["SmokeShellPurple", nil, 7000];
    (_return select 1) pushBack ["SmokeShellOrange", nil, 7000];
    (_return select 1) pushBack ["SmokeShellYellow", nil, 7000];

    //--- GL
    (_return select 1) pushBack ["1Rnd_Smoke_Grenade_shell", nil, 15000];
    (_return select 1) pushBack ["3Rnd_Smoke_Grenade_shell", nil, 20000];

    //--- Chemlights
    (_return select 1) pushBack ["Chemlight_blue", nil, 2500];
    (_return select 1) pushBack ["Chemlight_yellow", nil, 2500];
    (_return select 1) pushBack ["Chemlight_green", nil, 2500];
    (_return select 1) pushBack ["Chemlight_red", nil, 2500];
  };

  case "gun":	{
    if (playerSide != civilian) exitWith {"You are not a civilian!"};
    if (!license_civ_gun) exitWith {"You don't have a Firearms license!"};

    //--- P07 9 mm
    (_return select 1) pushBack ["hgun_P07_F", nil, 15000];

    //--- Rook-40
    (_return select 1) pushBack ["hgun_Rook40_F", nil, 15000];
    (_return select 1) pushBack ["16Rnd_9x21_Mag", nil, 400];
    (_return select 1) pushBack ["30Rnd_9x21_Mag", nil, 600];

    //--- 4-five .45
    (_return select 1) pushBack ["hgun_Pistol_heavy_01_F", nil, 18000];
    (_return select 1) pushBack ["11Rnd_45ACP_Mag", nil, 600];

    //--- ACP-C2
    (_return select 1) pushBack ["hgun_ACPC2_F", nil, 18000];
    (_return select 1) pushBack ["9Rnd_45ACP_Mag", nil, 600];

    //--- Zubr
    (_return select 1) pushBack ["hgun_Pistol_heavy_02_F", nil, 23000];
    (_return select 1) pushBack ["6Rnd_45ACP_Cylinder", nil, 800];

    //--- PDW2000
    (_return select 1) pushBack ["hgun_PDW2000_F", "PDW2000 [Illegal]", 30000];
    (_return select 1) pushBack ["16Rnd_9x21_Mag", nil, 400];
    (_return select 1) pushBack ["30Rnd_9x21_Mag", nil, 600];

    //--- Optics
    (_return select 1) pushBack ["optic_MRD", nil, 2500];
    (_return select 1) pushBack ["optic_Yorris", nil, 2500];
    (_return select 1) pushBack ["optic_Aco", nil, 10000];
    (_return select 1) pushBack ["optic_ACO_grn", nil, 10000];
    (_return select 1) pushBack ["optic_Aco_smg", nil, 5000];
    (_return select 1) pushBack ["optic_ACO_grn_smg", nil, 5000];
    (_return select 1) pushBack ["optic_Holosight", nil, 10000];
    (_return select 1) pushBack ["optic_Holosight_smg", nil, 5000];

    //--- Perk: Race Marshal
    if (["race_marshal"] call GTA_fnc_hasPerk) then {
      (_return select 1) pushBack ["hgun_Pistol_Signal_F", nil, 10000];
      (_return select 1) pushBack ["6Rnd_GreenSignal_F", nil, 500];
      (_return select 1) pushBack ["6Rnd_RedSignal_F", nil, 500];
    };

    //--- Rangemaster belt
    (_return select 1) pushBack ["V_Rangemaster_belt", nil, 5000];
  };

  case "genstore": {
    //--- Items
    (_return select 1) pushBack ["ItemGPS", nil, 100];
    (_return select 1) pushBack ["ItemCompass", nil, 100];
    (_return select 1) pushBack ["ItemWatch", nil, 100];
    (_return select 1) pushBack ["ItemMap", nil, 100];
    (_return select 1) pushBack ["ItemRadio", nil, 100];
    (_return select 1) pushBack ["FirstAidKit", nil, 150];
    (_return select 1) pushBack ["ToolKit", nil, 3000];
    (_return select 1) pushBack ["NVGoggles", nil, 5000];
    (_return select 1) pushBack ["NVGoggles_OPFOR", nil, 5000];
    (_return select 1) pushBack ["NVGoggles_INDEP", nil, 5000];
    (_return select 1) pushBack ["Binocular", nil, 100];
    (_return select 1) pushBack ["Rangefinder", nil, 50000];

    //--- Perk (Thug Life)
    if ("thug_life" call GTA_fnc_perkRank > 0) then {
      (_return select 1) pushBack ["HandGrenade_Stone", nil, 25000];
    };
  };

  case "bounty_hunter": {
    if (playerSide != civilian) exitWith {"You are not a civilian!"};
    if !(["bounty_hunter"] call GTA_fnc_hasPerk) exitWith {"You don't have the 'Bounty Hunter' perk!"};

    //--- Items
    (_return select 1) pushBack ["ItemGPS", nil, 100];
    (_return select 1) pushBack ["ItemCompass", nil, 100];
    (_return select 1) pushBack ["ItemWatch", nil, 100];
    (_return select 1) pushBack ["ItemMap", nil, 100];
    (_return select 1) pushBack ["ItemRadio", nil, 100];
    (_return select 1) pushBack ["FirstAidKit", nil, 150];
    (_return select 1) pushBack ["ToolKit", nil, 3000];
    (_return select 1) pushBack ["NVGoggles", nil, 5000];
    (_return select 1) pushBack ["NVGoggles_OPFOR", nil, 5000];
    (_return select 1) pushBack ["NVGoggles_INDEP", nil, 5000];
    (_return select 1) pushBack ["Binocular", nil, 100];
    (_return select 1) pushBack ["Rangefinder", nil, 50000];

    //--- P07 Taser
    (_return select 1) pushBack ["hgun_P07_snds_F", "Taser", 30000];
    (_return select 1) pushBack ["16Rnd_9x21_Mag", nil, 30000];

    //--- Advanced Taser
    if (["hunter_veteran"] call GTA_fnc_hasPerk) then {
      (_return select 1) pushBack ["hgun_Pistol_heavy_01_snds_F", "Advanced Taser", 50000];
      (_return select 1) pushBack ["11Rnd_45ACP_Mag", nil, 500];
      (_return select 1) pushBack ["optic_MRD", nil, 25000];
    };
  };
};

//--- Donator (50% reduced price)
if (["GTA_donatorLevel", 0] call GTA_fnc_getConstant > 0 || {[] call GTA_fnc_isMonthlySale}) then {
  {
    _x params [
      "",
      "",
      ["_price", 0, [0]],
      ["_discount", true, [true]]
  ];

    if (_discount) then {
      _x set [2, _price / 2];
    };
  } forEach (_return select 1);
};

_return
