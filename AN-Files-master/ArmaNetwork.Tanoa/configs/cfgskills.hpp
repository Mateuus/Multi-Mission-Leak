class Skills {
  class gathering
  {
    displayName = "STR_SKILL_gathering";
    level = 3;
    skillpoint = 1;
    illegal = 0;
    dependence = "";
    kindOf = "processing";
    price = 4000;
    info = "STR_SKILL_gatheringInfo";
    number = 1;
  };
  class mechanic
  {
    displayName = "STR_SKILL_mechanic";
    level = 3;
    skillpoint = 1;
    illegal = 0;
    dependence = "";
    kindOf = "mechanicOne";
    price = 4000;
    info = "STR_SKILL_mechanicInfo";
    number = 2;
  };
  class nighthawk
  {
    displayName = "STR_SKILL_Nighthawk";
    level = 4;
    skillpoint = 2;
    illegal = 0;
    dependence = "";
    kindOf = "";
    price = 4000;
    info = "STR_SKILL_nighthawkInfo";
    number = 3;
  };
  class direction
  {
    displayName = "STR_SKILL_Direction";
    level = 5;
    skillpoint = 2;
    illegal = 0;
    dependence = "";
    kindOf = "";
    price = 4000;
    info = "STR_SKILL_directionInfo";
    number = 4;
  };
  class connected
  {
    displayName = "STR_SKILL_connected";
    level = 5;
    skillpoint = 3;
    illegal = 0;
    dependence = "";
    kindOf = "";
    price = 4000;
    info = "STR_SKILL_connectedInfo";
    number = 5;
  };
  class alcohol
  {
    displayName = "STR_SKILL_alcohol";
    level = 8;
    skillpoint = 2;
    illegal = 0;
    dependence = "";
    kindOf = "";
    price = 6000;
    info = "STR_SKILL_alcoholInfo";
    number = 6;
  };
  class mechanicOne
  {
    displayName = "STR_SKILL_mechanicOne";
    level = 15;
    skillpoint = 4;
    illegal = 0;
    dependence = "mechanic";
    kindOf = "";
    price = 6000;
    info = "STR_SKILL_mechanicOneInfo";
    number = 7;
  };
  class vehgps
  {
    displayName = "STR_SKILL_vehgps";
    level = 15;
    skillpoint = 4;
    illegal = 0;
    dependence = "";
    kindOf = "";
    price = 6000;
    info = "STR_SKILL_vehgpsInfo";
    number = 8;
  };
  class death
  {
    displayName = "STR_SKILL_death";
    level = 20;
    skillpoint = 4;
    illegal = 0;
    dependence = "";
    kindOf = "";
    price = 6000;
    info = "STR_SKILL_deathInfo";
    number = 9;
  };
  class processing
  {
    displayName = "STR_SKILL_processing";
    level = 8;
    skillpoint = 4;
    illegal = 0;
    dependence = "gathering";
    kindOf = "";
    price = 0;
    info = "STR_SKILL_processingInfo";
    number = 10;
  };
  class robbery
  {
    displayName = "STR_SKILL_robbery";
    level = 5;
    skillpoint = 4;
    illegal = 1;
    dependence = "";
    kindOf = "";
    price = 0;
    info = "STR_SKILL_robberyInfo";
    number = 11;
  };
  class storage
  {
    displayName = "STR_SKILL_storage";
    level = 10;
    skillpoint = 4;
    illegal = 0;
    dependence = "";
    kindOf = "";
    price = 0;
    info = "STR_SKILL_storageInfo";
    number = 12;
  };
  class demo
  {
    displayName = "STR_SKILL_demo";
    level = 5;
    skillpoint = 5;
    illegal = 1;
    dependence = "";
    kindOf = "demoOne";
    price = 0;
    info = "STR_SKILL_demoInfo";
    number = 13;
  };
  class demoOne
  {
    displayName = "STR_SKILL_demoOne";
    level = 15;
    skillpoint = 5;
    illegal = 1;
    dependence = "demo";
    kindOf = "";
    price = 0;
    info = "STR_SKILL_demoOneInfo";
    number = 14;
  };
  class silencer
  {
    displayName = "STR_SKILL_silencer";
    level = 15;
    skillpoint = 4;
    illegal = 1;
    dependence = "";
    kindOf = "";
    price = 0;
    info = "STR_SKILL_silencerInfo";
    number = 15;
  };
  class mastermind
  {
    displayName = "STR_SKILL_mastermind";
    level = 15;
    skillpoint = 4;
    illegal = 1;
    dependence = "";
    kindOf = "";
    price = 0;
    info = "STR_SKILL_mastermindInfo";
    number = 16;
  };
  class hacker
  {
    displayName = "STR_SKILL_hacker";
    level = 5;
    skillpoint = 4;
    illegal = 1;
    dependence = "";
    kindOf = "hackerOne";
    price = 0;
    info = "STR_SKILL_hackerInfo";
    number = 17;
  };
  class hackerOne
  {
    displayName = "STR_SKILL_hackerOne";
    level = 15;
    skillpoint = 4;
    illegal = 1;
    dependence = "hacker";
    kindOf = "";
    price = 0;
    info = "STR_SKILL_hackerOneInfo";
    number = 18;
  };
  class survival
  {
    displayName = "STR_SKILL_survival";
    level = 5;
    skillpoint = 4;
    illegal = 0;
    dependence = "";
    kindOf = "";
    price = 0;
    info = "STR_SKILL_survivalInfo";
    number = 19;
  };
  class stockmarket
  {
    displayName = "STR_SKILL_stockmarket";
    level = 4;
    skillpoint = 2;
    illegal = 0;
    dependence = "";
    kindOf = "";
    price = 4000;
    info = "STR_SKILL_stockmarketInfo";
    number = 20;
  };
  class smuggler
  {
    displayName = "STR_SKILL_smuggler";
    level = 20;
    skillpoint = 6;
    illegal = 1;
    dependence = "";
    kindOf = "";
    price = 4000;
    info = "STR_SKILL_smugglerInfo";
    number = 21;
  };
};

