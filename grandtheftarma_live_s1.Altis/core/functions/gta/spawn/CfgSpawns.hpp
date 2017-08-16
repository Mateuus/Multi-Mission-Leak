/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

class GTA_CfgSpawns
{
  class Police_Kavala
  {
    factions[] = {"cop"};
    marker = "spawn_cop_1";
    name = "Kavala Station";
    icon = "\a3\modules_f_curator\Data\portraitobjectivemove_ca.paa";
    color[] = {0, 0.3, 0.6, 1};
  };

  class Police_Pyrgos
  {
    factions[] = {"cop"};
    marker = "spawn_cop_3";
    name = "Pyrgos Station";
    icon = "\a3\modules_f_curator\Data\portraitobjectivemove_ca.paa";
    color[] = {0, 0.3, 0.6, 1};
  };

  class Police_Athira
  {
    factions[] = {"cop"};
    marker = "spawn_cop_6";
    name = "Athira Station";
    icon = "\a3\modules_f_curator\Data\portraitobjectivesector_ca.paa";
    color[] = {0, 0.3, 0.6, 1};
  };

  class Police_RPU
  {
    factions[] = {"cop"};
    marker = "spawn_cop_2";
    name = "Road Policing Unit HQ";
    icon = "\a3\modules_f_curator\Data\portraitobjectivemove_ca.paa";
    color[] = {0, 0.3, 0.6, 1};
    licenses[] = {"rpu"};
  };

  class Police_Sofia
  {
    factions[] = {"cop"};
    marker = "spawn_cop_7";
    name = "Sofia Station";
    icon = "\a3\modules_f_curator\Data\portraitobjectivesector_ca.paa";
    color[] = {0, 0.3, 0.6, 1};
  };

  class Police_NPAS
  {
    factions[] = {"cop"};
    marker = "spawn_cop_4";
    name = "NPAS HQ";
    icon = "\a3\modules_f_curator\Data\portraitobjectivesector_ca.paa";
    color[] = {0, 0.3, 0.6, 1};
    licenses[] = {"npas"};
  };

  class NATO_Pyrgos
  {
    factions[] = {"mil"};
    marker = "spawn_nato_1";
    name = "Pyrgos HQ";
    icon = "\a3\modules_f_curator\Data\portraitobjectivemove_ca.paa";
    color[] = {0, 0.3, 0.6, 1};
  };

  class NATO_Kavala
  {
    factions[] = {"mil"};
    marker = "spawn_nato_2";
    name = "Kavala Base";
    icon = "\a3\modules_f_curator\Data\portraitobjectivemove_ca.paa";
    color[] = {0, 0.3, 0.6, 1};
  };

  class NATO_Air
  {
    factions[] = {"mil"};
    marker = "spawn_nato_3";
    name = "Air Base";
    icon = "\a3\modules_f_curator\Data\portraitobjectivemove_ca.paa";
    color[] = {0, 0.3, 0.6, 1};
  };

  class NATO_Naval
  {
    factions[] = {"mil"};
    marker = "spawn_nato_4";
    name = "Naval Base";
    icon = "\a3\modules_f_curator\Data\portraitobjectivemove_ca.paa";
    color[] = {0, 0.3, 0.6, 1};
  };

  class NATO_Molos
  {
    factions[] = {"mil"};
    marker = "spawn_nato_5";
    name = "Molos Base";
    icon = "\a3\modules_f_curator\Data\portraitobjectivemove_ca.paa";
    color[] = {0, 0.3, 0.6, 1};
  };

  class NHS_01
  {
    factions[] = {"med"};
    marker = "spawn_medic_1";
    name = "Kavala Hospital";
    icon = "\a3\modules_f_curator\Data\portraitobjectivemove_ca.paa";
    color[] = {0, 0.5, 0, 1};
  };

  class NHS_02
  {
    factions[] = {"med"};
    marker = "spawn_medic_2";
    name = "Sofia Hospital";
    icon = "\a3\modules_f_curator\Data\portraitobjectivemove_ca.paa";
    color[] = {0, 0.5, 0, 1};
  };

