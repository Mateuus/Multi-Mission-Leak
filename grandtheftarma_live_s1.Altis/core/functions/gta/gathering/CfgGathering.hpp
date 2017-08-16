/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

class GTA_CfgGathering
{
  class BaseGather
  {
    factions[] = {"civ"};
    requiredItems[] = {};
    requiredLicenses[] = {};
    requiredPerks[] = {};
    scope = 0;

    class Events
    {
      onBeforeGather = "";
      onAfterGather = "";
    };
  };

  class Legal: BaseGather
  {
    scope = 0;
    actionTime = 7;
  };

  class Illegal: BaseGather
  {
    scope = 0;
    actionTime = 10;
  };

  class Apples: Legal
  {
    positions[] = {{"apple_1", 20}, {"apple_2", 20}, {"apple_3", 20}, {"apple_4", 20}};
    resources[] = {{"apple", 3}};
    scope = 1;
  };

  class Peaches: Legal
  {
    positions[] = {{"peaches_1", 20}, {"peaches_2", 20}, {"peaches_3", 20}, {"peaches_4", 20}};
    resources[] = {{"peach", 3}};
    scope = 1;
  };

  class Watermelon: Legal
  {
    positions[] = {{"watermelon_1", 20}, {"watermelon_2", 20}};
    resources[] = {{"watermelon", 2}};
    scope = 1;
  };

  class Copper: Legal
  {
    positions[] = {{"copper_1", 30}};
    resources[] = {{"copper_u", 2}};
    requiredItems[] = {"pickaxe"};
    requiredLicenses[] = {"copper"};
    scope = 1;
  };

  class Rice: Legal
  {
    positions[] = {{"rice_1", 40}};
    resources[] = {{"rice_u", 2}};
    requiredLicenses[] = {"rice"};
    scope = 1;
  };

  class Sugar: Legal
  {
    positions[] = {{"sugar_1", 20}};
    resources[] = {{"sugar_u", 2}};
    requiredLicenses[] = {"sugar"};
    scope = 1;
  };

  class Iron: Legal
  {
    positions[] = {{"iron_1", 50}};
    resources[] = {{"iron_u", 2}};
    requiredItems[] = {"pickaxe"};
    requiredLicenses[] = {"iron"};
    scope = 1;
  };

  class Salt: Legal
  {
    positions[] = {{"salt_1", 20}};
    resources[] = {{"salt_u", 2}};
    requiredItems[] = {"pickaxe"};
    requiredLicenses[] = {"salt"};
    scope = 1;
  };

  class Sand: Legal
  {
    positions[] = {{"sand_1", 20}};
    resources[] = {{"sand", 2}};
    requiredItems[] = {"pickaxe"};
    requiredLicenses[] = {"sand"};
    scope = 1;
  };

  class Diamond: Legal
  {
    positions[] = {{"diamond_1", 40}};
    resources[] = {{"diamond_u", 2}};
    requiredItems[] = {"pickaxe"};
    requiredLicenses[] = {"diamond"};
    scope = 1;
  };

  class Rock: Legal
  {
    positions[] = {{"rock_1", 20}};
    resources[] = {{"rock", 2}};
    requiredItems[] = {"pickaxe"};
    requiredLicenses[] = {"cement"};
    scope = 1;
  };

  class Silver: Legal
  {
    positions[] = {{"silver_1", 40}};
    resources[] = {{"silver_u", 2}};
    requiredItems[] = {"pickaxe"};
    requiredLicenses[] = {"silver"};
    scope = 1;
  };

  class Rye: Legal
  {
    positions[] = {{"rye_1", 30}};
    resources[] = {{"rye", 2}};
    scope = 1;
  };

  class Yeast: Legal
  {
    positions[] = {{"yeast_1", 30}};
    resources[] = {{"yeast", 2}};
    scope = 1;
  };

  class Hops: Legal
  {
    positions[] = {{"hops_1", 20}};
    resources[] = {{"hops", 2}};
    scope = 1;
  };

  class Cocaine: Illegal
  {
    positions[] = {{"cocaine_1", 80}};
    resources[] = {{"cocaine_u", 2}};
    requiredLicenses[] = {"cocaine"};
    scope = 1;
  };

  class Heroin: Illegal
  {
    positions[] = {{"heroin_1", 40}};
    resources[] = {{"heroin_u", 2}};
    requiredLicenses[] = {"heroin"};
    scope = 1;
  };

  class Weed: Illegal
  {
    positions[] = {{"weed_1", 30}};
    resources[] = {{"cannabis", 2}};
    requiredLicenses[] = {"marijuana"};
    scope = 1;
  };

  class Oil: Illegal
  {
    actionTitle = "Stealing Oil";
    actionTime = 14;
    positions[] = {{"oil_1", 28}};
    resources[] = {{"oil_u", 2}};
    requiredLicenses[] = {"oil"};
    scope = 1;
  };

  class Cmeth_3: Illegal
  {
    positions[] = {{"cmeth_3", 20}};
    resources[] = {{"cmeth_u_3", 2}};
    requiredLicenses[] = {"cmeth"};
    scope = 1;
  };

  class Wood: Legal
  {
    positions[] = {{"wood_1", 500}};
    resources[] = {{"wood_u", 8}};
    requiredItems[] = {"axe"};
    requiredLicenses[] = {"wood"};
    actionTime = 25;
    scope = 1;

    class Events
    {
      onBeforeGather = "GTA_fnc_gatherWood";
      onAfterGather = "GTA_fnc_gatherWood";
    };
  };

  class Natural_Gas: Legal
  {
    actionTime = 8;
    positions[] = {{"naturalgas_1", 20}};
    resources[] = {{"naturalgas", 2}};
    requiredLicenses[] = {"gas"};
    scope = 1;
  };
};
