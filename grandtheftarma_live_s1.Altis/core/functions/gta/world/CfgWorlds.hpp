/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

class GTA_CfgWorlds
{
  class Altis
  {
    class TerrainObjects
    {
      class Kavala_CarShop_Office
      {
        position[] = {3536.63, 13005.4, 7.58118};
        type = "Land_Offices_01_V1_F";
        lockDoors[] = {6};
      };

      class Kavala_CarShop_House1
      {
        position[] = {3491.8, 12998.2, 1.4377};
        type = "Land_i_House_Small_01_V3_F";
        hide = 1;
      };

      class Kavala_CarShop_House2
      {
        position[] = {3497.04, 13018, 3.21051};
        type = "Land_u_Shop_02_V1_F";
        hide = 1;
      };

      class Checkpoint1_Building
      {
        position[] = {5184.67, 14511.3, 3.27515};
        type = "Land_Unfinished_Building_02_F";
        hide = 1;
      };

      class Kavala_Square
      {
        position[] = {3650, 13112, 0};
        radius = 36;
        recursive = 1;
        type[] = {"concrete_smallwall", "t_phoenixc3s_f", "t_oleae1s_f", "treebin_f", "garbagecontainer_closed_f"};
        hide = 1;
      };

      class Kavala_Square_RedBurger
      {
        position[] = {3637.2, 13099.4, 2.97199};
        type = "Land_Kiosk_redburger_F";
        hide = 1;
      };

      class Kavala_Square_Office
      {
        position[] = {3691.69, 13156.8, 7.94988};
        type = "Land_Offices_01_V1_F";
        lockDoors[] = {6};
      };

      class Kavala_Square_TouristHouse
      {
        position[] = {3603.72, 13117.4, 3.11376};
        type = "Land_i_House_Big_02_V1_F";
        hide = 1;
      };

      class Kavala_FoodCourt_Walls
      {
        position[] = {3668, 13187, 0};
        radius = 60;
        recursive = 1;
        mapType[] = {"Fence", "Wall"};
        type[] = {"pipewall_concretel", "city_pillar_f"};
        hide = 1;
      };

      class Kaval_FoodCourt_Barracks
      {
        position[] = {3654.56, 13196.9, -0.31782};
        type = "Land_i_Barracks_V2_F";
        hide = 1;
      };

      class Kavala_Checkpoint
      {
        position[] = {5176, 14485, 0};
        radius = 36;
        recursive = 1;
        type[] = {"workstand_f", "cargo20_brick_red_f", "bricks_v1_f", "bricks_v3_f", "wreck_car3_f", "wall_tin_4_2", "lampstreet_f", "garbagepallet_f"};
        hide = 1;
      };

      class Airport_Checkpoint
      {
        position[] = {15787, 17438, 0};
        radius = 72;
        recursive = 1;
        type[] = {"signt_infopetrolstation", "Land_fs_roof_F", "Land_fs_feed_F", "fs_price_f", "b_ficusc1s_f", "Land_i_Shop_01_V2_F", "garbagecontainer_open_f", "signt_commandeddirectionforward", "wall_tin_4_2", "tyres_f", "fs_sign_f", "b_neriumo2s_f", "vergepost_f", "concrete_smallwall_8m", "pavement_narrow_f", "b_neriumo2d_f"};
        hide = 1;
      };

      class Neochori_Bank_Warehouse
      {
        position[] = {12356.5, 14354.2, 1.76128};
        type = "Land_i_Shed_Ind_F";
        hide = 1;
      };

      class Neochori_Bank_FuelTank
      {
        position[] = {12352.9, 14356.8, 1.32167};
        type = "tank_rust_f";
        hide = 1;
      };

      class Pyrgos_LicensingAgency_Baracks
      {
        position[] = {17014.5, 12808.5, -0.291006};
        type = "Land_i_Barracks_V2_F";
        hide = 1;
      };

      class Molos_NATO_Base_Trash
      {
        position[] = {26697, 23005, 0};
        radius = 50;
        recursive = 1;
        type[] = {"sportground_fence_f", "goal_f"};
        hide = 1;
      };