  class NHS_03
  {
    factions[] = {"med"};
    marker = "spawn_medic_3";
    name = "Pyrgos Hospital";
    icon = "\a3\modules_f_curator\Data\portraitobjectivemove_ca.paa";
    color[] = {0, 0.5, 0, 1};
  };

  class HATO_01
  {
    factions[] = {"hato"};
    marker = "spawn_hato_1";
    name = "Kavala RCC";
    icon = "\a3\modules_f_curator\Data\portraitobjectivemove_ca.paa";
    color[] = {0.7, 0.6, 0, 1};
  };

  class HATO_02
  {
    factions[] = {"hato"};
    marker = "spawn_hato_2";
    name = "Gravia RCC";
    icon = "\a3\modules_f_curator\Data\portraitobjectivemove_ca.paa";
    color[] = {0.7, 0.6, 0, 1};
  };

  class Civilian_01
  {
    factions[] = {"civ"};
    marker = "spawn_civ_1";
    name = "Kavala";
    icon = "\a3\modules_f_curator\Data\portraitobjectivemove_ca.paa";
    color[] = {0.4, 0, 0.5, 1};
    buildingTypes[] = {"Land_i_Shop_01_V1_F", "Land_i_Shop_02_V1_F", "Land_i_Shop_03_V1_F", "Land_i_Stone_HouseBig_V1_F"};
    radius = 400;
  };

  class Civilian_02
  {
    factions[] = {"civ"};
    marker = "spawn_civ_2";
    name = "Pyrgos";
    icon = "\a3\modules_f_curator\Data\portraitobjectivemove_ca.paa";
    color[] = {0.4, 0, 0.5, 1};
    buildingTypes[] = {"Land_i_Shop_01_V1_F", "Land_i_Shop_02_V1_F", "Land_i_Shop_03_V1_F", "Land_i_Stone_HouseBig_V1_F"};
    radius = 400;
  };

	  class Civilian_03
  {
    factions[] = {"civ"};
    marker = "spawn_civ_3";
    name = "Athira";
    icon = "\a3\modules_f_curator\Data\portraitobjectivemove_ca.paa";
    buildingTypes[] = {"Land_i_Shop_01_V1_F", "Land_i_Shop_02_V1_F", "Land_i_Shop_03_V1_F", "Land_i_Stone_HouseBig_V1_F"};
    radius = 250;
    color[] = {0.4, 0, 0.5, 1};
  };

  class Civilian_04
  {
    factions[] = {"civ"};
    marker = "spawn_civ_4";
    name = "Sofia";
    icon = "\a3\modules_f_curator\Data\portraitobjectivemove_ca.paa";
    color[] = {0.4, 0, 0.5, 1};
    buildingTypes[] = {"Land_i_Shop_01_V1_F", "Land_i_Shop_02_V1_F", "Land_i_Shop_03_V1_F", "Land_i_Stone_HouseBig_V1_F"};
    radius = 250;
  };

  class Civilian_05
  {
    factions[] = {"civ"};
    marker = "spawn_civ_5";
    name = "Agios Dionysios";
    icon = "\a3\modules_f_curator\Data\portraitobjectivemove_ca.paa";
    color[] = {0.4, 0, 0.5, 1};
    buildingTypes[] = {"Land_i_Shop_01_V1_F", "Land_i_Shop_02_V1_F", "Land_i_Shop_03_V1_F", "Land_i_Stone_HouseBig_V1_F"};
    radius = 300;
    perks[] = {"explorer"};
  };

  class Civilian_06
  {
    factions[] = {"civ"};
    marker = "spawn_civ_6";
    name = "Zaros";
    icon = "\a3\modules_f_curator\Data\portraitobjectivemove_ca.paa";
    color[] = {0.4, 0, 0.5, 1};
    buildingTypes[] = {"Land_i_Shop_01_V1_F", "Land_i_Shop_02_V1_F", "Land_i_Shop_03_V1_F", "Land_i_Stone_HouseBig_V1_F"};
    radius = 300;
    perks[] = {"explorer"};
  };

