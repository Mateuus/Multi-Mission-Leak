class CfgShop
{
  /* ----------WEAPONS----------*/
  class DDOPP_X26
  {
    class price
    {
      guer = 0;
      west = 50;
      civ = 0;
    };
    magazines[] = {"DDOPP_1Rnd_X26"};
    silencer[] = {};
    sights[] = {};
    items[] = {};
  };
  class DDOPP_1Rnd_X26
  {
    class price
    {
      guer = 0;
      west = 10;
      civ = 0;
    };
  };
  /*Police Standard Issue*/
  class RH_g17
  {
    class price
    {
      guer = 0;
      west = 100;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_coplevel) > 1";
    };
    magazines[] = {"RH_17Rnd_9x19_g17"};
    silencer[] = {"RH_gemtech9"};
    sights[] = {};
    items[] = {"RH_M6X","RH_X2","RH_X300"};
  };

  class arifle_SDAR_F
  {
    class price
    {
      guer = 0;
      west = 1050;
      civ = 35000;
    };
    class requirement
    {
      west = "(call life_coplevel) > 1";
      civ = "('dive' in AN_Licenses) && ('gun' in AN_Licenses)";
    };
    magazines[] = {"20Rnd_556x45_UW_mag"};
    silencer[] = {};
    sights[] = {};
    items[] = {};
  };

  class V_RebreatherB
  {
    class price
    {
      guer = 10;
      west = 150;
      civ = 1500;
    };
    class requirement
    {
      west = "(call life_coplevel) > 1";
      civ = "('dive' in AN_Licenses)";
    };
  };

  class U_C_man_sport_1_F: V_RebreatherB{};
  class U_C_man_sport_2_F: V_RebreatherB{};
  class U_C_man_sport_3_F: V_RebreatherB{};

  class RH_17Rnd_9x19_g17
  {
    class price
    {
      guer = 0;
      west = 50;
      civ = 500;
    };
    class requirement
    {
      west = "(call life_coplevel) > 1";
      civ = "('gun' in AN_Licenses)";
    };
  };
  class RH_gemtech9
  {
    class price
    {
      guer = 0;
      west = 50;
      civ = 750;
    };
    class requirement
    {
      west = "(call life_swatlevel) > 0";
      civ = "('silencer' in AN_Skills)";
    };
  };
  class RH_tecsd: RH_gemtech9 {};
  /* SWAT */
  class RH_fnp45t
  {
    class price
    {
      guer = 0;
      west = 100;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_swatlevel) > 0";
    };
    magazines[] = {"RH_15Rnd_45cal_fnp"};
    silencer[] = {"RH_gemtech45"};
    sights[] = {"optic_MRD"};
    items[] = {"RH_M6X","RH_X2","RH_X300"};
  };
  class RH_15Rnd_45cal_fnp
  {
    class price
    {
      guer = 0;
      west = 50;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_swatlevel) > 0";
    };
  };
  class optic_MRD
  {
    class price
    {
      guer = 0;
      west = 50;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_swatlevel) > 0";
    };
  };
  class RH_gemtech45
  {
    class price
    {
      guer = 0;
      west = 50;
      civ = 500;
    };
    class requirement
    {
      west = "(call life_swatlevel) > 0";
      civ = "('silencer' in AN_Skills)";
    };
  };

  class RH_matchsd
  {
    class price
    {
      guer = 0;
      west = 50;
      civ = 500;
    };
    class requirement
    {
      west = "(call life_swatlevel) > 0";
      civ = "('silencer' in AN_Skills)";
    };
  };
  class RH_usp
  {
    class price
    {
      guer = 0;
      west = 100;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_swatlevel) > 0";
    };
    magazines[] = {"RH_12Rnd_45cal_usp"};
    silencer[] = {"RH_gemtech45"};
    sights[] = {};
    items[] = {"RH_M6X","RH_X2","RH_X300"};
  };
  class RH_16Rnd_40cal_usp: RH_15Rnd_45cal_fnp {};

  class RH_uspM
  {
    class price
    {
      guer = 0;
      west = 100;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_swatlevel) > 0";
    };
    magazines[] = {"RH_16Rnd_40cal_usp"};
    silencer[] = {"RH_matchsd"};
    sights[] = {};
    items[] = {};
  };
  class RH_12Rnd_45cal_usp: RH_15Rnd_45cal_fnp {};
  /* SWAT */
  /* Detective */
  class RH_m9
  {
    class price
    {
      guer = 0;
      west = 100;
      civ = 10000;
    };
    class requirement
    {
      west = "(call life_coplevel) > 2";
    };
    magazines[] = {"RH_15Rnd_9x19_M9"};
    silencer[] = {};
    sights[] = {};
    items[] = {"RH_M6X","RH_X2","RH_X300"};
  };
  class RH_15Rnd_9x19_M9
  {
    class price
    {
      guer = 0;
      west = 50;
      civ = 400;
    };
    class requirement
    {
    west = "(call life_coplevel) > 2";
    };
  };
  /* Civ Gunstore */
  class RH_g19t
  {
    class price
    {
      guer = 0;
      west = 500;
      civ = 9000;
    };
    class requirement
    {
      civ = "('gun' in AN_Licenses)";
      west = "(call life_detective) > 0";
    };
    magazines[] = {"RH_17Rnd_9x19_g17"};
    silencer[] = {};
    sights[] = {};
    items[] = {};
  };
  class hgun_P07_F
  {
    class price
    {
      guer = 0;
      west = 100;
      civ = 10000;
    };
    class requirement
    {
      civ = "('gun' in AN_Licenses)";
      west = "(call life_detective) > 0";
    };
    magazines[] = {"16Rnd_9x21_Mag"};
    silencer[] = {};
    sights[] = {};
    items[] = {};
  };
  class 16Rnd_9x21_Mag: RH_17Rnd_9x19_g17 {};
  class hgun_Rook40_F: hgun_P07_F {};
  class RH_cz75
  {
    class price
    {
      guer = 0;
      west = 100;
      civ = 5500;
    };
    class requirement
    {
      civ = "('gun' in AN_Licenses)";
      west = "(call life_detective) > 0";
    };
    magazines[] = {"RH_16Rnd_9x19_CZ"};
    silencer[] = {};
    sights[] = {};
    items[] = {};
  };
  class RH_16Rnd_9x19_CZ: RH_17Rnd_9x19_g17 {};
  class RH_fn57
  {
    class price
    {
      guer = 0;
      west = 500;
      civ = 40500;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
      civ = "('gun' in AN_Licenses)";
    };
    magazines[] = {"RH_20Rnd_57x28_FN"};
    silencer[] = {};
    sights[] = {};
    items[] = {};
  };
  class RH_20Rnd_57x28_FN
  {
    class price
    {
      guer = 0;
      west = 10;
      civ = 1000;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
      civ = "('gun' in AN_Licenses)";
    };
  };
  class RH_kimber_nw
  {
    class price
    {
      guer = 0;
      west = 500;
      civ = 40000;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
      civ = "('gun' in AN_Licenses)";
    };
    magazines[] = {"RH_7Rnd_45cal_m1911"};
    silencer[] = {};
    sights[] = {};
    items[] = {};
  };
  class RH_m1911: RH_kimber_nw {};
  class RH_sw659
  {
    class price
    {
      guer = 0;
      west = 500;
      civ = 10000;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
      civ = "('gun' in AN_Licenses)";
    };
    magazines[] = {"RH_14Rnd_9x19_sw"};
    silencer[] = {};
    sights[] = {};
    items[] = {};
  };
  class RH_7Rnd_45cal_m1911
  {
    class price
    {
      guer = 0;
      west = 50;
      civ = 150;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
      civ = "('gun' in AN_Licenses)";
    };
  };
  class RH_14Rnd_9x19_sw: RH_7Rnd_45cal_m1911 {};
  class RH_mp412
  {
    class price
    {
      guer = 0;
      west = 100;
      civ = 26000;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
      civ = "('gun' in AN_Licenses)";
    };
    magazines[] = {"RH_6Rnd_357_Mag"};
    silencer[] = {};
    sights[] = {};
    items[] = {};
  };
  class RH_6Rnd_357_Mag
  {
    class price
    {
      guer = 0;
      west = 0;
      civ = 1000;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
      civ = "('gun' in AN_Licenses)";
    };
  };
  /**/
  class RH_Deagles
  {
    class price
    {
      guer = 0;
      west = 5000;
      civ = 55000;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
      civ = "('rebel' in AN_Licenses)";
    };
    magazines[] = {"RH_7Rnd_50_AE"};
    silencer[] = {};
    sights[] = {};
    items[] = {};
  };
  class RH_7Rnd_50_AE
  {
    class price
    {
      guer = 0;
      west = 50;
      civ = 1500;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
      civ = "('rebel' in AN_Licenses)";
    };
  };
  class RH_g18
  {
    class price
    {
      guer = 0;
      west = 500;
      civ = 35000;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
      civ = "('rebel' in AN_Licenses)";
    };
    magazines[] = {"RH_19Rnd_9x19_g18","RH_33Rnd_9x19_g18"};
    silencer[] = {"RH_gemtech9"};
    sights[] = {};
    items[] = {};
  };
  class RH_19Rnd_9x19_g18
  {
    class price
    {
      guer = 0;
      west = 100;
      civ = 150;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
      civ = "('rebel' in AN_Licenses)";
    };
  };
  class RH_33Rnd_9x19_g18
  {
    class price
    {
      guer = 0;
      west = 40;
      civ = 310;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
      civ = "('rebel' in AN_Licenses)";
    };
  };
  class RH_tec9
  {
    class price
    {
      guer = 0;
      west = 500;
      civ = 35000;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
      civ = "('rebel' in AN_Licenses)";
    };
    magazines[] = {"RH_32Rnd_9x19_tec"};
    silencer[] = {"RH_tecsd"};
    sights[] = {};
    items[] = {};
  };
  class RH_32Rnd_9x19_tec: RH_33Rnd_9x19_g18 {};
  class RH_vz61
  {
    class price
    {
      guer = 0;
      west = 4000;
      civ = 37500;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
      civ = "('rebel' in AN_Licenses)";
    };
    magazines[] = {"RH_20Rnd_32cal_vz61"};
    silencer[] = {};
    sights[] = {};
    items[] = {};
  };
  class RH_20Rnd_32cal_vz61
  {
    class price
    {
      guer = 0;
      west = 30;
      civ = 250;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
      civ = "('rebel' in AN_Licenses)";
    };
  };
  class hlc_rifle_auga2para_t
  {
    class price
    {
      guer = 0;
      west = 500;
      civ = 33000;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
      civ = "('rebel' in AN_Licenses)";
    };
    magazines[] = {"hlc_25Rnd_9x19mm_M882_AUG","hlc_25Rnd_9x19mm_JHP_AUG"};
    silencer[] = {"hlc_muzzle_snds_a6AUG"};
    sights[] = {};
    items[] = {};
  };
  class hlc_rifle_auga2para: hlc_rifle_auga2para_t {};
  class hlc_rifle_augpara
  {
    class price
    {
      guer = 0;
      west = 500;
      civ = 35000;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
      civ = "('rebel' in AN_Licenses)";
    };
    magazines[] = {"hlc_25Rnd_9x19mm_M882_AUG","hlc_25Rnd_9x19mm_JHP_AUG"};
    silencer[] = {"hlc_muzzle_snds_a6AUG"};
    sights[] = {};
    items[] = {};
  };
  class hlc_rifle_augpara_t: hlc_rifle_augpara {};
  class hlc_25Rnd_9x19mm_M882_AUG
  {
    class price
    {
      guer = 0;
      west = 40;
      civ = 250;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
      civ = "('rebel' in AN_Licenses)";
    };
  };
  class hlc_25Rnd_9x19mm_JHP_AUG: hlc_25Rnd_9x19mm_M882_AUG {};
  class hlc_muzzle_snds_a6AUG
  {
    class price
    {
      guer = 0;
      west = 500;
      civ = 1000;
    };
    class requirement
    {
      civ = "('silencer' in AN_Skills)";
      west = "(call life_detective) > 0";
    };
  };
  class muzzle_snds_B
  {
    class price
    {
      guer = 0;
      west = 500;
      civ = 1000;
    };
    class requirement
    {
      civ = "('silencer' in AN_Skills)";
      west = "(call life_detective) > 0";
    };
  };

  class hlc_muzzle_545SUP_AK: hlc_muzzle_snds_a6AUG {};
  class hlc_muzzle_762SUP_AK: hlc_muzzle_snds_a6AUG {};
  class hlc_rifle_aku12
  {
    class price
    {
      guer = 0;
      west = 5400;
      civ = 82000;
    };
    class requirement
    {
      civ = "('rebel' in AN_Licenses)";
      west = "(call life_detective) > 0";
    };
    magazines[] = {"hlc_30Rnd_545x39_B_AK","hlc_30Rnd_545x39_t_ak","hlc_30Rnd_545x39_EP_ak","hlc_30Rnd_545x39_S_AK"};
    silencer[] = {"hlc_muzzle_545SUP_AK"};
    sights[] = {"optic_Aco","optic_ACO_grn","optic_Holosight","optic_MRCO"};
    items[] = {};
  };
  class hlc_rifle_aks74u
  {
    class price
    {
      guer = 0;
      west = 9000;
      civ = 97000;
    };
    class requirement
    {
      civ = "('rebel' in AN_Licenses)";
      west = "(call life_detective) > 0";
    };
    magazines[] = {"hlc_30Rnd_545x39_B_AK","hlc_30Rnd_545x39_t_ak","hlc_30Rnd_545x39_EP_ak","hlc_30Rnd_545x39_S_AK"};
    silencer[] = {"hlc_muzzle_545SUP_AK"};
    sights[] = {};
    items[] = {};
  };
  class arifle_AK12_F
  {
    class price
    {
      guer = 0;
      west = 12000;
      civ = 190000;
    };
    class requirement
    {
      civ = "('rebel' in AN_Licenses)";
      west = "(call life_detective) > 0";
    };
    magazines[] = {"30Rnd_762x39_Mag_F"};
    silencer[] = {"muzzle_snds_B"};
    sights[] = {"optic_Aco","optic_ACO_grn","optic_Holosight","optic_Hamr","optic_MRCO","optic_Hamr_khk_F","optic_Arco"};
    items[] = {};
  };
  class arifle_AK12_GL_F: arifle_AK12_F {};

  class arifle_AKM_F
  {
    class price
    {
      guer = 0;
      west = 9000;
      civ = 110000;
    };
    class requirement
    {
      civ = "('rebel' in AN_Licenses)";
      west = "(call life_detective) > 0";
    };
    magazines[] = {"30Rnd_762x39_Mag_F"};
    silencer[] = {"muzzle_snds_B"};
    sights[] = {};
    items[] = {};
  };

  class arifle_AKS_F
  {
    class price
    {
      guer = 0;
      west = 20000;
      civ = 90000;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
      civ = "('rebel' in AN_Licenses)";
    };
    magazines[] = {"30Rnd_545x39_Mag_F"};
    silencer[] = {"muzzle_snds_B"};
    sights[] = {};
    items[] = {};
  };
  class hlc_30Rnd_545x39_B_AK
  {
    class price
    {
      civ = 1350;
      west = 40;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
      civ = "('rebel' in AN_Licenses)";
    };
  };
  class hlc_30Rnd_545x39_t_ak: hlc_30Rnd_545x39_B_AK {};
  class hlc_30Rnd_545x39_EP_ak: hlc_30Rnd_545x39_B_AK {};
  class hlc_30Rnd_545x39_S_AK: hlc_30Rnd_545x39_B_AK {};
  class 30Rnd_545x39_Mag_F: hlc_30Rnd_545x39_B_AK {};
  class 30Rnd_762x39_Mag_F: hlc_30Rnd_545x39_B_AK {};
  class hlc_45Rnd_545x39_t_rpk
  {
    class price
    {
      civ = 500;
      west = 40;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
      civ = "('rebel' in AN_Licenses)";
    };
  };
  class hlc_30Rnd_762x39_b_ak
  {
    class price
    {
      civ = 1000;
      west = 40;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
      civ = "('rebel' in AN_Licenses)";
    };
  };
  class hlc_30Rnd_762x39_t_ak: hlc_30Rnd_762x39_b_ak {};

    // cop shit
  class hlc_smg_mp5a2
  {
    class price
    {
      guer = 0;
      west = 500;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_coplevel) > 3";
    };
    magazines[] = {"hlc_30Rnd_9x19_B_MP5","hlc_30Rnd_9x19_GD_MP5","hlc_30Rnd_9x19_SD_MP5"};
    silencer[] = {"hlc_muzzle_Tundra"};
    sights[] = {"optic_Aco","optic_ACO_grn","optic_Holosight_smg"};
    items[] = {};
  };
  class hlc_smg_mp5a3: hlc_smg_mp5a2 {};
  class SMG_05_F
  {
    class price
    {
      guer = 0;
      west = 500;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_coplevel) > 2";
    };
    magazines[] = {"30Rnd_9x21_Mag_SMG_02"};
    silencer[] = {};
    sights[] = {"optic_Aco","optic_ACO_grn","optic_Holosight_smg"};
    items[] = {"acc_pointer_IR","acc_flashlight"};
  };
  class hlc_smg_mp5k_PDW
  {
    class price
    {
      guer = 0;
      west = 500;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_swatlevel) > 0";
    };
    magazines[] = {"hlc_30Rnd_9x19_B_MP5","hlc_30Rnd_9x19_GD_MP5","hlc_30Rnd_9x19_SD_MP5"};
    silencer[] = {"hlc_muzzle_Tundra"};
    sights[] = {"optic_Aco","optic_ACO_grn","optic_Holosight_smg"};
    items[] = {};
  };
  class hlc_30Rnd_9x19_B_MP5
  {
    class price
    {
      guer = 0;
      west = 50;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_coplevel) > 3";
    };
  };
  class hlc_30Rnd_9x19_GD_MP5: hlc_30Rnd_9x19_B_MP5 {};
  class hlc_30Rnd_9x19_SD_MP5: hlc_30Rnd_9x19_B_MP5 {};
  class hlc_muzzle_Tundra
  {
    class price
    {
      guer = 0;
      west = 200;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_swatlevel) > 0";
    };
  };
  class hlc_muzzle_556NATO_KAC: hlc_muzzle_Tundra {};
  class optic_Aco
  {
    class price
    {
      guer = 0;
      west = 100;
      civ = 300;
    };
    class requirement
    {
      west = "(call life_coplevel) > 2";
    };
  };
  class optic_ACO_grn: optic_Aco {};
  class optic_Holosight_smg: optic_Aco {};
  class optic_Holosight: optic_Aco {};
  class optic_MRCO: optic_Aco {};
  class optic_Hamr
  {
    class price
    {
      civ = 650;
    };
  };
  class optic_DMS
  {
    class price
    {
      civ = 5000;
    };
  };
  class optic_Hamr_khk_F: optic_Aco {};
  class optic_Arco: optic_Hamr {};
  class hlc_optic_kobra: optic_Aco {};
  class acc_pointer_IR: optic_Aco {};
  class acc_flashlight: optic_Aco {};
  class bipod_01_F_blk: optic_Aco {};
  class HLC_Optic_1p29
  {
    class price
    {
      civ = 500;
    };
  };
  class arifle_SPAR_01_blk_F
  {
    class price
    {
      guer = 0;
      west = 500;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_coplevel) > 4";
    };
    magazines[] = {"30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Tracer_Green","30Rnd_556x45_Stanag_Tracer_Yellow"};
    silencer[] = {"hlc_muzzle_556NATO_KAC"};
    sights[] = {"optic_Aco","optic_ACO_grn","optic_Holosight","optic_DMS","optic_MRCO","optic_Hamr_khk_F"};
    items[] = {};
  };

  class arifle_SPAR_01_khk_F: arifle_SPAR_01_blk_F{};
  class arifle_SPAR_01_snd_F: arifle_SPAR_01_blk_F{};
  class arifle_SPAR_01_GL_blk_F: arifle_SPAR_01_blk_F{};
  class arifle_SPAR_01_GL_snd_F: arifle_SPAR_01_blk_F{};
  class arifle_SPAR_01_GL_khk_F: arifle_SPAR_01_blk_F{};


  class arifle_SPAR_03_blk_F
  {
    class price
    {
      guer = 0;
      west = 500;
      civ = 500000;
    };
    class requirement
    {
      west = "(call life_coplevel) > 5";
    };
    magazines[] = {"20Rnd_762x51_Mag"};
    silencer[] = {"muzzle_snds_B_khk_F","muzzle_snds_B_snd_F","muzzle_snds_B"};
    sights[] = {"optic_Aco","optic_ACO_grn","optic_Holosight","optic_DMS","optic_MRCO","optic_Hamr_khk_F"};
    items[] = {"acc_flashlight","acc_pointer_IR","bipod_01_F_blk"};
  };

  class arifle_SPAR_03_khk_F: arifle_SPAR_03_blk_F{};
  class arifle_SPAR_03_snd_F: arifle_SPAR_03_blk_F{};

  class hlc_rifle_CQBR
  {
    class price
    {
      guer = 0;
      west = 500;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_coplevel) > 6";
    };
    magazines[] = {"hlc_30rnd_556x45_EPR","hlc_30rnd_556x45_SOST","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Tracer_Green","30Rnd_556x45_Stanag_Tracer_Yellow"};
    silencer[] = {"hlc_muzzle_556NATO_KAC"};
    sights[] = {"optic_Aco","optic_ACO_grn","optic_Holosight","optic_MRCO"};
    items[] = {"acc_flashlight","acc_pointer_IR","bipod_01_F_blk"};
  };
  class hlc_30rnd_556x45_EPR
  {
    class price
    {
      guer = 0;
      west = 50;
      civ = 500;
    };
    class requirement
    {
      west = "(call life_coplevel) > 3";
      civ = "life_protectiveDetail";
    };
  };
  class hlc_30rnd_556x45_SOST: hlc_30rnd_556x45_EPR {};
  class 20Rnd_762x51_Mag: hlc_30rnd_556x45_EPR {};
  //class hlc_30rnd_556x45_SPR: hlc_30rnd_556x45_EPR {};

  class 30Rnd_556x45_Stanag
  {
    class price
    {
      guer = 0;
      west = 50;
      civ = 3000;
    };
  };

  class 30Rnd_556x45_Stanag_Tracer_Red: 30Rnd_556x45_Stanag {};
  class 30Rnd_556x45_Stanag_Tracer_Green: 30Rnd_556x45_Stanag {};
  class 30Rnd_556x45_Stanag_Tracer_Yellow: 30Rnd_556x45_Stanag {};
  class 20Rnd_556x45_UW_mag: 30Rnd_556x45_Stanag {};

  class R3F_FRF2
  {
    class price
    {
      guer = 0;
      west = 1000;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_swatlevel) > 1";
    };
    magazines[] = {"R3F_10Rnd_762x51_FRF2"};
    silencer[] = {"R3F_SILENCIEUX_FRF2"};
    sights[] = {"R3F_NF","R3F_NF42"};
    items[] = {};
  };

  class arifle_ARX_blk_F
  {
    class price
    {
      guer = 0;
      west = 1000;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_coplevel) > 5";
    };
    magazines[] = {"30Rnd_65x39_caseless_green"};
    silencer[] = {"muzzle_snds_65_TI_blk_F"};
    sights[] = {"optic_Aco","optic_ACO_grn","optic_Holosight","optic_DMS","optic_MRCO","optic_Hamr_khk_F"};
    items[] = {"acc_pointer_IR","acc_flashlight"};
  };
  class arifle_ARX_ghex_F:arifle_ARX_blk_F {};
  class arifle_ARX_hex_F:arifle_ARX_blk_F {};

  class gign_shield
  {
    class price
    {
      guer = 0;
      west = 1000;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_swatlevel) > 1";
    };
    magazines[] = {};
    silencer[] = {};
    sights[] = {};
    items[] = {};
  };
  class R3F_10Rnd_762x51_FRF2
  {
    class price
    {
      guer = 0;
      west = 100;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_swatlevel) > 1";
    };
  };

  class R3F_SILENCIEUX_FRF2
  {
    class price
    {
      guer = 0;
      west = 500;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_swatlevel) > 1";
    };
  };
  class muzzle_snds_65_TI_blk_F: R3F_SILENCIEUX_FRF2{};
  class muzzle_snds_65_TI_knk_F: R3F_SILENCIEUX_FRF2{};
  class muzzle_snds_65_TI_snd_F: R3F_SILENCIEUX_FRF2{};
  class R3F_NF
  {
    class price
    {
      guer = 0;
      west = 150;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_swatlevel) > 1";
    };
  };
  class R3F_NF42
  {
    class price
    {
      guer = 0;
      west = 150;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_swatlevel) > 1";
    };
  };

  /* -----------BODYGUARD------*/
  class hlc_rifle_RU556
  {
    class price
    {
      guer = 0;
      west = 0;
      civ = 15000;
    };
    class requirement
    {
      civ = "life_protectiveDetail";
    };
    magazines[] = {"hlc_30rnd_556x45_SOST"};
    silencer[] = {};
    sights[] = {"optic_Aco","optic_ACO_grn","optic_Holosight","optic_MRCO"};
    items[] = {"acc_pointer_IR","acc_flashlight"};
  };
  class RH_p226
  {
    class price
    {
      guer = 0;
      west = 0;
      civ = 1500;
    };
    class requirement
    {
      civ = "life_protectiveDetail";
    };
    magazines[] = {"RH_15Rnd_9x19_SIG"};
    silencer[] = {};
    sights[] = {};
    items[] = {};
  };
  class RH_15Rnd_9x19_SIG
  {
    class price
    {
      guer = 0;
      west = 0;
      civ = 100;
    };
    class requirement
    {
      civ = "life_protectiveDetail";
    };
  };
  class KAEL_SUITS_BR_F15
  {
    class price
    {
      civ = 300;
      west = 0;
      guer = 0;
    };
    class requirement
    {
      civ = "life_protectiveDetail";
    };
  };

  class tacs_Cap_Earpiece_BlackLogo
  {
    class price
    {
      civ = 50;
      west = 0;
      guer = 0;
    };
    class requirement
    {
      civ = "life_protectiveDetail";
    };
  };
  class G_Spectacles_Tinted
  {
    class price
    {
      civ = 50;
      west = 0;
      guer = 0;
    };
  };
  class TRYK_V_Sheriff_BA_TB
  {
    class price
    {
      civ = 500;
      west = 0;
      guer = 0;
    };
    class requirement
    {
      civ = "life_protectiveDetail";
    };
  };
  class TRYK_V_Sheriff_BA_TB2
  {
    class price
    {
      civ = 500;
      west = 0;
      guer = 0;
    };
    class requirement
    {
      civ = "life_protectiveDetail";
    };
  };
  class pmc_earpiece
  {
    class price
    {
      civ = 50;
      west = 0;
      guer = 0;
    };
  };
  /* -----------PRESIDENT--------*/
  class TRYK_SUITS_BLK_F
  {
    class price
    {
      civ = 100;
      west = 0;
      guer = 0;
    };
  };
  class TRYK_V_Bulletproof_BL
  {
    class price
    {
      civ = 500;
      west = 0;
      guer = 0;
    };
    class requirement
    {
      civ = "life_isGov";
    };
  };
  class TRYK_V_Bulletproof_BLK: TRYK_V_Bulletproof_BL {};
  class tacs_Suit_VIP: TRYK_SUITS_BLK_F {};

  /* ---- Lawyer suits ----- */
  class KAEL_SUITS_BLK_F
  {
    class price
    {
      civ = 5000;
      west = 5000;
      guer = 0;
    };
  };

  class KAEL_SUITS_BR_F: KAEL_SUITS_BLK_F {};
  class KAEL_SUITS_BR_F3: KAEL_SUITS_BLK_F {};
  class KAEL_SUITS_BR_F4: KAEL_SUITS_BLK_F {};
  class KAEL_SUITS_BR_F5: KAEL_SUITS_BLK_F {};
  class KAEL_SUITS_BR_F6: KAEL_SUITS_BLK_F {};
  class KAEL_SUITS_BR_F7: KAEL_SUITS_BLK_F {};
  class KAEL_SUITS_BR_F8: KAEL_SUITS_BLK_F {};
  class KAEL_SUITS_BR_F9: KAEL_SUITS_BLK_F {};
  class KAEL_SUITS_BR_F10: KAEL_SUITS_BLK_F {};
  class KAEL_SUITS_BR_F12: KAEL_SUITS_BLK_F {};
  class KAEL_SUITS_BR_F13: KAEL_SUITS_BLK_F {};
  class KAEL_SUITS_BR_F14: KAEL_SUITS_BLK_F {};
  class KAEL_SUITS_BR_F33: KAEL_SUITS_BLK_F {};
  /* -----------CG Gear--------*/
  class TRYK_H_Booniehat_3CD
  {
    class price
    {
      guer = 0;
      west = 20;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_cglevel) > 0";
    };
  };
  class AN_CG_HAT
  {
    class price
    {
      guer = 0;
      west = 20;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_cglevel) > 0";
    };
  };
  class G_B_Diving
  {
    class price
    {
      guer = 0;
      west = 20;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_cglevel) > 0";
      civ = "('dive' in AN_Licenses)";
    };
  };

  class U_B_Wetsuit
  {
    class price
    {
      guer = 500;
      west = 20;
      civ = 500;
    };
    class requirement
    {
      civ = "('dive' in AN_Licenses)";
    };
  };

  class U_I_Wetsuit: U_B_Wetsuit {};
  class AN_EMS_WET: U_B_Wetsuit {};
  class Handgrenade_stone
  {
    class price
    {
      civ = 50000;
      west = 50;
      guer = 0;
    };
    class requirement
    {
      west = "(call life_swatlevel) > 1";
    };
  };
  class AN_CG_VEST_HIGH_1
  {
    class price
    {
      guer = 0;
      west = 100;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_cglevel) > 3";
    };
  };
  class AN_CG_VEST_TAK_1
  {
    class price
    {
      guer = 0;
      west = 100;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_cglevel) isEqualTo 1";
    };
  };
  class AN_CG_VEST_REB_1
  {
    class price
    {
      guer = 0;
      west = 100;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_cglevel) isEqualTo 1";
    };
  };
  class AN_CG_VEST_TAK_2
  {
    class price
    {
      guer = 0;
      west = 100;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_cglevel) isEqualTo 2";
    };
  };
  class AN_CG_VEST_TAK_3
  {
    class price
    {
      guer = 0;
      west = 100;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_cglevel) isEqualTo 3";
    };
  };
  class TRYK_U_B_3cr
  {
    class price
    {
      guer = 0;
      west = 50;
      civ = 150;
    };
    class requirement
    {
      west = "(call life_cglevel) isEqualTo 6";
    };
  };
  class AN_CG_CAP
  {
    class price
    {
      guer = 0;
      west = 50;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_cglevel) isEqualTo 6";
    };
  };
  class AN_CG_LT
  {
    class price
    {
      guer = 0;
      west = 50;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_cglevel) isEqualTo 5";
    };
  };
  class AN_CG_COR
  {
    class price
    {
      guer = 0;
      west = 50;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_cglevel) isEqualTo 3";
    };
  };
  class AN_CG_OF
  {
    class price
    {
      guer = 0;
      west = 50;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_cglevel) isEqualTo 2";
    };
  };
  class AN_CG_RCT
  {
    class price
    {
      guer = 0;
      west = 50;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_cglevel) isEqualTo 1";
    };
  };
  class AN_CG_SAR
  {
    class price
    {
      guer = 0;
      west = 50;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_cglevel) isEqualTo 4";
    };
  };
  class AN_CG_HELI_UNI
  {
    class price
    {
      guer = 0;
      west = 50;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_cglevel) isEqualTo 2 && (call life_asqlevel) > 0";
    };
  };
  class AN_CG_WET
  {
    class price
    {
      guer = 0;
      west = 50;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_cglevel) > 0";
    };
  };
  /* ------TSO-----*/

  class Campaign_Hat_Tan
  {
    class price
    {
      guer = 0;
      west = 20;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_coplevel) > 0";
    };
  };
  class Campaign_Hat_Washedout
  {
    class price
    {
      guer = 0;
      west = 20;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_coplevel) > 2";
    };
  };
  class Campaign_Hat_Light
  {
    class price
    {
      guer = 0;
      west = 20;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_coplevel) > 4";
    };
  };
  class Campaign_Hat_Dark
  {
    class price
    {
      guer = 0;
      west = 20;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_coplevel) > 5";
    };
  };

  class AN_TSO_CAP
  {
    class price
    {
      guer = 0;
      west = 20;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_coplevel) > 0";
    };
  };
  class AN_TSO_CHIEF
  {
    class price
    {
      guer = 0;
      west = 20;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_coplevel) isEqualTo 7";
    };
  };
  class AN_TSO_USHERIFF
  {
    class price
    {
      guer = 0;
      west = 20;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_coplevel) isEqualTo 8";
    };
  };
  class AN_TSO_CPT
  {
    class price
    {
      guer = 0;
      west = 20;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_coplevel) isEqualTo 6";
    };
  };
  class AN_TSO_SHERIFF
  {
    class price
    {
      guer = 0;
      west = 20;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_coplevel) isEqualTo 9";
    };
  };
  class AN_TSO_CORP
  {
    class price
    {
      guer = 0;
      west = 20;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_coplevel) isEqualTo 3";
    };
  };
  class AN_TSO_LT
  {
    class price
    {
      guer = 0;
      west = 20;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_coplevel) isEqualTo 5";
    };
  };
  class AN_TSO_DEPUTY
  {
    class price
    {
      guer = 0;
      west = 20;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_coplevel) isEqualTo 2";
    };
  };
  class AN_TSO_CADET
  {
    class price
    {
      guer = 0;
      west = 20;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_coplevel) isEqualTo 1";
    };
  };
  class AN_TSO_SERG
  {
    class price
    {
      guer = 0;
      west = 20;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_coplevel) isEqualTo 4";
    };
  };
  class AN_PD_HELI_UNI
  {
    class price
    {
      guer = 0;
      west = 20;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_coplevel) > 1 && (call life_asqlevel) > 0";
    };
  };
  class AN_TSO_VEST_1
  {
    class price
    {
      guer = 0;
      west = 50;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_coplevel) > 5";
    };
  };
  class AN_TSO_VEST_3
  {
    class price
    {
      guer = 0;
      west = 50;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_coplevel) > 0";
    };
  };
  class TRYK_V_Bulletproof: AN_TSO_VEST_3 {};
  /* ----- SWAT ----- */
  class ATHhelm_Balaclava4
  {
    class price
    {
      guer = 0;
      west = 20;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_swatlevel) > 0";
    };
  };
  class TRYK_H_PASGT_OD
  {
    class price
    {
      guer = 0;
      west = 20;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_swatlevel) > 0";
    };
  };
  class TRYK_U_B_OD_OD_CombatUniform
  {
    class price
    {
      guer = 0;
      west = 20;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_swatlevel) > 0";
    };
  };
  class AN_TSO_SWAT_1
  {
    class price
    {
      guer = 0;
      west = 100;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_swatlevel) > 0";
    };
  };
  /* ----- Detectives ----- */
  class AN_TSO_VEST_2
  {
    class price
    {
      guer = 0;
      west = 20;
      civ = 0;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
    };
  };
  /* ----------ITEMS----------*/
  class ItemWatch
  {
    class price
    {
      guer = 10;
      west = 10;
      civ = 10;
    };
  };
  class Mattaust_Phone: ItemWatch {};
  class ItemCompass: ItemWatch {};
  class FirstAidKit: ItemWatch {};
  class ItemGPS
  {
    class price
    {
      guer = 10;
      west = 10;
      civ = 100;
    };
  };
  class ItemMap: ItemWatch {};
  class Binocular: ItemWatch {};
  class Rangefinder: ItemGPS {};
  class ToolKit
  {
	class price
    {
      guer = 10;
      west = 10;
      civ = 100;
    };
  };
  class NVGoggles: Toolkit {};
  class Medikit: ToolKit {};
  class AN_Bandage
  {
	class price
    {
      guer = 10;
      west = 10;
      civ = 10;
    };
  };
  class AN_Morphine
  {
	class price
    {
      guer = 10;
      west = 10;
      civ = 100;
    };
  };
  class AN_Defibrillator: AN_Morphine {};
  class AN_Adrenaline: AN_Morphine {};
  class AN_Tourniquet: AN_Morphine {};
  class AN_Bloodbag: AN_Morphine {};
  /* ----- Backpack ------ */
  class EG_InvisBagMain
  {
    class price
    {
      civ = 100;
      west = 50;
      guer = 100;
    };
    class requirement
    {
      civ = "(call life_coplevel) > 0";
    };
  };

  class AM_PoliceBelt: EG_InvisBagMain {};
  /* ---- RADIOS ----- */
  class tf_fadak
  {
    class price
    {
      civ = 100;
      west = 100;
      guer = 100;
    };
    class requirement
    {
      civ = "";
    };
  };
  class tf_anprc152
  {
    class price
    {
      civ = 100;
      west = 20;
      guer = 20;
    };
    class requirement
    {
      civ = "";
    };
  };
  /* ----- EMS CLOTHING -------- */
  class max_command_uniform
  {
    class price
    {
      civ = 0;
      west = 0;
      guer = 10;
    };
    class requirement
    {
      guer = "(call life_mediclevel) > 3";
    };
  };

  class max_paramedic_cap
  {
    class price
    {
      civ = 0;
      west = 0;
      guer = 10;
    };
  };

  class HEMS_pilot_Helmet
  {
    class price
    {
      civ = 0;
      west = 0;
      guer = 10;
    };
  };

  class EG_EMS1
  {
    class price
    {
      civ = 0;
      west = 0;
      guer = 10;
    };
    class requirement
    {
      guer = "(call life_mediclevel) > 0";
    };
  };

  class max_paramedic_uniform: EG_EMS1 {};
  class HEMS_pilot_uniform: EG_EMS1 {};

    class max_paramedic_vol_green
    {
      class price
      {
        civ = 0;
        west = 0;
        guer = 10;
      };
      class requirement
      {
        guer = "(call life_mediclevel) > 0";
      };
    };

  class max_paramedic_vest_red: max_paramedic_vol_green {};
  class EG_paramedic_vest_white: max_paramedic_vol_green {};

    class EG_paramedic_vest_semt
    {
      class price
      {
        civ = 0;
        west = 0;
        guer = 10;
      };
      class requirement
      {
        guer = "(call life_mediclevel) > 2";
      };
    };

    class EG_paramedic_vest_com
    {
      class price
      {
        civ = 0;
        west = 0;
        guer = 10;
      };
      class requirement
      {
        guer = "(call life_mediclevel) > 3";
      };
    };

  class max_paramedic_vest_blue: max_paramedic_vol_green {};

  /* ----- CIV CLOTHING -------- */
  class AN_Civ2
  {
    class price
    {
      civ = 50;
      west = 10;
      guer = 0;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
    };
  };
  class AN_Civ3: AN_Civ2 {};
  class AN_Civ4: AN_Civ2 {};
  class AN_Civ5: AN_Civ2 {};
  class AN_Civ6: AN_Civ2 {};
  class AN_Civ7: AN_Civ2 {};
  class AN_Civ9: AN_Civ2 {};
  class AN_Civ12: AN_Civ2 {};
  class Kangaro0_PsiSyndicate: AN_Civ2 {};
  class AN_CivBlast: AN_Civ2 {};
  class Kangaro0_Pydrex: AN_Civ2 {};
  class Kangaro0_ItsKangaro0: AN_Civ2 {};
  class U_C_Poloshirt_blue: AN_Civ2 {};
  class U_C_Poloshirt_burgundy: AN_Civ2 {};
  class U_C_Poloshirt_redwhite: AN_Civ2 {};
  class U_C_Poloshirt_salmon: AN_Civ2 {};
  class U_C_Poloshirt_stripped: AN_Civ2 {};
  class U_C_Poloshirt_tricolour: AN_Civ2 {};
  class U_C_Poor_2: AN_Civ2 {};
  class U_IG_Guerilla2_2
  {
    class price
    {
      civ = 70;
      west = 10;
      guer = 0;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
    };
  };
  class U_IG_Guerilla3_1: U_IG_Guerilla2_2 {};
  class U_IG_Guerilla2_3: U_IG_Guerilla2_2 {};
  class U_C_HunterBody_grn: U_IG_Guerilla2_2 {};
  class U_C_WorkerCoveralls: AN_Civ2 {};
  class TRYK_U_B_PCUHsW3nh
  {
    class price
    {
      civ = 150;
      west = 10;
      guer = 0;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
    };
  };
  class TRYK_U_B_PCUHsW3: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_B_BLKOCP_CombatUniform: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_B_BLOD_T: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_B_BLKTAN_CombatUniform: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_B_3c: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_B_fleece: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_B_fleece_UCP: TRYK_U_B_PCUHsW3nh {};
  class TRYK_HRP_khk: TRYK_U_B_PCUHsW3nh {};
  class TRYK_OVERALL_SAGE_BLKboots_nk_blk2: TRYK_U_B_PCUHsW3nh {};
  class TRYK_OVERALL_SAGE_BLKboots_nk: TRYK_U_B_PCUHsW3nh {};
  class TRYK_OVERALL_nok_flesh: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_B_NATO_OCP_BLK_CombatUniform: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_Bts_PCUGs: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_Bts_GRYGRY_PCUs: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_Bts_PCUODs: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_B_PCUHs: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_B_PCUGs_BLK_R: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_B_PCUGs_OD_R: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_pad_hood_CSATBlk: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_pad_hood_Cl_blk: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_nohoodPcu_gry: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_pad_hood_odBK: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_pad_hood_tan: TRYK_U_B_PCUHsW3nh {};
  class TRYK_hoodie_3c: TRYK_U_B_PCUHsW3nh {};
  class TRYK_hoodie_Blk: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_hood_mc: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_hood_nc: TRYK_U_B_PCUHsW3nh {};
  class TRYK_T_BLK_PAD: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_denim_hood_3c: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_denim_hood_blk: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_denim_hood_mc: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_denim_hood_nc: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_denim_jersey_blk: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_denim_jersey_blu: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_pad_j_blk: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_pad_j: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_taki_BL: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_taki_BLK: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_taki_COY: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_taki_wh: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_taki_G_BL: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_taki_G_BLK: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_taki_G_COY: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_taki_G_WH: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_B_RED_T_BR: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_B_BLK_T_BG_WH: TRYK_U_B_PCUHsW3nh {};
  class TRYK_shirts_OD_PAD_BLW: TRYK_U_B_PCUHsW3nh {};
  class TRYK_shirts_TAN_PAD_BLW: TRYK_U_B_PCUHsW3nh {};
  class TRYK_shirts_PAD_BLU3: TRYK_U_B_PCUHsW3nh {};
  class TRYK_shirts_BLK_PAD_BLU3: TRYK_U_B_PCUHsW3nh {};
  class TRYK_shirts_OD_PAD_BLU3: TRYK_U_B_PCUHsW3nh {};
  class TRYK_shirts_TAN_PAD_BLU3: TRYK_U_B_PCUHsW3nh {};
  class TRYK_shirts_PAD: TRYK_U_B_PCUHsW3nh {};
  class TRYK_shirts_BLK_PAD: TRYK_U_B_PCUHsW3nh {};
  class TRYK_shirts_DENIM_BK: TRYK_U_B_PCUHsW3nh {};
  class TRYK_shirts_DENIM_BL: TRYK_U_B_PCUHsW3nh {};
  class TRYK_shirts_DENIM_BWH: TRYK_U_B_PCUHsW3nh {};
  class TRYK_shirts_DENIM_od: TRYK_U_B_PCUHsW3nh {};
  class TRYK_shirts_DENIM_R: TRYK_U_B_PCUHsW3nh {};
  class TRYK_shirts_DENIM_RED2: TRYK_U_B_PCUHsW3nh {};
  class TRYK_shirts_DENIM_WH: TRYK_U_B_PCUHsW3nh {};
  class TRYK_shirts_DENIM_ylb: TRYK_U_B_PCUHsW3nh {};
  class TRYK_shirts_DENIM_od_Sleeve: TRYK_U_B_PCUHsW3nh {};
  class TRYK_shirts_DENIM_ylb_Sleeve: TRYK_U_B_PCUHsW3nh {};
  class TRYK_shirts_DENIM_R_Sleeve: TRYK_U_B_PCUHsW3nh {};
  class TRYK_shirts_DENIM_RED2_Sleeve: TRYK_U_B_PCUHsW3nh {};
  class TRYK_shirts_DENIM_WH_Sleeve: TRYK_U_B_PCUHsW3nh {};
  class U_C_Driver_1_black: TRYK_U_B_PCUHsW3nh {};
  class U_C_Driver_1_blue: TRYK_U_B_PCUHsW3nh {};
  class U_C_Driver_1_white: TRYK_U_B_PCUHsW3nh {};
  class U_C_Driver_2: TRYK_U_B_PCUHsW3nh {};
  class U_C_Driver_1: TRYK_U_B_PCUHsW3nh {};
  class U_C_Driver_1_green: TRYK_U_B_PCUHsW3nh {};
  class U_C_Driver_1_orange: TRYK_U_B_PCUHsW3nh {};
  class U_C_Driver_1_red: TRYK_U_B_PCUHsW3nh {};
  class U_C_Driver_3: TRYK_U_B_PCUHsW3nh {};
  class U_C_Driver_4: TRYK_U_B_PCUHsW3nh {};
  class U_C_Driver_1_yellow: TRYK_U_B_PCUHsW3nh {};
  class U_C_Journalist: TRYK_U_B_PCUHsW3nh {};
  class tacs_Uniform_Polo_CP_RS_LP_BB
  {
    class price
    {
      civ = 120;
      west = 10;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
    };
  };
  class tacs_Uniform_Polo_CP_LS_TP_OB: tacs_Uniform_Polo_CP_RS_LP_BB {};
  //
  class H_Bandanna_cam
  {
    class price
    {
      civ = 50;
      west = 10;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
    };
  };
  class H_Bandanna_surfer: H_Bandanna_cam {};
  class H_Bandanna_khk: H_Bandanna_cam {};
  class H_Cap_blu: H_Bandanna_cam {};
  class H_Cap_grn: H_Bandanna_cam {};
  class H_Cap_grn_BI: H_Bandanna_cam {};
  class H_Cap_oli: H_Bandanna_cam {};
  class H_Cap_red: H_Bandanna_cam {};
  class H_Cap_tan: H_Bandanna_cam {};
  class H_Bandanna_gry: H_Bandanna_cam {};
  class H_Bandanna_sgg: H_Bandanna_cam {};
  class H_Bandanna_cbr: H_Bandanna_cam {};
  class H_StrawHat: H_Bandanna_cam {};
  class H_Hat_tan: H_Bandanna_cam {};
  class H_Hat_brown: H_Bandanna_cam {};
  class H_Hat_grey: H_Bandanna_cam {};
  class H_BandMask_blk: H_Bandanna_cam {};
  class H_Hat_blue: H_Bandanna_cam {};
  class H_Hat_checker: H_Bandanna_cam {};
  class H_Booniehat_tan: H_Bandanna_cam {};
  //
  class B_OutdoorPack_blk
  {
    class price
    {
      civ = 100;
      west = 10;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
    };
  };
  class B_AssaultPack_khk: B_OutdoorPack_blk {};
  class B_AssaultPack_dgtl: B_OutdoorPack_blk {};
  class B_AssaultPack_rgr: B_OutdoorPack_blk {};
  class B_AssaultPack_sgg: B_OutdoorPack_blk {};
  class B_AssaultPack_blk: B_OutdoorPack_blk {};
  class B_AssaultPack_cbr: B_OutdoorPack_blk {};
  class B_AssaultPack_mcamo: B_OutdoorPack_blk {};
  class B_TacticalPack_oli
  {
    class price
    {
      civ = 135;
      west = 10;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
    };
  };
  class B_Kitbag_mcamo
  {
    class price
    {
      civ = 158;
      west = 10;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
    };
  };
  class B_Kitbag_sgg: B_Kitbag_mcamo {};
  class B_Kitbag_cbr: B_Kitbag_mcamo {};
  class B_FieldPack_blk
  {
    class price
    {
      civ = 175;
      west = 10;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
    };
  };
  class B_FieldPack_ocamo: B_FieldPack_blk {};
  class B_FieldPack_oucamo: B_FieldPack_blk {};
  class B_Bergen_sgg
  {
    class price
    {
      civ = 500;
      west =100;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
    };
  };
  class B_Bergen_mcamo: B_Bergen_sgg {};
  class B_Bergen_rgr: B_Bergen_sgg {};
  class B_Bergen_blk: B_Bergen_sgg {};
  class B_Carryall_ocamo
  {
    class price
    {
      civ = 5000;
      west = 50;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
    };
  };

  class TRYK_B_Carryall_blk: B_Carryall_ocamo {};
  class TRYK_B_Medbag_BK: B_Carryall_ocamo {};
  class B_Carryall_oucamo: B_Carryall_ocamo {};
  class B_Carryall_mcamo: B_Carryall_ocamo {};
  class B_Carryall_oli: B_Carryall_ocamo {};
  class B_Carryall_khk: B_Carryall_ocamo {};
  class B_Carryall_cbr: B_Carryall_ocamo {};
  //
  class G_Shades_Black
  {
    class price
    {
      civ = 50;
      west = 10;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
    };
  };
  class G_Shades_Blue: G_Shades_Black {};
  class G_Shades_Green: G_Shades_Black {};
  class G_Shades_Red: G_Shades_Black {};
  class G_Sport_Blackred: G_Shades_Black {};
  class G_Sport_BlackWhite: G_Shades_Black {};
  class G_Sport_Blackyellow: G_Shades_Black {};
  class G_Sport_Checkered: G_Shades_Black {};
  class G_Sport_Greenblack: G_Shades_Black {};
  class G_Sport_Red: G_Shades_Black {};
  class G_Lowprofile: G_Shades_Black {};
  class G_Squares: G_Shades_Black {};
  class G_Aviator: G_Shades_Black {};
  class G_Combat: G_Shades_Black {};
  class G_Lady_Mirror: G_Shades_Black {};
  class G_Lady_Dark: G_Shades_Black {};
  class G_Lady_Blue: G_Shades_Black {};
  //REBEL
  class TRYK_U_B_C02_Tsirt: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_Bts_PCUs: TRYK_U_B_PCUHsW3nh {};
  class U_I_G_Story_Protagonist_F: TRYK_U_B_PCUHsW3nh {};
  class U_I_G_resistanceLeader_F: TRYK_U_B_PCUHsW3nh {};
  class U_BG_Guerrilla_6_1: TRYK_U_B_PCUHsW3nh {};
  class U_O_SpecopsUniform_ocamo: TRYK_U_B_PCUHsW3nh {};
  class U_IG_leader: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_B_WOOD_MARPAT_CombatUniform: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_B_WDL_GRY_R_CombatUniform: TRYK_U_B_PCUHsW3nh {};
  class TRYK_U_B_PCUHsW6: TRYK_U_B_PCUHsW3nh {};
  class TRYK_B_USMC_R_ROLL: TRYK_U_B_PCUHsW3nh {};
  class TRYK_hoodie_Wood: TRYK_U_B_PCUHsW3nh {};
  //
  class TAC_LBT_H3_Khaki
  {
    class price
    {
      civ = 55000;
      west = 100;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
      civ = "('rebel' in AN_Licenses)";
    };
  };
  class TAC_LBT_HL3_Khaki: TAC_LBT_H3_Khaki {};
  class TAC_EI_RRV2_Khaki: TAC_LBT_H3_Khaki {};
  class TAC_EI_RRV23L_Khaki: TAC_LBT_H3_Khaki {};


  class TRYK_V_tacv1EP_CY: TAC_LBT_H3_Khaki {};
  class TRYK_V_ArmorVest_AOR1_2: TAC_LBT_H3_Khaki {};
  class TRYK_V_ArmorVest_Delta2: TAC_LBT_H3_Khaki {};
  class TRYK_V_ChestRig_L: TAC_LBT_H3_Khaki {};

  class V_BandollierB_blk
    {
      class price
      {
        civ = 20000;
        west = 100;
      };
      class requirement
      {
        west = "(call life_detective) > 0";
        civ = "('rebel' in AN_Licenses)";
      };
  };
  class V_BandollierB_cbr: V_BandollierB_blk {};
  class V_BandollierB_khk: V_BandollierB_blk {};
  class V_BandollierB_oli: V_BandollierB_blk {};
  class V_BandollierB_rgr: V_BandollierB_blk {};

  class v_tacvest_brn
  {
    class price
    {
      civ = 25000;
      west = 100;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
      civ = "('rebel' in AN_Licenses)";
    };
  };

  class V_Press_F
  {
    class price
    {
      civ = 5000;
      west = 100;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
    };
  };

  class TRYK_V_tacSVD_OD: v_tacvest_brn {};
  class v_tacvest_camo: v_tacvest_brn {};
  class v_tacvest_khk: v_tacvest_brn {};
  class v_tacvest_oli: v_tacvest_brn {};
  class V_HarnessO_brn: v_tacvest_brn {};
  class V_HarnessO_gry: v_tacvest_brn {};

  class TRYK_B_Coyotebackpack: B_Bergen_sgg {};

  class PU_shemagh_OD
  {
    class price
    {
      civ = 100;
    };
    class requirement
    {
      west = "(call life_detective) > 0";
    };
  };
  class PU_shemagh_Tan: PU_shemagh_OD {};
  class PU_shemagh_GryBLK: PU_shemagh_OD {};
  class PU_shemagh_ODBLK: PU_shemagh_OD {};
  class PU_shemagh_TanBLK: PU_shemagh_OD {};
  class G_Balaclava_oli: PU_shemagh_OD {};
  class G_Bandanna_beast: PU_shemagh_OD {};
  class G_Bandanna_blk: PU_shemagh_OD {};
  class G_Bandanna_khk: PU_shemagh_OD {};
  class G_Bandanna_oli: PU_shemagh_OD {};
  class G_Bandanna_tan: PU_shemagh_OD {};
  class Mask_M40: PU_shemagh_OD {};
  //
  class TRYK_R_CAP_BLK: H_Bandanna_cam {};
  class H_Cap_brn_SPECOPS: H_Bandanna_cam {};
  class H_Cap_khaki_specops_UK: H_Bandanna_cam {};
};
