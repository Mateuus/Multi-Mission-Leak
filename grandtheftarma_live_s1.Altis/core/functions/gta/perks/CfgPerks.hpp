/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

class GTA_CfgExperience
{
  gather = 15;
  catchturtle = 40;
  catchfish = 15;
  process = 10;
  bankjob = 2000;
  delivery = 180;
  heal = 10;
  repair = 50;
  lockpick = 10;
  gamble = 50;
  revive = 250;
  impound = 50;
  crush = 250;
  arrest = 250;
  patrol = 50;
  banksafe = 200;
  bankmoney = 200;
};

class GTA_CfgPerks
{
  /*	class blackfoot
  {
    name = "The Mighty Blackfoot";
    description = "Grants the ability to purchase the unarmed Blackfoot.";
    side = 3;
    ranks = 1;
    level = 15;
    icon = "gui\data\RscDisplayPerks\blackfoot.paa";
  }; */

  /*	class memesword
  {
    name = "THE CHINESE MEME SWORD";
    description = "ONLY A TRUE MEME MASTER  CAN WIELD THE SWORD";
    side = 3;
    ranks = 1;
    level = 15;
    icon = "gui\data\RscDisplayPerks\memesword.paa";
  }; */

  class xp_boost1
  {
    name = "Student";
    description = "XP gained is increased by %1.";
    descriptionRanks[] = {"5%"};
    ranks = 1;
    level = 4;
    icon = "\a3\ui_f\data\gui\cfg\Hints\timing_ca.paa";
  };

  class xp_boost2
  {
    name = "Higher Learning";
    description = "Increase XP gaining with %1<br />Stacks with the 'Student' perk.";
    descriptionRanks[] = {"7%"};
    parent= "xp_boost1";
    ranks = 1;
    level = 8;
    icon = "\a3\ui_f\data\gui\cfg\Hints\timing_ca.paa";
  };

  class xp_boost3
  {
    name = "Professor";
    description = "Increase XP gaining with %1.<br />Stacks with the 'Student' and 'Higher Learning' perk.";
    descriptionRanks[] = {"10%"};
    parent = "xp_boost2";
    ranks = 1;
    level = 12;
    icon = "\a3\ui_f\data\gui\cfg\Hints\timing_ca.paa";
  };

  class brawler
  {
    name = "Brawler";
    description = "Gain the ability to knock players down without them having to surrender.";
    ranks = 1;
    level = 12;
    icon = "gui\data\RscDisplayPerks\brawler.paa";
  };

  class cannibal
  {
    name = "Cannibal";
    description = "Regain Health by feeding on incapacitated players.";
    ranks = 1;
    level = 8;
    icon = "gui\data\RscDisplayPerks\cannibal.paa";
  };

  class retention
  {
    name = "Retention";
    description = "Reduce food and drink deterioration by %1.";
    descriptionRanks[] = {"25%", "50%", "75%"};
    ranks = 3;
    level = 2;
    icon = "\a3\ui_f\data\gui\cfg\Hints\thermal_imaging_ca.paa";
  };

  class broad_shoulders
  {
    name = "Broad Shoulders";
    description = "All that time at the gym has paid off.<br />Vest virtual item weight capacity increased by %1.";
    descriptionRanks[] = {"5", "10"};
    ranks = 2;
    level = 3;
    icon = "\a3\ui_f\data\gui\cfg\Hints\slots_ca.paa";
  };

  class strong_back
  {
    name = "Strong Back";
    description = "Looking like the Hunchback of Notre-Dame has some advantages at least.<br />Backpack virtual item weight capacity increased by %1.";
    descriptionRanks[] = {"5", "10"};
    ranks = 2;
    level = 5;
    icon = "\a3\ui_f\data\gui\cfg\Hints\gear_ca.paa";
  };

  class pay_rise
  {
    name = "Pay Rise";
    description = "All those long hours have 'paid' off.<br />Receive an additional %1 on top of your original paycheque.";
    descriptionRanks[] = {"£500", "£1100", "£1800", "£2600", "£3600"};
    ranks = 5;
    level = 7;
    icon = "gui\data\RscDisplayPerks\money.paa";
  };