  class Civilian_07
  {
    factions[] = {"civ"};
    marker = "spawn_civ_7";
    name = "Syrta";
    icon = "\a3\modules_f_curator\Data\portraitobjectivemove_ca.paa";
    color[] = {0.4, 0, 0.5, 1};
    buildingTypes[] = {"Land_i_Shop_01_V1_F", "Land_i_Shop_02_V1_F", "Land_i_Shop_03_V1_F", "Land_i_Stone_HouseBig_V1_F"};
    radius = 250;
    perks[] = {"explorer"};
  };

  class Bounty
  {
    factions[] = {"civ"};
    marker = "spawn_bounty";
    name = "Bounty Hunter HQ";
    icon = "\a3\modules_f_curator\Data\portraitobjectiveprotect_ca.paa";
    color[] = {0, 0.7, 0.9, 1};
    perks[] = {"bounty_hunter"};
  };

  class Gang_01 // NL
  {
    factions[] = {"civ"};
    marker = "gang_base_1_spawn";
    name = "Gang Base";
    icon = "\a3\modules_f_curator\Data\portraitobjectiveattackdefend_ca.paa";
    color[] = {0.5, 0, 0, 1};
    gang = 1;
  };

  class Gang_02 // CSAT
  {
    factions[] = {"civ"};
    marker = "gang_base_2_spawn";
    name = "Gang Base";
    icon = "\a3\modules_f_curator\Data\portraitobjectiveattackdefend_ca.paa";
    color[] = {0.5, 0, 0, 1};
    gang = 2;
  };

  class Gang_03 // SPZ
  {
    factions[] = {"civ"};
    marker = "gang_base_3_spawn";
    name = "Gang Base";
    icon = "\a3\modules_f_curator\Data\portraitobjectiveattackdefend_ca.paa";
    color[] = {0.5, 0, 0, 1};
    gang = 3;
  };

  class Gang_04 // The Legendary Shack
  {
    factions[] = {"civ"};
    marker = "gang_base_4_spawn";
    name = "Gang Base";
    icon = "\a3\modules_f_curator\Data\portraitobjectiveattackdefend_ca.paa";
    color[] = {0.5, 0, 0, 1};
    gang = 4;
  };

  class Gang_05 // Revolution
  {
    factions[] = {"civ"};
    marker = "gang_base_5_spawn";
    name = "Gang Base";
    icon = "\a3\modules_f_curator\Data\portraitobjectiveattackdefend_ca.paa";
    color[] = {0.5, 0, 0, 1};
    gang = 5;
  };

  class Gang_06 // SoE
  {
    factions[] = {"civ"};
    marker = "gang_base_6_spawn";
    name = "Gang Base";
    icon = "\a3\modules_f_curator\Data\portraitobjectiveattackdefend_ca.paa";
    color[] = {0.5, 0, 0, 1};
    gang = 6;
  };

  class Press
  {
    factions[] = {"civ"};
    marker = "spawn_press_1";
    name = "Press HQ";
    icon = "\a3\modules_f_curator\Data\portraitobjectivesector_ca.paa";
    color[] = {0.4, 0.15, 0.95, 1};
    licenses[] = {"press"};
  };

  class Taxi_01
  {
    factions[] = {"civ"};
    marker = "spawn_taxi_1";
    name = "Kavala Metro Taxi HQ";
    icon = "\a3\modules_f_curator\Data\portraitobjectivegetin_ca.paa";
    color[] = {0.85, 0.85, 0, 1};
    licenses[] = {"taxi"};
  };

  class Taxi_02
  {
    factions[] = {"civ"};
    marker = "spawn_taxi_2";
    name = "Pyrgos Metro Taxi HQ";
    icon = "\a3\modules_f_curator\Data\portraitobjectivegetin_ca.paa";
    color[] = {0.85, 0.85, 0, 1};
    licenses[] = {"taxi"};
  };

  class Event
  {
    marker = "spawn_event";
    name = "Event Arena";
    icon = "\a3\modules_f_curator\Data\portraitobjective_ca.paa";
    color[] = {1, 0.5, 0, 1};
  };
};
