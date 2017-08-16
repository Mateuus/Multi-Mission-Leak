/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [
  ["_license", "", [""]]
];

if (_license == "") exitWith {0};

switch _license do {
  case "iron";
  case "salt";
  case "wood";
  case "beer": {4};

  case "sand";
  case "diamond";
  case "silver";
  case "whiskey";
  case "gas":{5};

  case "marijuana";
  case "heroin": {5};

  case "cocaine";
  case "cmeth": {6};

  case "bootleg";
  case "oil": {8};

  case "rebel": {6};
  case "advrebel": {15};

  default {0};
};
