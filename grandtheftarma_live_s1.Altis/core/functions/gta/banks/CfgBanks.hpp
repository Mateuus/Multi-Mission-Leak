/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

class GTA_CfgBanks
{
  class Neochori
  {
    name = "%1 Bank";
    requiredWest = 14;
    location[] = {12350, 14357, 0};
    zone = 1;
    zoneSize[] = {150, 150};

    class Vaults
    {
      class Vault_01
      {
        position[] = {12351, 14354, 0};
        building = "Land_MilOffices_V1_F";
        doors[] = {4 };
        time = 900;
      };
    };
  };

  class Mint
  {
    name = "Royal Mint";
    requiredPolice = 15;
    requiredNATO = 5;
    location[] = {16084, 17000, 0};
    zone = 0;

    class Vaults
    {
      class Vault_01
      {
        position[] = {16022, 17028, 0};
        building = "Land_Research_HQ_F";
        doors[] = {1, 2 };
        marker = 1;
        time = 900;
      };

      class Vault_02: Vault_01
      {
        position[] = {16004, 17038, 0};
      };

      class Vault_03: Vault_01
      {
        position[] = {16015, 17056 , 0};
      };

      class Vault_04: Vault_01
      {
        position[] = {16030, 17047, 0};
      };
    };
  };
};
