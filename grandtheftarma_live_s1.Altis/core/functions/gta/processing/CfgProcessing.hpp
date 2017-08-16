/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

class GTA_CfgProcessing
{
  class Legal
  {
    actionTime = 25;
    scope = 0;
  };

  class Illegal
  {
    actionTime = 45;
    scope = 0;
  };

  class Mash: Illegal
  {
    materials[] = {{"water", 1}, {"cornmeal", 1}};
    products[] = {{"mash", 1}};
    license = "bootleg";
    scope = 1;
  };

  class Meth: Illegal
  {
    materials[] = {{"cmeth_u_1", 1}, {"cmeth_u_2", 1}, {"cmeth_u_3", 1}};
    products[] = {{"cmeth_p", 1}};
    license = "cmeth";
    scope = 1;
  };

  class Oil: Illegal
  {
    actionTime = 38;
    materials[] = {{"oil_u", 1}};
    products[] = {{"oil_p", 1}};
    license = "oil";
    scope = 1;
  };

  class Diamond: Legal
  {
    materials[] = {{"diamond_u", 1}};
    products[] = {{"diamond_p", 1}};
    license = "diamond";
    scope = 1;
  };

  class Heroin: Illegal
  {
    materials[] = {{"heroin_u", 1}};
    products[] = {{"heroin_p", 1}};
    license = "heroin";
    scope = 1;
  };

  class Copper: Legal
  {
    materials[] = {{"copper_u", 1}};
    products[] = {{"copper_p", 1}};
    license = "copper";
    scope = 1;
  };

  class Sugar: Legal
  {
    materials[] = {{"sugar_u", 1}};
    products[] = {{"sugar_p", 1}};
    license = "sugar";
    scope = 1;
  };

  class Rice: Legal
  {
    materials[] = {{"rice_u", 1}};
    products[] = {{"rice_p", 1}};
    license = "rice";
    scope = 1;
  };

  class Iron: Legal
  {
    materials[] = {{"iron_u", 1}};
    products[] = {{"iron_p", 1}};
    license = "iron";
    scope = 1;
  };

  class Glass: Legal
  {
    materials[] = {{"sand", 1}};
    products[] = {{"glass", 1}};
    license = "sand";
    scope = 1;
  };

  class Glass_Bottle: Legal
  {
    materials[] = {{"glass", 1}};
    products[] = {{"bottles", 1}};
    license = "sand";
    scope = 1;
  };

  class Salt: Legal
  {
    materials[] = {{"salt_u", 1}};
    products[] = {{"salt_p", 1}};
    license = "salt";
    scope = 1;
  };

  class Cocaine: Illegal
  {
    materials[] = {{"cocaine_u", 1}};
    products[] = {{"cocaine_p", 1}};
    license = "cocaine";
    scope = 1;
  };

  class Marijuana: Illegal
  {
    materials[] = {{"cannabis", 1}};
    products[] = {{"marijuana", 1}};
    license = "marijuana";
    scope = 1;
  };

  class Cement: Legal
  {
    materials[] = {{"rock", 1}};
    products[] = {{"cement", 1}};
    license = "cement";
    scope = 1;
  };

  class Whiskey: Legal
  {
    materials[] = {{"yeast", 1}, {"rye", 1}};
    products[] = {{"whiskey", 1}};
    license = "whiskey";
    scope = 1;
  };

  class Beer: Legal
  {
    materials[] = {{"yeast", 1}, {"hops", 1}};
    products[] = {{"beerp", 1}};
    license = "beer";
    scope = 1;
  };

  class Moonshine: Illegal
  {
    materials[] = {{"yeast", 1}, {"mash", 1}};
    products[] = {{"moonshine", 1}};
    license = "bootleg";
    scope = 1;
  };

  class Bottled_Beer: Legal
  {
    materials[] = {{"beerp", 1}, {"bottles", 1}};
    products[] = {{"bottledbeer", 1}};
    scope = 1;
  };

  class Bottled_Whiskey: Legal
  {
    materials[] = {{"whiskey", 1}, {"bottles", 1}};
    products[] = {{"bottledwhiskey", 1}};
    scope = 1;
  };

  class Bottled_Moonshine: Illegal
  {
    materials[] = {{"moonshine", 1}, {"bottles", 1}};
    products[] = {{"bottledshine", 1}};
    scope = 1;
  };

  class Silver: Legal
  {
    materials[] = {{"silver_u", 1}};
    products[] = {{"silver_p", 1}};
    license = "silver";
    scope = 1;
  };

  class Wood: Legal
  {
    materials[] = {{"wood_u", 1}};
    products[] = {{"wood_p", 1}};
    license = "wood";
    scope = 1;
  };

  class Natural_Gas: Legal
  {
    actionTime = 19;
    materials[] = {{"naturalgas", 1}};
    products[] = {{"propane", 1}};
    license = "gas";
    scope = 1;
  };
};