  /*class energy_boost
  {
  name = "Energy Boost";
  description = "Redbull effect now lasts %1 minutes.";
  descriptionRanks[] = {"4", "6", "8"};
  ranks = 3;
  level = 5;
  icon = "\a3\ui_f\data\gui\cfg\Hints\basicspeed_ca.paa";
  };*/

  class first_aid
  {
    name = "First Aid";
    description = "Healing using a first aid kit now heals you to %1 health, whilst also increasing fatigue.";
    descriptionRanks[] = {"80%", "85%", "90%", "95%", "100%"};
    ranks = 5;
    level = 16;
    icon = "\a3\ui_f\data\gui\cfg\Hints\incapacitated_ca.paa";
  };

  class blood_donor
  {
    name = "Blood Donor";
    description = "Gain to ability to stabilise incapacitated patients by performing a blood transfusion. The process will damage and fatigue you.<br />Requires 1x First Aid Kit.";
    ranks = 1;
    level = 9;
    icon = "\a3\ui_f\data\gui\cfg\Hints\injury_ca.paa";
  };

  class healing_hands
  {
    name = "Healing Hands";
    description = "You might just be the second coming.<br />%1 chance of first aid kit not being consumed.";
    descriptionRanks[] = {"10%", "25%", "50%"};
    ranks = 3;
    level = 8;
    icon = "\a3\ui_f\data\gui\cfg\Hints\actionmenu_ca.paa";
  };

  class teamviewer
  {
    name = "Teamviewer";
    description = "Your gang members will now be displayed on the map.";
    side = 3;
    ranks = 1;
    level = 10;
    icon = "\a3\ui_f\data\gui\cfg\Hints\radar_ca.paa";
  };

  class night_owl
  {
    name = "Night Owl";
    description = "Always spawn with night vision goggles.";
    side = 3;
    ranks = 1;
    level = 4;
    icon = "\a3\ui_f\data\gui\cfg\Hints\nv_ca.paa";
  };

  class chauffeur
  {
    name = "Chauffeur";
    description = "Always spawn with a GPS.";
    side = 3;
    ranks = 1;
    level = 4;
    icon = "\a3\ui_f\data\gui\cfg\Hints\map_ca.paa";
  };

  class thug_life
  {
    name = "Thug Life";
    description = "Access to explosive rocks in the general store.";
    side = 3;
    ranks = 1;
    level = 11;
    icon = "\a3\ui_f\data\gui\cfg\Hints\death_ca.paa";
  };

  /*	class black_belt
  {
    name = "Black belt";
    description = "Only few people ever mastered the secret Kong Fu moves.<br />The legendary Hobo Lord only teaches his secret moves to people with this perk unlocked.<br /><br />Press F2 to perform the moves.";
    ranks = 1;
    level = 14;
    icon = "\a3\ui_f\data\gui\cfg\Hints\miss_icon_ca.paa";
  }; */

  class race_marshal
  {
    name = "Race Marshal";
    description = "A race isn't a race without a real starter pistol is it? Unlock the starter pistol at the civilian weapon shop.";
    side = 3;
    ranks = 1;
    level = 5;
    icon = "\a3\ui_f\data\gui\cfg\Hints\flares_ca.paa";
  };

  /*class fancy_pants
  {
    name = "Fancy Pants";
    description = "Access to colored clothing!<br /><br />Unlocks >%1 clothing";
    descriptionRanks[] = {"blue", "blue, white and black", "blue, white, black and pink"};
    side = 3;
    ranks = 3;
    level = 8;
    icon = "\a3\ui_f\data\gui\cfg\Hints\actionmenu_ca.paa";
  };*/

