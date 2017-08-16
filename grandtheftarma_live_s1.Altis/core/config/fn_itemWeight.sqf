/*
  File: fn_itemWeight.sqf
  Author: Bryan "Tonic" Boardwine

  Description:
  Gets the items weight and returns it.
*/
private["_item"];
_item = [_this,0,"",[""]] call GTA_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{
  //case "oil_u": {4};
  //case "oil_p": {3};
  case "oil_u": {12};
  case "oil_p": {12};
  case "cmeth_u_1": {2};
  case "cmeth_u_2": {2};
  case "cmeth_u_3": {2};
  case "cmeth_p": {4};
  case "heroin_u": {6};
  case "heroin_p": {4};
  case "cannabis": {6};
  case "marijuana": {4};
  case "apple": {1};
  case "water": {2};
  case "rabbit": {2};
  case "salema": {2};
  case "ornate": {2};
  case "mackerel": {4};
  case "tuna": {6};
  case "mullet": {4};
  case "catshark": {6};
  case "turtle": {6};
  case "fishing": {2};
  case "turtlesoup": {2};
  case "donuts": {1};
  case "coffee": {2};
  case "fuelE": {2};
  case "fuelF": {5};
  case "money": {0};
  case "pickaxe": {8};
  case "copper_u": {4};
  case "iron_u": {4};
  case "iron_p": {3};
  case "copper_p": {3};
  case "sugar_u": {4};
  case "sugar_p": {3};
  case "rice_u": {4};
  case "rice_p": {3};
  case "sand": {4};
  case "salt_u": {4};
  case "salt_p": {3};
  case "glass": {2};
  case "diamond_u": {4};
  case "diamond_p": {3};
  case "cocaine_u": {6};
  case "cocaine_p": {4};
  case "spikeStrip": {15};
  case "rock": {4};
  case "cement": {3};
  case "goldbar": {18};
  case "moneybag": {15};
  case "blastingcharge": {20};
  case "boltcutter": {30};
  case "defusekit": {2};
  case "storagesmall": {15};
  case "storagebig": {20};
  case "drill": {6};
  case "rye": {2};
  case "hops": {2};
  case "yeast": {2};
  case "cornmeal": {2};
  case "mash": {2};
  case "whiskey": {4};
  case "beerp": {4};
  case "moonshine": {6};
  case "bottledwhiskey": {5};
  case "bottledbeer": {5};
  case "bottledshine": {5};
  case "bottles": {1};
  case "zipties": {2};
  case "underwatercharge": {20};
  case "goldbarp": {12};
  case "redgull": {2};
  case "tbacon": {2};
  case "peach": {1};
  case "lockpick": {1};
  case "snapgun": {3};
  case "silver_u": {4};
  case "silver_p": {3};
  case "salad": {1};
  case "watermelon": {3};
  case "tobacco": {1};
  case "bubblegum": {1};
  case "kitkat": {1};
  case "present": {0};
  case "cream": {1};
  case "team_red": {1};
  case "team_blue": {1};
  case "ration_small": {1};
  case "ration_big": {2};

  case "axe": {8};
  case "wood_u": {4};
  case "wood_p": {3};

  case "naturalgas": {8};
  case "propane": {8};

  case "kfc_popcorn": {1};
  case "kfc_wings": {2};
  case "kfc_bucket": {3};
  case "kfc_pepsi": {1};

  case "kebab": {2};
  case "tea": {1};

  case "greggs_sausageroll": {1};
  case "greggs_pasty": {2};
  case "greggs_steakbake": {3};
  case "greggs_sausagebean": {3};
  case "greggs_cheesebacon": {3};

  case "roadcone": {1};
  case "roadcone_l": {3};
  case "bargate": {25};
  case "safetybarrier": {8};
  case "plasticbarrier_l": {5};
  case "plasticbarrier_m": {3};
  case "cargohouse_g";
  case "cargohouse_b": {20};
  case "cargopost_g";
  case "cargopost_b": {25};
  case "cargohq_g";
  case "cargohq_b": {35};
  case "cargotower_g";
  case "cargotower_b": {45};
  case "portablelight_s": {4};
  case "portablelight_d": {6};
  case "roadsign": {4};
  case "tapebarrier": {3};

  case "streetlamp": {3};
  case "concretebarrier_s": {6};
  case "concretebarrier_l": {12};

  case "target1_pop": {5};
  case "target1": {5};
  case "target2_pop": {5};
  case "target2": {5};
  case "target3_pop": {5};
  case "target3": {5};
  case "target4_pop": {5};
  case "target4": {5};
  case "shoot_house_stand": {20};
  case "shoot_house_crouch": {15};
  case "shoot_house_prone": {10};

  default {1};
};