class CfgSkillNumbers
{
  class skill_1
  {
    name = "gathering";
  };
  class skill_2
  {
    name = "mechanic";
  };
  class skill_3
  {
    name = "nighthawk";
  };
  class skill_4
  {
    name = "direction";
  };
  class skill_5
  {
    name = "connected";
  };
  class skill_6
  {
    name = "alcohol";
  };
  class skill_7
  {
    name = "mechanicOne";
  };
  class skill_8
  {
    name = "vehgps";
  };
  class skill_9
  {
    name = "death";
  };
  class skill_10
  {
    name = "processing";
  };
  class skill_11
  {
    name = "robbery";
  };
  class skill_12
  {
    name = "storage";
  };
  class skill_13
  {
    name = "demo";
  };
  class skill_14
  {
    name ="demoOne";
  };
  class skill_15
  {
    name ="silencer";
  };
  class skill_16
  {
    name ="mastermind";
  };
  class skill_17
  {
    name ="hacker";
  };
  class skill_18
  {
    name ="hackerOne";
  };
  class skill_19
  {
	  name ="survival";
  };
  class skill_20
  {
    name ="stockmarket";
  };
  class skill_21
  {
    name = "smuggler";  
  };
};
//requiredExp is required experience to level up to next level
class CfgLevels
{
  class level_0
  {
    requiredExp = 1500;
    receivedSkill = 1;
  };
  class level_1
  {
    requiredExp = 4500;
    receivedSkill = 1;
  };
  class level_2
  {
    requiredExp = 13500;
    receivedSkill = 1;
  };
  class level_3
  {
    requiredExp = 40500;
    receivedSkill = 1;
  };
  class level_4
  {
    requiredExp = 151500;
    receivedSkill = 1;
  };
  class level_5
  {
    requiredExp = 354500;
    receivedSkill = 1;
  };
  class level_6
  {
    requiredExp = 635000;
    receivedSkill = 1;
  };
  class level_7
  {
    requiredExp = 950000;
    receivedSkill = 1;
  };
  class level_8
  {
    requiredExp = 1250000;
    receivedSkill = 1;
  };
  class level_9
  {
    requiredExp = 2025000;
    receivedSkill = 1;
  };
  class level_10
  {
    requiredExp = 3125000;
    receivedSkill = 2;
    receivedCash = 100000;
  };
  class level_11
  {
    requiredExp = 4250000;
    receivedSkill = 1;
  };
  class level_12
  {
    requiredExp = 5125000;
    receivedSkill = 1;
  };
  class level_13
  {
    requiredExp = 6225000;
    receivedSkill = 1;
  };
  class level_14
  {
    requiredExp = 7125000;
    receivedSkill = 1;
  };
  class level_15
  {
    requiredExp = 8225000;
    receivedSkill = 2;
    receivedCash = 150000;
  };
  class level_16
  {
    requiredExp = 9870000;
    receivedSkill = 1;
  };
  class level_17
  {
    requiredExp = 11844000;
    receivedSkill = 1;
  };
  class level_18
  {
    requiredExp = 13028400;
    receivedSkill = 1;
  };
  class level_19
  {
    requiredExp = 14331240;
    receivedSkill = 1;
  };
  class level_20
  {
    requiredExp = 15764364;
    receivedSkill = 2;
    receivedCash = 200000;
  };
  class level_21
  {
    requiredExp = 17340800;
    receivedSkill = 1;
  };
  class level_22
  {
    requiredExp = 19074880;
    receivedSkill = 1;
  };
  class level_23
  {
    requiredExp = 20982368;
    receivedSkill = 1;
  };
  class level_24
  {
    requiredExp = 23080604;
    receivedSkill = 1;
  };
  class level_25
  {
    requiredExp = 25388665;
    receivedSkill = 2;
    receivedCash = 300000;
  };
  class level_26
  {
    requiredExp = 27927531;
    receivedSkill = 1;
  };
  class level_27
  {
    requiredExp = 30720284;
    receivedSkill = 1;
  };
  class level_28
  {
    requiredExp = 33792313;
    receivedSkill = 1;
  };
  class level_29
  {
    requiredExp = 37171544;
    receivedSkill = 1;
  };
  class level_30
  {
    requiredExp = 40888699;
    receivedSkill = 2;
    receivedCash = 400000;
  };
  class level_31
  {
    requiredExp = 44977569;
    receivedSkill = 1;
  };
  class level_32
  {
    requiredExp = 47226447;
    receivedSkill = 1;
  };
  class level_33
  {
    requiredExp = 49587770;
    receivedSkill = 1;
  };
  class level_34
  {
    requiredExp = 50579525;
    receivedSkill = 1;
  };
  class level_35
  {
    requiredExp = 55000000;
    receivedSkill = 2;
    receivedCash = 750000;
  };
};