  /*class pimp_my_ride
  {
    name = "Pimp My Ride";
    description = "Access to colored cars!<br /><br />Unlocks %1 cars";
    descriptionRanks[] = {"blue", "blue, white and black", "blue, white, black and pink"};
    side = 3;
    ranks = 3;
    level = 14;
    icon = "\a3\ui_f\data\gui\cfg\Hints\actionmenu_ca.paa";
  };

  class pimp_my_boat
  {
    name = "Pimp My Boat";
    description = "Access to colored boats!<br /><br />Unlocks %1 boats";
    descriptionRanks[] = {"blue", "blue, white and black", "blue, white, black and pink"};
    side = 3;
    ranks = 3;
    level = 14;
    icon = "\a3\ui_f\data\gui\cfg\Hints\actionmenu_ca.paa";
  };

  class pimp_my_jet
  {
    name = "Pimp My Jet";
    description = "Access to colored air vehicles!<br /><br />Unlocks %1 air vehicles";
    descriptionRanks[] = {"blue", "blue, white and black", "blue, white, black and pink"};
    side = 3;
    ranks = 3;
    level = 22;
    icon = "\a3\ui_f\data\gui\cfg\Hints\actionmenu_ca.paa";
  };*/

  /*	class lord_of_war
  {
    name = "Lord of War";
    description = "Reducing the prices of weapons and ammunition by %1.";
    descriptionRanks[] = {"5%", "10%", "15%"};
    side = 3;
    ranks = 3;
    level = 15;
    icon = "\a3\ui_f\data\gui\cfg\Hints\rifles_ca.paa";
  }; */

  class locksmith
  {
    name = "Locksmith";
    description = "Increase the chance of successfully picking a lock by %1.";
    descriptionRanks[] = {"5%", "10%", "15%"};
    ranks = 3;
    level = 6;
    icon = "\a3\ui_f\data\gui\cfg\Hints\basicmove_ca.paa";
  };

  class master_thief
  {
    name = "Master Thief";
    description = "Increasing lockpicking speed by %1";
    descriptionRanks[] = {"10%", "25%", "50%"};
    side = 3;
    ranks = 3;
    level = 2;
    icon = "\a3\ui_f\data\gui\cfg\Hints\basicspeed_ca.paa";
  };

  /*class bobby_pins
  {
    name = "Bobby Pins";
    description = "Reduce time restrained by %1";
    descriptionRanks[] = {"10%", "20%", "30%"};
    side = 3;
    ranks = 3;
    level = 3;
    icon = "\a3\ui_f\data\gui\cfg\Hints\normaldamage_ca.paa";
  };*/

  /*	class pneumatic_cutter
  {
    name = "Pneumatic Cutter";
    description = "Decrease the time required to break into the first two bank doors.";
    side = 3;
    ranks = 1;
    level = 7;
    icon = "\a3\ui_f\data\gui\cfg\Hints\actionmenu_ca.paa";
  }; */

  /*class subtlety
  {
    name = "Subtlety";
    description = "Decrease the risk of gas station robberies being reported to the cops by %1.";
    descriptionRanks[] = {"10%", "20%", "30%"};
    side = 3;
    ranks = 3;
    level = 6;
    icon = "\a3\ui_f\data\gui\cfg\Hints\pheripheal_vision_ca.paa";
  };*/

  class black_decker
  {
    name = "Black &amp; Decker";
    description = "Years of DIY have taught you how to break open vault doors using a drill.";
    side = 3;
    ranks = 1;
    level = 6;
    icon = "\a3\ui_f\data\gui\cfg\Hints\doors_ca.paa";
  };

  class fortune_finder
  {
    name = "Fortune Finder";
    description = "Receive an extra %1 when you launder stolen money bags.";
    descriptionRanks[] = {"15%"};
    side = 3;
    ranks = 1;
    level = 15;
    icon = "gui\data\RscDisplayPerks\money.paa";
  };

  class explorer
  {
    name = "Explorer";
    description = "Gain access to additional spawn points.";
    side = 3;
    ranks = 1;
    level = 10;
    icon = "\a3\ui_f\data\gui\cfg\Hints\map_ca.paa";
  };

