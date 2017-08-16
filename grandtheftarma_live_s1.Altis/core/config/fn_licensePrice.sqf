params [
  ["_type", "", [""]]
];

if (_type == "") exitWith {-1};

switch _type do {
  case "driver": {10000};
  case "boat": {10000};
  case "pilot": {50000};
  case "gun": {150000};
  case "dive": {10000};
  case "medmarijuana": {1500};
  case "gang": {0};
  case "truck": {20000};
  case "mair": {15000};
  case "home": {1000000};
  case "rebel": {2000000};
  case "advrebel": {20000000};
  case "jet": {5000000};
  case "bomb": {250000};
  case "taxi": {150000};

  case "copper": {10000};
  case "sugar": {10000};
  case "rice": {10000};
  case "cement": {10000};

  case "iron": {250000};
  case "salt": {250000};
  case "wood": {250000};
  case "beer":{250000};

  case "sand": {500000};
  case "diamond": {500000};
  case "silver": {500000};
  case "whiskey":{500000};
  case "gas": {500000};

  case "marijuana": {1000000};
  case "heroin": {1000000};
  case "cocaine": {1500000};
  case "cmeth": {1500000};
  case "bootleg":{1750000};
  case "oil": {2000000};
};