      class Pyrgos_KFC_Building
      {
        position[] = {16764.4, 12744.7, 3.36263};
        type = "Land_Unfinished_Building_02_F";
        hide = 1;
      };

      class Airport_Terminal_ATC
      {
        position[] = {14529.6, 16713.8, 10.6641};
        type = "Land_Airport_Tower_F";
        hide = 1;
      };

      class Kavala_NATOHQ_Structures
      {
        position[] = {3264, 12452, 0};
        radius = 100;
        recursive = 1;
        type[] = {"wall_tin_4_2", "Land_cmp_Shed_F", "garbagecontainer_open_f", "Land_cmp_Tower_F"};
        hide = 1;
      };

      class Kavala_PoliceHQ_Trash
      {
        position[] = {3225, 12919, 0};
        radius = 100;
        recursive = 1;
        type[] = {"fishinggear_01_f", "fishinggear_02_f", "crabcages_f"};
        hide = 1;
      };

      class Agios_PoliceHQ_Trash
      {
        position[] = {9740, 15871, 0};
        radius = 50;
        recursive = 1;
        type[] = {"sportground_fence_f", "goal_f", "pavement_narrow_f"};
        hide = 1;
      };

      class Athira_PoliceHQ_Trash
      {
        position[] = {13851, 18598, 0};
        radius = 50;
        recursive = 1;
        type[] = {"sportground_fence_f", "goal_f", "tribune_f"};
        hide = 1;
      };

      class Pyrgos_Replace_Shops01
      {
        position[] = {16812, 12718, 0};
        radius = 400;
        recursive = 1;
        mapType = "House";
        type[] = {"Land_u_Shop_01_V1_F", "Land_d_Shop_01_V1_F"};
        replacement[] = {"Land_i_Shop_01_V1_F", "Land_i_Shop_01_V2_F", "Land_i_Shop_01_V3_F"};
      };

      class Pyrgos_Shops02_Replace: Pyrgos_Replace_Shops01
      {
        type = "Land_u_Shop_02_V1_F";
        replacement[] = {"Land_i_Shop_02_V1_F", "Land_i_Shop_02_V2_F", "Land_i_Shop_02_V3_F"};
      };

      class Pyrgos_Houses01_Replace: Pyrgos_Replace_Shops01
      {
        type[] = {"Land_u_House_Big_01_V1_F", "Land_d_House_Big_01_V1_F"};
        replacement[] = {"Land_i_House_Big_01_V1_F", "Land_i_House_Big_01_V2_F", "Land_i_House_Big_01_V3_F"};
      };

      class Pyrgos_Houses02_Replace: Pyrgos_Replace_Shops01
      {
        type[] = {"Land_u_House_Big_02_V1_F"};
        replacement[] = {"Land_i_House_Big_02_V1_F", "Land_i_House_Big_02_V2_F", "Land_i_House_Big_02_V3_F"};
      };

      class Kavala_Square_Replace_Shops01
      {
        position[] = {3651, 13148, 0};
        radius = 85;
        recursive = 1;
        mapType = "House";
        type[] = {"Land_u_Shop_01_V1_F", "Land_d_Shop_01_V1_F"};
        //lockDoors[] = {2, 3};
        replacement[] = {"Land_i_Shop_01_V1_F", "Land_i_Shop_01_V2_F", "Land_i_Shop_01_V3_F"};
      };

      class Kavala_Square_Replace_Shops02: Kavala_Square_Replace_Shops01
      {
        type = "Land_u_Shop_02_V1_F";
        //lockDoors = 1;
        replacement[] = {"Land_i_Shop_02_V1_F", "Land_i_Shop_02_V2_F", "Land_i_Shop_02_V3_F"};
      };

      /*class Kavala_Square_Lock_Shops01
      {
        position[] = {3651, 13148, 0};
        radius = 85;
        recursive = 1;
        type[] = {"Land_i_Shop_01_V1_F", "Land_i_Shop_01_V2_F", "Land_i_Shop_01_V3_F"};
        lockDoors[] = {2, 3};
      };*/
    };
  };
};