  class mechanic
  {
    name = "Mechanic";
    description = "Increase the speed at which a vehicle is repaired by %1.";
    descriptionRanks[] = {"10%", "25%", "40%"};
    ranks = 3;
    level = 7;
    icon = "\a3\ui_f\data\gui\cfg\Hints\vehiclerepair_ca.paa";
  };

  class scrapper
  {
    name = "Scrapper";
    description = "%1 chance of a tool kit not being consumed when repairing a vehicle.";
    descriptionRanks[] = {"25%", "50%", "75%", "100%"};
    ranks = 3;
    level = 9;
    icon = "\a3\ui_f\data\gui\cfg\Hints\vehiclerepair_ca.paa";
  };

  /*	class transporter
  {
    name = "Transporter";
    description = "Increase the weight limit of your cars by %1";
    descriptionRanks[] = {"5%", "10%", "15%"};
    side = 3;
    ranks = 3;
    level = 10;
    icon = "\a3\ui_f\data\gui\cfg\Hints\vehiclecommanding_ca.paa";
  }; */

  /*	class sailor
  {
    name = "Sailor";
    description = "Increase the weight limit of your boats by %1";
    descriptionRanks[] = {"5%", "10%", "15%"};
    side = 3;
    ranks = 3;
    level = 11;
    icon = "\a3\ui_f\data\gui\cfg\Hints\vehiclecommanding_ca.paa";
  }; */

  /*	class trucker
  {
    name = "Trucker";
    description = "Increase the weight limit of your trucks by %1.";
    descriptionRanks[] = {"5%", "10%", "15%"};
    side = 3;
    ranks = 3;
    level = 13;
    icon = "\a3\ui_f\data\gui\cfg\Hints\vehiclecommanding_ca.paa";
  }; */

  /*	class pilot
  {
    name = "Pilot";
    description = "Increase the weight limit of your helicopters by %1.";
    descriptionRanks[] = {"5%", "10%", "15%"};
    side = 3;
    ranks = 3;
    level = 14;
    icon = "\a3\ui_f\data\gui\cfg\Hints\takeoff_ca.paa";
  }; */

  /*class just_tow_it
  {
    name = "Just Tow It";
    description = "Grants ability to tow small vehicles with the Mohawk.<br /><br />Required for Heavy Towing<br />Heavy Towing unlocks at Level 15";
    ranks = 1;
    level = 15;
    icon = "\a3\ui_f\data\gui\cfg\Hints\actionmenu_ca.paa";
  };

  class heavy_towing
  {
    name = "Heavy Towing";
    description = "Grants ability to tow big vehicles with the Mohawk.";
    parent = "just_tow_it";
    ranks = 1;
    level = 23;
    icon = "\a3\ui_f\data\gui\cfg\Hints\actionmenu_ca.paa";
  };*/

  class farmer
  {
    name = "Farmer";
    description = "Increases gathering speed of legal goods by %1.";
    descriptionRanks[] = {"10%", "25%", "50%"};
    side = 3;
    ranks = 3;
    level = 1;
    icon = "\a3\ui_f\data\gui\cfg\Hints\take_ca.paa";
  };

  class harvester
  {
    name = "Harvester";
    description = "Increases gathering speed of illegal goods by %1.";
    descriptionRanks[] = {"10%", "25%", "50%"};
    side = 3;
    ranks = 3;
    level = 1;
    icon = "\a3\ui_f\data\gui\cfg\Hints\take_ca.paa";
  };

  class working_man
  {
    name = "Working Man";
    description = "Increases processing speed of legal goods by %1.";
    descriptionRanks[] = {"10%", "20%", "30%"};
    side = 3;
    ranks = 3;
    level = 5;
    icon = "\a3\ui_f\data\gui\cfg\Hints\basicspeed_ca.paa";
  };

  /*	class barter
  {
    name = "Bartering";
    description = "Legal goods sell for %1 more.";
    descriptionRanks[] = {"5%", "10%", "15%"};
    side = 3;
    ranks = 3;
    level = 9;
    icon = "gui\data\RscDisplayPerks\money.paa";
  }; */

  class heisenberg
  {
    name = "Heisenberg";
    description = "'Jesse, we need to cook'.<br /><br />Processing speed of illegal goods increased by %1";
    descriptionRanks[] = {"10%", "20%", "30%"};
    side = 3;
    ranks = 3;
    level = 13;
    icon = "gui\data\RscDisplayPerks\heisenberg.paa";
  };

  /*	class connections
  {
    name = "Connections";
    description = "Illegal goods sell for %1 more.";
    descriptionRanks[] = {"5%", "10%", "15%"};
    side = 3;
    ranks = 3;
    level = 14;
    icon = "gui\data\RscDisplayPerks\money.paa";
  }; */

  class bounty_hunter
  {
    name = "Bounty Hunter";
    description = "Grants access to the Bounty Hunter HQ and access to:<br />- The normal taser<br />- The ability to restrain<br />- The ability to arrest and claim bounties";
    side = 3;
    ranks = 1;
    level = 8;
    icon = "\a3\ui_f\data\gui\cfg\Hints\basicwalk_ca.paa";
  };

  class hunter_veteran
  {
    name = "Hunter Veteran";
    description = "Grants access to the advanced taser.";
    parent = "bounty_hunter";
    side = 3;
    ranks = 1;
    level = 11;
    icon = "\a3\ui_f\data\gui\cfg\Hints\callsupport_ca.paa";
  };

  class inside_knowledge
  {
    name = "Inside knowledg-e";
    description = "Grants access to the wanted list. Can be used to find criminals.";
    parent = "bounty_hunter";
    side = 3;
    ranks = 1;
    level = 9;
    icon = "\a3\ui_f\data\gui\cfg\Hints\chat_ca.paa";
  };

  /*class big_brother
  {
    name = "Big Brother";
    description = "%1 chance of spotting criminals when they enter green zones.";
    descriptionRanks[] = {"10%", "25%", "50%"};
    side = 1;
    ranks = 3;
    level = 6;
    icon = "\a3\ui_f\data\gui\cfg\Hints\actionmenu_ca.paa";
  };*/

  /*	class informants
  {
    name = "Informants";
    description = "%1 chance to alert you when illegals goods are being sold.";
    descriptionRanks[] = {"10%", "20%", "30%"};
    side = 1;
    ranks = 3;
    level = 9;
    icon = "\a3\ui_f\data\gui\cfg\Hints\callsupport_ca.paa";
  }; */

  class dirty_cop
  {
    name = "Dirty Cop";
    description = "Receive a %1 bonus from a criminal's warrant value.";
    descriptionRanks[] = {"10%", "25%", "50%"};
    side = 1;
    ranks = 3;
    level = 9;
    icon = "gui\data\RscDisplayPerks\money.paa";
  };

  class loadmaster
  {
    name = "Loadmaster";
    description = "Enables you to sling load using helicopters.";
    public = 1;
    ranks = 1;
    level = 11;
    icon = "\a3\ui_f\data\gui\cfg\hints\use_ca.paa";
  };

  /*class spotter
  {
    name = "Spotter";
    description = "Always spawn with a pair of %1.";
    side = 3;
    descriptionRanks[] = {"binoculars", "rangefinders"};
    ranks = 2;
    level = 17;
    icon = "\a3\ui_f\data\gui\cfg\Hints\zooming_ca.paa";
  };

  /*class enlistment
  {
    name = "Enlistment";
    description = "Enlist for the Altis Armed forces.";
    side = 1;
    ranks = 1;
    level = 8;
    icon = "\a3\ui_f\data\gui\cfg\hints\basicstances_ca.paa";
  };

  class veteran
  {
    name = "Veteran";
    description = "For your long standing services in the Altis Armed forces, gain access to aditional equipment.";
    parent= "enlistment";
    side = 1;
    ranks = 1;
    level = 12;
    icon = "\a3\ui_f\data\gui\cfg\hints\commanding_ca.paa";
  };*/
};
